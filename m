Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE76515F68
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:05:49 +0200 (CEST)
Received: from localhost ([::1]:37852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkqXU-0002Bl-7k
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqUJ-0008HE-GN
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:02:31 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkqUH-0001Bc-Ti
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:02:31 -0400
Received: by mail-pf1-x429.google.com with SMTP id c14so469282pfn.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QvfdSEBOg6Ufr/s6Ow9ptopcge3u9K/j1RRfTmH4ryc=;
 b=m6CXWm/x7xJagaanGQqhSP0MQ1ZMXtKmp6V8cSWd0gN4p+c14/PrOt6d6MMrUv9WBl
 hHTsRUwCm+ZRI65bP2P++eSg1jrQhoceiNHkcOM4+E53PQ4xVMHp3TrvQ6gdyWUCmnGa
 xP13YsVMm+ReU65cSzUEg0fn3cZ2lPm1w0q+Iecgt0pREw2oxr6YJtpxHvvcJxafTUnH
 ovFenSuxiDSWOjXwj/TX/NNuLmqA/Eqo1SXRMRnYkMBFyHAzzXeiaHR+eW5diKtikffP
 1dJeDYGtd18MHw6W8V7IPLYgXC7jljRaX6jfV+KdGG5NkdEo8AKX/9obEcuITvo5pVIT
 iTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QvfdSEBOg6Ufr/s6Ow9ptopcge3u9K/j1RRfTmH4ryc=;
 b=fDiRpRiLbXCOxsGryur9u+ImMBh7UTo4L/6NojrsJ1DtI0qoqxD8EXAR3GAhhUGhi5
 zW9hcUR5j8D78PnP95hZtQgFBkfgnJm/sDIiA3pa9UHMTju8SruEycdhvj9woTUMbxuQ
 +Xz6c2cuqfhoDPSh0QxvwUx0zg5uyYdICvfpypl5Z+nnVdoSHUsfZeGSztpfzsH0iL/U
 dXBjYrwpBuT/UYz8PZdajvHFETrDrZTkps0p1xq9S7lljSUZqNsU8ftehpusZWaL4T1r
 7yDTZZolMy1/PAW9A7UI4mIPCwJKABGQr7iiQ5mpTw0+KR1S0GO6C1+UqZ+ZJ0eNXKNw
 lqTw==
X-Gm-Message-State: AOAM531PVkHO0P71/9aN0IxGOOiTYX/IiaUZNOs+Hi6R+OAprEse5xp3
 dDKbDQdBxy3S8h/0x2I/u/m9Y5L8IuGioQ==
X-Google-Smtp-Source: ABdhPJzBqqXwn0u+QoB2xEC1IHdUw3/+ine3BKncDHdJ1EEA0HHSw4GN/N2BLI2kV/LXlrsaUT78jg==
X-Received: by 2002:a63:814a:0:b0:3ab:71d0:1a05 with SMTP id
 t71-20020a63814a000000b003ab71d01a05mr3640970pgd.599.1651338148527; 
 Sat, 30 Apr 2022 10:02:28 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 j10-20020a62b60a000000b0050dc762817dsm1753826pff.87.2022.04.30.10.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:02:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/m68k: Enable halt insn for 68060
Date: Sat, 30 Apr 2022 10:02:25 -0700
Message-Id: <20220430170225.326447-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430170225.326447-1-richard.henderson@linaro.org>
References: <20220430170225.326447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 4026572ed8..e4efd988d2 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -6003,6 +6003,7 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(tas,       4ac0, ffc0, M68000);
 #if defined(CONFIG_SOFTMMU)
     INSN(halt,      4ac8, ffff, CF_ISA_A);
+    INSN(halt,      4ac8, ffff, M68060);
 #endif
     INSN(pulse,     4acc, ffff, CF_ISA_A);
     BASE(illegal,   4afc, ffff);
-- 
2.34.1


