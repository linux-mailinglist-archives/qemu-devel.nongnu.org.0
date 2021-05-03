Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C9371885
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:55:37 +0200 (CEST)
Received: from localhost ([::1]:48760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldav2-0006Re-BU
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:55:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1ldasM-0003y7-9Z; Mon, 03 May 2021 11:52:50 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:36118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1ldasJ-0000Mg-50; Mon, 03 May 2021 11:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=rgBAzuBWuNK4PmsMf8O9WMLMA8z4r1Z6QObGEVCLyL0=; 
 b=rnvcfHrjxkaooIY6xwvbCqBWzyqqGic7NXt+zIHHBxaImE0yFgsZmDQFMRgGPXu0S7aTv1cGlNFg05BdY9VvYRvFm0A/kdvrAzrPycFtU6cP2lt3AK6HaRdTz7mbtUQZe+kD+RcoM4EcsezzYvVLIdwrb3zoYnciJaSwpRtR+oGpdjQmgIUQ4FTaCSogcXVBXoDcKVcFjMr6Z59JLFGsYPmCXSYtfRuHWkNgiD8J2B2vUscO2JxXoJtLYCvPq8eDru2bopItJ07VgD1Cnv91/FCCebfEOvq1gEd/kyOvFQBojmaE5yK4Z1w6gG96LFEotXbY+ixnXdGG5fH1NqiM+w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1ldasG-0008Pt-NK; Mon, 03 May 2021 17:52:44 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1ldasG-00006F-E9; Mon, 03 May 2021 17:52:44 +0200
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 2/6] block: bdrv_reopen_multiple(): fix leak of tran object
In-Reply-To: <20210503113402.185852-3-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
 <20210503113402.185852-3-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 03 May 2021 17:52:44 +0200
Message-ID: <w51tunjhl0z.fsf@maestria.local.igalia.com>
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 vsementsov@virtuozzo.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 03 May 2021 01:33:58 PM CEST, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
> We have one path, where tran object is created, but we don't touch and
> don't free it in any way: "goto cleanup" in first loop with calls to
> bdrv_flush().
>
> Fix it simply moving tran_new() call below that loop.
>
> Reported-by: Coverity (CID 1452772)
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 72373e40fbc7e4218061a8211384db362d3e7348
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

