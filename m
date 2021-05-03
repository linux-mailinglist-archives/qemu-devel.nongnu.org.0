Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1553715ED
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:26:45 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYay-0003dD-8x
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ldYYs-0002HS-FG
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:24:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ldYYp-000667-4H
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620048270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+du2eRFAWRyhYJKFxOpJfHb9vxTFrBySFxLObgWCjs=;
 b=DrXxzDyTHrctXpWTyYG5nvblMIUNGNXeEkIjA6CO4PvBtMdK3Z30PIAu3ZvitMRUbUcCpT
 e+7qN3YZv8nvqYFEb4Q9xbSdDqwj9WFtdbsXcNARkmXzNY7dLIYgWFV0JOsog8NIKOoDro
 1QzAgq0ohOWj2qCAkReRNWy1B5W++PM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-yrBgRIHsMD2fSoiV77OweQ-1; Mon, 03 May 2021 09:24:28 -0400
X-MC-Unique: yrBgRIHsMD2fSoiV77OweQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 ji8-20020a1709079808b029037c921a9ea0so2007077ejc.9
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f+du2eRFAWRyhYJKFxOpJfHb9vxTFrBySFxLObgWCjs=;
 b=KHBj1oJEMZBCCSOEDsvR2blqYCdkYbDDta9NL0QhN09UVVSV4R2HclCG/yqplwRen7
 DfII4X05kCSF8ry+bmCXQiOiYGAPu7Pqqp4aFnOIQ9xbYH+h1kOI3w9Zm9HUFMCDxnbz
 7cIFekLeVa09OHkvmS35e0lS0dRJbI5369cXJnvjE+cxL9uBvI4sLthZwohVTyxZc+DH
 hfEuNdHN+PRGtwZRTYuDkt0USMgntOXLAFovTUTOpKOyq/+yXkpY/KhDfRxhRcbOwIiX
 Yx56ptYj6Dyg3Tann2JR2ES6/vJyo0It2X9HFQUSzdisE4zaTiYvgxpGSDQhsAWhAsbI
 H7pA==
X-Gm-Message-State: AOAM530JOunxsX3v6/m8Tbn1Mci2AmpnHAHa/St8O+lTdV7Mm3jz6o55
 0qTPQx4j90lKJWSrcmUD2WKriuAmx499UqZzvVRqubHT9I20AODDHRZVrchVwdLWmonxBW5J2Wi
 tiZ+1o9Kn/HGq+l4=
X-Received: by 2002:a17:906:2546:: with SMTP id
 j6mr16522950ejb.51.1620048267656; 
 Mon, 03 May 2021 06:24:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzP19LBCVPt9/2po/CRRdt68bFmIj1gNRfLHTOOSpeNv2pTdhNuUJwnHIxWjjLbesMqTZnmMQ==
X-Received: by 2002:a17:906:2546:: with SMTP id
 j6mr16522925ejb.51.1620048267436; 
 Mon, 03 May 2021 06:24:27 -0700 (PDT)
Received: from steredhat (host-79-46-211-24.retail.telecomitalia.it.
 [79.46.211.24])
 by smtp.gmail.com with ESMTPSA id qu23sm11171211ejb.1.2021.05.03.06.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 06:24:26 -0700 (PDT)
Date: Mon, 3 May 2021 15:24:24 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/4] block/vvfat: Fix leak of BDRVVVFATState::used_clusters
Message-ID: <20210503132424.bu3wg5mzvqgnqwoy@steredhat>
References: <20210430162519.271607-1-philmd@redhat.com>
 <20210430162519.271607-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210430162519.271607-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Johannes Schindelin <johannes.schindelin@gmx.de>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 06:25:17PM +0200, Philippe Mathieu-Daudé wrote:
>used_clusters is allocated in enable_write_target(), called by
>vvfat_open(), but never free'd.
>Allocate it using GLib API, and free it in vvfat_close().
>
>This fixes (QEMU built with --enable-sanitizers):
>
>  Direct leak of 64508 byte(s) in 1 object(s) allocated from:
>      #0 0x55d7a36378f7 in calloc (qemu-system-x86_64+0x1dab8f7)
>      #1 0x55d7a5e14246 in enable_write_target block/vvfat.c:3145:24
>      #2 0x55d7a5e123aa in vvfat_open block/vvfat.c:1236:19
>      #3 0x55d7a5a5363f in bdrv_open_driver block.c:1526:15
>      #4 0x55d7a5a9d369 in bdrv_open_common block.c:1802:11
>      #5 0x55d7a5a609f1 in bdrv_open_inherit block.c:3444:11
>      #6 0x55d7a5a65411 in bdrv_open_child_bs block.c:3079:10
>      #7 0x55d7a5a60079 in bdrv_open_inherit block.c:3391:19
>      #8 0x55d7a5a65da3 in bdrv_open block.c:3537:12
>      #9 0x55d7a5b33f6a in blk_new_open block/block-backend.c:421:10
>      #10 0x55d7a5a0a33e in blockdev_init blockdev.c:610:15
>      #11 0x55d7a5a088e7 in drive_new blockdev.c:994:11
>      #12 0x55d7a51b10c4 in drive_init_func softmmu/vl.c:636:12
>      #13 0x55d7a620e148 in qemu_opts_foreach util/qemu-option.c:1167:14
>      #14 0x55d7a51b0e20 in configure_blockdev softmmu/vl.c:695:9
>      #15 0x55d7a51a70b5 in qemu_create_early_backends softmmu/vl.c:1895:5
>      #16 0x55d7a519bf87 in qemu_init softmmu/vl.c:3551:5
>      #17 0x55d7a366f619 in main softmmu/main.c:49:5
>
>Fixes: a046433a161 ("Major overhaul of the virtual FAT driver for read/write support")
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> block/vvfat.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/block/vvfat.c b/block/vvfat.c
>index 5a4a7915220..2cc21787600 100644
>--- a/block/vvfat.c
>+++ b/block/vvfat.c
>@@ -3142,7 +3142,7 @@ static int enable_write_target(BlockDriverState *bs, Error **errp)
>     int size = sector2cluster(s, s->sector_count);
>     QDict *options;
>
>-    s->used_clusters = calloc(size, 1);
>+    s->used_clusters = g_malloc0(size);
>
>     array_init(&(s->commits), sizeof(commit_t));
>
>@@ -3233,6 +3233,7 @@ static void vvfat_close(BlockDriverState *bs)
>     array_free(&(s->directory));
>     array_free(&(s->mapping));
>     g_free(s->cluster_buffer);
>+    g_free(s->used_clusters);
>     g_free(s->qcow_filename);
>
>     if (s->qcow) {
>-- 
>2.26.3
>
>

In vvfat_open() we set to NULL the other pointers allocated through GLib 
API (e.g. s->qcow_filename), but IIUC the BDRVVVFATState (bs->opaque) is 
allocated through g_malloc0() in bdrv_open_driver(), so those 
initializations should be superfluous and in this case we can avoid 
setting s->used_clusters to NULL.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


