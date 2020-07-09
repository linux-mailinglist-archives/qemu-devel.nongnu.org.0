Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA921A113
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 15:42:04 +0200 (CEST)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtWoN-0001UK-QI
	for lists+qemu-devel@lfdr.de; Thu, 09 Jul 2020 09:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jtWnI-0000XS-EC; Thu, 09 Jul 2020 09:40:56 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jtWnF-0004e4-Mz; Thu, 09 Jul 2020 09:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=v5Irnfn987+S6iLAIt8dtQ7Up0TG1so6lxQGdsGAJkM=; 
 b=ZGAu0YWiN4Nmc3MA64HYKiICZZiDXTVEPlnFifayjW8XfawTJ5ydhWp0Wn0Sl0LDntt9elU9xW5Qft7NJyQ7JFx2eF+nioDqcW7YYwie3L8oxTdiRFzEKb/hxfFeVN6buoo+JTzHaZ2DV23vUnZRFwJUpwDbZC5E2MxEXGI1kucFQ/fyrzmGvo7noPqM4gF7j7Lw6a3lKPhzzvIskxAoN7oWcJpTugbTryIRDwaMDnltVC0hhBCHxurZRbcblmvsE6OitwfL5p03Rssnf4L+T/W2aClKUBDk31ztBWRLg9luJlr7XoTuZXyGBmsbWyg7UDbW4oPdo7jFc7FNPZAFWA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jtWmq-0005pv-Ug; Thu, 09 Jul 2020 15:40:29 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jtWmq-0001vK-Jt; Thu, 09 Jul 2020 15:40:28 +0200
From: Alberto Garcia <berto@igalia.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 31/34] qcow2: Add the 'extended_l2' option and the
 QCOW2_INCOMPAT_EXTL2 bit
In-Reply-To: <297b0c60-9f5e-dfdf-0086-470e762ac22b@redhat.com>
References: <cover.1593791819.git.berto@igalia.com>
 <7bd13895731899d66f75d4f6790957aefc5ba353.1593791819.git.berto@igalia.com>
 <297b0c60-9f5e-dfdf-0086-470e762ac22b@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 09 Jul 2020 15:40:28 +0200
Message-ID: <w517dvcrelv.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 09:40:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Derek Su <dereksu@qnap.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 09 Jul 2020 03:07:29 PM CEST, Max Reitz wrote:
> On 03.07.20 17:58, Alberto Garcia wrote:
>> Now that the implementation of subclusters is complete we can finally
>> add the necessary options to create and read images with this feature,
>> which we call "extended L2 entries".
>> 
>> Signed-off-by: Alberto Garcia <berto@igalia.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Max Reitz <mreitz@redhat.com>
>> ---
>
> (This requires quite a bit of a rebase, but nothing spectacularly
> interesting, I think.)

Yeah I noticed, I can send v11 after the rebase.

Berto

