Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272156AED12
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbae-0006EO-Jf; Tue, 07 Mar 2023 12:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaY-00065S-Py
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:02 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaX-0000F5-5j
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:02 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so12652251pjz.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfCafz6je9YMB7RCxVqwooZkMjeDhfgC8yEpA0iVQDE=;
 b=JtFAZXtb3s0v+fmLwH1ZQghclleZJf3gQCBjcUuZG1zh0S7VhwoIApHhduxbY/FoRm
 2rZ30L9iqZ8FOoo6J0zGezp1OmISebzwxW8F7ltSPib1L+Z5ubwkQaEpmprlYQV2VJR6
 qg4sYdd4PLx8KRGM3Iaqitacwh+GEv38Nucu2E/Uegutxjp0W3mPbiqA027uiLtBtJqm
 MVi9nP+VKOgPEEAfTFSBLyayMs98p4CrZ4HYGVtnOyjdgmIhoXjqw7pmWEAy7/RFt4BU
 PgVa+h7O5FzOntx/aEJJSRZKACxdQ2nXGRvjtUHndDJGDMRgJzcf4DJ1D9g6Hg8H+8E1
 d4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfCafz6je9YMB7RCxVqwooZkMjeDhfgC8yEpA0iVQDE=;
 b=7SDv5TIe+E0WwFXHX688CMPrhJwowFCulEzT53XvZNu0xhmAud8/ICzStmlWtcZdKk
 U5/tRKf0aoSVP5RD2la2SiDpuiPbYSxWPktmXv6P7giukp/6Lp5cW462+B9OP1cIP+QK
 lCF+7vCyfvd++WYAKG51hZsTNB7mhKOpf1+o4tVPWm3JKjQ1a+rSzjf6NjnRlYMLw52D
 jgmIASWeiOE3DbU2u6Xr7xqBcRkpLThjdAmEjDaZsm5nYSBmqF7sgeVVQm6xNr6HfeSR
 xbBbaGoa2DerKc84SxmPrdMc0Twj66BmW9SFcZonS1FUNgREsw8QJxkQ4SyH4ho+QUHQ
 j1ug==
X-Gm-Message-State: AO0yUKX2v0FnU4eBREMhEEtTI13CA4FQ7VIwLOr844wzGdt9/VIDVClF
 icYE7yXTBdZug11pjZ+enfnnk4JlKw+nLrFhbok=
X-Google-Smtp-Source: AK7set9Z609sSpKXD1/Fo/UR6HWlFeiOouHTD9nYLZ3TUVeiDq5mAjRINd5FBWPDdNDGaQttd/HNLg==
X-Received: by 2002:a17:902:e54f:b0:19d:d14:d48a with SMTP id
 n15-20020a170902e54f00b0019d0d14d48amr18648251plf.3.1678211939908; 
 Tue, 07 Mar 2023 09:58:59 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:58:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 13/67] target/s390x: Remove assert vs g_in2
Date: Tue,  7 Mar 2023 09:57:54 -0800
Message-Id: <20230307175848.2508955-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

These were trying to determine if o->in2 was available for
use as a temporary.  It's better to just allocate a new one.

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 954a1edd10..9ad6e75434 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1428,11 +1428,11 @@ static DisasJumpType op_andi(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_ori_i64(o->in2, o->in2, ~mask);
-    tcg_gen_and_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_ori_i64(t, t, ~mask);
+    tcg_gen_and_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -3520,10 +3520,10 @@ static DisasJumpType op_ori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_or_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_or_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -4832,10 +4832,10 @@ static DisasJumpType op_xori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_xor_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_xor_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
-- 
2.34.1


