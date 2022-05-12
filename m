Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD3D525255
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:18:39 +0200 (CEST)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBWQ-0005Fr-W4
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1npBJz-0003tH-4J
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1npBJu-0000Hm-Hj
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652371541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bpQiuEofWXK5+ybliZOJINdoHUbHL/TVaSuakxYz8P8=;
 b=I3iOKvpa+yTXz+k4dXL3u95CcKnHbw4KXzXH+WtJ6UatSh5pfHj1FiAIXCKO+1itKVTnlj
 YYATdXiRkxRfRBhbZhjXUvUEweqD+GSfpKvrMhve5jDWRCGpZMmb6+2OPERgyjVH+bSM+q
 wBY822hO5xWrCUHmMARhCZ8McjTFgjk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-ZvL6lWiLOAiXtXUvkryDeA-1; Thu, 12 May 2022 12:05:39 -0400
X-MC-Unique: ZvL6lWiLOAiXtXUvkryDeA-1
Received: by mail-wr1-f69.google.com with SMTP id
 s16-20020adfeb10000000b0020cc4e5e683so2211308wrn.6
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bpQiuEofWXK5+ybliZOJINdoHUbHL/TVaSuakxYz8P8=;
 b=vYhmZLZxgLARliyjtvLvPdErLXnKOt1G2LjkEvRpLdPCaP2+Lh9XWbjSZx2C9MC5Fb
 tKWZBgHmGVT+7F7xiLk0s8VferFZqEa1A6m3UkpAmU+yMZYNGoPK3/6B+As/oo7GiVVV
 3CeDzTqABpd3usfBZB1kgz/5bcpvUpWG5F07fy6BxspsOVmrQpqr/zaAYB3oifbDKjGV
 GlkYxWa8WDQFXo3WJiHCvueNc+grkEzJptqOo2OtXiAV7gH6hdHbF393kXl0wIqIIXNq
 ZZ0pIDinhRJNGe9dUtjnHjUfcd1DpxeaQbuGbR96gPur9VA9TVSMPHIz5e9v+reXq0lC
 zsdg==
X-Gm-Message-State: AOAM531Djrk858zdLaUGY+dNeECZSOfVpjxXe09EqZI6jcqOxw4Tq69R
 wBZI0RYIaCjNPE1PAMimgKt8+SR14YA5AWx2Lj5R+PN6JJ/YDaWzHFiG8G+eFPpL9tmUdwyyKD8
 kMjMQxqP3I1opj4s=
X-Received: by 2002:a05:6000:81c:b0:20c:d4e7:400d with SMTP id
 bt28-20020a056000081c00b0020cd4e7400dmr298671wrb.459.1652371538462; 
 Thu, 12 May 2022 09:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDiu2IP3dTiL+5x0weIMMylaLwx7pI4e/8JnmaNIwFlhzJVAEnNJXH6A3yITTvApakzyijBA==
X-Received: by 2002:a05:6000:81c:b0:20c:d4e7:400d with SMTP id
 bt28-20020a056000081c00b0020cd4e7400dmr298643wrb.459.1652371538179; 
 Thu, 12 May 2022 09:05:38 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 x13-20020a7bc20d000000b0039429bfebebsm3147668wmi.3.2022.05.12.09.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 09:05:37 -0700 (PDT)
Date: Thu, 12 May 2022 18:05:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, integration@gluster.org,
 qemu-stable@nongnu.org, eblake@redhat.com, vsementsov@virtuozzo.com
Subject: Re: [PATCH v2] block/gluster: correctly set max_pdiscard
Message-ID: <20220512160534.lijy67jibfiyox54@sgarzare-redhat>
References: <20220512103048.214100-1-f.ebner@proxmox.com>
 <20220512154413.vw7lnfxqttdidu4n@sgarzare-redhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220512154413.vw7lnfxqttdidu4n@sgarzare-redhat>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 05:44:13PM +0200, Stefano Garzarella wrote:
>On Thu, May 12, 2022 at 12:30:48PM +0200, Fabian Ebner wrote:
>>On 64-bit platforms, SIZE_MAX is too large for max_pdiscard, which is
>
>The main problem is that SIZE_MAX for an int64_t is a negative value.
>
>>int64_t, and the following assertion would be triggered:
>>qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
>>`max_pdiscard >= bs->bl.request_alignment' failed.
>>
>>Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
>>Cc: qemu-stable@nongnu.org
>>Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>>---
>>block/gluster.c | 4 ++--
>>1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>diff --git a/block/gluster.c b/block/gluster.c
>>index 398976bc66..f711bf0bd6 100644
>>--- a/block/gluster.c
>>+++ b/block/gluster.c
>>@@ -891,7 +891,7 @@ out:
>>static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
>>{
>>    bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
>>-    bs->bl.max_pdiscard = SIZE_MAX;
>>+    bs->bl.max_pdiscard = MIN(SIZE_MAX, INT64_MAX);
>
>What would be the problem if we use INT64_MAX?

Okay, I just saw Eric's answer to v1 and I think this is right.

Please explain it in the commit message and also the initial problem 
that is SIZE_MAX on a 64-bit platform is a negative number for int64_t, 
so the assert fails.

Thanks,
Stefano

>(I guess the intention of the original patch was to set the maximum 
>value in drivers that do not have a specific maximum).
>
>Or we can set to 0, since in block/io.c we have this code:
>
>    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT64_MAX),
>                                   align);
>    assert(max_pdiscard >= bs->bl.request_alignment);
>
>Where `max_pdiscard` is set to INT64_MAX (and aligned) if 
>bs->bl.max_pdiscard is 0.
>
>>}
>>
>>static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
>>@@ -1304,7 +1304,7 @@ static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
>>    GlusterAIOCB acb;
>>    BDRVGlusterState *s = bs->opaque;
>>
>>-    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
>>+    assert(bytes <= MIN(SIZE_MAX, INT64_MAX)); /* rely on max_pdiscard */
>
>Can we use bs->bl.max_pdiscard directly here?
>
>Thanks,
>Stefano


