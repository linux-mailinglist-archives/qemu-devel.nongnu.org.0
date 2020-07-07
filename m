Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A72166B1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 08:48:40 +0200 (CEST)
Received: from localhost ([::1]:39952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jshPD-0007aT-Kj
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 02:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jshNV-0005wP-OS
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 02:46:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jshNU-0000cE-Fc
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 02:46:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id 17so45206812wmo.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 23:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OAALL/cw7n/+7fM0VWJqcBq9KNUXzDegINtW6gZFwpE=;
 b=gJZsYghd9IMqY6Xpzg4t1DXJxI4iLNVJsRsfTuB+J6fsNNt8zB9sLvbXRysZr+VhqX
 H6rtbbyXrEnqVTN9zmYmHmGpeXPaxY3z01s8mw4iLSqbn2ZtpdjNjEIi2R3Ro5p6wIOR
 v5Q7od1EXZgFPAT/cAzABR5xNN08wLogQt7zohgPHTrBJNeZTBTHAEE0xUo3rDJIF2kx
 2/cFnazRgANFJybh1wlTJhk99KK7XBczT+Y9fSj32APOYxk4Nq8E87hNx1mycdd9+nb3
 kVWNoJFVWv/OCQI9WsGOatiszOWTiFy5gF7uWTpgTY4q0DQspfgOZZlJ7+xfuRwt3LlR
 njZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OAALL/cw7n/+7fM0VWJqcBq9KNUXzDegINtW6gZFwpE=;
 b=l2wY+si0E8JFuGWpOVX8lyuTZTKKmXjYpa35iMM25s14jDZjLyq0wW/rcnwwls90AO
 yOY4U0A77avXlpTrcMQGZMqxKmbXzuD+7QcBk2r5m5MER8wo98MuPVJhDLzc3u84ixwi
 4QXn77NBiMcuqd2rbiA8IEMCzN5DUmioyJ+gjEFpbDe6OByJa1QudtmfXtOkmat2Pbir
 Ak/QpzbIQUlmunEIC3dieG/XAJSfg6tl2BMBBaw2YSKXGcS2SuAEAhITyoC/EDMlBLX8
 dkx+dWbVQtvEL8g3fZ6fhXWnEjCxkbmWEyRPVTXi5iv5mOFAL6xIiysTl451RiqbE5yW
 4Hgw==
X-Gm-Message-State: AOAM531SksvJwLmVNHvEMkIh3K7lUpkJM95kN5ZpfrFM5Brrplkf3Ye0
 EA0jpUVA3eCObjZHdQeLP/SBzYkr
X-Google-Smtp-Source: ABdhPJyFEDx+NByKlEgjZnpSWjc+gK2vB1pJBtONnNTJJxU4TgBxHNYJ6Zdr1fRLhyDfwNPmFMjVTQ==
X-Received: by 2002:a05:600c:2116:: with SMTP id
 u22mr2512882wml.82.1594104410976; 
 Mon, 06 Jul 2020 23:46:50 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id 5sm2172545wmk.9.2020.07.06.23.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 23:46:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/avr: Fix $PC displayed address
Date: Tue,  7 Jul 2020 08:46:45 +0200
Message-Id: <20200707064646.7603-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200707064646.7603-1-f4bug@amsat.org>
References: <20200707064646.7603-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Thomas Huth <huth@tuxfamily.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$PC is 16-bit wide. Other registers display addresses on a byte
granularity.
To have a coherent ouput, display $PC using byte granularity too.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 50fb1c378b..9be464991f 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -151,7 +151,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     int i;
 
     qemu_fprintf(f, "\n");
-    qemu_fprintf(f, "PC:    %06x\n", env->pc_w);
+    qemu_fprintf(f, "PC:    %06x\n", env->pc_w * 2);
     qemu_fprintf(f, "SP:      %04x\n", env->sp);
     qemu_fprintf(f, "rampD:     %02x\n", env->rampD >> 16);
     qemu_fprintf(f, "rampX:     %02x\n", env->rampX >> 16);
-- 
2.21.3


