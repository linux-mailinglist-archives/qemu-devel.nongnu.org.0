Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF75AE68D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:26:44 +0200 (CEST)
Received: from localhost ([::1]:39530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWj5-0005vN-EX
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVea-0003Lh-9Y
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeY-0005BO-Ly
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:59 -0400
Received: by mail-wr1-x430.google.com with SMTP id b5so14699506wrr.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=69Hf+uFfKAyJd3wd8wnV5QVuX0BdMNOKT/F+cpQhvA0=;
 b=SRgMaFpaZP3fkof1DL6krj0yZtQDgdJsCyodtxXMWLBBTH7vQse4814bm2ujecGBrk
 Y+4EOKFAHto32VHlLzz5I7xgskXJ0eCUp4ep9Zxet5T5ZRqBcFqjTgh6tQwMVS70q7wa
 jQkPx3Scm7ryYslWV4UtM+nH1OGCraebzb2W9caR7L8kFLLSEGW3x9ZQFS1EOQfbWMiU
 oP3BFWFlwDH/JQSJmRflKU7WMOzyZaIsbmbe2R/F5R1mcCrFIIdYRrtjHIxi9xAUrUJR
 wnp1iyTYxCF0nql4fdJ27myV0GU7C0JfxuZBLTcv6H2sHckqzfP5sTVFT4GWVdd9cL5w
 ggXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=69Hf+uFfKAyJd3wd8wnV5QVuX0BdMNOKT/F+cpQhvA0=;
 b=0ooeJjdcAC9IkrhRyp42L3RzOjRAsSDiYR7qpycIPZupfzl4MjGEWY0Uv1ml+cZxLV
 khCFNDX1lR8IQ5YKhgcXzFjGRPUZPY/E2xeBJGptSpO16IIIVpeOHZnsY/rRKVhLcn6w
 PRQJoNNJV0tTlUkw33eI8ZmnL3nsDD1yO6TmiSjMPuolIPUoIZVkTzhhpn8hgs3iVKSy
 3LbZ3L/W8rugiQUSwVo7QghcvzFFj434D+kjOaPvWF2RlB0/4WKu64qO9vPxT4ky74h1
 W+QX0Z00XNtbmWYyQ6Z+dyLRYl4KQYY2NoTLodbi2NTyZ5buHqyhJpbYxEZv96Yd3k34
 yG9w==
X-Gm-Message-State: ACgBeo22m+qSIiIy1mKR9co4OQ62lm3v1UwT52Z6GiWBvUQK0hteWzpw
 toaByZW6VyK6ajqIN2I5Ybv3WuknU73y5vS6
X-Google-Smtp-Source: AA6agR4Q6W03m3GjKp0aJfenlNTfEE4DgNYnPWxSS8zqdIPs0Q/rDN82Ue8hJHCD8SDeoqKH+whi9A==
X-Received: by 2002:a05:6000:15c5:b0:220:727a:24bf with SMTP id
 y5-20020a05600015c500b00220727a24bfmr28263940wry.621.1662459477840; 
 Tue, 06 Sep 2022 03:17:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 09/26] target/s390x: Use gen_psw_addr_disp in save_link_info
Date: Tue,  6 Sep 2022 11:17:30 +0100
Message-Id: <20220906101747.344559-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial but non-mechanical conversion away from pc_tmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 4c3ea958d7..ad73a64b05 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1558,9 +1558,11 @@ static void save_link_info(DisasContext *s, DisasOps *o)
         return;
     }
     gen_op_calc_cc(s);
-    tcg_gen_andi_i64(o->out, o->out, 0xffffffff00000000ull);
-    tcg_gen_ori_i64(o->out, o->out, ((s->ilen / 2) << 30) | s->pc_tmp);
     t = tcg_temp_new_i64();
+    tcg_gen_andi_i64(o->out, o->out, 0xffffffff00000000ull);
+    gen_psw_addr_disp(s, t, s->ilen);
+    tcg_gen_or_i64(o->out, o->out, t);
+    tcg_gen_ori_i64(o->out, o->out, (s->ilen / 2) << 30);
     tcg_gen_shri_i64(t, psw_mask, 16);
     tcg_gen_andi_i64(t, t, 0x0f000000);
     tcg_gen_or_i64(o->out, o->out, t);
-- 
2.34.1


