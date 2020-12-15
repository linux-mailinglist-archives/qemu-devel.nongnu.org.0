Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCEA2DAC5B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:52:28 +0100 (CET)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8sV-000343-LA
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8ov-00077Y-DC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:46 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kp8or-00015d-S9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:48:44 -0500
Received: by mail-pg1-x529.google.com with SMTP id c12so14579737pgm.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 03:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6f6cB8+j9bmaE4tIz0+ycFzetfYNmLLuJuRVcmb/DV8=;
 b=K8wKjLBrSeF+saIJdgKRCoT0CbOJDobCxGLSlQ62qhDg5SYd3KKZz5nkY9EP5/23Ro
 /wSiWj5W/PiBAUBEDxpxb51aMCU9ofCFdQDzy32A7HipNVhQ5wyWIN5x4RIvmHInZmjM
 ZAj0Jr8KEpJGVLWkJnvDhbFqolNoHpf8GKR3/cdmMyEi4FePjHQEhzAICOh4Ua2lZR10
 D+V4fm6BQIpk7P9AMD6QpAtN1U0QqCwlZqHfkwLc47rf+gQukC1K08rzoaLpmXfS0rpL
 xmAMQqZP2sMnELaVZ9qHE60BZXMQ3XVpchVdp3zpx0NvFzAuZxXdqO+IlPLCyJZx3ZUO
 SVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6f6cB8+j9bmaE4tIz0+ycFzetfYNmLLuJuRVcmb/DV8=;
 b=ViXj+KyVfvWNQzIBmGg2FE3TASvpjkPPsnSGy3sWmD7HzEnenQZuOG+iUWQjgvJTmN
 1vcsbJYK/QpmZobURUrxvCqCC3GDFaTSHQWdbgPBViuPDW3K+LlkM7TEoxbYnKyJ3STP
 touPYKg6syDiplnt9crqTDmnXfbyBNAx/+kKwRH9GPSgUI5fucXs2Za3JEAzggsOSUIa
 VlxlcH5DFiGgbqLGPYoKjP6dhd9BJW7MybmuApGjvPj60Adchh5lV39alSTv41nyLgX2
 X1M/m+arMD9VEDTXtTCUTKXWKhMasePF4WEJxd7h9VIerhNyRDpbFaHrpgNv9rJiAmMX
 vj6g==
X-Gm-Message-State: AOAM533H0NfsI7fjVXYcZhame7+jYib5ivLk6IUKh3pmduCl8jtnvgUJ
 VTCetA3vyjldOiFcdgBafc0zmw==
X-Google-Smtp-Source: ABdhPJynU37MB86bP+5SmCz0mKb3w1MILOHVlxOt09EM9GPQYO+NkfofZBGY87GWUQlC+FDn25PTgQ==
X-Received: by 2002:a05:6a00:7c5:b029:19e:2965:7a6 with SMTP id
 n5-20020a056a0007c5b029019e296507a6mr28003636pfu.60.1608032920573; 
 Tue, 15 Dec 2020 03:48:40 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id z23sm23340001pfn.202.2020.12.15.03.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:48:40 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1,
 CTR_EL0 to cpu.h
Date: Tue, 15 Dec 2020 11:48:26 +0000
Message-Id: <20201215114828.18076-4-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215114828.18076-1-leif@nuviainc.com>
References: <20201215114828.18076-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=leif@nuviainc.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fadd1a47df..90ba707b64 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1736,6 +1736,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(CLIDR_EL1, CTYPE1, 0, 3)
+FIELD(CLIDR_EL1, CTYPE2, 3, 3)
+FIELD(CLIDR_EL1, CTYPE3, 6, 3)
+FIELD(CLIDR_EL1, CTYPE4, 9, 3)
+FIELD(CLIDR_EL1, CTYPE5, 12, 3)
+FIELD(CLIDR_EL1, CTYPE6, 15, 3)
+FIELD(CLIDR_EL1, CTYPE7, 18, 3)
+FIELD(CLIDR_EL1, LOUIS, 21, 3)
+FIELD(CLIDR_EL1, LOC, 24, 3)
+FIELD(CLIDR_EL1, LOUU, 27, 3)
+FIELD(CLIDR_EL1, ICB, 30, 3)
+
+FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
+FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
+
+FIELD(CTR_EL0,  IMINLINE, 0, 4)
+FIELD(CTR_EL0,  L1IP, 14, 2)
+FIELD(CTR_EL0,  DMINLINE, 16, 4)
+FIELD(CTR_EL0,  ERG, 20, 4)
+FIELD(CTR_EL0,  CWG, 24, 4)
+FIELD(CTR_EL0,  IDC, 28, 1)
+FIELD(CTR_EL0,  DIC, 29, 1)
+
 FIELD(MIDR_EL1, REVISION, 0, 4)
 FIELD(MIDR_EL1, PARTNUM, 4, 12)
 FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
-- 
2.20.1


