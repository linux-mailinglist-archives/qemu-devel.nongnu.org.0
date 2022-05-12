Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C195251A6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:54:04 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npB8d-0003Xq-Hr
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1npAzK-0006i1-Qq
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1npAzI-0005N9-3S
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652370261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8RzYKQTLfNnZg90tkG6JNS62QmgPjT8zq2VEjCBGY4=;
 b=DgJWXZu7WoeWUMd/NkhpV45+7nIGH+rpiih5rp5XBdnXH/+2BJeF3JVBM9TTYdutrKMaAr
 xKfty45AWB3KBnjxQU8DeWRplNiglwNPbvemPbnhWG06y1VD5JL0/VQ7qGOCQUt+/jzai8
 T2fNdIgF5us/8r9mJkrnp/QhuPCb8lM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-N-zCFv6JO7OAGvuxi3rWMw-1; Thu, 12 May 2022 11:44:20 -0400
X-MC-Unique: N-zCFv6JO7OAGvuxi3rWMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so4564050wmq.3
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 08:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z8RzYKQTLfNnZg90tkG6JNS62QmgPjT8zq2VEjCBGY4=;
 b=Hf3ru3E99u+Jv6+S7Fxb7IR14U6RL14LFJa8mw5mR87xaDVwYctInu++Sq2oIisR3A
 MN5PFTXHn8ACH0aTz4kqfabLxJ/9MpAgN2Jcw22OUpqnthIjvfaU0zLnEGkZpzw9yEGP
 yBJ+pWSuQkgoRxt1eDy/aw1bYi7Hr2INKxOR2AYWLRj4xrjqYg6nSPmYF+D0+InA3NCm
 cNEr5trHVZ9KTjaE/nd/9JxITGZ1gNMklMaf7hsIbJq1lzMZiFyWUpTURfKHcFDUIUV5
 J6H+j7Ebo5F0NZIOWkElVmIFRC0a68FBDRJBkm9hSXAo4FXMyYAtAmrWuGvepArM8fzv
 SGdw==
X-Gm-Message-State: AOAM5302Lvz9e7os+kWLD8ewYCqV8lsKS4+Xv2zJxZPeDacCOHFTK1n4
 bor1NqPS9N1mDke04J4crJFRl61OT1uFoQjn+u/d268RhTjOawHEeNkV2IPwQM1h1993mZMmibK
 5fiOe2QXtbOGzPtw=
X-Received: by 2002:a05:600c:4f95:b0:394:8919:7557 with SMTP id
 n21-20020a05600c4f9500b0039489197557mr439860wmq.166.1652370258841; 
 Thu, 12 May 2022 08:44:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+upmbq1xMPTmGMjK6OOdIBvsMtAvFxEMuXD+ahYKlVgy2KbsMy1ioCeP3fU05KFlvu7to5w==
X-Received: by 2002:a05:600c:4f95:b0:394:8919:7557 with SMTP id
 n21-20020a05600c4f9500b0039489197557mr439843wmq.166.1652370258649; 
 Thu, 12 May 2022 08:44:18 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-106.retail.telecomitalia.it.
 [87.11.6.106]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d678f000000b0020c5253d8cdsm4665825wru.25.2022.05.12.08.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:44:18 -0700 (PDT)
Date: Thu, 12 May 2022 17:44:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, integration@gluster.org,
 qemu-stable@nongnu.org, eblake@redhat.com, vsementsov@virtuozzo.com
Subject: Re: [PATCH v2] block/gluster: correctly set max_pdiscard
Message-ID: <20220512154413.vw7lnfxqttdidu4n@sgarzare-redhat>
References: <20220512103048.214100-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220512103048.214100-1-f.ebner@proxmox.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 12, 2022 at 12:30:48PM +0200, Fabian Ebner wrote:
>On 64-bit platforms, SIZE_MAX is too large for max_pdiscard, which is

The main problem is that SIZE_MAX for an int64_t is a negative value.

>int64_t, and the following assertion would be triggered:
>qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
>`max_pdiscard >= bs->bl.request_alignment' failed.
>
>Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
>Cc: qemu-stable@nongnu.org
>Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>---
> block/gluster.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/block/gluster.c b/block/gluster.c
>index 398976bc66..f711bf0bd6 100644
>--- a/block/gluster.c
>+++ b/block/gluster.c
>@@ -891,7 +891,7 @@ out:
> static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
> {
>     bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
>-    bs->bl.max_pdiscard = SIZE_MAX;
>+    bs->bl.max_pdiscard = MIN(SIZE_MAX, INT64_MAX);

What would be the problem if we use INT64_MAX?
(I guess the intention of the original patch was to set the maximum 
value in drivers that do not have a specific maximum).

Or we can set to 0, since in block/io.c we have this code:

     max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT64_MAX),
                                    align);
     assert(max_pdiscard >= bs->bl.request_alignment);

Where `max_pdiscard` is set to INT64_MAX (and aligned) if 
bs->bl.max_pdiscard is 0.

> }
>
> static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
>@@ -1304,7 +1304,7 @@ static coroutine_fn int qemu_gluster_co_pdiscard(BlockDriverState *bs,
>     GlusterAIOCB acb;
>     BDRVGlusterState *s = bs->opaque;
>
>-    assert(bytes <= SIZE_MAX); /* rely on max_pdiscard */
>+    assert(bytes <= MIN(SIZE_MAX, INT64_MAX)); /* rely on max_pdiscard */

Can we use bs->bl.max_pdiscard directly here?

Thanks,
Stefano


