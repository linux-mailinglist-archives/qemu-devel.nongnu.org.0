Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB364A090
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:26:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4igi-0006fW-QK; Mon, 12 Dec 2022 08:17:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4igJ-0006Uq-2X
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4igF-0004IH-Uc
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670851035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PMtV9Oq/t1AGwdxav7mTExmZOl76s9wyB7A+fwPf24=;
 b=BPNtSDXuYLB7oQW4ZgmXj9YA0oUqDojY0CWefUHjWAvo/h25UjyOA3mSZJcrPZxqqL4dDJ
 9HRmOqwxRyS6qKlM6EytqldINVOAmGKCONhlLWYpvhlkuXdZXGphSF6sSkkVCP2z/A0gj6
 /VouLgNRLA5qnZ2jyDJqt/wtjfHnBFY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-LvxElQV-NvKZVMOK78y-0Q-1; Mon, 12 Dec 2022 08:17:11 -0500
X-MC-Unique: LvxElQV-NvKZVMOK78y-0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso3345960wma.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:17:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7PMtV9Oq/t1AGwdxav7mTExmZOl76s9wyB7A+fwPf24=;
 b=VqPV4KU3ssZZ87PP1q7cetm9/rDYZUYWrPJK1xvZtwzNAfaJRwdUbdIvBwz35YU0I1
 Nmk32n/ZEcIo5lfCrJa4zKLRhkp4N0m14vkHvmQgvpSA1IfqWpFLUPJlmkIwM1Ygu4Hc
 y/GEC8FhFjg2eoSOtqUA3XOKpO7vVJgITOc3JTe9H3urcddMXXsWhTY2Bs6W3mpMWWtZ
 DN2GHMco4B9PUmzmP/B/RfbQjuaQjKjf0NJXECl9y4/dH3smSq0DYCkie5MHTG12T8ek
 fff9I+lsGiuuliQrrgAxAKs/nd/KcL9KqjKlOZ/+7Ci88aIljOj84gdAPjMNJ3+Dk/vN
 twsw==
X-Gm-Message-State: ANoB5plIcpAVHwWCL6IESU8V3LxKFrWVQgbkk34ryXfsVSo7XmUkSnkZ
 a9rqFfr/a38AS4g8reroVt00TTzB9GNnrx3suBEndjI5d+QNwx8vtyGS1TqOfsO59ulSRyF5Dwi
 mNqxwFm4QAeQ0e7NTVyg/dGmDsI6oDt5VqkQCbVycv2/4EVRHS65OluCGGSCEW55c+e8=
X-Received: by 2002:a1c:4b0d:0:b0:3c6:e60f:3f63 with SMTP id
 y13-20020a1c4b0d000000b003c6e60f3f63mr12699352wma.26.1670851030185; 
 Mon, 12 Dec 2022 05:17:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59wKrhoRvGmU+v3Z/CD2i0So30Sv7wqxJ8tg7MYqSJxK+ukaSow7eUb2dSqfHK7gsrUSQdxw==
X-Received: by 2002:a1c:4b0d:0:b0:3c6:e60f:3f63 with SMTP id
 y13-20020a1c4b0d000000b003c6e60f3f63mr12699329wma.26.1670851029881; 
 Mon, 12 Dec 2022 05:17:09 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a05600c4ed400b003c71358a42dsm12348484wmq.18.2022.12.12.05.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 05:17:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH 2/3] block: do not check bdrv_file_open
Date: Mon, 12 Dec 2022 14:16:59 +0100
Message-Id: <20221212131700.250209-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212131700.250209-1-pbonzini@redhat.com>
References: <20221212131700.250209-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The set of BlockDrivers that have .bdrv_file_open coincides with those
that have .protocol_name and guess what---checking drv->bdrv_file_open
is done to see if the driver is a protocol.  So check drv->protocol_name
instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 0a625a489a6e..7a66cc2ea23a 100644
--- a/block.c
+++ b/block.c
@@ -911,7 +911,6 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     int i;
 
     GLOBAL_STATE_CODE();
-    /* TODO Drivers without bdrv_file_open must be specified explicitly */
 
     /*
      * XXX(hch): we really should not let host device detection
@@ -1618,7 +1617,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     bs->opaque = g_malloc0(drv->instance_size);
 
     assert(!drv->bdrv_needs_filename || bs->filename[0]);
-    if (drv->bdrv_file_open) {
+    if (drv->bdrv_open) {
         ret = drv->bdrv_file_open(bs, options, open_flags, &local_err);
     } else if (drv->bdrv_open) {
         ret = drv->bdrv_open(bs, options, open_flags, &local_err);
@@ -1930,7 +1929,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     open_flags = bdrv_open_flags(bs, bs->open_flags);
     node_name = qemu_opt_get(opts, "node-name");
 
-    assert(!drv->bdrv_file_open || file == NULL);
+    assert(!drv->protocol_name || file == NULL);
     ret = bdrv_open_driver(bs, drv, node_name, options, open_flags, errp);
     if (ret < 0) {
         goto fail_opts;
@@ -2030,7 +2029,7 @@ static int bdrv_fill_options(QDict **options, const char *filename,
         }
         /* If the user has explicitly specified the driver, this choice should
          * override the BDRV_O_PROTOCOL flag */
-        protocol = drv->bdrv_file_open;
+        protocol = drv->protocol_name;
     }
 
     if (protocol) {
@@ -3932,7 +3931,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
     }
 
     /* BDRV_O_PROTOCOL must be set iff a protocol BDS is about to be created */
-    assert(!!(flags & BDRV_O_PROTOCOL) == !!drv->bdrv_file_open);
+    assert(!!(flags & BDRV_O_PROTOCOL) == !!drv->protocol_name);
     /* file must be NULL if a protocol BDS is about to be created
      * (the inverse results in an error message from bdrv_open_common()) */
     assert(!(flags & BDRV_O_PROTOCOL) || !file);
@@ -5671,7 +5670,7 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
         return drv->bdrv_get_allocated_file_size(bs);
     }
 
-    if (drv->bdrv_file_open) {
+    if (drv->protocol_name) {
         /*
          * Protocol drivers default to -ENOTSUP (most of their data is
          * not stored in any of their children (if they even have any),
@@ -7772,7 +7771,7 @@ void bdrv_refresh_filename(BlockDriverState *bs)
          *   Both of these conditions are represented by generate_json_filename.
          */
         if (primary_child_bs->exact_filename[0] &&
-            primary_child_bs->drv->bdrv_file_open &&
+            primary_child_bs->drv->protocol_name &&
             !drv->is_filter && !generate_json_filename)
         {
             strcpy(bs->exact_filename, primary_child_bs->exact_filename);
-- 
2.38.1


