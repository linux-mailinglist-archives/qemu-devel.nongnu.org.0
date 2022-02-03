Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D64A8CDD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:04:09 +0100 (CET)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiKt-0007Ac-CY
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:04:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdo-0002ml-OO
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:39 -0500
Received: from [2607:f8b0:4864:20::436] (port=37589
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdm-0002L1-QB
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:36 -0500
Received: by mail-pf1-x436.google.com with SMTP id y5so2101623pfe.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TT5ERS0mtyXmsWNPPryOjx250kFAPf8XEK5Py5HGmAc=;
 b=qH+WEmJEfd6TyEmBB5FpDlLRQM6tfwR3iM/f/ZrbBgg/C9vvSGNnJMwpn/XBLSArkV
 O61ao5syA0aJM5/OLwnPqaXqJQ6IeIVZ0JJ4SS3Qf/XRgAQPq1rYwvEA0HCvdsCwSewL
 9prtDJe+IZqaWYDaqYZWInvdAcA6T2Ef4JcuEwBAtKylVPKsTavbp5hRlyDsxXTHAdT1
 suI9TKRq2mCA85qdW8zFSqAQgI21zjl+3BoXVuWiD2UB+ELpU2mvGwUGHVx4GragfGhM
 ogYqU9yES9/ACcTh8LKqxrlfrd3l0pLKxcrCAA0GOTBLYuOmLiVX4oH7lD+5zTzah4Mo
 Jlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TT5ERS0mtyXmsWNPPryOjx250kFAPf8XEK5Py5HGmAc=;
 b=hSy8FQ/zVkYfcwN1aiE5G/oxLlWbwwQKUr5d1JvTNUsNHFVn1mY43BQKJcVACivshA
 aqjMCujWcX0yy+UW/vLqOWfucNv/9aXF2Z/g73tzTyi7HUO+KAqrvaSyZ91HppO7mEgd
 dCNVv4W8r6cDv0Bp2W1x4iZbQ9pTxxnZlmE7WK7Hesv7KCHfQvC9ViywUi68nLk09qhE
 a8AOm/VcssLbFM6Bw/0ltxfdVBfl0K9KeOh5rWoarP9PlrK1S5E9hbJFssfqSLmrqCOS
 tChO3MlTulHnsSoxJRGRc4EUhm9zat07B/Tvocw/g5p8pvKsecyq09OHMO92e5/wuJmW
 Rkzg==
X-Gm-Message-State: AOAM532GeJDNGMNx/qn0czKW6uHclqdUUdxAGtkcdV1cpg4i/nxDUjSk
 ilMzpmlffnGhwKA0ktV3VwnwO4JDIxU=
X-Google-Smtp-Source: ABdhPJzVU10vzb2GDQ3+P906LvUVLYHZC0Ct5qHNDhfWQKvNE9lTNTyjIfiUnsXBWxvCiPIpjRjsvQ==
X-Received: by 2002:a63:e418:: with SMTP id a24mr29176869pgi.169.1643915972516; 
 Thu, 03 Feb 2022 11:19:32 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y2sm8211221pgf.33.2022.02.03.11.19.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:19:32 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 09/21] softmmu/cpus: Code movement
Date: Thu,  3 Feb 2022 20:18:02 +0100
Message-Id: <20220203191814.45023-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

We want cpu_thread_is_idle() to use cpus_accel, so declare this
variable earlier.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7f15106dd9..538e1714af 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -66,6 +66,11 @@
 
 static QemuMutex qemu_global_mutex;
 
+/*
+ * The chosen accelerator is supposed to register this.
+ */
+static const AccelOpsClass *cpus_accel;
+
 bool cpu_is_stopped(CPUState *cpu)
 {
     return cpu->stopped || !runstate_is_running();
@@ -126,11 +131,6 @@ void hw_error(const char *fmt, ...)
     abort();
 }
 
-/*
- * The chosen accelerator is supposed to register this.
- */
-static const AccelOpsClass *cpus_accel;
-
 void cpu_synchronize_all_states(void)
 {
     CPUState *cpu;
-- 
2.34.1


