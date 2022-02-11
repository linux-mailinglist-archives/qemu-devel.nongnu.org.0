Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7AC4B2AC5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:46:05 +0100 (CET)
Received: from localhost ([::1]:57494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIZ3b-0005uH-Di
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:46:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYu1-0000Q2-IM
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:09 -0500
Received: from [2607:f8b0:4864:20::62d] (port=42808
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYtz-0002If-5P
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:09 -0500
Received: by mail-pl1-x62d.google.com with SMTP id z17so5095921plb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ycHa0Cp/S2K1hnOLMDePUWT2anHQ+aB3cRrtgPqv7k=;
 b=VeqPRGEY4KPPbopjR3H1kGSQFobV6SNHKm6p3SJ+j7Barchup7vd7MN9J02P2oAEgj
 eAZspiKZWezmyrL5egJjazxMwrW9YEFPhfcBZLB+2mec4aBinA9aVvTuJms5c65fc8vD
 RyGw8zBAhhNvAT6Q3wW/ODK1ZrA7HkcsL+3cJJcwhy/XZl1OABfL3U9sE3v1o7r2cTq4
 nvJY2KrQtQoeQxUKphWYV/nUW+R6hzFEZanu7Ao5vH0IVZocIDKa34uJzgxqWsGvpMhQ
 HGg3QQI6KCJ0LW6a8laC5QdC/JET8dAV7HRjSYPIeLkJ7rEBqHJmZ8NmrWIDqh8UwY6T
 Nqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/ycHa0Cp/S2K1hnOLMDePUWT2anHQ+aB3cRrtgPqv7k=;
 b=nyFTW2GWLQRYz06gjimEmCgBxGBohPnaJezS+r7gTaQaR7odB0JgFWBzPfNiOjdoAG
 fdm8SwhhCjoa7kg5oz64a76EPv9oYIQ2/r20vTLXUhrdfrdV8y0DoSMSf7qPnle93tJ8
 PrxPi0RF6iPT+jfnkl8rqXp3Oclk1OUrQZcGVTurAhKICb0HbTSNPpx262PxWQPFipqa
 QML/sQDE/qEWfC+ESYajyzECnW74pHR8rGLxWg7ABtYiCZuvRw9n3GYn1ioB5WzHhG48
 b0Js5xONEC0DBbKLQUkfRkdrLXGNnlVIkKX5rn2RqLtPGS5xx54aMU2hu9Bir3slwMgI
 3PUw==
X-Gm-Message-State: AOAM533PT567e6jHIEiYtRtzRhrpEOEkL/0sg/wjEEfj8IqJgDzvWRM8
 LptbT2fLRk6DMjl8QJMseBu/9aSHpfo=
X-Google-Smtp-Source: ABdhPJwokFFBSFuIkKRf5XOnMNaaQTubd6HEPU83dgYoHMfNkl1Z48/wphnjZhVA6V27oHNYJKKFRg==
X-Received: by 2002:a17:902:ab46:: with SMTP id
 ij6mr2382524plb.32.1644597348402; 
 Fri, 11 Feb 2022 08:35:48 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y190sm13161727pfg.212.2022.02.11.08.35.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:35:48 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 07/13] hvf: Make hvf_get_segments() / hvf_put_segments()
 local
Date: Fri, 11 Feb 2022 17:34:28 +0100
Message-Id: <20220211163434.58423-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Both hvf_get_segments/hvf_put_segments() functions are only
used within x86hvf.c: do not declare them as public API.

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/x86hvf.c | 4 ++--
 target/i386/hvf/x86hvf.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index a805c125d9..cff59f3144 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -83,7 +83,7 @@ void hvf_put_xsave(CPUState *cpu_state)
     }
 }
 
-void hvf_put_segments(CPUState *cpu_state)
+static void hvf_put_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
     struct vmx_segment seg;
@@ -166,7 +166,7 @@ void hvf_get_xsave(CPUState *cpu_state)
     x86_cpu_xrstor_all_areas(X86_CPU(cpu_state), xsave, xsave_len);
 }
 
-void hvf_get_segments(CPUState *cpu_state)
+static void hvf_get_segments(CPUState *cpu_state)
 {
     CPUX86State *env = &X86_CPU(cpu_state)->env;
 
diff --git a/target/i386/hvf/x86hvf.h b/target/i386/hvf/x86hvf.h
index ef472a32f9..427cdc1c13 100644
--- a/target/i386/hvf/x86hvf.h
+++ b/target/i386/hvf/x86hvf.h
@@ -27,11 +27,9 @@ void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
                      SegmentCache *qseg, bool is_tr);
 void hvf_get_segment(SegmentCache *qseg, struct vmx_segment *vmx_seg);
 void hvf_put_xsave(CPUState *cpu_state);
-void hvf_put_segments(CPUState *cpu_state);
 void hvf_put_msrs(CPUState *cpu_state);
 void hvf_get_xsave(CPUState *cpu_state);
 void hvf_get_msrs(CPUState *cpu_state);
 void vmx_clear_int_window_exiting(CPUState *cpu);
-void hvf_get_segments(CPUState *cpu_state);
 void vmx_update_tpr(CPUState *cpu);
 #endif
-- 
2.34.1


