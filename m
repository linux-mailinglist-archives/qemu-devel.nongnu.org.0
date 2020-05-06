Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id D300C1C796E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 20:31:58 +0200 (CEST)
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWOpp-0005xT-O1
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 14:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jWOoB-0004Tk-7P
 for qemu-devel@nongnu.org; Wed, 06 May 2020 14:30:15 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:44718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jWOo9-0002wl-AQ
 for qemu-devel@nongnu.org; Wed, 06 May 2020 14:30:14 -0400
Received: by mail-pf1-x436.google.com with SMTP id p25so1416566pfn.11
 for <qemu-devel@nongnu.org>; Wed, 06 May 2020 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZhM8WFsngVW12JNtP5Ld2uYK1gRgB1Q32WgIlT7XOUI=;
 b=InUzyKQmLDYDnUY38WOGOVMnEWPqRxAPhgTcTjsegSh9xYJvjJt1icE6NZrgtQl2l/
 +YuN6Vo3ouunV+jfcMCymPC+Nvx621aw5rzzm7nLoOHX17LCJqzLX/DScrn6YHy7+hke
 of0r6qxRY60wpEgzlWLqQP9WM5u3hMz+MBWrGcP+xq6ug9GEPocKXTNdnFj8I5/hZdEx
 LnplUvx+P/0qlflmkuFazri5dm3zXrm8yWTa+dNRFzimVOTrYvC3ZScbkhLIYMM7wBDt
 ozh9N2ZIOo/hySNsiXmLPqBY0him4OghvSUEuh/r8Am9vweWRWVyQ34ILuAQ4hJ1jd6m
 noaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZhM8WFsngVW12JNtP5Ld2uYK1gRgB1Q32WgIlT7XOUI=;
 b=TmkdH/DT/4LdDwdkaoUd0LoA9BURvJ/C4O1DSFJQ11XStmZj5w9GcurpD5y17ck61e
 vJg7l9Ybu86cq4+m3FumLHxCpG8aM/VAYENZxQZOJu+jV5SbWCUEZ7m72YNiAV/tkmai
 zMbwl3EV6jaNlP2nwrZw2xj24FOfKCxkYHLdSz3khn6xn93BEFL+5ynSGFrdwOqfBfiW
 9lPQkC+MWY4YyjRUFCYuEC/h3kqp3Y+EI4d/+4bf0RvJmmdrYVXr9kIPIirQQPP64oHG
 O+lfi7O19E1FA7CZC4NF67Q1e0xMGd3jL0eFf+CjGWdW33d5vejU0CjyIaH0We2pUKHn
 Ghog==
X-Gm-Message-State: AGi0Puae9EUTKRY6PN8WDlCrJj5xRFGmKSTC+yKY278TKKlMtsMBsjrh
 oAIU4BZFzlCnm+joWiOa/s97BpfD7MY=
X-Google-Smtp-Source: APiQypJi+5Icp26BN3rBJ0iZI7waeZn4qM9AudzrILfPErNSD+LJL4pFPBH4eDlWwwKZLnERzfkqFA==
X-Received: by 2002:a63:d74a:: with SMTP id w10mr1499287pgi.417.1588789811507; 
 Wed, 06 May 2020 11:30:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w11sm2572589pfq.100.2020.05.06.11.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 11:30:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] tcg: Remove tcg_gen_gvec_dup{8,16,32,64}i
Date: Wed,  6 May 2020 11:29:58 -0700
Message-Id: <20200506183002.3192-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200506183002.3192-1-richard.henderson@linaro.org>
References: <20200506183002.3192-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These interfaces are now unused.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec.h |  5 -----
 tcg/tcg-op-gvec.c         | 28 ----------------------------
 2 files changed, 33 deletions(-)

diff --git a/include/tcg/tcg-op-gvec.h b/include/tcg/tcg-op-gvec.h
index eb0d47a42b..fa8a0c8d03 100644
--- a/include/tcg/tcg-op-gvec.h
+++ b/include/tcg/tcg-op-gvec.h
@@ -320,11 +320,6 @@ void tcg_gen_gvec_dup_i32(unsigned vece, uint32_t dofs, uint32_t s,
 void tcg_gen_gvec_dup_i64(unsigned vece, uint32_t dofs, uint32_t s,
                           uint32_t m, TCGv_i64);
 
-void tcg_gen_gvec_dup8i(uint32_t dofs, uint32_t s, uint32_t m, uint8_t x);
-void tcg_gen_gvec_dup16i(uint32_t dofs, uint32_t s, uint32_t m, uint16_t x);
-void tcg_gen_gvec_dup32i(uint32_t dofs, uint32_t s, uint32_t m, uint32_t x);
-void tcg_gen_gvec_dup64i(uint32_t dofs, uint32_t s, uint32_t m, uint64_t x);
-
 void tcg_gen_gvec_shli(unsigned vece, uint32_t dofs, uint32_t aofs,
                        int64_t shift, uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_shri(unsigned vece, uint32_t dofs, uint32_t aofs,
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index de16c027b3..5a6cc19812 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -1541,34 +1541,6 @@ void tcg_gen_gvec_dup_mem(unsigned vece, uint32_t dofs, uint32_t aofs,
     }
 }
 
-void tcg_gen_gvec_dup64i(uint32_t dofs, uint32_t oprsz,
-                         uint32_t maxsz, uint64_t x)
-{
-    check_size_align(oprsz, maxsz, dofs);
-    do_dup(MO_64, dofs, oprsz, maxsz, NULL, NULL, x);
-}
-
-void tcg_gen_gvec_dup32i(uint32_t dofs, uint32_t oprsz,
-                         uint32_t maxsz, uint32_t x)
-{
-    check_size_align(oprsz, maxsz, dofs);
-    do_dup(MO_32, dofs, oprsz, maxsz, NULL, NULL, x);
-}
-
-void tcg_gen_gvec_dup16i(uint32_t dofs, uint32_t oprsz,
-                         uint32_t maxsz, uint16_t x)
-{
-    check_size_align(oprsz, maxsz, dofs);
-    do_dup(MO_16, dofs, oprsz, maxsz, NULL, NULL, x);
-}
-
-void tcg_gen_gvec_dup8i(uint32_t dofs, uint32_t oprsz,
-                         uint32_t maxsz, uint8_t x)
-{
-    check_size_align(oprsz, maxsz, dofs);
-    do_dup(MO_8, dofs, oprsz, maxsz, NULL, NULL, x);
-}
-
 void tcg_gen_gvec_dup_imm(unsigned vece, uint32_t dofs, uint32_t oprsz,
                           uint32_t maxsz, uint64_t x)
 {
-- 
2.20.1


