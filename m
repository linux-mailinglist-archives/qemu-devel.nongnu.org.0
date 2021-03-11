Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A98833814A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:18:16 +0100 (CET)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUZL-0000Km-EU
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUU1-0001oQ-FZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTo-00056O-J8
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdOBjBLcdbMXP51scg5DrlFZj8mW1XPQm5WfkP9UVng=;
 b=MkNnYem2Lb7HW81MmLrkVHzTDPe/3R1NbySdrLUVHgxfogEn3+WXonAnrwV/8jsXl1sSOD
 VORk5eW8a2vWAxcUUWQdjxwVYQ7RItwre6+l46AzTeE+gLfWtaAZzv9ygqTtbhrWD6n7ND
 AkmgvnaPadGkN4xS7sZ6uAkAC+a4z6o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-s9zCKpiyNS6-r-Ta12dBYg-1; Thu, 11 Mar 2021 18:12:28 -0500
X-MC-Unique: s9zCKpiyNS6-r-Ta12dBYg-1
Received: by mail-wm1-f70.google.com with SMTP id c7so4641952wml.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:12:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdOBjBLcdbMXP51scg5DrlFZj8mW1XPQm5WfkP9UVng=;
 b=UAtrC3il/gKoS08iSz8NxyX9TxuUjuSKcIjUDuClAPCzD3nV/dGWHsPc2y44z1q2wK
 Uam4cyoDm5N0qCz+Gtkv/Z248C35urnhGCUxdpgkJAQkz7ZyF3xHvyu+N2OhE2277x3r
 4eIAw+HbDiso5Wa/nTrkEpBOUTdL0wplgF7Ah+0lpYICHBFyry77j+JBvlN5v27wgPzT
 PguFfwF8Apkwvp2lcg4ccgpt50IvWtwgU5p+L9rnJfE9RU6XvNGB8iwsdgXY5vKwIHou
 RcFW2Zzi35/McVWi2ly0bdFoshku0d3wL5xdCVFMhgPxDL++jiiVMQjCPUh9+Uym+vGG
 0uXg==
X-Gm-Message-State: AOAM530m9Q5CepgeDbP++86P0lNDc0YTR8aGru0SCWx+oIHgcM6037r+
 y1zaXHh7LCysgrhapGvFveStJHalOn9HJjU5E8dLg9QlhuOQK84UDJlMvl8NoVzG3J2j+JkcF4h
 KZDZ4hhwf2KQv6xSp04Ty6oCCZn0ptAuayaNIysfPkxnwAikQzroouG4xkS2ucV4R
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr10992793wrn.174.1615504346609; 
 Thu, 11 Mar 2021 15:12:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNLcz8VoON0vxaqyOVtbiqmCdBWPfk5PvjWnFcoWLBjEfFWyJmi8qYRwdZSaKQEGQYK1R38w==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr10992771wrn.174.1615504346467; 
 Thu, 11 Mar 2021 15:12:26 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s23sm255991wmc.35.2021.03.11.15.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 4/6] qtest/arm-cpu-features: Check KVM availability at runtime
Date: Fri, 12 Mar 2021 00:12:00 +0100
Message-Id: <20210311231202.1536040-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
are KVM specific tests. Skip them if KVM is not built-in.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb85..2b70104515d 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
@@ -413,6 +413,10 @@ static void sve_tests_sve_off_kvm(const void *data)
     QTestState *qts;
 
     qts = qtest_init(MACHINE_KVM "-cpu max,sve=off");
+    if (!qtest_probe_accel(qts, "kvm")) {
+        g_test_skip("KVM not available, skipping test");
+        goto done;
+    }
 
     /*
      * We don't know if this host supports SVE so we don't
@@ -424,6 +428,7 @@ static void sve_tests_sve_off_kvm(const void *data)
     assert_sve_vls(qts, "max", 0, NULL);
     assert_sve_vls(qts, "max", 0, "{ 'sve128': false }");
 
+done:
     qtest_quit(qts);
 }
 
@@ -492,6 +497,10 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
     QTestState *qts;
 
     qts = qtest_init(MACHINE_KVM "-cpu max");
+    if (!qtest_probe_accel(qts, "kvm")) {
+        g_test_skip("KVM not available, skipping test");
+        goto done;
+    }
 
     /*
      * These tests target the 'host' CPU type, so KVM must be enabled.
@@ -609,6 +618,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
         assert_has_not_feature(qts, "host", "kvm-steal-time");
     }
 
+done:
     qtest_quit(qts);
 }
 
-- 
2.26.2


