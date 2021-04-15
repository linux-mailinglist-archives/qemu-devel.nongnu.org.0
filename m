Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65B36105A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:44:48 +0200 (CEST)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX56l-0001RX-AO
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wc-0003aK-7Y
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4wT-0006Jo-G1
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXF3I2HiTrXmapky2sFUIdU4HSA6Nendcs7h4VxHKIw=;
 b=QpYeCch5sWLnWOI2qZR6N5609QQrppTSPFfoiFgo721HIXFXMmLNxOHy0C2vxccxQrkIaN
 7ST/mjZjDgCRuaom1IH6HLF04SOjC4RsVOaXVq/iuodXjK2NZfWf0fm3bMwDWpsKs0OM9A
 0pNjljSfWZmCZJZ5OgHdOiSkrc2bY7A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-HrEDskwINjGZvHQ0h-wpzQ-1; Thu, 15 Apr 2021 12:34:05 -0400
X-MC-Unique: HrEDskwINjGZvHQ0h-wpzQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 33-20020adf80240000b02900f9e2646f9aso2993267wrk.0
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXF3I2HiTrXmapky2sFUIdU4HSA6Nendcs7h4VxHKIw=;
 b=lB4Afw2B7+1Ze01hLk2yAUPKT1HJcW3OEFiBkWwLsLBTdqTt/BG44sB5tlbxHCp71F
 8M8cpAA8jRzAhPzzJkzx2YCZFtNFpiNxRA3BsbBHIrI5me9q7NO6JgzSgYGa3t6v98wR
 9S9iQxHLCZKoO4K3qTk7gdvRp53Dk7OpWcKMN/wF07ETAGzryVObh5IC2i6LiToDtLBW
 vu1TZ6WYPGgUSpq/oMw4oT+5/PROa6oOaPwIVxslwQxZ8epi1gL2lbSIG/sOVdwPG0Bo
 pCIJp6k0iDgmrdR+zhGSrOzipHRIKEgnqdzhni3j/Ba0OI14OBJtWWvT8TL1u47C7lrT
 UZgQ==
X-Gm-Message-State: AOAM5330OSzp2xMEnkgbPOsaZlb51r4mmie8GwXZSFxhR1ItokjUDMdz
 KemlrF9w4OE9QqOYHCFleWBZewbQK3dog2M8U3Yh++ad6zK5LFGpSgr9s0xlF/7AHyJhEKnD3PR
 d9bdfVmmRdyfN0ltQR5s31f/08BNSOqg7fj6D3ssh9tNIzNpA0uIgiqpb83wBIVf3
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr4007996wml.41.1618504443711; 
 Thu, 15 Apr 2021 09:34:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiFxh9zumaQT2ovO0zmmObHaJ8LmOOcmECLKoRsmflXTp/tWLdjOFpqSK1HJvzeKu63tBqYw==
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr4007963wml.41.1618504443538; 
 Thu, 15 Apr 2021 09:34:03 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j12sm4126038wro.29.2021.04.15.09.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:34:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test build-independent from
 accelerator
Date: Thu, 15 Apr 2021 18:33:02 +0200
Message-Id: <20210415163304.4120052-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than we can probe if the TCG accelerator is available
at runtime with a QMP command, do it once at the beginning
and only register the tests we can run.
We can then replace the #ifdef'ry by a runtime check.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index c98b78d0339..8902d2f169f 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -21,19 +21,24 @@ const char common_args[] = "-nodefaults -machine none";
 
 /* Query smoke tests */
 
+static bool tcg_accel_available;
+
 static int query_error_class(const char *cmd)
 {
-    static struct {
+    static const struct {
         const char *cmd;
         int err_class;
+        /*
+         * Pointer to boolean.
+         * If non-NULL and value is %true, the error class is skipped.
+         */
+        bool *skip_err_class;
     } fails[] = {
         /* Success depends on build configuration: */
 #ifndef CONFIG_SPICE
         { "query-spice", ERROR_CLASS_COMMAND_NOT_FOUND },
 #endif
-#ifndef CONFIG_TCG
-        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND },
-#endif
+        { "query-replay", ERROR_CLASS_COMMAND_NOT_FOUND, &tcg_accel_available },
 #ifndef CONFIG_VNC
         { "query-vnc", ERROR_CLASS_GENERIC_ERROR },
         { "query-vnc-servers", ERROR_CLASS_GENERIC_ERROR },
@@ -51,6 +56,9 @@ static int query_error_class(const char *cmd)
     int i;
 
     for (i = 0; fails[i].cmd; i++) {
+        if (fails[i].skip_err_class && *fails[i].skip_err_class) {
+            continue;
+        }
         if (!strcmp(cmd, fails[i].cmd)) {
             return fails[i].err_class;
         }
@@ -334,6 +342,8 @@ int main(int argc, char *argv[])
     QmpSchema schema;
     int ret;
 
+    tcg_accel_available = qtest_has_accel("tcg");
+
     g_test_init(&argc, &argv, NULL);
 
     qmp_schema_init(&schema);
-- 
2.26.3


