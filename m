Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103943E3B49
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 18:10:12 +0200 (CEST)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mClNL-000705-1o
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 12:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mClM6-00056I-8X
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 12:08:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mClM4-0001BS-Uz
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 12:08:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f5so2249109wrm.13
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5uZT3MfT4w+FruUmTHAg3owA862EljxsHIzMrbqXg/I=;
 b=Zj7InsFkucJ5QFoySMrm2oxRdpM57iig+G+QZ/fPkhB4p5K9rYYLQX9pt0rWk9cPvs
 IxEzuyM61x7GU65OPDqlK56lnt9m4TIiGTE6sn6+LOAyV07ZgYyTgTbZu+8jbNpFfLkO
 UB/ofXtZ/XvpNo/1MTq46HGm5sRWkhdCKCB6BhsbteiDwVbXJssxsGZ8fVf+lF+s1Skc
 wKyXBFqD2ioBcCJJNOziOAdddaJ1RHD6JWZO942cb2QQk3QPEpaKOv2hb170mt/1dLTW
 ozn01vzx6w+CCBpKet/zrXbDDtuu2hLn2HCLo/qosYDMJBdoeyI8ON2+gqG1+UlM3LyB
 Xdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5uZT3MfT4w+FruUmTHAg3owA862EljxsHIzMrbqXg/I=;
 b=WOYtrnlLpSzb4zZPF1/oeOLw1We8UOvicaREI2dPkYC5Oq7h1mcOnXOqaMD27byTKJ
 R5RKFFEjikSEdtFSwU2VqiiteQP+3H7w1qXGK17iav5HhKN81UvEN/Lo68E9/TmHlSP6
 ioHeP2+37wDyuyU2XhG6aE+habCiHdfznFLWuDokhI0LMvObM/HyT+lsdPwEv37yXmW0
 CdeOCo9phRY0ArRfJjqRru7iz4VhVcB3/9mlqe49vw0cy/v31ttl58IyG5swiiLK6dsw
 Sdd6hnhnFcgdvA95nGSQf5dhKI+NASPKZ0oWrYXp2nrO6YUh06JpdhH7uOZMSBgxXuJ5
 1n5w==
X-Gm-Message-State: AOAM531X+pS/gxC817kfWqEOGU4rZcpKuxmlFjEb939JHe3qzBLbheiT
 2imkTpjaV0b6isU6MR5lfLrxjlnDEDs=
X-Google-Smtp-Source: ABdhPJx336iImZfrJYtLadyFUvNSZHms55qM/fyH4NaSG//YvONPi0D6btTaJdkg6KP0y/BzgLE2LQ==
X-Received: by 2002:adf:d1e4:: with SMTP id g4mr20104909wrd.371.1628438930985; 
 Sun, 08 Aug 2021 09:08:50 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 c1sm1597114wmp.7.2021.08.08.09.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 09:08:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 1/2] target/mips/tx79: Use tcg_constant_tl()
Date: Sun,  8 Aug 2021 18:08:42 +0200
Message-Id: <20210808160843.84957-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808160843.84957-1-f4bug@amsat.org>
References: <20210808160843.84957-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_tl() with the allocate and free close together.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/tx79_translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index 6d51fe17c1a..0dacdf2a619 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -247,8 +247,8 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_r *a,
         return true;
     }
 
-    c0 = tcg_const_tl(0);
-    c1 = tcg_const_tl(0xffffffff);
+    c0 = tcg_constant_tl(0);
+    c1 = tcg_constant_tl(0xffffffff);
     ax = tcg_temp_new_i64();
     bx = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
@@ -279,8 +279,6 @@ static bool trans_parallel_compare(DisasContext *ctx, arg_r *a,
     tcg_temp_free(t0);
     tcg_temp_free(bx);
     tcg_temp_free(ax);
-    tcg_temp_free(c1);
-    tcg_temp_free(c0);
 
     return true;
 }
-- 
2.31.1


