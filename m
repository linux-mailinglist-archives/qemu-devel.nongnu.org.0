Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C174362253E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 09:23:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osgL6-0003Gs-2l; Wed, 09 Nov 2022 03:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1osgL3-0003GS-Ji
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 03:21:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1osgL2-0006Ia-3W
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 03:21:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667982094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vzxNmvuI8Q73AB0TkwhyAbbsP8pFK/gYr0eY/5/N2x0=;
 b=L3sovY+krDdtG8T286T9ILS9vBSplsNaLcYOBWFN6Na7aRsomNWlCpL6/FuVag17fBtnP4
 FTDfFMSm+QPhSRXjuNSz/QHyZV6+05B9cuXdtUJwTjZqvZMawfH6+cPs7NKKlq8fX91xbq
 fVQEgfEoJVUETMyJeicYaERmXiTgjxg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-548-ifmI-6jXPo-j7EHi-hA5VQ-1; Wed, 09 Nov 2022 03:21:33 -0500
X-MC-Unique: ifmI-6jXPo-j7EHi-hA5VQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z18-20020a05600c221200b003cf7fcc286aso294210wml.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 00:21:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vzxNmvuI8Q73AB0TkwhyAbbsP8pFK/gYr0eY/5/N2x0=;
 b=6fevLPPLGV/YSTdpQtYJxGWSa4SfJMViYLrO3mqoc7B/KiNUzfsalNDJ/j9FhxYQAK
 UrdSCKuR/Wb6j1+iyPspm1Vrbxl0FjA0x8Ee4Wbjgj3PXnlLIy1KbVgLMLFUnk3Vgtud
 h88szCPGRkzPfiD62+3JpbYXkiCZj7I6al01gs5f1w8ZNmOTosCKrMc/E+wWBsHloeAY
 dgcWR31GrRJvSMeI51u7W74Wcd+f8+Yd/yIlvTCg/oh8kAwuCz0sIGiJhMyIr7HdHRUJ
 T5cgOQdDJfYraDbE91N1w28/PJfFFNqmZKdKSPpJQzaYwE/iAdVVuhDC1xhB46BvljF8
 zZ7Q==
X-Gm-Message-State: ACrzQf0IlvjRD0nS2yLOMPPJswfvLfINXBQdMyd30aSc6KBmkTNWyU2t
 Huvxhj9nPFRwUSj73JMzezL+7E8CP6AnM+cuYWm7w0F+pdsKQ/jwcEAfmaRaTURIuG1qwHOIjvn
 qleyuaNbwbFfVtPE=
X-Received: by 2002:a05:600c:3587:b0:3cf:9aab:ab4a with SMTP id
 p7-20020a05600c358700b003cf9aabab4amr17685497wmq.155.1667982091983; 
 Wed, 09 Nov 2022 00:21:31 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6H9jcltsw06DYwfcCqM8U+FT98brjW2XJcI+z4XWRRHoMoqkwn42Yy44fGzj3XYzJIGB3vsQ==
X-Received: by 2002:a05:600c:3587:b0:3cf:9aab:ab4a with SMTP id
 p7-20020a05600c358700b003cf9aabab4amr17685480wmq.155.1667982091673; 
 Wed, 09 Nov 2022 00:21:31 -0800 (PST)
Received: from sgarzare-redhat (host-82-53-134-234.retail.telecomitalia.it.
 [82.53.134.234]) by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c458700b003c7087f6c9asm789363wmo.32.2022.11.09.00.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 00:21:31 -0800 (PST)
Date: Wed, 9 Nov 2022 09:21:18 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] qapi/block-core: Fix BlockdevOptionsNvmeIoUring @path
 description
Message-ID: <20221109082118.hqwhm2epsokbjyx4@sgarzare-redhat>
References: <20221108142347.1322674-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221108142347.1322674-1-afaria@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 08, 2022 at 02:23:47PM +0000, Alberto Faria wrote:
>The nvme-io_uring BlockDriver's path option must point at the character
>device of an NVMe namespace, not at an image file.
>
>Fixes: fd66dbd424f5 ("blkio: add libblkio block driver")
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Alberto Faria <afaria@redhat.com>
>---
> qapi/block-core.json | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for fixing this:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/qapi/block-core.json b/qapi/block-core.json
>index 6d904004f8..95ac4fa634 100644
>--- a/qapi/block-core.json
>+++ b/qapi/block-core.json
>@@ -3704,7 +3704,7 @@
> #
> # Driver specific block device options for the nvme-io_uring backend.
> #
>-# @path: path to the image file
>+# @path: path to the NVMe namespace's character device (e.g. /dev/ng0n1).
> #
> # Since: 7.2
> ##
>-- 
>2.38.1
>


