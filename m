Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4276420340
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:12:16 +0200 (CEST)
Received: from localhost ([::1]:60684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5yB-0001k4-TA
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5ko-0003Ub-6f
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:27 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kl-0003ih-Rm
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 g193-20020a1c20ca000000b0030d55f1d984so5814267wmg.3
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQLZEwzsOLFau3mXxxxHhtsLM0I/M/Yo3h72hp1JP8M=;
 b=UU0+JnFdSQjw8kvnUGaCnO6XR5oHf5mwkljQMjLrE3t3J4x0qHeX5LVour76s9qSBe
 NKTZQK5nkji3xhf/JP8VvgjxUzYac2WkUw2KNNympHy9nmP2oCNB/dmhrMAcXRsAQ4By
 iM8IZmhVlHmqf/FMMNKw9qRbi3yB22JownyjYax+cg7ZInmfh3NCZZ4msuww3EoRKXbr
 cf+xIEtnPUhG3YZWR83VGgpMLwV2/jVPV2/pu2KCXdrBWBp9cLxNczdJ3j/TZ3HKw6Ek
 tDsaouaH/r2Js/eEhENFajSvgoFN0s8HIuGk27z4ZNcRYCN550xT7ZPd0yui++2dfSzq
 2cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aQLZEwzsOLFau3mXxxxHhtsLM0I/M/Yo3h72hp1JP8M=;
 b=BoBNfTlSAJFwGlPdqhzc6vEmYYINT6wUDCgyv2t7gxUPNBZwBun5fTTXfGtT3YaXoh
 q3Li/k/b1edX8h7qviIKjMHJwbQsf3KG0Tir9SPfMxkXFQWj7UlsWNcvQ5Bp2U8epMNW
 ma5Wmq/2uJ6+YRfsMEXJ+3pYIUEx5+UqG9GPN5jzYGyyKP65na9ZZmcz0O6uNZVS/yav
 eWoSVwd/SzMswTKuZcXBbGcCnCAJHa8HGmiNBGmCrl95zb6cs7XvSt4ziIirLwu2ZJZe
 EJurM21LV7SCpa+D5rP32KbxD34PQaE1PMB+dEXJ19cXRAvzhbHJz3dV5KehMPrtxBxS
 30sw==
X-Gm-Message-State: AOAM531Lt7NwR7GbBpq8jyQa3PgWHrN7ISTHlRB176ZoCoylBRJYA2ln
 dovm5qN9z4DOM2kjPn2FN0ZbZuDexZ0=
X-Google-Smtp-Source: ABdhPJy2WQreFL1akAGlWFOtSFk/0pGIAqXpCZ4FHAbPuXz5luoVea4YZQHCqNUZs8zLlz9g3ES5CQ==
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr2477980wmc.183.1633283902349; 
 Sun, 03 Oct 2021 10:58:22 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k22sm12270084wrd.59.2021.10.03.10.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:58:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] target/mips: Use tcg_constant_tl() in
 gen_compute_compact_branch()
Date: Sun,  3 Oct 2021 19:57:43 +0200
Message-Id: <20211003175743.3738710-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
References: <20211003175743.3738710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The offset is constant and read-only: move it to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 148afec9dc0..d4e0fbd35be 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -11866,13 +11866,11 @@ static void gen_compute_compact_branch(DisasContext *ctx, uint32_t opc,
         } else {
             /* OPC_JIC, OPC_JIALC */
             TCGv tbase = tcg_temp_new();
-            TCGv toffset = tcg_temp_new();
+            TCGv toffset = tcg_constant_tl(offset);
 
             gen_load_gpr(tbase, rt);
-            tcg_gen_movi_tl(toffset, offset);
             gen_op_addr_add(ctx, btarget, tbase, toffset);
             tcg_temp_free(tbase);
-            tcg_temp_free(toffset);
         }
         break;
     default:
-- 
2.31.1


