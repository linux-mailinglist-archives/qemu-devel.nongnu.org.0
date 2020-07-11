Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0E221C3F4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jul 2020 13:20:20 +0200 (CEST)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juDYJ-0006yd-HN
	for lists+qemu-devel@lfdr.de; Sat, 11 Jul 2020 07:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1juDMW-0004od-8h
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 07:08:08 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1juDMU-0006Pu-3i
 for qemu-devel@nongnu.org; Sat, 11 Jul 2020 07:08:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b9so3301094plx.6
 for <qemu-devel@nongnu.org>; Sat, 11 Jul 2020 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dczlRWi7ZhKkrGTsLLmYfEd66aSo3puvzeQP9Y5BUgA=;
 b=LlItUsw3LDX+SUFMSFF5MdGs+S3SdT1pTPkxwaA2h94wLRn6roIz+tlN6Ummgfve7r
 7p9dDWIqt4Qv3Dmvs4kY9SodQE3t9V4tay/nEMIITqLOZXfUhogLu4Q4ZwdMMpU4r6MI
 fVdQACbIlqPmi13TiQYnEdJvVSr6lj987VTMHnvdBknV6EleNHvsYHV+ihTwTo3QPhns
 1pQS/Z6Frq2VgLrufFiwSdRD+lgf2xzNL0kKPtyG9lgcZ7dV2/SZKbOsoVb9NLYIlZNV
 nWKXmop3yWAQ6SdpaFk2oMsLUeVS1WA5c6PTNFufiyqHD6CGhTfD9SRe0wRTjFk7ZKuS
 9v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dczlRWi7ZhKkrGTsLLmYfEd66aSo3puvzeQP9Y5BUgA=;
 b=ZY6lsi1RC1Tzza3d7+ClCRumryoUlAHYloJ7fLU1siBTF28RySnxszQzI/rJj9tR8Q
 nDLNYI8ioAh5i5sM6gDNHgN9N6uAGwj6uPFjNFxwddv7RlEoZuwMdM65q/EzmEMHAmmB
 Qe4bxkKB1sJ6eo/nMu+84THyir3zHuOiyhGt+0lCQonRbtaw3CkzxeOBR91/AKC0ejI8
 58kDQZ4z0m4BbZVqQDoEUE5tGbMKdGf5yggRMa6GcZvNEkN5/Ma2oQm3xao451WgXKKy
 DhiSUyEpRr7gIDDEFf6o51SmUoTXbMJJVUHHV7c2NfGbn3YtY5NW3EXL5lVZg8Reu2EI
 Mh1Q==
X-Gm-Message-State: AOAM531uEFCVE0ueBnmC2Pu/mTXYeb/kPzBlmvf1sqN463japZxHdr22
 t8fMBrWBWL9sejJQ6mc9Twr6cBz8
X-Google-Smtp-Source: ABdhPJxV0G8QZUyWnuMwjYkXalQ35g1VToBaI+A4Lq7expR+0pX72jCWAZg+ka++gx9izVDIXDuDIA==
X-Received: by 2002:a17:90a:30ea:: with SMTP id
 h97mr10344555pjb.32.1594465684738; 
 Sat, 11 Jul 2020 04:08:04 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id m31sm8925826pjb.52.2020.07.11.04.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2020 04:08:04 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/22] tests/tcg/xtensa: test double precision load/store
Date: Sat, 11 Jul 2020 04:06:54 -0700
Message-Id: <20200711110655.20287-20-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200711110655.20287-1-jcmvbkbc@gmail.com>
References: <20200711110655.20287-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add ldi[p]/sdi[p]/ldx[p]/sdx[p] opcode tests to test_lsc.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/test_lsc.S | 123 ++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/tests/tcg/xtensa/test_lsc.S b/tests/tcg/xtensa/test_lsc.S
index 9d59c1815a9e..348822bdd359 100644
--- a/tests/tcg/xtensa/test_lsc.S
+++ b/tests/tcg/xtensa/test_lsc.S
@@ -140,4 +140,127 @@ test_end
 
 #endif
 
+#if XCHAL_HAVE_DFP
+
+#if XCHAL_HAVE_BE
+#define F64_HIGH_OFF 0
+#else
+#define F64_HIGH_OFF 4
+#endif
+
+.macro movdf fr, hi, lo
+    movi    a2, \hi
+    movi    a3, \lo
+    wfrd    \fr, a2, a3
+.endm
+
+test ldi
+    movi    a2, 1
+    wsr     a2, cpenable
+
+    movi    a2, 1f
+    ldi     f1, a2, 8
+    ldi     f2, a2, 16
+    ldip    f0, a2, 16
+    movi    a3, 1f + 16
+    assert  eq, a2, a3
+    rfrd    a2, f0
+    movi    a3, 0x3ff00000
+    assert  eq, a2, a3
+    rfrd    a2, f1
+    movi    a3, 0x40000000
+    assert  eq, a2, a3
+    rfrd    a2, f2
+    movi    a3, 0x40080000
+    assert  eq, a2, a3
+.data
+    .align  8
+1:
+.double 1, 2, 3
+.text
+test_end
+
+test sdi
+    movdf   f3, 0x40800000, 0
+    movdf   f4, 0x40a00000, 0
+    movdf   f5, 0x40c00000, 0
+    movi    a2, 1f
+    sdi     f4, a2, 8
+    sdi     f5, a2, 16
+    sdip    f3, a2, 16
+    movi    a3, 1f + 16
+    assert  eq, a2, a3
+    l32i    a4, a2, -16 + F64_HIGH_OFF
+    movi    a3, 0x40800000
+    assert  eq, a4, a3
+    l32i    a4, a2, -8 + F64_HIGH_OFF
+    movi    a3, 0x40a00000
+    assert  eq, a4, a3
+    l32i    a4, a2, F64_HIGH_OFF
+    movi    a3, 0x40c00000
+    assert  eq, a4, a3
+.data
+    .align  8
+1:
+.double 0, 0, 0
+.text
+test_end
+
+test ldx
+    movi    a2, 1f
+    movi    a3, 0
+    movi    a4, 8
+    movi    a5, 16
+    ldx     f7, a2, a4
+    ldx     f8, a2, a5
+    ldxp    f6, a2, a5
+    movi    a3, 1f + 16
+    assert  eq, a2, a3
+    rfrd    a2, f6
+    movi    a3, 0x401c0000
+    assert  eq, a2, a3
+    rfrd    a2, f7
+    movi    a3, 0x40200000
+    assert  eq, a2, a3
+    rfrd    a2, f8
+    movi    a3, 0x40220000
+    assert  eq, a2, a3
+.data
+    .align  8
+1:
+.double 7, 8, 9
+.text
+test_end
+
+test sdx
+    movdf   f9, 0x41200000, 0
+    movdf   f10, 0x41300000, 0
+    movdf   f11, 0x41400000, 0
+    movi    a2, 1f
+    movi    a3, 0
+    movi    a4, 8
+    movi    a5, 16
+    sdx     f10, a2, a4
+    sdx     f11, a2, a5
+    sdxp    f9, a2, a5
+    movi    a3, 1f + 16
+    assert  eq, a2, a3
+    l32i    a4, a2, -16 + F64_HIGH_OFF
+    movi    a3, 0x41200000
+    assert  eq, a4, a3
+    l32i    a4, a2, -8 + F64_HIGH_OFF
+    movi    a3, 0x41300000
+    assert  eq, a4, a3
+    l32i    a4, a2, F64_HIGH_OFF
+    movi    a3, 0x41400000
+    assert  eq, a4, a3
+.data
+    .align  8
+1:
+.double 0, 0, 0
+.text
+test_end
+
+#endif
+
 test_suite_end
-- 
2.20.1


