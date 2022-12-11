Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B3F6494E4
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:34:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFn-0006Qn-VK; Sun, 11 Dec 2022 10:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFk-0006Ls-DD
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:32 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007Xz-R3
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:31 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so5830750otp.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9PqR+j2AJ2Z/evFIqerFiBY2sN8DE35v/DjfPGQKroc=;
 b=qM8zRNJeq1Vzlyd3QV65RyIKwItYmjlAMnZeB8liVV9T7Lzuwze6S05dJqcLXVj5A7
 G9a5t6ymrnhPb6n+44NFrJcUku9ySbmjuh4ZuikV07gQGTDWz9XdkhLBNpQtksoJyNjq
 6LaPjrgrWDNNGEbQ2fz1Cp4rvAHPfv4AbammEBhYimaa8LtpK4s26RfJM/taFtiALMMC
 l0x7Y7uuNW5JLWqEkuEowtetgHLCP7sj09QgftBssBWGIdx7frd3w4tnl7tY/APlsKhq
 ibOA01QIQLb9gONxPVasvlc8bf2dd12AmCv2tRN1l7l0ySnGULVe2LWA5MTjgBdqcLE6
 ChXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9PqR+j2AJ2Z/evFIqerFiBY2sN8DE35v/DjfPGQKroc=;
 b=rPFEqoI/6zX1JhzlzTCgWHNq9Rmog7tfesz/SqF2PN0hI03pawSsklPyRzkGrS40t1
 PNyxboSvI2HQGiz8EVxLll1+7U1e6jC5FtzMyfNNsC+xfGNSARh+btpqElwadLLbkb2J
 rDPdLRnRgM91Wv5p5pI+RuDNGFfGTC71obF+xQ0mx8u+/0fpI62z+C87bD3NUbAODvQ/
 4wPLY8sio2DbXe6zLk74FGoR7KIqUGKItddDH7cDvron9zaKftExE9CkZcWRwaHuHebc
 2ISrRjNU8ew6mcaDgaNBSbq+r2r4FHZAA/rikBq+nLGcaXirBhso7w/W4tdFQtTsPq0Q
 /nSQ==
X-Gm-Message-State: ANoB5pn+3NWeNpICxmYAKj1eaIvuCLY/lDCyAStPs8i7L6dwDK3nspXZ
 hrT78SQ3eWIT6wF46tj6yukLgzLXvpIOrkuAMY4=
X-Google-Smtp-Source: AA0mqf4L04UPa3R4bcUeYzq9jCzGlgCr1u4EcwB1w9zmrt7aEo2DiUH02lu3p+IPeH99V5bR/zZ9dg==
X-Received: by 2002:a9d:65d3:0:b0:670:5951:87b3 with SMTP id
 z19-20020a9d65d3000000b00670595187b3mr6279795oth.31.1670772498015; 
 Sun, 11 Dec 2022 07:28:18 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 11/27] target/s390x: Use gen_psw_addr_disp in save_link_info
Date: Sun, 11 Dec 2022 09:27:46 -0600
Message-Id: <20221211152802.923900-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index f5b97fe1c4..b317767a7d 100644
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


