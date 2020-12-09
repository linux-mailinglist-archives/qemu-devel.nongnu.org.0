Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B702D4811
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:39:00 +0100 (CET)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3QZ-00063E-Rt
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kn3MT-0003eY-2K; Wed, 09 Dec 2020 12:34:45 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:33235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kn3MR-0004Zg-GF; Wed, 09 Dec 2020 12:34:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=1MyPVAooWJT2FDNMHz7kqzof62nkrcDMWIOORmvn79w=; 
 b=bVETsS1n/hdr2h8RD7MgC1pmvsIynQTAxVjc1EHOaQDisKjX9Dp39vZHecbuda93PRsAEVHPsIWzZiI1+83qdcFcKqdSwEuNO251UjrtDfz7Wv6zANP50TvrNv+p0nolfy7MMADwshD9wS+4+Lo//U4UCOAI9ZYiRr0LAhekOCJco3wfJKr/Htd0XuaeV98kUkB/CBz2btZLpbDsunVU22poAWlet1TLP5Toca666cugZLoVWKmb2tynrfllCvJ1k4ourBhnqIBFRd4YmoD7vQPW7XcTCiRGkK2F/kOwDijoNaeqx8xFvfyBJV6lE10NtT913lQTexmq0tBtrdQaVA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kn3MP-0005LS-O5; Wed, 09 Dec 2020 18:34:41 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kn3MP-0002hD-Ds; Wed, 09 Dec 2020 18:34:41 +0100
From: Alberto Garcia <berto@igalia.com>
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/4] crypto: luks: use bdrv_co_delete_file_noerr
In-Reply-To: <20201209164441.867945-4-mlevitsk@redhat.com>
References: <20201209164441.867945-1-mlevitsk@redhat.com>
 <20201209164441.867945-4-mlevitsk@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Wed, 09 Dec 2020 18:34:41 +0100
Message-ID: <w51mtymnary.fsf@maestria.local.igalia.com>
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

On Wed 09 Dec 2020 05:44:40 PM CET, Maxim Levitsky wrote:
> This refactoring is now possible thanks to this function.
>
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

