Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E24E51A0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:52:33 +0100 (CET)
Received: from localhost ([::1]:51232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzXT-00032b-2g
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:52:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz96-0001uH-NB
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:20 -0400
Received: from [2a00:1450:4864:20::32a] (port=54823
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz94-00064D-0c
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:19 -0400
Received: by mail-wm1-x32a.google.com with SMTP id r64so727017wmr.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U68ak4unAbqGYAM4zXFr3lp59AqwKDw7viO7+1coraY=;
 b=Pb/lq17wWi46rH6FqxPBY7PhRwt8LILO26RFzGYeOLj6klM+esydPvafT/VzH/f9fQ
 MLnzxp0wtkKbqwDyyoB7MyLoJlgaOuYnhWpN5stTch2U1ruEYqBD1iuka8zBOEu6BnJi
 hjIzJ6sctHkk7LXDrE2iovyNBw2E8sf2B+pYNRnTEGE5qiOCmDt+MJqKA3TeHN1+VTtW
 K19gZjR1km++p29vTNKPPfiyPyI9rBNMY4Mj0qc5Tmz9PoaAWxFwZDiAYgAq2nJJE8xG
 C6iZ1AE+inn9cwS/18sKV1XkSv6PMplp9p4s2GGWyy93DeDItmS8oyQd6rtfnR/mMixo
 ihPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U68ak4unAbqGYAM4zXFr3lp59AqwKDw7viO7+1coraY=;
 b=2Pq8u23tXxSj2966lbtkMA3LSD/6b2El7DXSHA29aEsfwrfzgsubR4Nvv2+eWIn4O8
 u7jduo/9EU4GJtAxub5WlV5NaujXuDuyG0f+kUlFks+3uP3fF6dsE/Xzntqqn1ZUsApS
 ySj3ET4sJbgZMV+A0vDrefYYhxbYP3Cr8AoKqGMsnpCdQRMH9x5cqOb4mqEPn8dCbC1T
 amltQA91TP+7Mg17cKveXXlRCFaLLKl1nW6T0iBnmKFLAQ9FL2/6dVsZY/dQYLvFoy0/
 GbzTZ6kFkSuLb7D8Tuf+shE9NjhXGrjSzlt+9NWJEYlThsGxI49DvzRK66g1y5s/l2n6
 AR7Q==
X-Gm-Message-State: AOAM5310CFInBy9fKP98qeygysSis0qNZV9fMRJlXU/XENFICIUbm9Q2
 U6S6CEikYEPJXM8gVQclcut89A==
X-Google-Smtp-Source: ABdhPJxGDuZoMjsnOdYljum2B3ZXZVQvN5C+/w8qxzs68HdEiVLcfG+NjSdo8vjcw/1VToBfCaAjOg==
X-Received: by 2002:a05:600c:4f0f:b0:38c:c8f5:73e7 with SMTP id
 l15-20020a05600c4f0f00b0038cc8f573e7mr1950730wmq.201.1648034836737; 
 Wed, 23 Mar 2022 04:27:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0038c949ef0d5sm4089640wmq.8.2022.03.23.04.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A33EA1FFBA;
 Wed, 23 Mar 2022 11:27:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/8] target/i386: force maximum rounding precision for fildl[l]
Date: Wed, 23 Mar 2022 11:27:05 +0000
Message-Id: <20220323112711.440376-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323112711.440376-1-alex.bennee@linaro.org>
References: <20220323112711.440376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The instruction description says "It is loaded without rounding
errors." which implies we should have the widest rounding mode
possible.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/888
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220315121251.2280317-4-alex.bennee@linaro.org>

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index cdd8e9f947..ebf5e73df9 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -237,24 +237,37 @@ void helper_fldl_ST0(CPUX86State *env, uint64_t val)
     merge_exception_flags(env, old_flags);
 }
 
+static FloatX80RoundPrec tmp_maximise_precision(float_status *st)
+{
+    FloatX80RoundPrec old = get_floatx80_rounding_precision(st);
+    set_floatx80_rounding_precision(floatx80_precision_x, st);
+    return old;
+}
+
 void helper_fildl_ST0(CPUX86State *env, int32_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old = tmp_maximise_precision(&env->fp_status);
 
     new_fpstt = (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d = int32_to_floatx80(val, &env->fp_status);
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
 
 void helper_fildll_ST0(CPUX86State *env, int64_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old = tmp_maximise_precision(&env->fp_status);
 
     new_fpstt = (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d = int64_to_floatx80(val, &env->fp_status);
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
 
 uint32_t helper_fsts_ST0(CPUX86State *env)
-- 
2.30.2


