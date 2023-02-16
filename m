Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D3A698C63
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX8L-0004ZI-LL; Thu, 16 Feb 2023 00:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX81-0004M1-Ke
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:22 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX80-0005Rs-3S
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:21 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 oa11-20020a17090b1bcb00b002341a2656e5so1115601pjb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADJUDCuJvLZTfwvvTitHGj1Ym2hlIeqZfcpR8Lo5PkU=;
 b=eo5FFjz8yLATRAi82bpjJ1onqV060Mw8G7Uyq7HZfRGzRbuAu4VIf+blALn1G7Dq5n
 Qvq/ECAVc9jZOBE1ODnOgsPT4NIK1tJm3WJcYadYAX7fTfs4KzIEoxf0cNhxhpC23aST
 zAvPJRsX24qO4rWAbhtG7L14OFwwgJUJFWPXI+STuTuEh1kB70IIONS/T0SHSJQWBjpv
 Twz5XkopgTS+P9kFzTLlspVzYa16EqOe9TNlkt1pfATSo16jIGND6IJ26zNeflzl3xZj
 +cSys+ZdrY1kCQwcWN6EJjKZ6ADsZQ9k4THf9+padckFQgT6aaO0ZBHFoHSDKzYcq/W6
 AIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ADJUDCuJvLZTfwvvTitHGj1Ym2hlIeqZfcpR8Lo5PkU=;
 b=AEmPOrsmQhGAnNrejQ+bVDGFIwv2lACFWc7iWViAumiSFMtv3UcIybgxxURyesy3KO
 8E/Rm9YeuVv3Y421vqKH7r0swfyvW1o3+5iBqI3O7hHv8zqqh4Gu7BPSM4VhsX54eBXl
 F8c3NuuEY8YcS8jiGI1EBJu4OJJ+scFXDvj3hT6Um70tXor8XI0V0PQTxqAzTc3a5jvZ
 NtvodaE97HB/m14axBwo1vxLgfAtTYt84K4r7Thvkkx+9SIQGyK1PVPMccWnl2zQnHsS
 NCAzgxiRFKgjpJRb2aIXgjmg6rn2eAqP3cTtSJREErwVSw6jbhfSkf9aSoHspU9YvXVC
 orCw==
X-Gm-Message-State: AO0yUKUEcFjPU6RwtpJPh9t6In4FjnaU6WncBK6VJyiwmp3C4PtIzpLc
 mvErD+qs5nlkyfSYBbSHa1Lt2i+BfliNQubYAnE=
X-Google-Smtp-Source: AK7set9XbbZJeteauJUonzCKiXR1DgyU/xwbW2pih1ia7Ce0h+5ir4O6+gtPM2DLlnbuRbOEuPuD+w==
X-Received: by 2002:a17:90b:1e05:b0:231:bb3:b36c with SMTP id
 pg5-20020a17090b1e0500b002310bb3b36cmr5691012pjb.42.1676526498840; 
 Wed, 15 Feb 2023 21:48:18 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 13/15] linux-user/sparc: Handle unimplemented flush trap
Date: Wed, 15 Feb 2023 19:45:14 -1000
Message-Id: <20230216054516.1267305-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

For sparc64, TT_UNIMP_FLUSH == TT_ILL_INSN, so this is
already handled.  For sparc32, the kernel uses SKIP_TRAP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index bf7e10216f..093358a39a 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -315,6 +315,9 @@ void cpu_loop (CPUSPARCState *env)
         case TT_NCP_INSN:
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->pc);
             break;
+        case TT_UNIMP_FLUSH:
+            next_instruction(env);
+            break;
 #endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.34.1


