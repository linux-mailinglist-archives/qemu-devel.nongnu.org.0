Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66DF69D2ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB87-0005g9-QN; Mon, 20 Feb 2023 13:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6Q-0004XH-3c
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:31 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6K-00047J-Vn
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:28 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so1484924pjn.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xjdX+3lrfnqV9nfR+Pm6BiLQ9pXwmV/7HhcoJgl+TnA=;
 b=YGPV7WPRywDeg0YHkGJwXip2G/kF6HG/ehqAG3NfgAbJFJnkuxGm1kMZFvf2cHn+3Y
 lTbac6EjHyd1nq/++/V4Y5t05YQhhAXRAHmbDKyd2hKfked7n1ErfEXwxXjlYe9PtY9r
 0I77zsCTktddQkcfnavmvNe3vmFMVxIK39w+Gs6dlgMOIbO80NVfY7xfZWsydrafOOBV
 O9wmJwFgQQgo0hl3D4143qGCvI64AOTuSY39DQZhKRjU2nd0Cnfd2vmL0h0044AcEQAt
 9Ue5ceUc8jxPeJ+5uF5NUbcYLaLKvmRjGqMWpCMxyYmhXCRluz6HfP8LojrlloJLqjn9
 pIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xjdX+3lrfnqV9nfR+Pm6BiLQ9pXwmV/7HhcoJgl+TnA=;
 b=q8nD9SBaG/SncFbkJoVZ8OUbCdltTLFFf81DbWOwOJm16b55TYj69JhxSvLwjaeYMH
 3XkIY7HBxVrk8Y9FrxwCbUaPdCdCsr6xadND9pi5g3oXJzS0OBt55PZEQ017g9GZsm9y
 6Js+Eh4S9X5wh79TTrPpeCCW+GVxEtfp5QeJuej92NLwjlKOaY0KZz5XZkiocw8l3H5n
 b1izqa/AyGOOGEwoAWC4NCAmo55Dp+AbqeK9pOUe0cy6iJqBYl+xdHPptwVQUyjmKULh
 IQo4ysEp08syuFZ++Yj5ZJ1N4TraFpRmmr3tb/2OlHe8Ivs8S8B6TzqBUKmzuSzbSfcA
 zLuQ==
X-Gm-Message-State: AO0yUKUeOrigj3qS7mGrzeziJoXN/WgDBYRBD/jplJR47+NJHoJLA890
 QEnNN1RidC3OdlvtMNU5r75/p/oHTN1FRmH5/J8=
X-Google-Smtp-Source: AK7set8qSgdCt/q7DD1O1J/S5ErVCB1p42aXS6ADR0g/Jl71E3K0PL003prFf77BnvPwYvSk5KPPgQ==
X-Received: by 2002:a17:902:e5c9:b0:199:5208:44de with SMTP id
 u9-20020a170902e5c900b00199520844demr3605448plf.21.1676918476663; 
 Mon, 20 Feb 2023 10:41:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 11/27] target/s390x: Use gen_psw_addr_disp in save_link_info
Date: Mon, 20 Feb 2023 08:40:36 -1000
Message-Id: <20230220184052.163465-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Trivial but non-mechanical conversion away from pc_tmp.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 027a5b0673..9e60abe97d 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1573,9 +1573,11 @@ static void save_link_info(DisasContext *s, DisasOps *o)
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


