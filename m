Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61D698C64
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX8D-0004Jn-Ap; Thu, 16 Feb 2023 00:48:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7y-0004IZ-UN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:20 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7x-0005RM-A7
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:18 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so1145696pjp.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0RV/Pw0nPLtehqObgMiaovu9PpCvAiBoNRoo5G4UtrA=;
 b=ibS+aqAHi20YDxR6+3nRSJQIDs1qahGY3mJ7rc/E3Ls2SGd4tSDkVQGLnVo+/0p+/S
 18GHHFyLmf0AKMVVrFHkivqVf4jqFgsAk5xNCBw0JQRvvDCDBaQhC6G+cBGOHHRFsNrN
 xpv/djp88Q5aZYoD3DwQCbQvbgW2dVUEQuL5YAGBxp1wY96VHPA/dFxuEfXxWyFzMAfc
 dUoxM8iTTbAzETGYGy+kQk9W8Fx9tEOff2vpHpjTFQFA58+loh7xm0mrh/PBX+IhRZQt
 Jyc5P9IwAoh7MCwh2xXHlTailYutoYUxtZLXC+TcNVteTIcnfpCooM9/QExelkyddZ0h
 G4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RV/Pw0nPLtehqObgMiaovu9PpCvAiBoNRoo5G4UtrA=;
 b=j9oHI0Tjnry6bB8sE8zXv5dNkrmv2HOvKSJV78HPK6mOON3lJV3uUj5Lmej31b39fD
 6Fa4Dbqlk31dATPY9epvcfNL1xj6UeXGrqJBxIkK/sfUrw8M60Soq9GKMhRwmXb9XXux
 EVXgDon4XXsnSFljE3sQ1upuVNv73oAifaB/b6WvTEmYnanDDMx8ENdzw/AboV/F78C1
 jX9Lg1sBLx8fVi8wxPRP3IG4wTQW1sn+qf7lpHG5yYtt01okuaC+ItqzsqObL6bd+UbA
 2ImkzPuwRg1C4Ei7JZGl0Vfn3JMl6mZToVIIdKQMuhLctNx4Y5pZ4FcVdL1RkZKWeqLy
 DjjA==
X-Gm-Message-State: AO0yUKWhtH1DmIgbfK2rIPM5rQj5xS0ucUnrClCmG8WlUq85Y9h88+tw
 KwpzSFwhx7Y2MXrlxQvG0HczI10MqMxfTJJpd10=
X-Google-Smtp-Source: AK7set/vUmjat02jemZtnNSZS/FiAik3n4twQLWBwy5IrIsuycDXgP9RZcDYyO0lj4NKoOuLbt0RsQ==
X-Received: by 2002:a05:6a20:3948:b0:b8:90aa:1956 with SMTP id
 r8-20020a056a20394800b000b890aa1956mr5651413pzg.20.1676526495932; 
 Wed, 15 Feb 2023 21:48:15 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 12/15] linux-user/sparc: Handle coprocessor disabled trap
Date: Wed, 15 Feb 2023 19:45:13 -1000
Message-Id: <20230216054516.1267305-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

Since qemu does not implement a sparc coprocessor, all such
instructions raise this trap.  Because of that, we never raise
the coprocessor exception trap, which would be vector 0x28.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 43f19fbd91..bf7e10216f 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -311,6 +311,10 @@ void cpu_loop (CPUSPARCState *env)
             /* Note do_privact defers to do_privop. */
             force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
             break;
+#else
+        case TT_NCP_INSN:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_COPROC, env->pc);
+            break;
 #endif
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
-- 
2.34.1


