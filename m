Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67502D2E36
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:28:12 +0100 (CET)
Received: from localhost ([::1]:52484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmeuR-0006CN-Rw
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kmes5-0004la-Sk; Tue, 08 Dec 2020 10:25:47 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:50284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kmes1-00037W-OU; Tue, 08 Dec 2020 10:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=LUp/ah4wog3Xjl3fjmoNey+od2/0mV7G6vg1EBfe9q8=; 
 b=QJY7t8yUEgCtlrko8NWPrF5GKKHTo8LMkHPEZKp34TvxxRxSFPaXBxRMWpb1ucSQpxr4VJX0wqo4yuuGFoVbFILU47iEsaL8A8TBLAfIZ06jwr61Mws2XiP9cCf1PmvbTi69ca6uLdcfMOZRCagMrNbKJ/MXsvnDGOsbgyTwN3oQU9o4MBpxpCdMmYWYykkxQbiStk/WT/h9XlEdU+P9QI0KTREkSntJKxkRg4KUwjyTW+KJ8CpD/1J/KgXGtg2NHsgWLEH+8X+1u7UXpDtqeQmyc0TmC875Zgdp4tY0xHN2bWcA7m3Gn2b89h3cW8zfpSz8mLVo+ftmF3enMjzzUQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kmerc-0001Ox-Rr; Tue, 08 Dec 2020 16:25:16 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kmerc-00022N-IB; Tue, 08 Dec 2020 16:25:16 +0100
From: Alberto Garcia <berto@igalia.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/2] crypto: luks: Fix tiny memory leak
In-Reply-To: <20201208142159.492489-2-mlevitsk@redhat.com>
References: <20201208142159.492489-1-mlevitsk@redhat.com>
 <20201208142159.492489-2-mlevitsk@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 08 Dec 2020 16:25:16 +0100
Message-ID: <w51zh2opbfn.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 08 Dec 2020 03:21:58 PM CET, Maxim Levitsky wrote:
> When the underlying block device doesn't support the
> bdrv_co_delete_file interface, an 'Error' object was leaked.
>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

