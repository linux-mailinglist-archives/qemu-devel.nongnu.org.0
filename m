Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38886392389
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:01:28 +0200 (CEST)
Received: from localhost ([::1]:37116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3Sp-0006SZ-7f
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FJ-0005d8-Vu
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:29 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FC-0004V7-QJ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:29 -0400
Received: by mail-pg1-x532.google.com with SMTP id t193so2301231pgb.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+yWYtAyvKHCLBY3UydOHOFHk7QNzbfv/DnodNJ6hJsw=;
 b=T9htAXoysDPLNgWWegWXonbElMenSa5Ov3ente2rThCG8D434TFOB+k+x4f6WbGahw
 BOa/HLUe+uFExziWvFvm0hSWIQi55CDPZYXFfrV1ohfqxrmX4r6oJAL0irVTAYUXGCnk
 UUqpStTjdzmui6EhPsTO9Mj7lDSBSyItHmGS6ijsAWq5XKG950pFtt3U08b5avI+BOaX
 TgZxKUpHr+no76oZttO+6nBvDVcjGb9O3KRyyuJlmg0lEA9/q8i525ojQVGL5Kf2otY/
 wlsqgqA/TF4s+SlIg9DsH8JiCLURwUg8QDANO9+sJhc4v4q3hmpT8A09co8P0kOGg4fW
 sOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+yWYtAyvKHCLBY3UydOHOFHk7QNzbfv/DnodNJ6hJsw=;
 b=lRyre20fyq+s9qXneQJ/iYbFRp/l3lZvDEAGPmWaWLcgJ9j2+5klgQ3HB4kaHf7lRH
 sbHEr2fs4J/OB2DapwbjkBljJLI3RJjMPT0RFFiWuKtq3wedsZ3TfN/CWzq/bGElNRrz
 gQc2K8SuM1sNA56jeW8bJMFQ5CIC1yuXSgRXBBUiwzJ68+GaZLIf6w+hA4AeCtpbmnmU
 Q1OPwfvnPh93Bn/e24e4a6gX67/TR0k0mRKtSUwmwO1DW74hTwIk3GwKyMvryA+fZOGn
 jlcKBJUR+kHW5j1XsZee3QomSuWw2cUejfqJuzXcilERp7WNYgH/EjWNqUdKDcCVyp1D
 4LRA==
X-Gm-Message-State: AOAM531/GY4pQVO5enXutwJp7fmAjmr/BVUVBBOAcYaO9/XlR8aidGGn
 dmDwZ7h7+KuKuK9r1BSw7k49yzhCt/CpZA==
X-Google-Smtp-Source: ABdhPJy4Dh9uqTNbHERJ2zfS2MqCWDx5nxNuNPDY6wmqJfbAR3w540JCoUa0ozgqNnmIpXiWoRV82A==
X-Received: by 2002:a62:7b07:0:b029:2e3:b540:707f with SMTP id
 w7-20020a627b070000b02902e3b540707fmr908958pfc.59.1622072841195; 
 Wed, 26 May 2021 16:47:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/31] tcg/aarch64: Fix tcg_out_rotl
Date: Wed, 26 May 2021 16:46:49 -0700
Message-Id: <20210526234710.125396-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, Yasuo Kuwahara <kwhr00@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yasuo Kuwahara <kwhr00@gmail.com>

The last argument of tcg_out_extr() must be in the range 0-31 if ext==0.
Before the fix, when m==0 it becomes 32 and it crashes with an Illegal
instruction on Apple Silicon.  After the fix, it will be 0.  If m is in
the range 1-31, it is the same as before.

Signed-off-by: Yasuo Kuwahara <kwhr00@gmail.com>
Message-Id: <CAHfJ0vSXnmnTLmT0kR=a8ACRdw_UsLYOhStzUzgVEHoH8U-7sA@mail.gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index f07ba98aa4..5bd366f2d4 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1291,9 +1291,8 @@ static inline void tcg_out_rotr(TCGContext *s, TCGType ext,
 static inline void tcg_out_rotl(TCGContext *s, TCGType ext,
                                 TCGReg rd, TCGReg rn, unsigned int m)
 {
-    int bits = ext ? 64 : 32;
-    int max = bits - 1;
-    tcg_out_extr(s, ext, rd, rn, rn, bits - (m & max));
+    int max = ext ? 63 : 31;
+    tcg_out_extr(s, ext, rd, rn, rn, -m & max);
 }
 
 static inline void tcg_out_dep(TCGContext *s, TCGType ext, TCGReg rd,
-- 
2.25.1


