Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D43017BF
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:52:21 +0100 (CET)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3O1E-0006a4-3x
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzW-0005Cv-Rx
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:34 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:53662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l3NzS-0008Es-JN
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:50:34 -0500
Received: by mail-pj1-x102f.google.com with SMTP id p15so5850431pjv.3
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwbeW203h18CH5C6eZxAsKhYtBKVyHAGifKiBt07tZk=;
 b=j+MfltymXxIYJDGwPCOntg78SHZw+sPd48mplNPzEBRExGB6tj9y6Vk0kg5v8bjCyP
 ItsikzL7Wd9P9hyu1pt41eblF/lqybkYgvWGENMwMBSt9CAGYU9auHB0wesXFkbiyPSg
 Ag47PlP598g/SvcVrvmxQDbWzmS565WG9zC2BwS81NpItOKMbP8zmmq+CItpDZCBwL0x
 /JiAXb7dWD5qOj4RwNIVcKVsjfbveaWcc7+TiCpZO/oErf5/Ey2E4DkD9W2NE8tkBjfT
 yowWusLAl4LIFEMg55vEtcBDAZ0fhVIrtCPFzpfXyKzsyf9G8EbJbfTBr0rghvITHloF
 /URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwbeW203h18CH5C6eZxAsKhYtBKVyHAGifKiBt07tZk=;
 b=Nf3epzmrvMa7yrnTAEa0zDfjJRhR9JbcF5vF1QcxT3MvZ1q1VY35P9gsiQID8if4OT
 XZusxbJNgOhUtvFxg6SRGNov2S/fcwsjC0KSWfM/3OVhH5OhZq2ARu27gemZ7v/vPZfi
 7vtrLWbPHP5uCzVMkTP5/UBVCr5roxBipYGoippZhFoeiCO2YKthplFltfYEsLx9zexJ
 fH9aabDV9cdhM1T3/QZibBkdEV/Ji9uNkiIcpbBLmV/ndwNCeekoDWQQrYldFNVR6+bl
 FkwG7RkXb/GoeOSHHxhEjWeTBsdgfMIBvrSK8LPE+jCSh0kBGwSomlM1VDBQJHBQ9pJB
 NJbA==
X-Gm-Message-State: AOAM53013wSjbI73B7m7ULqFIZnUgcZnDvBJzDc0eZr6xyPBVRsJFRvl
 xqEv5uJ1tRRnp3LAofrLZjjIL4mwd77dHQ==
X-Google-Smtp-Source: ABdhPJyy2n0ZSztMDKPAbRbFRM3jQ+1QgVjjTyNMCQq/0aqUVwOrk7jfd0SeKZeUoxRtO5nwfSbwQw==
X-Received: by 2002:a17:90a:f2cf:: with SMTP id
 gt15mr12328096pjb.166.1611427828754; 
 Sat, 23 Jan 2021 10:50:28 -0800 (PST)
Received: from localhost.localdomain (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id j19sm5018614pfn.14.2021.01.23.10.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 10:50:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] tcg: Optimize inline dup_const for MO_64
Date: Sat, 23 Jan 2021 08:50:13 -1000
Message-Id: <20210123185020.1766324-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210123185020.1766324-1-richard.henderson@linaro.org>
References: <20210123185020.1766324-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: peter.maydell@linaro.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid the out-of-line function call for immediate MO_64.
In addition, diagnose all invalid constants at compile-time.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 504c5e9bb0..c5a9d65d5f 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1325,7 +1325,8 @@ uint64_t dup_const(unsigned vece, uint64_t c);
      ? (  (VECE) == MO_8  ? 0x0101010101010101ull * (uint8_t)(C)   \
         : (VECE) == MO_16 ? 0x0001000100010001ull * (uint16_t)(C)  \
         : (VECE) == MO_32 ? 0x0000000100000001ull * (uint32_t)(C)  \
-        : dup_const(VECE, C))                                      \
+        : (VECE) == MO_64 ? (uint64_t)(C)                          \
+        : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
 
-- 
2.25.1


