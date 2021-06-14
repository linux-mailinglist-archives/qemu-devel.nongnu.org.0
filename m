Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36F3A7292
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 01:40:10 +0200 (CEST)
Received: from localhost ([::1]:51288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lswBb-0005w3-Lb
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 19:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3l-0006UD-MU
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:32:01 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsw3a-0007jo-Hl
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 19:32:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ei4so10688145pjb.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 16:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sJzZfO3g2MpwcVFE3IkN41sU5nN8+pD95wZ5rmnvFQE=;
 b=FKMBvgIZ6PRCqnpbeoMfkD2M8aFFhaTg7Rzddw61yXELxbiD5U19fdjN2EEsFkDIR/
 y84CfTlXcJQ0klkGFshkUACQJgs1v5+vpa91RtDuAVB6KZMqivpLBEVktb0B55AKS6c0
 gFJubqmYE2GElUjyxr/2fGAphtwb8UO85MAjJ2E/Dwmh7WCSIlBzU5Vabndvc77GJ9yP
 nTGhFk96MSVgpqjBH0OYu5p1FQTgzNSFtHF2Tuek4caIZN5Ccj7iQnA4PjrQvaVz+IjQ
 9UZFQa+NdDur+LoFzLx4hn4C1ua+VmcbFkAuU5rhuvZulGo5tIr27w6rePiDQG1a0rtL
 FDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJzZfO3g2MpwcVFE3IkN41sU5nN8+pD95wZ5rmnvFQE=;
 b=iKv6qWpBlsvQsOTKrikWSY2ex7Udft2mGduuTDB1WT+QMWiElVkxYCA2UpNE14tI+e
 Hj7igREYiFbc960hCuB/2YNyBM/nteE5J1kocTNKr+38mQLejJDOXMLDZt++RRdayLG/
 iNyyOL3HovpPep4V4eLq0IcapJR4U2B3Pq0t6gi2IoVYnTpI/CWhCIwrZo8L5mdM7ATo
 hKDAaN7UsxkKJZCVPY9MNPGAQcblRb9R0E/RzcUhWC0mTI0IxlSbhS3tofdgUwAO37kt
 Z/CrcpD+4AUvjBm0QYxJs5T82qioUg+BHi6nQSefbBy4yUmf5gd/79Lpci84d76tnzVo
 bu5Q==
X-Gm-Message-State: AOAM533GHqxZdBFTdzldnPddW8D6JeaVs0dg1wCPqd8Tw3J70+EtXDRn
 +/LNayVPfYXMWAA6SdAQA7JzLcATdruE0Q==
X-Google-Smtp-Source: ABdhPJzzuWdFDHAghUyDMSMV/z4/2ZHasOPzam69bRlZ5HLg2oDiAQWilOubg69qHuG6RqiHsMf2qQ==
X-Received: by 2002:a17:902:ce8e:b029:10c:eb2d:8d2e with SMTP id
 f14-20020a170902ce8eb029010ceb2d8d2emr1183021plg.15.1623713509214; 
 Mon, 14 Jun 2021 16:31:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id gl13sm488113pjb.5.2021.06.14.16.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 16:31:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] qemu/compiler: Remove QEMU_GENERIC
Date: Mon, 14 Jun 2021 16:31:42 -0700
Message-Id: <20210614233143.1221879-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614233143.1221879-1-richard.henderson@linaro.org>
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All previous users now use C11 _Generic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/compiler.h | 40 ----------------------------------------
 1 file changed, 40 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 091c45248b..5766d61589 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -173,46 +173,6 @@
 #define QEMU_ALWAYS_INLINE
 #endif
 
-/* Implement C11 _Generic via GCC builtins.  Example:
- *
- *    QEMU_GENERIC(x, (float, sinf), (long double, sinl), sin) (x)
- *
- * The first argument is the discriminator.  The last is the default value.
- * The middle ones are tuples in "(type, expansion)" format.
- */
-
-/* First, find out the number of generic cases.  */
-#define QEMU_GENERIC(x, ...) \
-    QEMU_GENERIC_(typeof(x), __VA_ARGS__, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
-
-/* There will be extra arguments, but they are not used.  */
-#define QEMU_GENERIC_(x, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, count, ...) \
-    QEMU_GENERIC##count(x, a0, a1, a2, a3, a4, a5, a6, a7, a8, a9)
-
-/* Two more helper macros, this time to extract items from a parenthesized
- * list.
- */
-#define QEMU_FIRST_(a, b) a
-#define QEMU_SECOND_(a, b) b
-
-/* ... and a final one for the common part of the "recursion".  */
-#define QEMU_GENERIC_IF(x, type_then, else_)                                   \
-    __builtin_choose_expr(__builtin_types_compatible_p(x,                      \
-                                                       QEMU_FIRST_ type_then), \
-                          QEMU_SECOND_ type_then, else_)
-
-/* CPP poor man's "recursion".  */
-#define QEMU_GENERIC1(x, a0, ...) (a0)
-#define QEMU_GENERIC2(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC1(x, __VA_ARGS__))
-#define QEMU_GENERIC3(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC2(x, __VA_ARGS__))
-#define QEMU_GENERIC4(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC3(x, __VA_ARGS__))
-#define QEMU_GENERIC5(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC4(x, __VA_ARGS__))
-#define QEMU_GENERIC6(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC5(x, __VA_ARGS__))
-#define QEMU_GENERIC7(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC6(x, __VA_ARGS__))
-#define QEMU_GENERIC8(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC7(x, __VA_ARGS__))
-#define QEMU_GENERIC9(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC8(x, __VA_ARGS__))
-#define QEMU_GENERIC10(x, a0, ...) QEMU_GENERIC_IF(x, a0, QEMU_GENERIC9(x, __VA_ARGS__))
-
 /**
  * qemu_build_not_reached()
  *
-- 
2.25.1


