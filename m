Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96958211171
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 19:01:14 +0200 (CEST)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqg6j-0008Te-Ko
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 13:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqg2V-0003E5-NL
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:56:51 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jqg2T-0006D7-TP
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:56:51 -0400
Received: by mail-pj1-x1044.google.com with SMTP id h22so11289968pjf.1
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 09:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrbOuw8wmrLaMoNbXCjk0t8awozGHEsmEarRx+CDXgI=;
 b=N8ecaIvuxoEkPcNx0xw6sc+yWFKAbe7xcifByzf3rGIdtmVIqmvvuEwstPq2/39Wju
 A0MJ/7fzDz25rnRuPH0BBiz6m+P20VrtcI+NGf4FhXdeLTHoW+9pUrKpe98HdKswqxa4
 FpWPLabQl5wzEAe/Am8zcF9Y/1Zkh+/IkQqGUYc76rjczu0p03dUqILl2CFoh5wD6PJD
 ojEleMynnAEMLbOHWs7k1AwNlG8ROABvc5EVsX98MIZzB93/8K+7B5mAhx9uukvtpzq6
 XtUu/TK9i2R5fR5arsEWP8fNjU1CxwLqTgHGg2EHV3klsFyu5HF0OcU+l/VDaUT2IP3m
 jt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lrbOuw8wmrLaMoNbXCjk0t8awozGHEsmEarRx+CDXgI=;
 b=MVYnXYajd+cJ65RY4C+d5XAoEFm6HOFdZQ7ydCNZCLVqmK+0Iq05vPM7YGae4kWaTy
 zI8Z6gFvy6Rk4pt3ixEFEpU15FSryekyzXVI+ShIuw+Wt9wVUtXWn8VilpFkTM30ijBc
 yve1UqnuLwZIt4SxAFCQvxh49V8R7DE/F7NS9zwUaCUmSY8LPMUuwaQsO6L791wdLgQ9
 QsutYSmX47RDgja0Tq29cb1BJwm7Kar9K03Tl7qRfjrFeia5mKEMgp2/0/mly8KZchMG
 2YS+vR/P4T12w/h0phvpH5yxEZHc7bn2n4z6IFPGYcQyrbjWm5prgdQByBT1fmS3HcGz
 n2eg==
X-Gm-Message-State: AOAM532xPOIl5igylN1Z0OLeNxRAC7t/QlCKOD52jfXzesQ8/9Uvg1xg
 CCdOySgUO7JCFwFkaM4Nk2TA1OhWuKs=
X-Google-Smtp-Source: ABdhPJx1wIfKW0CxviKuZhEcR7cEd97qhrvafH/KeNrRJmVPothUsJn2Ct1nyS/dfvrYVwhB7nqAOw==
X-Received: by 2002:a17:90a:2a09:: with SMTP id
 i9mr14029827pjd.50.1593622607859; 
 Wed, 01 Jul 2020 09:56:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s1sm5814930pjp.14.2020.07.01.09.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 09:56:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Fix do_nonatomic_op_* vs signed operations
Date: Wed,  1 Jul 2020 09:56:46 -0700
Message-Id: <20200701165646.1901320-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alistair.Francis@wdc.com, zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The smin/smax/umin/umax operations require the operands to be
properly sign extended.  Do not drop the MO_SIGN bit from the
load, and additionally extend the val input.

Reported-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index e60b74fb82..4b8a473fad 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -3189,8 +3189,9 @@ static void do_nonatomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
 
     memop = tcg_canonicalize_memop(memop, 0, 0);
 
-    tcg_gen_qemu_ld_i32(t1, addr, idx, memop & ~MO_SIGN);
-    gen(t2, t1, val);
+    tcg_gen_qemu_ld_i32(t1, addr, idx, memop);
+    tcg_gen_ext_i32(t2, val, memop);
+    gen(t2, t1, t2);
     tcg_gen_qemu_st_i32(t2, addr, idx, memop);
 
     tcg_gen_ext_i32(ret, (new_val ? t2 : t1), memop);
@@ -3232,8 +3233,9 @@ static void do_nonatomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
 
     memop = tcg_canonicalize_memop(memop, 1, 0);
 
-    tcg_gen_qemu_ld_i64(t1, addr, idx, memop & ~MO_SIGN);
-    gen(t2, t1, val);
+    tcg_gen_qemu_ld_i64(t1, addr, idx, memop);
+    tcg_gen_ext_i64(t2, val, memop);
+    gen(t2, t1, t2);
     tcg_gen_qemu_st_i64(t2, addr, idx, memop);
 
     tcg_gen_ext_i64(ret, (new_val ? t2 : t1), memop);
-- 
2.25.1


