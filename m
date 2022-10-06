Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB45F5FD0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 05:59:03 +0200 (CEST)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogI2I-0005eo-Ct
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 23:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoK-0004Aw-Ax
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:36 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoI-0003td-AX
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:35 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso583694pjk.1
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OUhdzli6FBB0g0/N3o8278Y1+i086FpwK4jH+sK5zo0=;
 b=P1qiqaGV+0DzUIk8pV2jmirqyd4HojMPNSFMSC8FmB14xeCnpWS70A7CMMtjyzcXuL
 /+aqyzYWSTqjvHE8tyRuFVn+Vf8393+O1RmyBohbOyUUhkXGsyOAtB8I7a1y+7cFQeBh
 QegNXdm4beh//0xotlx9qPH823oCXY77tf7a/hAY7S9z1Oe3h5ihF/X27gkRLkja7SED
 88/sLFh+AjAZnoENLOCZCsIEkhj1gOUEE7/B1+jwfkOBxX9FBI1yTiKqioKiHMywIWMh
 dN1FIgexhMraWHfB1vlp3OQDqfpCHrh9Wzdb8Z6CYbLfMz89eYutjIWsTg+4kh87qs4O
 SP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OUhdzli6FBB0g0/N3o8278Y1+i086FpwK4jH+sK5zo0=;
 b=b/hiTIRyUDLGnTo8OpOyt9Lpq1odmYB5bEO9A6c+hN3wJm7JbIN6C/dJOLd5+AWtF2
 os9X1j3wvZ9e9aCWNveFhGFXaIimgon4wshClo87Ow8DD6iP3yhnk30B3S28JwRjJRd+
 /eW+WT/OkOeEramCu28MHjOs3Kf3rrE53Cyg9hP2iTpzJOckYqLYIivrmVdue5iRXiGn
 eZWjhOZbPC4uhDfCByPHUv1/3KnTym6oDR13uda5uaNJgI8iM/7ibMAE43CfK3QokfY1
 CM10mjHntFA5aFB5LGkoMEWqz8YHwA516ezGBI+tOU2iKE4V0vZeOeaGRFICAzAWT8NL
 e6lw==
X-Gm-Message-State: ACrzQf3Htw3zaRVYkN1tRYmIYQVJriWBQLkGfVc5XSx9GV9KTSB0F2Ln
 jPygQrjqaeAzxUC0krv0oqOW5HvpyuPmwA==
X-Google-Smtp-Source: AMsMyM4ChDRrBvjIllmGO+j4u3kfq6JFBgHTIRRuIQYqvGyWXsnAKCMAMjxjIyh0F6ajbb/PZV0W4Q==
X-Received: by 2002:a17:903:2442:b0:17f:8069:533a with SMTP id
 l2-20020a170903244200b0017f8069533amr2769147pls.46.1665027871768; 
 Wed, 05 Oct 2022 20:44:31 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 09/26] target/s390x: Use gen_psw_addr_disp in save_link_info
Date: Wed,  5 Oct 2022 20:44:04 -0700
Message-Id: <20221006034421.1179141-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial but non-mechanical conversion away from pc_tmp.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


