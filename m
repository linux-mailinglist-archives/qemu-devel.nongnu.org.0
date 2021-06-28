Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534673B61B7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:37:29 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxsO8-0001et-AR
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsMf-0007cG-3t
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:35:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxsMc-0000bs-Te
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:35:56 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso128549pjp.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/oq/GCJo3ej444ufvYE37nA1CpuIBiVrhB+99DMw+hU=;
 b=m/HGN5MlUzgE6KEdyfeDbS8I8hbnNkAHaqGURau0oRDRQOVyDvf7XODNw962J2sriv
 mGYGqbg9eG3JPMgk/0+5P+mrVCGBqFSxPKjR1TaGqr0ukyFu+Dje0kqu8PkXnyfWim7o
 JzcLA32H8fuzyNYqF/vZopRw5BmQp1yGAOCgJBtvuJn3Ute6rR1uckaMblqMnshqjtLB
 ulvLDSzDD8X1p5hW8s/yliCAVwVUbYDK3xP7V/BhjH1w66d+teJjoyIaNDlazdK3Y+7I
 mP8fRbVmkoWxCLihxLGraIyBD6NUwBvzWrM9PBW5aNJg/K2hJWgaYobT6WBbM9IawwAD
 dBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/oq/GCJo3ej444ufvYE37nA1CpuIBiVrhB+99DMw+hU=;
 b=V8DcyfrfRa+6A7rFhmEG2pHJ2ns/uA+Zf0TYIEnA5c4QCkcbS1CFEQnmLpnRZ43EyC
 jwbnpIoEuWaJavZM6CEG0XsG5rhE/LozCoPE7RE8ta3FqWpUv+nxlt9W7CbiHch95nMO
 4xa42BAz3pE7/+mrEGnZr5yo+lxwBBOEIwXCq0bBEucRIXaFFviL5a2D+WCOVAmX1xPz
 4+p+S+X7CB9p2QGzPi4KG7/X3DH63arWT90SDNrM+xmPQmYenHbq9u0LGUWn31sW5Qj8
 Mi90GZf6K/IvYH3nX/EH/3ZhEMEMupfiMEfKTfLywwhtRNaWtiqsrygheUibP/a+9Fqv
 Zk8A==
X-Gm-Message-State: AOAM531QeKxD9cjRGdsCwaTUTlatAaraLKdOxkxsEa3e9e1SLCdwE61M
 0u205N3WMGbvHYvOrJ4UfhXtVSfRPSd7JA==
X-Google-Smtp-Source: ABdhPJwbfzqALaTQ2BJ1jUJRdooGzS94hHNVbhjr8oD/4h/bC8IHXVAJQmR39LwqIc2+zFp8bWT8JQ==
X-Received: by 2002:a17:902:b210:b029:11a:bf7b:1a83 with SMTP id
 t16-20020a170902b210b029011abf7b1a83mr23017375plr.84.1624890953688; 
 Mon, 28 Jun 2021 07:35:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k13sm72779pgh.82.2021.06.28.07.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 07:35:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hw/alpha: Provide console information to the PALcode at
 start-up
Date: Mon, 28 Jun 2021 07:35:48 -0700
Message-Id: <20210628143551.2870006-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628143551.2870006-1-richard.henderson@linaro.org>
References: <20210628143551.2870006-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Jason Thorpe <thorpej@me.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Thorpe <thorpej@me.com>

Redefine the a2 register passed by Qemu at start-up to also include
some configuration flags, in addition to the CPU count, and define
a flag to mirror the "-nographic" option.

Signed-off-by: Jason Thorpe <thorpej@me.com>
Message-Id: <20210613211549.18094-5-thorpej@me.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/alpha/dp264.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 010d22476b..316f0691cd 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -72,9 +72,19 @@ static void clipper_init(MachineState *machine)
         cpus[i] = ALPHA_CPU(cpu_create(machine->cpu_type));
     }
 
+    /*
+     * arg0 -> memory size
+     * arg1 -> kernel entry point
+     * arg2 -> config word
+     *
+     * Config word: bits 0-5 -> ncpus
+     *              bit  6   -> nographics option (for HWRPB CTB)
+     *
+     * See init_hwrpb() in the PALcode.
+     */
     cpus[0]->env.trap_arg0 = ram_size;
     cpus[0]->env.trap_arg1 = 0;
-    cpus[0]->env.trap_arg2 = smp_cpus;
+    cpus[0]->env.trap_arg2 = smp_cpus | (!machine->enable_graphics << 6);
 
     /*
      * Init the chipset.  Because we're using CLIPPER IRQ mappings,
-- 
2.25.1


