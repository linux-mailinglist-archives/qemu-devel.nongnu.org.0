Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF259533A34
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 11:46:38 +0200 (CEST)
Received: from localhost ([::1]:42530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntnbB-0005Ml-Oa
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 05:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ntn4k-0000ic-Pi
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:13:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ntn4V-0004qC-3k
 for qemu-devel@nongnu.org; Wed, 25 May 2022 05:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653469967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nKOrPYK5YzHRPtcJw8A5C7CFhUGEWdR7j2mJ2HwiA+M=;
 b=bwzdcHx91sOW0t9AKYc/Sy8V8/FbZYSB8UivS6sSDnojvsoul+Hrxjk/zAwvL4ythi5Uuf
 kSbVXoeOB0gKf3CsDJK4hCpOoV8rAZrE+lgrsbvyQfPlsTiFPQp4094Nka57dcKIntwfB/
 nYNR03CldGdzxr45zI4uVlce6eLkFPI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-s1NkG9gJOVKv9NKrEcL6ag-1; Wed, 25 May 2022 05:12:45 -0400
X-MC-Unique: s1NkG9gJOVKv9NKrEcL6ag-1
Received: by mail-qv1-f72.google.com with SMTP id
 kc27-20020a056214411b00b0046243e2136bso5771379qvb.10
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 02:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nKOrPYK5YzHRPtcJw8A5C7CFhUGEWdR7j2mJ2HwiA+M=;
 b=6Z95XiUrNCCiDD4rLGuC8I9TsYasANRhETSzo9pWuxyUtSfxg6WpqourCdVlniCjJ9
 pT7+zOgTRsSt3nPRXStmt99C4d5MAvQ0nvZp4TaCTZMDWNGGA+Q+fn0CITnJ0LPG87xO
 FUhhJz/kQQ/eY5cytolH3IPllUxhYBEpYe4GpPAf1aCzKFqJKDXi0FAb1Ik+6Dl02z7c
 O9qXc9YtIFDzBkww9VHXmwamFbpidvYvWP/l5habmwuonf4737BlXQr766DX8h83gaxa
 G3POGfty9duwcQLWMJWIDlFPAd83q3kRi2TcLauO5QmvELrTqHhDlIUOYZRcrV6OS6Hq
 9+fw==
X-Gm-Message-State: AOAM532/EhRiUhRBklTVAGzkvynA/rnaQCXPzcNav8SrE6I6WlI95tyE
 xY7K0xsWAIbwwPazaT1JRSbIm6xVewxDM7sZQ/40yiZEWTAnCtmFe/xqpa+tAp1KYwx9pbIQRIp
 nrgMxa1O/z6HMDuk=
X-Received: by 2002:a05:620a:40c2:b0:6a3:7a56:b282 with SMTP id
 g2-20020a05620a40c200b006a37a56b282mr10138724qko.408.1653469965160; 
 Wed, 25 May 2022 02:12:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEgi75j3jUCD9x3+ex+OEpcI9KqOdy4lxhV13lq3oDhxz3thQLTu2+2ZY3EHmd/qrQWLfAlQ==
X-Received: by 2002:a05:620a:40c2:b0:6a3:7a56:b282 with SMTP id
 g2-20020a05620a40c200b006a37a56b282mr10138707qko.408.1653469964942; 
 Wed, 25 May 2022 02:12:44 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-16.business.telecomitalia.it.
 [87.12.25.16]) by smtp.gmail.com with ESMTPSA id
 p123-20020a37bf81000000b0069fd21d0b09sm1001256qkf.0.2022.05.25.02.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 02:12:44 -0700 (PDT)
Date: Wed, 25 May 2022 11:12:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org, integration@gluster.org,
 qemu-stable@nongnu.org, eblake@redhat.com, vsementsov@virtuozzo.com
Subject: Re: [PATCH v3] block/gluster: correctly set max_pdiscard
Message-ID: <20220525091236.56andr5kbh6gnokx@sgarzare-redhat>
References: <20220520075922.43972-1-f.ebner@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220520075922.43972-1-f.ebner@proxmox.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, May 20, 2022 at 09:59:22AM +0200, Fabian Ebner wrote:
>On 64-bit platforms, assigning SIZE_MAX to the int64_t max_pdiscard
>results in a negative value, and the following assertion would trigger
>down the line (it's not the same max_pdiscard, but computed from the
>other one):
>qemu-system-x86_64: ../block/io.c:3166: bdrv_co_pdiscard: Assertion
>`max_pdiscard >= bs->bl.request_alignment' failed.
>
>On 32-bit platforms, it's fine to keep using SIZE_MAX.
>
>The assertion in qemu_gluster_co_pdiscard() is checking that the value
>of 'bytes' can safely be passed to glfs_discard_async(), which takes a
>size_t for the argument in question, so it is kept as is. And since
>max_pdiscard is still <= SIZE_MAX, relying on max_pdiscard is still
>fine.
>
>Fixes: 0c8022876f ("block: use int64_t instead of int in driver discard handlers")
>Cc: qemu-stable@nongnu.org
>Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
>---
>
>v2 -> v3:
>    * Keep assertion in qemu_gluster_co_pdiscard() as is.
>    * Improve commit message.
>
>v1 -> v2:
>    * Use an expression that works for both 64-bit and 32-bit platforms.
>
> block/gluster.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/block/gluster.c b/block/gluster.c
>index 398976bc66..b60213ab80 100644
>--- a/block/gluster.c
>+++ b/block/gluster.c
>@@ -891,7 +891,7 @@ out:
> static void qemu_gluster_refresh_limits(BlockDriverState *bs, Error **errp)
> {
>     bs->bl.max_transfer = GLUSTER_MAX_TRANSFER;
>-    bs->bl.max_pdiscard = SIZE_MAX;
>+    bs->bl.max_pdiscard = MIN(SIZE_MAX, INT64_MAX);
> }
>
> static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
>-- 
>2.30.2
>
>


