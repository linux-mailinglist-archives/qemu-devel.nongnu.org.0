Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C044B5A40
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 19:56:04 +0100 (CET)
Received: from localhost ([::1]:39294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgW3-0004Uq-8d
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 13:56:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9U-0008Lv-Fu
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:44 -0500
Received: from [2607:f8b0:4864:20::42b] (port=44029
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJg9T-0002cp-6q
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 13:32:44 -0500
Received: by mail-pf1-x42b.google.com with SMTP id d187so30678950pfa.10
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 10:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwzAoSrGJ3x/bKluviqLTkKJTgNhXDXBL+z+UP/egkI=;
 b=RzhBYHKGNCwe2SfEK7yTXNGhPeLI1Nf7K80wtqFeZZz/dMiESExoExtpWqcAIBSSgA
 uvs1iBZKd6cC/GNfJn0kOTUyOd0oO7LIWnTysLs3fDbHGDruHx6Rw+5NyDlnWW8jEv43
 f7+HBNtQ3V7siXqQ2O749AXf0enx8VEWalzyoK8xf+UWTHx/nC3JRhYM5LNzIqa82iEH
 74kB606ed2iLnexSwTXA6DupAzkARLdjd7SXxogTcmt1P6xFoati0k8+hKfQS3XtPXAu
 g/tOUVr2XxwGnaHbqYDDWcPHf5MNbJK0SdF/UV70sz6E/3WuZAGh0p50+NXW64aO/DSb
 +7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cwzAoSrGJ3x/bKluviqLTkKJTgNhXDXBL+z+UP/egkI=;
 b=vC3gPW9FlBbq07SeuVvIuxVT0HaC8DvdGVlyNRnzoq3xiSvmxCHU64EcVnDD4QlXGl
 sYfNpPpnOHE060oMdhkpGJehoWoJCLiSDnZ4MOdKlZ97K8lHq2amXyQS1AK1La1SNixG
 O+Ow4Wabf3Yck3pfpBWnkGrLQZUagbRZnfGvKNqbQWF8fgvj+QTzn5hSWwuEPzb62Wf3
 Pyek+3L4QoX8Kzcb78IjnN+yksoKnO80lEpVaxhQcAuyi2CZ22irQTWA/CKwjJEDL5Xx
 5IKWLuiVucjLex56OZyNS0LJ+r8nsAq25ejHNycM/6DB4ORBhQ/jSkM/aCptIFVFgq6P
 /thQ==
X-Gm-Message-State: AOAM533CGv7/xHP0pWwcE4OQ/2weqnWktEvG30HaJFWfDIxgE/8QWhGA
 DZ3jCmPOB+TIDS3Tc8A5ZM4cBR4+Nz4=
X-Google-Smtp-Source: ABdhPJxhKE3ZWHDvAoVdu2IbMTxoEButGwazhPoDo/yc1oGZ2jW2VSPRpGRT5tQis+mnD0pTP8t0mg==
X-Received: by 2002:a05:6a00:2310:: with SMTP id
 h16mr152697pfh.80.1644863561810; 
 Mon, 14 Feb 2022 10:32:41 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id u37sm281270pga.2.2022.02.14.10.32.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:32:41 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 06/14] target/i386/cpu: Ensure accelerators set CPU
 addressble physical bits
Date: Mon, 14 Feb 2022 19:31:36 +0100
Message-Id: <20220214183144.27402-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
References: <20220214183144.27402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

The only accelerator allowed to use zero as default value is TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..16523a78d9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6384,6 +6384,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
          * In this case, the default is the value used by TCG (40).
          */
         if (cpu->phys_bits == 0) {
+            assert(tcg_enabled());
             cpu->phys_bits = TCG_PHYS_ADDR_BITS;
         }
     } else {
-- 
2.34.1


