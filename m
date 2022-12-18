Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BCA64FD25
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 01:08:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6hCz-0008Dy-SP; Sat, 17 Dec 2022 19:07:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6hCr-0008Cp-2F
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 19:07:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p6hCn-0001t9-Hv
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 19:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671322020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=b1OdsFDNSpkCrx/ydX2YpYJos4rKJHJuGr4yCaKPwsk=;
 b=Abdpufy1opxsTvx3mW09qFtPNIHrfJg61ywzDl8PI0fNSBlMnn5VosGfGwf8sJgLtyc9yz
 IkbhrjcytkKvoZVn83ingeByV3SOBDdUK0zNGCzT2jbb1jyfMj0hsqU6abJC2WYFtRy1Id
 iHl+e8II/ErvbS8bAXlA0PCrx8bKjbs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-xFLPooaFOkGIUjLP99EfGg-1; Sat, 17 Dec 2022 19:06:59 -0500
X-MC-Unique: xFLPooaFOkGIUjLP99EfGg-1
Received: by mail-ej1-f69.google.com with SMTP id
 nc4-20020a1709071c0400b0078a5ceb571bso3964687ejc.4
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 16:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b1OdsFDNSpkCrx/ydX2YpYJos4rKJHJuGr4yCaKPwsk=;
 b=srNnBLMpj5eLRA5D28nDS675ebaprvs9E366vT9eEVYgSNG4BO/vRjojEoCivPt0gZ
 6hob0V5tKZPwbCLiP98mWn/AOZ5UTQpIZyAckYnj84lACsPrYcWIXAcu3MR1KCKkJSiK
 Wfc+MFubPFmu41pgcfiYNHZMZ64hR54/WWh7IPBd75MHyKvi7ON0bj4wDOlOswLbZTwb
 wBFGWFg7dHjLIZUVqWffMyj/NqmeXwRjzwObzl2L7Bg18Y9dNuY6Cv0kz+y1Mvmb/HEG
 Zq8R8Jrxt/jYNIrXPxjNpV3j/4XByV6c/UBG/keBtZGBWiwqOytnNQjmusOH2fxclln6
 XvUQ==
X-Gm-Message-State: ANoB5pkCPbBw+a3nHDVqFv+4H66Iu/H2IMEqXu+NXZZM3kTGzPiUrCpX
 eZaDPQAir+/uwUWS68UG0nNRcVPkSDLdkCiciyLjZab0mgviS/vkCZ8DgCnoJT7UqJzDjvtQ5S+
 2HyqqRSZHWvuY6zT68g2Bnba4C3JeKgrAVx7IPC3MDHoVbH0ScK3Y3Lb3prv1dQtRHFY=
X-Received: by 2002:a17:906:1c04:b0:7c1:1444:da2e with SMTP id
 k4-20020a1709061c0400b007c11444da2emr29256260ejg.63.1671322017768; 
 Sat, 17 Dec 2022 16:06:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5JOBF78VbiEi2ybKOWB1B924MFPZlrV3lIPeucRZs+EVpYmsaenTLAo7x0ACL96xB+7eSUEg==
X-Received: by 2002:a17:906:1c04:b0:7c1:1444:da2e with SMTP id
 k4-20020a1709061c0400b007c11444da2emr29256248ejg.63.1671322017329; 
 Sat, 17 Dec 2022 16:06:57 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a1709060cc100b007be886f0db5sm2471976ejh.209.2022.12.17.16.06.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 16:06:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] util: remove support for hex numbers with a scaling suffix
Date: Sun, 18 Dec 2022 01:06:47 +0100
Message-Id: <20221218000649.686882-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
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

This was deprecated in 6.0 and can now be removed.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/about/deprecated.rst       |  8 --------
 docs/about/removed-features.rst |  8 ++++++++
 tests/unit/test-cutils.c        |  8 ++++++++
 util/cutils.c                   | 14 +++-----------
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index f1575a52cb4d..f3cb309cb8e1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -58,14 +58,6 @@ and will cause a warning.
 The replacement for the ``nodelay`` short-form boolean option is ``nodelay=on``
 rather than ``delay=off``.
 
-hexadecimal sizes with scaling multipliers (since 6.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Input parameters that take a size value should only use a size suffix
-(such as 'k' or 'M') when the base is written in decimal, and not when
-the value is hexadecimal.  That is, '0x20M' is deprecated, and should
-be written either as '32M' or as '0x2000000'.
-
 ``-spice password=string`` (since 6.0)
 ''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 76c2178cd39e..68ac80d37a40 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -408,6 +408,14 @@ pcspk-audiodev=<name>``.
 
 Use ``-device`` instead.
 
+Hexadecimal sizes with scaling multipliers (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Input parameters that take a size value should only use a size suffix
+(such as 'k' or 'M') when the base is written in decimal, and not when
+the value is hexadecimal.  That is, '0x20M' should be written either as
+'32M' or as '0x2000000'.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 86caddcf6498..2126b463919b 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2315,6 +2315,14 @@ static void test_qemu_strtosz_invalid(void)
     g_assert_cmpint(res, ==, 0xbaadf00d);
     g_assert(endptr == str);
 
+    /* No suffixes */
+    str = "0x18M";
+    endptr = NULL;
+    err = qemu_strtosz(str, &endptr, &res);
+    g_assert_cmpint(err, ==, -EINVAL);
+    g_assert_cmpint(res, ==, 0xbaadf00d);
+    g_assert(endptr == str);
+
     /* No negative values */
     str = "-0";
     endptr = NULL;
diff --git a/util/cutils.c b/util/cutils.c
index def9c746cede..5887e7441405 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -197,10 +197,8 @@ static int64_t suffix_mul(char suffix, int64_t unit)
  *   fractional portion is truncated to byte
  * - 0x7fEE - hexadecimal, unit determined by @default_suffix
  *
- * The following cause a deprecation warning, and may be removed in the future
- * - 0xabc{kKmMgGtTpP} - hex with scaling suffix
- *
  * The following are intentionally not supported
+ * - hex with scaling suffix, such as 0x20M
  * - octal, such as 08
  * - fractional hex, such as 0x1.8
  * - floating point exponents, such as 1e3
@@ -222,7 +220,6 @@ static int do_strtosz(const char *nptr, const char **end,
     int retval;
     const char *endptr, *f;
     unsigned char c;
-    bool hex = false;
     uint64_t val, valf = 0;
     int64_t mul;
 
@@ -237,17 +234,16 @@ static int do_strtosz(const char *nptr, const char **end,
         goto out;
     }
     if (val == 0 && (*endptr == 'x' || *endptr == 'X')) {
-        /* Input looks like hex, reparse, and insist on no fraction. */
+        /* Input looks like hex; reparse, and insist on no fraction or suffix. */
         retval = qemu_strtou64(nptr, &endptr, 16, &val);
         if (retval) {
             goto out;
         }
-        if (*endptr == '.') {
+        if (*endptr == '.' || suffix_mul(*endptr, unit) > 0) {
             endptr = nptr;
             retval = -EINVAL;
             goto out;
         }
-        hex = true;
     } else if (*endptr == '.') {
         /*
          * Input looks like a fraction.  Make sure even 1.k works
@@ -272,10 +268,6 @@ static int do_strtosz(const char *nptr, const char **end,
     c = *endptr;
     mul = suffix_mul(c, unit);
     if (mul > 0) {
-        if (hex) {
-            warn_report("Using a multiplier suffix on hex numbers "
-                        "is deprecated: %s", nptr);
-        }
         endptr++;
     } else {
         mul = suffix_mul(default_suffix, unit);
-- 
2.38.1


