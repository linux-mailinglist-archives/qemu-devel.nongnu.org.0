Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A951FBD9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:03:33 +0200 (CEST)
Received: from localhost ([::1]:50398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no26u-0001ch-3V
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22Q-00070k-Jt
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:54 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22O-0001Ga-Vc
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:58:54 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t6so19116578wra.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HECDO2g5fuR9qiRk+IIoBmUOKs2yPZa4jqvWajfBo7U=;
 b=n3/OLf9tX4IaEs7CFqVxQk2s5TKdjTzg34rTZOGapIeW+c7e+/mJWNHgp1beHWA/Yk
 CcQE/PAfXr6rJeMWjBtbHjfJuV8tAc/Vj9C14btrWUBy8OrDpuWbevXSxOxDGASrlI0c
 DtqE6HjVs2um+exqe6PFGNTTwwJQgCX8Qfj2h2YipiLd7VoE3rwAtk4+/fmoGbuOtUIA
 dpnLhhOtmuuyYc5oNZN/cW6lamUPtsSxQeKSGPh4Twr2oOsRBeodpjPxIsuNsMiYMdLp
 hhyuzbFC1zhLU6dIfVI2eqX6XPLfb436V7ZLyz9bGJgg/7iY8ooMXsUkZ6ORkuEDbgOD
 cYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HECDO2g5fuR9qiRk+IIoBmUOKs2yPZa4jqvWajfBo7U=;
 b=X4l4WladBHlp+qoeuZTY+Rk/AQ1ntp/Y8sBDAPfDfObgylTZtkEiA4M2qbkqmP/eDu
 YoZX0bjbS+Agn8fHjaH/yvCQhAQeiVd55B3KCQzCeKe4fNbk1mO4adHBZnSQOPyo7A8M
 CdOes5KOS9N0RuKxpsw+LTBNPYjxU3EQEdfSxkIOzZA8vNtnZrKzukQPSezW6qtM0qr5
 SeiYBJdvHZ+nLw+35/X97WvmsRef52nezFbDuJ4kfutj7CP8WKsnxHN0NWkM630NJmbs
 vEH4fkQE13AqrBNflRRY19F9zBKwKKI9Qi/UK651AhHECEBhhETCq4+xE3SBK3Zakwqf
 3V1A==
X-Gm-Message-State: AOAM531FOZwGXDWERX8f/3+QOuRr7uQfI2+GosVFIDl8xWd9JNTfHR7D
 YZR6kEwmAeWvDNZArRdmheKS8xirKpCjdg==
X-Google-Smtp-Source: ABdhPJxcbCkmsCd5H31gTdGSTcSYCCbxWLbOTWQHPbI12IC743RVVmtQc9fqUOWEsTzbu/7dlYJsxQ==
X-Received: by 2002:a05:6000:178d:b0:20c:b1fb:abe9 with SMTP id
 e13-20020a056000178d00b0020cb1fbabe9mr9440987wrg.452.1652097530837; 
 Mon, 09 May 2022 04:58:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/32] MAINTAINERS/.mailmap: update email for Leif Lindholm
Date: Mon,  9 May 2022 12:58:17 +0100
Message-Id: <20220509115848.3521805-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Leif Lindholm <quic_llindhol@quicinc.com>

NUVIA was acquired by Qualcomm in March 2021, but kept functioning on
separate infrastructure for a transitional period. We've now switched
over to contributing as Qualcomm Innovation Center (quicinc), so update
my email address to reflect this.

Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
Message-id: 20220505113740.75565-1-quic_llindhol@quicinc.com
Cc: Leif Lindholm <leif@nuviainc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[Fixed commit message typo]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 .mailmap    | 3 ++-
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 2976a675ea5..8c326709cfa 100644
--- a/.mailmap
+++ b/.mailmap
@@ -62,7 +62,8 @@ Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
 James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
-Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
+Leif Lindholm <quic_llindhol@quicinc.com> <leif.lindholm@linaro.org>
+Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>
 Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
 Paul Burton <paulburton@kernel.org> <paul.burton@mips.com>
 Paul Burton <paulburton@kernel.org> <paul.burton@imgtec.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 662ec472467..42f67e2b930 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -889,7 +889,7 @@ F: include/hw/ssi/imx_spi.h
 SBSA-REF
 M: Radoslaw Biernacki <rad@semihalf.com>
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Leif Lindholm <leif@nuviainc.com>
+R: Leif Lindholm <quic_llindhol@quicinc.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
-- 
2.25.1


