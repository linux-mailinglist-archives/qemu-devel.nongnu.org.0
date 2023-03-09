Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE8D6B1EB1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:51:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBzU-0007mg-7A; Thu, 09 Mar 2023 03:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBzJ-0007k5-5L
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBzH-00021Z-Fb
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M03WwdG34wPjeEEg0rnhkt9BMsbe0esm2loujONRDeM=;
 b=fL9ghfGFwhBdccmrjeFJywdk6F17ztbSXfYu8RqNmrWWaDwO/QLiw8hfe+RfoOYUQXMV0m
 vJJnDQsellBzDcoiwQhFccOFely7E4mTLADCACZ24z7pmdyJNEz8SS3JpQgpyTBnINETK9
 wze6K8NGvxtcboLx9ZTEh3c5BXJkI6Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-sro_wGHoMuWragfHCdFEMQ-1; Thu, 09 Mar 2023 03:50:57 -0500
X-MC-Unique: sro_wGHoMuWragfHCdFEMQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 g2-20020a056402320200b004e98d45ee7dso1985404eda.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M03WwdG34wPjeEEg0rnhkt9BMsbe0esm2loujONRDeM=;
 b=h819uqFY+r5cHyWWgkCmH3/YOt+OsL2zm927URVxT2MV2YVZwHLTsj4dVbQA+iiGCL
 /VChn5U2NZeXS4KLMmUZRG4RGq8HDYKTOOODYunHDrD6S0Gs+roC6beE7ZgqAoY2FmSd
 kG0FxCfmA9CkVQ6F2WahvvjQ4k4v8cCJrzh8sqGI7fyaHezKeWxj4RelUnJSW9rl2W81
 qV9f8H49RkhGR74qvPZ1Qxf5mLOSRs/hz5uGHOKBbjixQAMKzIrZ5amrpILYA1hxM44K
 3k9jzWwpI17dUr5f7pMwfTieK31rzP/5Ye8/4djMkn8tkpqIob8QZrk+kXcMUDa3/FnU
 AS6w==
X-Gm-Message-State: AO0yUKWga2SPf8bOrCADtLHi1igcmsoc7vD/8Oc1gs2Hgg5/skcbdwz2
 XfEiH39f4p9v3dXzdFusYcybBPO8P2Vh33D2ozhelj/9QsX9OgFCwGNJ7TYLuH7FZ8XCwDyqSL+
 qlCUFTgGYOnT/iPJDkQGEqZbML4MDOWijulvK5hCyO3uq6qS1Vkrcr8q6qMb0MqHq2gE3WF3wzd
 A=
X-Received: by 2002:a17:906:ee82:b0:8b1:304e:589e with SMTP id
 wt2-20020a170906ee8200b008b1304e589emr26895181ejb.53.1678351855612; 
 Thu, 09 Mar 2023 00:50:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+KVdd4iT9KYtwQng5DgQINYhW0LF+4oiBf2FrBOTolWU+wi5lCG7IepPcc2VsI5qS792cDBw==
X-Received: by 2002:a17:906:ee82:b0:8b1:304e:589e with SMTP id
 wt2-20020a170906ee8200b008b1304e589emr26895164ejb.53.1678351855267; 
 Thu, 09 Mar 2023 00:50:55 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a170906719700b008c673cd9ba2sm8484640ejk.126.2023.03.09.00.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:50:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 2/3] block: do not check bdrv_file_open
Date: Thu,  9 Mar 2023 09:50:50 +0100
Message-Id: <20230309085051.308664-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309085051.308664-1-pbonzini@redhat.com>
References: <20230309085051.308664-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The set of BlockDrivers that have .bdrv_file_open coincides with those
that have .protocol_name and guess what---checking drv->bdrv_file_open
is done to see if the driver is a protocol.  So check drv->protocol_name
instead.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 075da6517b7f..71f0ea24870e 100644
--- a/block.c
+++ b/block.c
@@ -914,7 +914,6 @@ BlockDriver *bdrv_find_protocol(const char *filename,
     int i;
 
     GLOBAL_STATE_CODE();
-    /* TODO Drivers without bdrv_file_open must be specified explicitly */
 
     /*
      * XXX(hch): we really should not let host device detection
@@ -1628,7 +1627,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     bs->opaque = g_malloc0(drv->instance_size);
 
     assert(!drv->bdrv_needs_filename || bs->filename[0]);
-    if (drv->bdrv_file_open) {
+    if (drv->bdrv_open) {
         ret = drv->bdrv_file_open(bs, options, open_flags, &local_err);
     } else if (drv->bdrv_open) {
         ret = drv->bdrv_open(bs, options, open_flags, &local_err);
@@ -1940,7 +1939,7 @@ static int bdrv_open_common(BlockDriverState *bs, BlockBackend *file,
     open_flags = bdrv_open_flags(bs, bs->open_flags);
     node_name = qemu_opt_get(opts, "node-name");
 
-    assert(!drv->bdrv_file_open || file == NULL);
+    assert(!drv->protocol_name || file == NULL);
     ret = bdrv_open_driver(bs, drv, node_name, options, open_flags, errp);
     if (ret < 0) {
         goto fail_opts;
@@ -2040,7 +2039,7 @@ static int bdrv_fill_options(QDict **options, const char *filename,
         }
         /* If the user has explicitly specified the driver, this choice should
          * override the BDRV_O_PROTOCOL flag */
-        protocol = drv->bdrv_file_open;
+        protocol = drv->protocol_name;
     }
 
     if (protocol) {
@@ -4000,7 +3999,7 @@ bdrv_open_inherit(const char *filename, const char *reference, QDict *options,
     }
 
     /* BDRV_O_PROTOCOL must be set iff a protocol BDS is about to be created */
-    assert(!!(flags & BDRV_O_PROTOCOL) == !!drv->bdrv_file_open);
+    assert(!!(flags & BDRV_O_PROTOCOL) == !!drv->protocol_name);
     /* file must be NULL if a protocol BDS is about to be created
      * (the inverse results in an error message from bdrv_open_common()) */
     assert(!(flags & BDRV_O_PROTOCOL) || !file);
@@ -5785,7 +5784,7 @@ int64_t coroutine_fn bdrv_co_get_allocated_file_size(BlockDriverState *bs)
         return drv->bdrv_co_get_allocated_file_size(bs);
     }
 
-    if (drv->bdrv_file_open) {
+    if (drv->protocol_name) {
         /*
          * Protocol drivers default to -ENOTSUP (most of their data is
          * not stored in any of their children (if they even have any),
@@ -7888,7 +7887,7 @@ void bdrv_refresh_filename(BlockDriverState *bs)
          *   Both of these conditions are represented by generate_json_filename.
          */
         if (primary_child_bs->exact_filename[0] &&
-            primary_child_bs->drv->bdrv_file_open &&
+            primary_child_bs->drv->protocol_name &&
             !drv->is_filter && !generate_json_filename)
         {
             strcpy(bs->exact_filename, primary_child_bs->exact_filename);
-- 
2.39.2


