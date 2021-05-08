Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8A0376E66
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:10:17 +0200 (CEST)
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCQ4-0007tm-MR
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC52-0004GU-J9
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:35 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4o-0003ca-PD
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:31 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i13so9253024pfu.2
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=neyTzvAnX2wPhFkKkMrIMIRjgXeJq5dPzr0xBKa/qog=;
 b=d3YrmWCRSfA0/8eKR5E8WJ1tW7Xx6FXxqEHcrLCV+/RZKkVmXt3RYdbN+iGcAV/KUx
 ZV/vNERDeIcPep/qT2+/DYcTdk/ej5hXEfn0iS6VUrQf6LV+I8/0HHCwSmvtLK4iD1D9
 m96oSwLWWhiez6Ja8YHKl/SeivuZ0caz6fKQ9U1oKQMiwFsqjY0jO+LW4Sk+0NBU08Ef
 x7GX/4/rYT6jKPst2bEtK1B+AlNE0avO5oLC0UhrSGpNyuHuT0Nn8yn/mr8G1pK60AJd
 kZoVQ3sInuqfolUQDEssymW/WWbh+o+RzyqXSgmnZe/iMQz4NHdTwN2uFvkXr39WM4ao
 AsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=neyTzvAnX2wPhFkKkMrIMIRjgXeJq5dPzr0xBKa/qog=;
 b=gF16fA6onSFLmRJM/5RhEndW/npl4lwHt6SfUkJJ8r4zCuYoq99SgeCip0KWnXHAq6
 RXnHFywh9/SJUrYyd6lyjEfYSozHxe/l5TqWpMutTv03hzWf8o4rk6X1J+qDmcAmpbOh
 CK5zYhIX89T+IHlcpO6o2gXZat0UwD38bV0w0x8gn5ocPPTPQNWhO2y4HywYCgBWslzf
 I3Tak6sEgRN5aqGC18/WWllYubao3Mg+cFsfn77tLcbjUuH0TO0afLdY48oaUnO+h5Aq
 hlGj2/fHuOhXFijT6NcGtJcW+CKCcPzs1/x8EZ55cBbDKTXB2VTCKYhwAPL+03nAhNOW
 /BAQ==
X-Gm-Message-State: AOAM530Vy12S2gP7XnRh06svv+w/lKwV387Y5rbkCsYunXdWXQ1j/Psf
 5O9EQHhUUPAbX/MSVAOlqoH0lLHWeTg1hQ==
X-Google-Smtp-Source: ABdhPJzrOvcDVUCUgRPJkLJUvufPYvRZC6t9++F94W8gtylEPhG8h5M1Pn5JlqocQZXWl4eUYokgGA==
X-Received: by 2002:a63:b211:: with SMTP id x17mr5612695pge.106.1620438496625; 
 Fri, 07 May 2021 18:48:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/72] softfloat: Use pointers with pack_raw
Date: Fri,  7 May 2021 18:47:10 -0700
Message-Id: <20210508014802.892561-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, rename to pack_raw64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5a736a46cf..b59b777bca 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -614,31 +614,36 @@ static inline void float64_unpack_raw(FloatParts64 *p, float64 f)
 }
 
 /* Pack a float from parts, but do not canonicalize.  */
-static inline uint64_t pack_raw(FloatFmt fmt, FloatParts64 p)
+static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
 {
-    const int sign_pos = fmt.frac_size + fmt.exp_size;
-    uint64_t ret = deposit64(p.frac, fmt.frac_size, fmt.exp_size, p.exp);
-    return deposit64(ret, sign_pos, 1, p.sign);
+    const int f_size = fmt->frac_size;
+    const int e_size = fmt->exp_size;
+    uint64_t ret;
+
+    ret = (uint64_t)p->sign << (f_size + e_size);
+    ret = deposit64(ret, f_size, e_size, p->exp);
+    ret = deposit64(ret, 0, f_size, p->frac);
+    return ret;
 }
 
 static inline float16 float16_pack_raw(FloatParts64 p)
 {
-    return make_float16(pack_raw(float16_params, p));
+    return make_float16(pack_raw64(&p, &float16_params));
 }
 
 static inline bfloat16 bfloat16_pack_raw(FloatParts64 p)
 {
-    return pack_raw(bfloat16_params, p);
+    return pack_raw64(&p, &bfloat16_params);
 }
 
 static inline float32 float32_pack_raw(FloatParts64 p)
 {
-    return make_float32(pack_raw(float32_params, p));
+    return make_float32(pack_raw64(&p, &float32_params));
 }
 
 static inline float64 float64_pack_raw(FloatParts64 p)
 {
-    return make_float64(pack_raw(float64_params, p));
+    return make_float64(pack_raw64(&p, &float64_params));
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


