Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167032BCBF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:07:48 +0100 (CET)
Received: from localhost ([::1]:34830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZel-0006yw-LI
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZN4-0006lb-1h; Wed, 03 Mar 2021 16:49:31 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZN2-0002fM-CQ; Wed, 03 Mar 2021 16:49:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e10so25127033wro.12;
 Wed, 03 Mar 2021 13:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4R5DcpwiVyH1crneA2P/IW+Ft2bwjopPdJYmPr1uTds=;
 b=NbAIWa7c7wZe+GDH8szDSnlBZPWxefFR6ntjrAyy3SKVtlc+p67YkOygXelyZmOmah
 OacmPQiMQ0lbJXnBe+33mRgfmD5dw7+k+5Ow/5Pn1Ci9mGYzyOz5bhtpFfpCkY3+QQrZ
 5OpMSLo+GrtqvuQrFkRHoCmjX4zqF9222pqR0ZAzPPMiqRDPvrAK4bs5UwU7ZNOVznZF
 f9Xvgwp06LFaXUxDXE7xbatRKqokXNme+UMnhRg/a+IFQ5sisTntQew93UxnY+Pof4nA
 KfW9JorwSMGyM8dJqxFIBkOk5Xngz0MR+vlqm+6W06idIcZ7v2TDzmRgin0C7txbfgFy
 8uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4R5DcpwiVyH1crneA2P/IW+Ft2bwjopPdJYmPr1uTds=;
 b=WYHYHVLOIs3a/XQIwMm8qw5kIr3+JVLknHAooTgJIVM7+u7ye7eu3YBL2cF0VKfYRI
 dYRIjLLkJJtRUNvwI6Yv0Rnqmd+fvifLVIos5QM0sQeaMYAGzx83Jg4flCzKnSNq1OQ+
 u0NWKQPteM4Nf+pObPVlW/SIAOWz4Yzt1KQXtPnFpTSab3K6MckB/S+cUMN4ptKa7Fex
 /JOEGCA6q7zxbXDATWlSjdJilt/RF9H4ROew5HUgm/Au/U90fRR15FTDI9QHV4dsRwFI
 cH/aWOeK+gi9b9m5H5eRM9JN8RS0q4Jat7nOQWXa3hiDL+yBEW+wnGwSMjN+uxkmgvVg
 GV7w==
X-Gm-Message-State: AOAM5303U8jttpYA897+6k1h7sPez4vvHDpBXSqzCgHr/17Z2/KbC/m5
 +f0Bdtm/EcRo0ZJ+W5hk2sPV92eNUUQ=
X-Google-Smtp-Source: ABdhPJw5M5BRw3KaT9S7Kgh8uaaWjhLQQiXmBsGhFLwNCBpvbqOZzXsB1MohyDvx9cI1GkLbED4wdA==
X-Received: by 2002:adf:a418:: with SMTP id d24mr663327wra.187.1614808166003; 
 Wed, 03 Mar 2021 13:49:26 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm38037052wro.15.2021.03.03.13.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:49:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 25/28] accel/tcg/cpu-exec: Restrict watchpoint code to
 system emulation
Date: Wed,  3 Mar 2021 22:47:05 +0100
Message-Id: <20210303214708.1727801-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. Add #ifdef'ry around it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/cpu-exec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 16e4fe3ccd8..3a6436013ea 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -471,13 +471,16 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 static inline void cpu_handle_debug_exception(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUWatchpoint *wp;
 
+#ifndef CONFIG_USER_ONLY
     if (!cpu->watchpoint_hit) {
+        CPUWatchpoint *wp;
+
         QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
             wp->flags &= ~BP_WATCHPOINT_HIT;
         }
     }
+#endif
 
     if (cc->tcg_ops->debug_excp_handler) {
         cc->tcg_ops->debug_excp_handler(cpu);
-- 
2.26.2


