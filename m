Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994043715DB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:18:33 +0200 (CEST)
Received: from localhost ([::1]:52378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYT2-0005W1-Kt
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ldYPL-0004AM-Es
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ldYPJ-0000TU-VM
 for qemu-devel@nongnu.org; Mon, 03 May 2021 09:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620047681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oH75rSsaJO7eI4T6FMTQ8qXgtAkyAGDpItPzGij5WfY=;
 b=IwS5a9SuPJbyTGZkdKlkoev5NS0NjafWfKQc7VzYNMffuFC1/zirg90cSNJ9MsBsVAPFAx
 uellFj15igmYjfQkj1I/ZpObuJV6F3xaPm6GHs/74hw+o30anb9tPxn0dw6/cxg0R+HPnE
 kQhi8UxBiGmPjKiluK27QoAAfIwTK8c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-uozruUkPNp-8o0V4uvemlw-1; Mon, 03 May 2021 09:14:37 -0400
X-MC-Unique: uozruUkPNp-8o0V4uvemlw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso4348133edd.19
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 06:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oH75rSsaJO7eI4T6FMTQ8qXgtAkyAGDpItPzGij5WfY=;
 b=sJUYp6qUM6QoATbeypKWEyJfB2uJ7c8yhuZSuURWcIC3K8SahMrN6oI7/pcySziVKM
 28krLGfdkZT9C193RXmCYaYmrDfcxPXAohBJoeuWq4jhAdlRPUo3dsAAKiYAlR/PvraX
 7P8OnhHma3zqZfnHqFsdykHWRbSZhS/y93ZwlnOk0vB/1GILersSAz/D93rv082WSaBF
 wbBDtseccMlpnYMytditUzml0rhD55RSdkZf7pHbmr9nHqiullJehdsHfagUoE8S5P4M
 iOGZ+M60CciiFc1S+wx7WRGloWhpGSna+VR3HrL/I8VUpTyTUQkJsfM57UKggR/Pwp9Q
 4f6A==
X-Gm-Message-State: AOAM531cAAXF+kZf2LE9uC5YSVVqiXleLuSKst3F6v71m7ISunzI1uAK
 u+xqaVMU78KXQ3q6qNoBjWqwAIWKNFfg8C73WG11aOVVAxZA9NZD4fpiWbhaSbvB/wxPEVS1VE+
 1jFPH7vrZy2pZl/Y=
X-Received: by 2002:a50:bec1:: with SMTP id e1mr7545429edk.116.1620047676269; 
 Mon, 03 May 2021 06:14:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4x8kN1GcCjaxwjdqf4vJsUwe8AzVHIXUWeeQxnRLzVKiiia2XNoFwPiF+EloxjBPpmiXrBQ==
X-Received: by 2002:a50:bec1:: with SMTP id e1mr7545401edk.116.1620047676078; 
 Mon, 03 May 2021 06:14:36 -0700 (PDT)
Received: from steredhat (host-79-46-211-24.retail.telecomitalia.it.
 [79.46.211.24])
 by smtp.gmail.com with ESMTPSA id 9sm11019601ejv.73.2021.05.03.06.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 06:14:35 -0700 (PDT)
Date: Mon, 3 May 2021 15:14:33 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/4] block/vvfat: Fix leak of BDRVVVFATState::qcow_filename
Message-ID: <20210503131433.totsjlkq6rdjl5m4@steredhat>
References: <20210430162519.271607-1-philmd@redhat.com>
 <20210430162519.271607-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210430162519.271607-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Apr 30, 2021 at 06:25:16PM +0200, Philippe Mathieu-Daudé wrote:
>qcow_filename is allocated in enable_write_target(), called by
>vvfat_open(), but never free'd. Free it in vvfat_close().
>
>This fixes (QEMU built with --enable-sanitizers):
>
>  Direct leak of 4096 byte(s) in 1 object(s) allocated from:
>      #0 0x55d7a363773f in malloc (/mnt/scratch/qemu/sanitizer/qemu-system-x86_64+0x1dab73f)
>      #1 0x7f55c6447958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
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
>Fixes: 8475ea48544 ("block/vvfat: Do not unref qcow on closing backing bdrv")
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> block/vvfat.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/block/vvfat.c b/block/vvfat.c
>index 54807f82ca1..5a4a7915220 100644
>--- a/block/vvfat.c
>+++ b/block/vvfat.c
>@@ -3233,6 +3233,7 @@ static void vvfat_close(BlockDriverState *bs)
>     array_free(&(s->directory));
>     array_free(&(s->mapping));
>     g_free(s->cluster_buffer);
>+    g_free(s->qcow_filename);
>
>     if (s->qcow) {
>         migrate_del_blocker(s->migration_blocker);
>-- 
>2.26.3
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


