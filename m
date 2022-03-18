Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDAD4DDA9E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:35:53 +0100 (CET)
Received: from localhost ([::1]:49348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVClk-0000qo-5b
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:35:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZf-0006V8-8b
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:23 -0400
Received: from [2a00:1450:4864:20::42e] (port=45977
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZd-0002Bv-Kc
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:22 -0400
Received: by mail-wr1-x42e.google.com with SMTP id p9so11693951wra.12
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=w+JI1qq6cdVD2iag3w2GaYZANAYR6mX3L0DIG064z08=;
 b=oiGoivpKTOpWiJHmlPkw60nFenTkWLNaJs9k2w0TbN3jlzI8ZZDvDs22i26kQZyfMt
 lFo5GXCEHgl0SSoXz/SuJ8e6EEkPhia+x/+DUrgoVcEBwLDG2ug8N0fdTLk+S0o1uXTo
 jF+CgnRk3adk7vrHYed9D4H36/dP9QmE/OYHV/juTT8xaYVwrsVg/d3LMb4jrZ/7SXGe
 pzGAbiA8K5IZJwUiKBRACPENcgOjsN+16YngPlWy++kKgtfRdztBUJFxccPMRVNrv7m8
 m6jw/IlL27i6weu9vzVYKGpGb068n8ynJzHZekQZ4cZDJ9tfrwH5pCTsPg52HOfb/faB
 /zEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+JI1qq6cdVD2iag3w2GaYZANAYR6mX3L0DIG064z08=;
 b=ypB9QJkuEs3y7DK7KiPEjVpjEEEd0o6v4KT+yzFw+avzH13keGSmcEZNxy1uzayEM7
 /d+kXr4VbRwAtzj1048OV9SApeQCT1gkf57WiGdIaHkYsq9MbXNW1KwwMPOBMnZMzybT
 GhqTs6QEmZJgJFHJ3rw/7JLmg/+qbl+GhJSxPT33bCeuMJWG3JSxkqkhwc3/SjbfQCIl
 t55YF/92AQAJbCal3mnDSjTPHuR+jGGh6azyF7XxRRKGJZSM9vMTjtuP6gnwGKMI85lq
 PombOlJ1qo0tIMW70PAxxAeC6sWwgeF/KQZAzPGK7I8XLFpcI9i2Kbs/IMJQvEmY7ekj
 bBpQ==
X-Gm-Message-State: AOAM5329YdHEMBCn2HnpbA+ITzM7hPPJid/TXtE2nIUH9zwIU/n+ciMv
 KZq8TTPe48TZdfa+VOXS4WkTxT2t2uxq/A==
X-Google-Smtp-Source: ABdhPJyCfNDg1ie/vZpMLYviUl/XXD/skysdbspO1GcyznjRbvB+qmq5fCJJF7r/ovPJ84Mo87ombQ==
X-Received: by 2002:a05:6000:1847:b0:203:813a:509e with SMTP id
 c7-20020a056000184700b00203813a509emr7924405wri.329.1647609800298; 
 Fri, 18 Mar 2022 06:23:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GICV3_TCG is unset
Date: Fri, 18 Mar 2022 13:22:55 +0000
Message-Id: <20220318132306.3254960-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

From: Eric Auger <eric.auger@redhat.com>

In TCG mode, if gic-version=max we always select GICv3 even if
CONFIG_ARM_GICV3_TCG is unset. We shall rather select GICv2.
This also brings the benefit of fixing qos tests errors for tests
using gic-version=max with CONFIG_ARM_GICV3_TCG unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Message-id: 20220308182452.223473-3-eric.auger@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46a42502bc5..d2e5ecd234a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1852,7 +1852,12 @@ static void finalize_gic_version(VirtMachineState *vms)
         vms->gic_version = VIRT_GIC_VERSION_2;
         break;
     case VIRT_GIC_VERSION_MAX:
-        vms->gic_version = VIRT_GIC_VERSION_3;
+        if (module_object_class_by_name("arm-gicv3")) {
+            /* CONFIG_ARM_GICV3_TCG was set */
+            vms->gic_version = VIRT_GIC_VERSION_3;
+        } else {
+            vms->gic_version = VIRT_GIC_VERSION_2;
+        }
         break;
     case VIRT_GIC_VERSION_HOST:
         error_report("gic-version=host requires KVM");
-- 
2.25.1


