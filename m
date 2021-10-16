Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F584303EC
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 19:26:02 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbnRa-0005zn-1M
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 13:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGM-00012W-RQ
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:14:27 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnGJ-0006CD-A9
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 13:14:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id v20so8422871plo.7
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PWp+DyK/MXQrYSGCBqie9Ey1GjpSYq8FmATujtXXGIU=;
 b=tI/HZQOM/f7v85O4Y420RHliIEJFRgOK86vAn9cQ8UzDdhd7FPsgLYlQDS1yQ4ogGl
 yNfojEyUZ1GQObmY2diwNuMzsnNhi6kjPP/3JM+m8Q6bJSsES+MihTrAtI+PW4woNrCX
 16/oPLDy2s0v+vgb4cmVZ0Kvxur31Yc3U/MYKzh1TVPl0DznMfQdQ+FrALgIFObcssed
 1NuShc1btS3lgEu/HLAcEUgy3sEVJwVGMhJb+rMzGXZiLIq5MIM4TbYLDJFVyNOqEeL9
 sOe+SnA0t0cEduIePx1pk3aNbpLMYCKpBwB1tpenpI89tkMazr0ybEJbPLD5jHNwUsPi
 rL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PWp+DyK/MXQrYSGCBqie9Ey1GjpSYq8FmATujtXXGIU=;
 b=QAOp1G6+Ii4hUpWmeK2DsgTFeKfZAGzKsOzEXwoCRQzqMWK/1HdGuvDa5+LcN8B30E
 RmyeSpf/6EF51jANnmHOPb2Kle5QMUM22I7E9VlOmQN6seZTRc/GJsYgEWTkzPdeVax0
 evEsDJkKTnJKFQhc8ZDs8KV/8JpgoB1BA9ulJ2VzVDW34MSeD681B96uxod4YJ4Z/5li
 JloRvUQWp5GdfQiHGE+GZCAHC+XqJA4TCTLCaL43rDyWJJh5DL158NN2rIBqeR0P5fQC
 8pvJvWvU1YFMkVE0Le2Ai8bsEfaLPh7sdAHzyZ9FPszYhDIp4YD4VFM5Qe46G5fdNgjV
 lVlQ==
X-Gm-Message-State: AOAM533Zp1OrNRJ3XseDTaFAxN1U61aNseWIFDd3LxsNrB9klxcVHRK7
 gEI7FwLfpksFcF5BULgt0wn6/YzejXSyeA==
X-Google-Smtp-Source: ABdhPJyshR25TWEskYEY9XvRsM5CBsDaCqjh58315XIyybjVXbF64peTz85dUKheoS8YAoBGCCjMXw==
X-Received: by 2002:a17:90a:1a42:: with SMTP id
 2mr22170039pjl.202.1634404460321; 
 Sat, 16 Oct 2021 10:14:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l4sm2330281pfc.121.2021.10.16.10.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 10:14:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/14] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Sat, 16 Oct 2021 10:14:04 -0700
Message-Id: <20211016171412.3163784-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016171412.3163784-1-richard.henderson@linaro.org>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: qemu-riscv@nongnu.org, frank.chang@sifive.com, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org, frederic.petrot@univ-grenoble-alpes.fr,
 zhiwei_liu@c-sky.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1..bbc5c93ef1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


