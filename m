Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188DE572CDB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 07:02:17 +0200 (CEST)
Received: from localhost ([::1]:48990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBUVr-0003Xe-Mj
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 01:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSg-0000wQ-Qx
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 00:58:59 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBUSf-0006qV-DO
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 00:58:58 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso1703922pjk.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 21:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHtaGb+0bceVj4ZA4UdjMCU/5EVY5lNfh75m/ENra58=;
 b=Q6D6H/i4M8lN458NExEdCt5K7DQ/Br+xfz0c4/U0ifLNSLF++9Hf0x24wQMycXy4+u
 4GwPWXsBSmAMH65ZN9WHCgTiLdv0mqwvdAI3Y8YnKy944/J5a2y8iZXd0BPYh+P+jZLz
 jWd6+Tt47GHZ33Nj+tVWVvWugrHWbQ3242BFlY+1OYyaGHF7lF0qDGWTnHoBtxfiMHXR
 Eg/mNwLo/mnxs0ntFXA8dgURlZTZP9ZIhB417spWDKvmm75kVYXG6Pcaa2dDIBR5mqIa
 4r91iO5APVUZhbHX1jSK9w8oCD/5PY/V8iLjzZtzpQ1y5zy2n8WL/AuwpKmJaUJhK59i
 qUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHtaGb+0bceVj4ZA4UdjMCU/5EVY5lNfh75m/ENra58=;
 b=nnsqKJ9zrzXT0lfaLucID8L+/aX9MiCCcvnHRee62Pv6S3HXrk2k2RraHhhhaeo5NU
 vC6mohg83qqgBL76S9Jz12rljS1UQK4n1PspNEQGZa/gHIeUTccrTBt9ntGss7pHfWaU
 pMLXlPB0/3vL46gl0ZyFM/c3haQ6Jit/i1bdU0bilwdeUUm+8Bq/0J34vlMF1cHgH5p2
 ocX0GB1ZNM4XUVTqQstokmZ65Fvf3omyulLCfoM7u/fGjL0PGX5UhxfyC5Zf0UbXCjAt
 qfQJyCBOjkrc+KuPFwN/kgL8AZ8HIH2O3h/RMYExTuWO12UUFJYLaueBxihRzeqcLQ6N
 Lguw==
X-Gm-Message-State: AJIora8b/oCQS/kAizuFO9a/T8vo0iPGwkeDK2YJn2HtDzfh2cQVvybX
 yIMVO4QLrLaChkbsGX+2nLFS1alykBrODT4W
X-Google-Smtp-Source: AGRyM1tYU4YotpnecuJ1D6v5XYVuAaKmpcsLhvjxZmo5lqnNwFPcsmcfSm5fFB/HuQm3m9yUfGZgMw==
X-Received: by 2002:a17:90b:1bc8:b0:1f0:5854:f761 with SMTP id
 oa8-20020a17090b1bc800b001f05854f761mr1860660pjb.116.1657688335409; 
 Tue, 12 Jul 2022 21:58:55 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 d194-20020a621dcb000000b00525302fe9c4sm7677047pfd.190.2022.07.12.21.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 21:58:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: broonie@kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Two SME fixes
Date: Wed, 13 Jul 2022 10:28:46 +0530
Message-Id: <20220713045848.217364-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ho hum.  Let a feature loose on users and they find bugs.  Mark noticed
that the wrong value was being picked up for VL when SVE is disabled.
I had run the same test but failed to notice the vector length wasn't
as expected, though the test otherwise produced expected results.


r~


Richard Henderson (2):
  target/arm: Fill in VL for tbflags when SME enabled and SVE disabled
  target/arm: Fix aarch64_sve_change_el for SME

 target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

-- 
2.34.1


