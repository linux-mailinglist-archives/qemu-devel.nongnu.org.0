Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8D84CC586
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:00:26 +0100 (CET)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqgb-0008SW-BC
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:00:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbG-0007Ja-Pv
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:54 -0500
Received: from [2607:f8b0:4864:20::c2b] (port=46905
 helo=mail-oo1-xc2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbE-0001k5-I8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:54 -0500
Received: by mail-oo1-xc2b.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso6793054oop.13
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h7K10PVkFg7lIGvwJ0Hq+fi9pulMgiLjM/TrtSEBCu4=;
 b=LlTR/1BTLQoVb5pkZx0kp/gSo6a+KgJX5hOdbPpyOYHY3WPDDewef3kngjfax9LwK+
 oHUKakeu62YeJpPOg0r9PUx0nQJAusIYphA7lv3PJrLbitPQ1Ir+YlOo4fG2oxd4taNo
 +jxIgYcaUEwe/NQ19VZBYguGQHzjXPHNWkC/ryjwjrTi+qmhpk6IWyWSzTqs/pzBQ3mo
 RE+yAD5DrhXnZbW4zv6A9Kh0t0s5RDchcIGpKcTHT7sByzdNZbhTlVuAwWJrEdLGKLyq
 7q6f1PqYncikOZaNex792tsMsSLS2WyiXHxPuKHdjR5zUh/vi2qJLc7amaUcHE8qJzpE
 0+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h7K10PVkFg7lIGvwJ0Hq+fi9pulMgiLjM/TrtSEBCu4=;
 b=q18uddP1BPGWbE1AnYwzMfE5UuAg0bMnTywjCMdjMsVAY8YxekXac0J6zTzFL27mOa
 5VgEwmUU7C+OHSyg4M2EjmvMMtCg16pqBUIsBJ9l7MEg7OrKbZZnZcRLfhjV3FfIQ/Il
 tpeJWA31+mP0lTOrInPW0T0/AIsHw3tTOImz/zIYHRZkh2LOt+tREX9/1xDGOs5M9dQG
 jLTtM1AS3Z3ec0rIHP+m4bklfnKcWq00029Tda1wriBxfv9R2uKJ4R3g8jKEa4uonYY7
 kcODFKP2FbAmFg3v5wlEf/HBWIvXbyiEl0yBDwve3rwyvWzXl8s06GEOwOSgLRjouRZK
 bZPQ==
X-Gm-Message-State: AOAM531a5CSOs1pwwcTeMtvTYULtW/dk+qLndifzKTv81UiBLLNxF+wR
 Rceru/lqoiWJ6cHqmUVP2ZUdJ5rkGfOWOg==
X-Google-Smtp-Source: ABdhPJx77Wvy5SKAFimIwidjpSk+vdlOVoyXj/vjoC3/DtnIOjs9eD91LBicJ0AJk182/7Kt9Jn2Aw==
X-Received: by 2002:a05:6870:7991:b0:d6:ce21:ebfe with SMTP id
 he17-20020a056870799100b000d6ce21ebfemr5067876oab.125.1646333691299; 
 Thu, 03 Mar 2022 10:54:51 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:50 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] target/riscv: Define simpler privileged spec version
 numbering
Date: Thu,  3 Mar 2022 10:54:35 -0800
Message-Id: <20220303185440.512391-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
References: <20220303185440.512391-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-riscv@nongnu.org, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the privileged specification version are defined in
a complex manner for no benefit.

Simplify it by changing it to a simple enum based on.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9ba05042ede0..cf748102efa2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,8 +82,11 @@ enum {
     RISCV_FEATURE_AIA
 };
 
-#define PRIV_VERSION_1_10_0 0x00011000
-#define PRIV_VERSION_1_11_0 0x00011100
+/* Privileged specification version */
+enum {
+    PRIV_VERSION_1_10_0 = 0,
+    PRIV_VERSION_1_11_0,
+};
 
 #define VEXT_VERSION_1_00_0 0x00010000
 
-- 
2.30.2


