Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8C93EDEDA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 22:56:13 +0200 (CEST)
Received: from localhost ([::1]:59554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjeW-0007Ov-Ko
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 16:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjZs-0007zn-Qt
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:28 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFjZq-0002oq-Ra
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:51:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v4so18270933wro.12
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OxEJXC7lL6JkeE88O86XD/Gz40sjVZOycwNQPdJyF4g=;
 b=i1l5hgEQaq9V4Y5y7/bSnpgr3qvoP/wo+WS+TV/3DgKZiTP2bRMY+voiUoe7i4md9F
 HBaO2+pifvW/UnHJyekRpcTdte9T+Z7n0vMd1uv1iaBxynAcbqwTqLLMnRxlwpEcdOZt
 /KWZJg0DA0FwHCoC8WAA7uDTFGtVh0Zxx62Z1FCfv7NonYFkUnza994oLmfS0zBe0GFr
 Hsdp00TZ+LAiJ927plojPQMwK9/Uz50VNm//v8JGHypvGtHkQ7qdHsc8gVfmvxe/ZAfY
 f4ee9xwnUJI9Sw/LhCI7SytJZIj9spIx1bIsmE0teo8O5DlXp6TjwJq2gf81Wxz8esem
 UmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OxEJXC7lL6JkeE88O86XD/Gz40sjVZOycwNQPdJyF4g=;
 b=QYsx7JcmDYA+uJZBgzQBdsc0hhVXiafFZIUeAL4iEFgqkQ30WdEnS3BpElVrEPT8lw
 lMx4C1BwBPEXjxdekP3ynpW66iGKoPYao6lc1BdCXJGVkbHKlSDgrq84FitLhLUdWXvu
 /3SWDIwYSmMRBpi3oaeDOo++oullqtaKGswleiuHsNxWhtI4s+6BSIhQv0D300A+MOXA
 hoWhou9IqZptJ5+tlRFyiWGywFbt9CVRket07IuaXcyhZ+UR4RncP6qogKLw2D/17ttj
 HKM69mdImxMMbrDNcRbQZXieBx5y8rwM2yEIYRXk9X8sMg9LS47oPXfwjNAZten0qwln
 ye6Q==
X-Gm-Message-State: AOAM531xEaJY3ZJur7/Dnuuy8XfvdrcSwAZLJ01KrM2jqunzWF3ZFIB7
 /kswMrggVtqo1ZXJWgSMdHek8L2tSIY=
X-Google-Smtp-Source: ABdhPJz/IZTOHsjLIQeLVsNCQ4Tl/MVfrQ1bIRMEHMWb8RPSXNpgO76mxduu9IErhioD+xIhSVn0sA==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr352581wrn.111.1629147081252; 
 Mon, 16 Aug 2021 13:51:21 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t1sm256821wma.25.2021.08.16.13.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:51:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/8] target/mips: Remove gen_helper_1e2i()
Date: Mon, 16 Aug 2021 22:51:01 +0200
Message-Id: <20210816205107.2051495-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210816205107.2051495-1-f4bug@amsat.org>
References: <20210816205107.2051495-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gen_helper_1e2i() is unused since commit 33a07fa2db6
("target/mips: reimplement SC instruction emulation
and use cmpxchg"), remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c0f8a04b472..4b689a54abb 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1243,12 +1243,6 @@ TCGv_i64 fpu_f64[32];
     tcg_temp_free_i32(helper_tmp);                                \
     } while (0)
 
-#define gen_helper_1e2i(name, ret, arg1, arg2, arg3) do {         \
-    TCGv_i32 helper_tmp = tcg_const_i32(arg3);                    \
-    gen_helper_##name(ret, cpu_env, arg1, arg2, helper_tmp);      \
-    tcg_temp_free_i32(helper_tmp);                                \
-    } while (0)
-
 #define DISAS_STOP       DISAS_TARGET_0
 #define DISAS_EXIT       DISAS_TARGET_1
 
-- 
2.31.1


