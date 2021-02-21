Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C9320B20
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:51:24 +0100 (CET)
Received: from localhost ([::1]:42420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq4x-0000se-3o
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppw-0006f7-0d
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:52 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppu-0002wb-Ds
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:51 -0500
Received: by mail-wr1-x436.google.com with SMTP id l30so654100wrb.12
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D6VYexV1cpoyJ2slRh52R88zZ65uYGwbs5LIn6CZfrA=;
 b=Kwc3YhJ2HVeRK47bimLkMJdPy5Al26U2B4fn2XwD2+siH1013miOzfuclWO8ZWPmda
 YvNEZ3H3gwGXzJVk7A8zM/jINq+gCQ32tcyOHkL/hHub3Fb4oPm6iNU8Z8wZTuamwZgy
 FuHlTsUr4Gu+y3rp0Ao0q4qQt7JBfkmgtxOn6iQXVXJZNj9fx0CERvwkmmaGR7lnl17H
 oS8YjmMYLK622i5MoEXlcCGI6w3u6+lJ00YQoiQAceKqpYeD1oRUjNhVTw9zhL1bRlLu
 XPfuyuvzRsXtj1tYHrqmyY/MLX84MbWF69ktWsNK44uo6ldEsg2751xlEfTTJN4Eg3YE
 0xXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D6VYexV1cpoyJ2slRh52R88zZ65uYGwbs5LIn6CZfrA=;
 b=DHkUHb82COjTiJo9zJI0PPz1omRPEJKeTzAe0LZbwcie7qknVweJ3Ideusxxq6kYQP
 P8fwkLIOsJj+qv4aexwxHNyqbHIMkPXGFB86x8A/fI1w+I8fmZlIl/oiCpg9j6EgjFSR
 Aj4872d5oaZAhGSspG45aObo6qMLrLEtlDInw3st6N7Znqjg33jjXvttvE7P6dGf0bz/
 7FTnHkdN+ozfOtdghUrsr3qYUhf9e7UvDovscuTTSqd9RH54VE9dZkAg10OecfOk9JGj
 3uF8cB79nPYPDi2A2GCmP5WEWI4gJIMyTrSzGnWLTW2sno1b8exS5NX8lKKu1rhGEeCS
 HkjQ==
X-Gm-Message-State: AOAM532TIGG2GRtRtJFT+DqgH7K92lOsiMgEspeic723Lng6CiY4gNSn
 Yjox4XYTa7Mc+TyeApvRThtv5WRoBjU=
X-Google-Smtp-Source: ABdhPJy42raJalYXebbYQkkHS1WUscl2cCV7GhsKnBJILSGWF3l4V3XaPcN0KLBG9iyt1eSqyMV5hw==
X-Received: by 2002:adf:ef86:: with SMTP id d6mr17695840wro.419.1613918148911; 
 Sun, 21 Feb 2021 06:35:48 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z13sm2276073wrh.65.2021.02.21.06.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/43] target/mips: Let do_translate_address() take
 MMUAccessType argument
Date: Sun, 21 Feb 2021 15:34:04 +0100
Message-Id: <20210221143432.2468220-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single caller, HELPER_LD_ATOMIC(), passes MMUAccessType to
do_translate_address(). Let the prototype use it as argument,
as it is stricter than an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-9-f4bug@amsat.org>
---
 target/mips/op_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 9fce0194b3e..b80e8f75401 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -288,13 +288,14 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
 #ifndef CONFIG_USER_ONLY
 
 static inline hwaddr do_translate_address(CPUMIPSState *env,
-                                                      target_ulong address,
-                                                      int rw, uintptr_t retaddr)
+                                          target_ulong address,
+                                          MMUAccessType access_type,
+                                          uintptr_t retaddr)
 {
     hwaddr paddr;
     CPUState *cs = env_cpu(env);
 
-    paddr = cpu_mips_translate_address(env, address, rw);
+    paddr = cpu_mips_translate_address(env, address, access_type);
 
     if (paddr == -1LL) {
         cpu_loop_exit_restore(cs, retaddr);
-- 
2.26.2


