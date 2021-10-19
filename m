Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4D44334AB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:28:08 +0200 (CEST)
Received: from localhost ([::1]:57022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnHr-0003DG-Rm
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9v-0008Li-Gl
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9s-0001j2-BH
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J4MfM0+HkTOQpE0I/uBk2BJFfKfE/CesWmDc3Xi4A0w=;
 b=f3JWm/kb6UsXGjNOC5xwcJbvlhRDMK1yCDM73/jxdwaG7e999jqOk5V+24+z7zBFaRurIl
 GSS+lmrHLbz4DqP0wcom6vp1/hom8u2JPA8aWD/BNLq3xUK5ts9ceH6Thg47UObqLdMRJz
 GcWQ6ps4FW5CMEHqTFQCtrW0sdb7oZQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Y13qyBUBPTyfd-XMzMwLGQ-1; Tue, 19 Oct 2021 07:19:48 -0400
X-MC-Unique: Y13qyBUBPTyfd-XMzMwLGQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so17254969edi.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J4MfM0+HkTOQpE0I/uBk2BJFfKfE/CesWmDc3Xi4A0w=;
 b=f69xEDNCXI+URvMK2bPT8GCgaEkBRBqWUXgIiTMBBp2uizUewtKaKJdrxWHQm6UN3L
 T+eSQ9MUkTB5IhTeyOUM+UYe86sKBzUvN4x2nhSOjU485Z5cSZApueOmpUpGa1AjEee1
 G0Y7rwd8sWgcowbPttUqu9nJbca4p0h3cxwsPi9//YvBaXFbf2PMJIAMQacxnnVkTj/R
 R6N0A0VXJx0hIYXeYEipvyAdQVAh8XMH6xbzn0YiRivnQKGjYlGySQ25qvVlAxbaZVNq
 AEDRr+2WClME3WMk2/qjydoGZDuJ8CTP4YnFG8ibLJXRyZRmiqnIzf+2o4W7Zs4ZOrie
 J2GQ==
X-Gm-Message-State: AOAM533GnpI0hBpXmfpebhJjfZjyhZzm9uONzQ+dKHW9F0mC6N+Mkdui
 NBFSYnsyeoHfmEBznaB7w8SRz0z9raWBB3/5NjS8z8rhvpyu575ZkbPtmVUU5PLb5Dw26L9Yy7S
 AJwGn8BHiBkzxJIwVl1hfJd4VECnpx8+wCCwp1cce/sZyYifhvsRxikK8m3AF
X-Received: by 2002:a17:906:6c8:: with SMTP id
 v8mr37445852ejb.428.1634642386497; 
 Tue, 19 Oct 2021 04:19:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyCMkaXaJyHk/UaeCVDptIseU2Wb0+kj8kUS66+liIZUlDbL+7sXIy8E9v156iyrW0745MOQ==
X-Received: by 2002:a17:906:6c8:: with SMTP id
 v8mr37445825ejb.428.1634642386237; 
 Tue, 19 Oct 2021 04:19:46 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id lg3sm9955275ejb.78.2021.10.19.04.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:19:45 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:19:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/29] tests: qtest: add qtest_has_accel() to check if tested
 binary supports accelerator
Message-ID: <20211019111923.679826-3-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Currently it is not possible to create tests that have KVM as a hard
requirement on a host that doesn't support KVM for tested target
binary (modulo going through the trouble of compiling out
the offending test case).

Following scenario makes test fail when it's run on non x86 host:
  qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288

This patch introduces qtest_has_accel() to let users check if accel is
available in advance and avoid executing non run-able test-cases.

It implements detection of TCG and KVM only, the rest could be
added later on, when we actually start testing them in qtest.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c        | 27 +++++++++++++++++++++++++++
 meson.build                   |  6 ++++++
 3 files changed, 41 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d4..59e9271195 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -588,6 +588,14 @@ bool qtest_big_endian(QTestState *s);
  */
 const char *qtest_get_arch(void);
 
+/**
+ * qtest_has_accel:
+ * @accel_name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_has_accel(const char *accel_name);
+
 /**
  * qtest_add_func:
  * @str: Test case path.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 73f6b977a6..25aeea385b 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -922,6 +922,33 @@ const char *qtest_get_arch(void)
     return end + 1;
 }
 
+bool qtest_has_accel(const char *accel_name)
+{
+    if (g_str_equal(accel_name, "tcg")) {
+#if defined(CONFIG_TCG)
+        return true;
+#else
+        return false;
+#endif
+    } else if (g_str_equal(accel_name, "kvm")) {
+        int i;
+        const char *arch = qtest_get_arch();
+        const char *targets[] = { CONFIG_KVM_TARGETS };
+
+        for (i = 0; i < ARRAY_SIZE(targets); i++) {
+            if (!strncmp(targets[i], arch, strlen(arch))) {
+                if (!access("/dev/kvm", R_OK | W_OK)) {
+                    return true;
+                }
+            }
+        }
+    } else {
+        /* not implemented */
+        g_assert_not_reached();
+    }
+    return false;
+}
+
 bool qtest_get_irq(QTestState *s, int num)
 {
     /* dummy operation in order to make sure irq is up to date */
diff --git a/meson.build b/meson.build
index 6b7487b725..266b94644b 100644
--- a/meson.build
+++ b/meson.build
@@ -72,6 +72,12 @@ else
   kvm_targets = []
 endif
 
+kvm_targets_c = ''
+if not get_option('kvm').disabled() and targetos == 'linux'
+  kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
+endif
+config_host_data.set('CONFIG_KVM_TARGETS', kvm_targets_c)
+
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
 
 if cpu in ['aarch64']
-- 
MST


