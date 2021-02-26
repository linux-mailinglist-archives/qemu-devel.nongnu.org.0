Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77CC325EA6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:09:42 +0100 (CET)
Received: from localhost ([::1]:33350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYBs-0003l1-Kl
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7x-0001ia-4l
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:33 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7v-00042s-7q
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id o16so6955218wmh.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yXIWvdB/EerYRecTTmg1n1mknTNJJTJWRa3KyltqPKU=;
 b=Qmi+NZjWS8ZZ+NLakI5UbC+nGTeVkQ2moF7KPSTytSwsS7/uXMs5fcg8X4E6Uh/KTb
 nz+2br67AOi/DgA8NAuABXVYT/+UklYA4Z027U52R1uv+mwcflWq/TpI1GUq+RWuE7A6
 AtkfY8AN6Rrvf3N7uBYLpGQh7I17ubXGGOTWgkD37lT7JlzFnKLnrMn/RtQCRjPo00Sb
 CEHRPkH4e9OJ6eCGExdWfTYvfHenq5IhTA2qg62EwOMhuJ6PiQ5A6vcF2br3IvqrCIEW
 9qkR+ve7Oev0Vn2Fna6UJdS4zHhl9CvQ+TdF9C4iAu++49deCbCj0euMHSmFcQV6nR4n
 5ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yXIWvdB/EerYRecTTmg1n1mknTNJJTJWRa3KyltqPKU=;
 b=LDKABeT82RnEB+IqwHI45XB9+DLbKRbKlis5ZeqWrQgiGxP4lOGUpewvvpbNQ+/FR8
 A6bD16mpZ/WFQOrr4RRzoOhNSnjw9lANzeeZiULMJPWI5N2Ep2F4qGukwAZY1fu7xv8V
 yyM66E0VjfDxe71bad36OkpPxGugSJbpjKeQ2E6XlqIZgRyuiK6aiIH9Zh6KRrjlSnNd
 YCXecD+c8xSK0ktLgzcPQiGb9YCbiHgV4H3nPqJVw4siqn39OdOsS2QCxNPTy8fBRGou
 cOy9HEY1I1DubLMaVZtV3xbNtGWiAjR5ok73V4GGVUMriMSqZRJI7xiA4jWbVKunr0hr
 ygaw==
X-Gm-Message-State: AOAM533Hq2LQNwif/mttmvfxYcxFHxNITs2QoGDHcKd5OuVHV8utJOri
 +NhCIOSjACzjxHaEUR0gaZ+hiEcuWd8=
X-Google-Smtp-Source: ABdhPJw8cIKjCSZ4BafE+4vnmU/Osfg9nhJIyF9PkOXQTfCL81iideiRsYSk4ogGWEKMVPlgjTJbTQ==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr1534632wmk.63.1614326729156;
 Fri, 26 Feb 2021 00:05:29 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:28 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/29] configure: fix --enable-fuzzing linker failures
Date: Fri, 26 Feb 2021 09:04:59 +0100
Message-Id: <20210226080526.651705-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Li Qiang <liq3ea@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

With --enable-fuzzing, QEMU_CFLAGS include -fsanitize=fuzzer-no-link.
This should allow us to build non-fuzzer binaries using objects
instrumented for fuzzing. However, to do that, we also need to link with
-fsanitize=fuzzer-no-link. We were not doing that.

Reported-by: Li Qiang <liq3ea@163.com>,
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20210221174510.22542-1-alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/configure b/configure
index a79b3746d4..19f2b88589 100755
--- a/configure
+++ b/configure
@@ -6096,7 +6096,17 @@ if test "$fuzzing" = "yes" ; then
   # If LIB_FUZZING_ENGINE is set, assume we are running on OSS-Fuzz, and the
   # needed CFLAGS have already been provided
   if test -z "${LIB_FUZZING_ENGINE+xxx}" ; then
+    # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
+    # compiled code.
     QEMU_CFLAGS="$QEMU_CFLAGS -fsanitize=fuzzer-no-link"
+    # To build non-fuzzer binaries with --enable-fuzzing, link everything with
+    # fsanitize=fuzzer-no-link. Otherwise, the linker will be unable to bind
+    # the fuzzer-related callbacks added by instrumentation.
+    QEMU_LDFLAGS="$QEMU_LDFLAGS -fsanitize=fuzzer-no-link"
+    # For the actual fuzzer binaries, we need to link against the libfuzzer
+    # library. Provide the flags for doing this in FUZZ_EXE_LDFLAGS. The meson
+    # rule for the fuzzer adds these to the link_args. They need to be
+    # configurable, to support OSS-Fuzz
     FUZZ_EXE_LDFLAGS="-fsanitize=fuzzer"
   else
     FUZZ_EXE_LDFLAGS="$LIB_FUZZING_ENGINE"
-- 
2.29.2



