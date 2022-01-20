Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D555449540A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:18:11 +0100 (CET)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAc0g-0001T4-Jo
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:18:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgM-0004A2-Eg
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:50 -0500
Received: from [2a00:1450:4864:20::333] (port=42948
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgI-00039f-TZ
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:49 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso10083130wmf.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Oso7/2buPYykc7UJ4gn65BTPj25X4xqzim5YNeB47XA=;
 b=jjr0Zxp1+oLNhJjiCwad+tjahP384vQD9mfGVwwtWu3QCyAdU9W2TmG+7chupz/g7h
 aGT+K0MHmCuCX9f564f4onAu0C+HaDjiiH1LiF5mrNQyS0Ahj3zNfJPHm8/3k5a8hwbl
 Zfuv+7aBgpprWeesRVGl/NeyP9c2b4Zz0K40JN+TfGMuIRg2u/CNpQcT682aq6kv35XM
 FPQkTPd1nd1pfGi+/R18aPoqNlu1+2JiLvS/sEzvlFuEMeRL3FtNTzBwAV8jbg9vw8QJ
 24cej7PwQ90dMalHI5iYA+1/3p21LsEEXut8moeKs+97H1DlDoVHw+5ihJjaxARLWfZh
 tFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oso7/2buPYykc7UJ4gn65BTPj25X4xqzim5YNeB47XA=;
 b=EAgkBFu/D1gOVDMaGBBcw47j6/RUVqnS8DdFKYLOeqVRGUtfqRISqsQPk6V2H9yHOg
 BMvcal0qyiT7Nfr7W0wlK7sh3YfP4zTFQ91+wqAAMZhqj5zdQbyeun0tekhm4FT3RLGF
 a07eQcbiUNaAz1VSEMZWnOSOCN7fyDW1K0sJI2VWg1TjtFdNMwofrTAnJqqtmRlTUzwA
 razUJ5iXArOaW1K9cDCKoOt9WZL8wj/d9pWzE1RPpQttGpM543FxAYajhFGPr+QHt+V8
 +1V+ovIjdsWkIqg7K60dJRSJylRJkKgTSPvfPBX0ypGCEASm5PLwYqlvn47ClF+LlexX
 SxNw==
X-Gm-Message-State: AOAM533XLd/OI0cjtjInvLtqC/VSLbKbci4yZqdfubEz/I+hddjv/2Ox
 BfCLNcPaj78SuE26fsDcpVkGiq8Q75b6bQ==
X-Google-Smtp-Source: ABdhPJx/dhp6X4y0rR61TeVbMm2LZqMP/iXyCUqQtd+r+8kaIzjIvAqN36EAjoBcnFlgePQVhN0Z3g==
X-Received: by 2002:a05:600c:4f85:: with SMTP id
 n5mr8587869wmq.43.1642682204155; 
 Thu, 20 Jan 2022 04:36:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/38] hw/intc/arm_gic: Implement read of GICC_IIDR
Date: Thu, 20 Jan 2022 12:36:06 +0000
Message-Id: <20220120123630.267975-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Petr Pavlu <petr.pavlu@suse.com>

Implement support for reading GICC_IIDR. This register is used by the
Linux kernel to recognize that GICv2 with GICC_APRn is present.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
Message-id: 20220113151916.17978-2-ppavlu@suse.cz
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a994b1f0245..0cd9ceca8d1 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1662,6 +1662,15 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         }
         break;
     }
+    case 0xfc:
+        if (s->revision == REV_11MPCORE) {
+            /* Reserved on 11MPCore */
+            *data = 0;
+        } else {
+            /* GICv1 or v2; Arm implementation */
+            *data = (s->revision << 16) | 0x43b;
+        }
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_read: Bad offset %x\n", (int)offset);
-- 
2.25.1


