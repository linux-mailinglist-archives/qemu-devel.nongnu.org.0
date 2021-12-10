Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC3F46FC50
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:08:02 +0100 (CET)
Received: from localhost ([::1]:44302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvawj-0005JQ-LB
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:08:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaml-0003ga-1M
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:43 -0500
Received: from [2607:f8b0:4864:20::433] (port=34648
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvamj-0006EX-Cd
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:57:42 -0500
Received: by mail-pf1-x433.google.com with SMTP id r130so7805208pfc.1
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=diu+b8Fx5MRcfuwh61M+1YLyx5mhOpAPn3HlKZcEPh4=;
 b=UFkIMU3ucDeAf1n3sq/F8gPANnfFYUB7clnqvjap7Lft7PFxzGQajKJI6Gsd6pKgEN
 PDkVT7XIseo5VkPDk/IqtNOY9qLFMG8BqOzfhSZZAb7tYyThnWNAkdUXVPVG+U0wfhDq
 NpIC5iCQdFDEplI++aCGn9Msp0ObSaa6A7Ee3lyo5YxPsnb7EMPETUKlbw2lF4BJ5EdY
 1yNXXcDEotSeUIRUdg2ztAclq1BhlhYQioSd2JU9aPyeLJxd6PFhBeqQXMml+m4meOWD
 lc3HHSttmv0cubgAgNBb+H/u/pEBPY9RQQfgZGlstIHWkYH+akQ+UB7Y9jWGKdUrE4Ha
 avRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=diu+b8Fx5MRcfuwh61M+1YLyx5mhOpAPn3HlKZcEPh4=;
 b=6I5Nyxp+PV2oA/A+DWJbYoSaB7F+6ZvTEX7NuheLlt2vi34ZeJTXzDWJgC/9QIuItj
 R6TYLYY/tpwPAkj7hXggQs2xQbQLmkwk/QOQpDD1WFhuxNHCEDYT0I1laDVxPhbAz59z
 r+7Z90dpDnKHB94nKYzzCvSPXOcgzHf3SA5886viwjLK6vMFg8vRSgkptakXGX9BeDPL
 wh6WeExRod9Jq8ia90aKTzL/TJPAxfFWQkx998BYcpVLUaCsjwTlYpZMhugOel/BS9i8
 961KtZDRKP7cP57Bxd8ygGRBF9Cs5E2lc2qD5RLyM4cbN7k/d725HThTSpyDQKzFb5zj
 uqFw==
X-Gm-Message-State: AOAM531hYAF1SeMRV95cm7T1b8SQUJZSB9Je/Uupazqqt1AoOaHPwZRD
 TSfzwmeeS1eOtcdsdXzXUvYj5cJniKWrINJo
X-Google-Smtp-Source: ABdhPJyjsqvt5uPwila/ZdqUvAQAUTJ3x5cPMQ8IoaxcsH6azwT1LFWOmE7b0U7LcQq/BUXxcpl89Q==
X-Received: by 2002:a65:5c47:: with SMTP id v7mr38305827pgr.64.1639123060088; 
 Thu, 09 Dec 2021 23:57:40 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:57:39 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 06/77] target/riscv: rvv-1.0: introduce writable misa.v
 field
Date: Fri, 10 Dec 2021 15:55:52 +0800
Message-Id: <20211210075704.23951-7-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Implementations may have a writable misa.v field. Analogous to the way
in which the floating-point unit is handled, the mstatus.vs field may
exist even if misa.v is clear.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 83f4dbd824..bc149add6c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -643,7 +643,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
     val &= env->misa_ext_mask;
 
     /* Mask extensions that are not supported by QEMU */
-    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
+    val &= (RVI | RVE | RVM | RVA | RVF | RVD | RVC | RVS | RVU | RVV);
 
     /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
     if ((val & RVD) && !(val & RVF)) {
-- 
2.31.1


