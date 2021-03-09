Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F02D332BF3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:27:24 +0100 (CET)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfCd-0003KD-Dc
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeez-0003xq-E9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeem-0000ws-Hy
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUIP1hLD9IuDyzpzwwpjqZJWzFhUHjnXHR+4nt8i9Rs=;
 b=XgXs67rhC5l+QN803ez9Nh2F0qtDuEM6uDd7bnR5dm1n3ZZyG/FUyi1Ya7tySkSZRV9GqN
 HwjhaY/vHqtuQJ2Tz14tFeUYE0oCN5B2Jiy4BA0KPOQrL3hbM59/PH7J8ei+JMK+X0XWXm
 7dIaMhhn0iUp4QpLzBC7ptgZSxGbULY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-1tCHwvirN9inWzhAUmkkWQ-1; Tue, 09 Mar 2021 10:52:18 -0500
X-MC-Unique: 1tCHwvirN9inWzhAUmkkWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7321842144
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 15:52:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FEEE19C46;
 Tue,  9 Mar 2021 15:52:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/17] utils: Deprecate hex-with-suffix sizes
Date: Tue,  9 Mar 2021 09:51:50 -0600
Message-Id: <20210309155202.1312571-6-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supporting '0x20M' looks odd, particularly since we have a 'B' suffix
that is ambiguous for bytes, as well as a less-frequently-used 'E'
suffix for extremely large exibytes.  In practice, people using hex
inputs are specifying values in bytes (and would have written
0x2000000, or possibly relied on default_suffix in the case of
qemu_strtosz_MiB), and the use of scaling suffixes makes the most
sense for inputs in decimal (where the user would write 32M).  But
rather than outright dropping support for hex-with-suffix, let's
follow our deprecation policy.  Sadly, since qemu_strtosz() does not
have an Err** parameter, and plumbing that in would be a much larger
task, we instead go with just directly emitting the deprecation
warning to stderr.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210211204438.1184395-4-eblake@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/deprecated.rst |  8 ++++++++
 util/cutils.c              | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index cfabe6984677..ecff6bf8c633 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -166,6 +166,14 @@ Using ``-M kernel-irqchip=off`` with x86 machine types that include a local
 APIC is deprecated.  The ``split`` setting is supported, as is using
 ``-M kernel-irqchip=off`` with the ISA PC machine type.

+hexadecimal sizes with scaling multipliers (since 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Input parameters that take a size value should only use a size suffix
+(such as 'k' or 'M') when the base is written in decimal, and not when
+the value is hexadecimal.  That is, '0x20M' is deprecated, and should
+be written either as '32M' or as '0x2000000'.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------

diff --git a/util/cutils.c b/util/cutils.c
index 189a184859c0..d89a40a8c325 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -250,6 +250,9 @@ static int64_t suffix_mul(char suffix, int64_t unit)
  *   fractional portion is truncated to byte
  * - 0x7fEE - hexadecimal, unit determined by @default_suffix
  *
+ * The following cause a deprecation warning, and may be removed in the future
+ * - 0xabc{kKmMgGtTpP} - hex with scaling suffix
+ *
  * The following are intentionally not supported
  * - octal, such as 08
  * - fractional hex, such as 0x1.8
@@ -272,7 +275,7 @@ static int do_strtosz(const char *nptr, const char **end,
     int retval;
     const char *endptr, *f;
     unsigned char c;
-    bool mul_required = false;
+    bool mul_required = false, hex = false;
     uint64_t val;
     int64_t mul;
     double fraction = 0.0;
@@ -298,6 +301,7 @@ static int do_strtosz(const char *nptr, const char **end,
             retval = -EINVAL;
             goto out;
         }
+        hex = true;
     } else if (*endptr == '.') {
         /*
          * Input looks like a fraction.  Make sure even 1.k works
@@ -320,6 +324,10 @@ static int do_strtosz(const char *nptr, const char **end,
     c = *endptr;
     mul = suffix_mul(c, unit);
     if (mul > 0) {
+        if (hex) {
+            warn_report("Using a multiplier suffix on hex numbers "
+                        "is deprecated: %s", nptr);
+        }
         endptr++;
     } else {
         mul = suffix_mul(default_suffix, unit);
-- 
2.30.1


