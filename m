Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6203142B7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:19:07 +0100 (CET)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Es6-0008BK-2w
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCe-0003a5-VN
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:04 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCd-0006Gb-8W
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:04 -0500
Received: by mail-wr1-x432.google.com with SMTP id v15so18373805wrx.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QcUQysKIzSM/Au103fYACCSBXfd/a9CnayLthJR5WoQ=;
 b=sZ5ItwIW1sUrBz78PLnW+9jsu1kCjbXWHeW5D15Ze7XhyWY670vAVasxiQYiseX/7m
 djZpiJQ1nWnMorioPJnibX6126Xe8iWbVy3dxfe3kjOOsqujs/c9oNegSkBYRMWbivmp
 4XUP2jlB70R5dLfT42+kWkSBa6vOwHFSvgmAHmiJxN93pz2V6c+zWzKN/qyjCKB+gDuD
 x41XlOGsrOctIF9ylpG2gho2T0INvBHBA0CkcBPTIgRlurMpbSDeEGKYxaCM7NtGQcN/
 me/zPMKiCJV1nGtJt6aadVYiSMJnlRXpEN5HP07BG1HCvArnowSzafvvJwQtDVMNrc3G
 37HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QcUQysKIzSM/Au103fYACCSBXfd/a9CnayLthJR5WoQ=;
 b=KMnSuDVDNj7sciiWK4W5KIn4z20Aa+mRWnpuLBl6xrGZKwPzVty2OGGk2nOIa0DixT
 E7wv8tLtbtISeCrQdCHAO/LN2CBfSVqZjduu+mCCXMSuO6ymdIPCW17N3PAHyDURSo0p
 sg+uFqegOjIFtxg0arfc51Z6Gs/qHlIv4YlPAKKwJ7LIyJS/dfpDlZ1eBa9dWN4UPeFx
 gSMOFUdctpi6TaIgtKvst0GANwcUAHf47HpHtZ0UvYP6RKM/XLfV91m2yodkLb2Eg9B7
 XMB5G3798tI66dv0MMBkWJLfhsEqmuCX7fieypB6nvswtwQ46BDVp9np157tvhRKbPrd
 LeCA==
X-Gm-Message-State: AOAM530fFYXlNI6gQjkFvwvxQkciUvoWCVssMtA9K1WfIT5ZogKHN0Tx
 y0rLRSxpAcUKxNXW+fVIZBDb5jHjCvA79w==
X-Google-Smtp-Source: ABdhPJxulR1piCpbEfCRG32mIz5baXV7RfwbAmqS9ola3+TNcm3UyzJ1rhdQKND60GFwSEX7P93L2A==
X-Received: by 2002:a5d:5185:: with SMTP id k5mr21725162wrv.40.1612808640169; 
 Mon, 08 Feb 2021 10:24:00 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:59 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/46] qapi/meson: Remove QMP from user-mode emulation
Date: Mon,  8 Feb 2021 19:23:14 +0100
Message-Id: <20210208182331.58897-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-11-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/meson.build  | 10 +++++++---
 tests/meson.build |  7 ++++++-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index 2839871b47..b301a46f04 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -4,14 +4,18 @@ util_ss.add(files(
   'qapi-dealloc-visitor.c',
   'qapi-util.c',
   'qapi-visit-core.c',
-  'qmp-dispatch.c',
-  'qmp-event.c',
-  'qmp-registry.c',
   'qobject-input-visitor.c',
   'qobject-output-visitor.c',
   'string-input-visitor.c',
   'string-output-visitor.c',
 ))
+if have_system or have_tools
+  util_ss.add(files(
+    'qmp-dispatch.c',
+    'qmp-event.c',
+    'qmp-registry.c',
+  ))
+endif
 
 qapi_all_modules = [
   'acpi',
diff --git a/tests/meson.build b/tests/meson.build
index 6f1ff926d2..7d7da6a636 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -86,7 +86,6 @@ tests = {
   'test-qobject-input-visitor': [testqapi],
   'test-string-input-visitor': [testqapi],
   'test-string-output-visitor': [testqapi],
-  'test-qmp-event': [testqapi],
   'test-opts-visitor': [testqapi],
   'test-visitor-serialization': [testqapi],
   'test-bitmap': [],
@@ -117,6 +116,12 @@ tests = {
   'test-qapi-util': [],
 }
 
+if have_system or have_tools
+  tests += {
+    'test-qmp-event': [testqapi],
+  }
+endif
+
 test_deps = {
   'test-qht-par': qht_bench,
 }
-- 
2.29.2



