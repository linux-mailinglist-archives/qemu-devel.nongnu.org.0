Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0AF39AD1B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:47:09 +0200 (CEST)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovBE-0007m7-1j
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5v-00021f-GS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:39 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5t-00011b-NH
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:39 -0400
Received: by mail-pj1-x1030.google.com with SMTP id h16so4445410pjv.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=keKjVz3imnmcUE3wTIllL+iQylaB2Eebnx0eXWC+uoM=;
 b=Jg6erSt06mrzVQ8iwCmUTSU+JmpntcyfKNOvUAEPdki+s6Of3krtkKHY12lyzaL0vE
 L5e40lnB7C6j/uHh7YQk7pfkQAaUCNIh3r05qFZRGUXbmR2FAUsNNhAPkRqDI1Bkn5XI
 0thG+6ob0GwXYgeug/99gQm1pdey7Z/4cutfhFvdoSImSk7nfwTESNdG7/rakXEHC04h
 TRHGUvRuVkkO/lM7maNK7Ym7hVYiMK7CeAWZcz0VzpFcyLIahYA0H0qqk2s3+luFxqsW
 L7wpLubvhxzniHBzrqlnRSzgEpXIGAHjBFFETimxg7N65zIbZBDEkLITaSngAtG0xWuI
 xiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=keKjVz3imnmcUE3wTIllL+iQylaB2Eebnx0eXWC+uoM=;
 b=HBfZotLArGYevFsgkn8GxbfDVFOqdpzrNhtpHPlJEbxqSYjVxB+NNGhMx14SuTlk3r
 CKcUEgliiBlf0Lib15YVyq5PBsjeKQjMyB6ZQ9X/7xUp6qBtWhcmGCYHjRF6ktREDUYt
 YXfClmb1CnSvDFBeComGJIZ8xjx9pIlG4S5R/zlafV4hNulC4uImAJnOKPwwyacrAk4N
 BlSs9QnGT22JjhKmY9pFHLCf4FFnZTAKY6hJnzrh7M2+k9MH9dALG3xxMt7O0Emu2CEr
 SZYLhWdacooIik8maH11b5pyd9CgZR++k/ByGLIRCjqMHs1P2Z45Ybj1VSAFi0uJMu6i
 FHMQ==
X-Gm-Message-State: AOAM5327B1DjiL5SthUaJChyt9X7YZ2gxGsfKs2pGE4HUp36z4qdRTVY
 uBpsMak8/xV+gRf++0LRI91GuBFFBFx5Ng==
X-Google-Smtp-Source: ABdhPJyK9QslLughvJNZpeVtMN9niT2fKnLR4DAlRkn7b/nAd7TL3X2eD47qZxqOLMSHXYjKTVdgrw==
X-Received: by 2002:a17:902:ea92:b029:103:a022:c545 with SMTP id
 x18-20020a170902ea92b0290103a022c545mr1192574plb.43.1622756496107; 
 Thu, 03 Jun 2021 14:41:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/29] softfloat: Implement
 float128_(min|minnum|minnummag|max|maxnum|maxnummag)
Date: Thu,  3 Jun 2021 14:41:07 -0700
Message-Id: <20210603214131.629841-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

The float128 implementation is straight-forward.
Unfortuantely, we don't have any tests we can simply adjust/unlock.

Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210517142739.38597-24-david@redhat.com>
[rth: Update for changed parts_minmax return value]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h |  6 ++++++
 fpu/softfloat.c         | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 53f2c2ea3c..ed32040aa9 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1204,6 +1204,12 @@ float128 float128_rem(float128, float128, float_status *status);
 float128 float128_sqrt(float128, float_status *status);
 FloatRelation float128_compare(float128, float128, float_status *status);
 FloatRelation float128_compare_quiet(float128, float128, float_status *status);
+float128 float128_min(float128, float128, float_status *status);
+float128 float128_max(float128, float128, float_status *status);
+float128 float128_minnum(float128, float128, float_status *status);
+float128 float128_maxnum(float128, float128, float_status *status);
+float128 float128_minnummag(float128, float128, float_status *status);
+float128 float128_maxnummag(float128, float128, float_status *status);
 bool float128_is_quiet_nan(float128, float_status *status);
 bool float128_is_signaling_nan(float128, float_status *status);
 float128 float128_silence_nan(float128, float_status *status);
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ef750e1e95..4fee5a6cb7 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3324,6 +3324,18 @@ static float64 float64_minmax(float64 a, float64 b, float_status *s, int flags)
     return float64_round_pack_canonical(pr, s);
 }
 
+static float128 float128_minmax(float128 a, float128 b,
+                                float_status *s, int flags)
+{
+    FloatParts128 pa, pb, *pr;
+
+    float128_unpack_canonical(&pa, a, s);
+    float128_unpack_canonical(&pb, b, s);
+    pr = parts_minmax(&pa, &pb, s, flags);
+
+    return float128_round_pack_canonical(pr, s);
+}
+
 #define MINMAX_1(type, name, flags) \
     type type##_##name(type a, type b, float_status *s) \
     { return type##_minmax(a, b, s, flags); }
@@ -3340,6 +3352,7 @@ MINMAX_2(float16)
 MINMAX_2(bfloat16)
 MINMAX_2(float32)
 MINMAX_2(float64)
+MINMAX_2(float128)
 
 #undef MINMAX_1
 #undef MINMAX_2
-- 
2.25.1


