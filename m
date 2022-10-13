Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48725FDEDF
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:23:35 +0200 (CEST)
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj1vi-0005GL-VJ
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj1tg-0001Tl-Mf
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:21:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj1te-00069c-Vf
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:21:28 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bv10so3878691wrb.4
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3u6OQz/fmCLbEozpuffG9tqPYh3I2Cp7JHnUU5CusZM=;
 b=RQPGnDP2Ivwp545rfrbw7SQp3ehq1EISfDIPL5LsqLhXKvmyrDsJbP8J+kuKN8/bIK
 7N6Z+HZ1fwoKOKWVMrZPE2JWrokxU+wMyWf9U6GG3vVcqP64NSNkGzQO3okYWPgiVP7e
 SXVUYl2ceQh3W/r4ZfjuZAchE8cXvdFPsmMgjVLjTWrMozvOr4cvWTxIu51ABd9IXkAZ
 U3wbYMy4jGLt+ueQ8AbMhPkXXRhgtIRNM8ayScoppy5COPOiGe/JtTmWP3xy9jTmt89Z
 +tWAEdVY3D+qvWCUt+NloTLjWTe7hsUJB60wxbgmcMriL5zmNgjsWlHn5uFG8jSKqCB/
 vuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3u6OQz/fmCLbEozpuffG9tqPYh3I2Cp7JHnUU5CusZM=;
 b=WO8fl+v/o0szkDkfsY+t9UsG+CPwGW0/IH95WvNn5ezhMYoBhCIw4p00A1nAzSVs3m
 Fpv/Ft4VKXp07hAONz8YYSeDZis81P1PKJQAX0NSWCacBEllkym+Zw/N9qIGRmA73z6z
 Z/2EEzNJEJimvVJvEVfQd0CRlNlmkemu8GXQCIn7VmH6wen2HwsKDfHuDiGvRSY1E29P
 iUk2j+deuu5Nw38i+UqIjwqR5p9l5u4khVfrgGcrLYNV3cXfA37uDPC6WR4H2EMvVUEK
 LX1LXLYOCguIDYJhAtGEKiXK7YHKOt71O9KJDHBM2+hvpaNLCBx8Qpcc6ofKpgNx0f5a
 Wdyg==
X-Gm-Message-State: ACrzQf0FG5l75FEOBYteikzsFTgG4m4Nx6OfZU8P3CJR2xWt1sWOVvbR
 dNiF3yBUaUJ7Zb8YzgsDuc8ZfDzxYc1BpQ==
X-Google-Smtp-Source: AMsMyM4+9DARv+7I2Ve45AQXlCmpJHOLabFYqqsMvwW/ZwWFhtZ8ReRqJofuTWMGhJkf1LQolrQ7Ug==
X-Received: by 2002:a05:6000:15c6:b0:22e:5c0c:13d6 with SMTP id
 y6-20020a05600015c600b0022e5c0c13d6mr659578wry.485.1665681685280; 
 Thu, 13 Oct 2022 10:21:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i188-20020a1c3bc5000000b003a682354f63sm5028915wma.11.2022.10.13.10.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 10:21:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Subject: [PATCH] hw/s390x/s390-pci-inst.c: Use device_cold_reset() to reset
 PCI devices
Date: Thu, 13 Oct 2022 18:21:23 +0100
Message-Id: <20221013172123.1448288-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The semantic difference between the deprecated device_legacy_reset()
function and the newer device_cold_reset() function is that the new
function resets both the device itself and any qbuses it owns,
whereas the legacy function resets just the device itself and nothing
else.

In s390-pci-inst.c we use device_legacy_reset() to reset an
S390PCIBusDevice.  This device doesn't have any child qbuses, so the
functions do the same thing and we can stop using the deprecated one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB: tested only with 'make check' and 'make check-avocado', which
probably don't exercise this codepath.

 hw/s390x/s390-pci-inst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 20a9bcc7afb..16f5a3e81b4 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -272,7 +272,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
                 stw_p(&ressetpci->hdr.rsp, CLP_RC_SETPCIFN_FHOP);
                 goto out;
             }
-            device_legacy_reset(DEVICE(pbdev));
+            device_cold_reset(DEVICE(pbdev));
             pbdev->fh &= ~FH_MASK_ENABLE;
             pbdev->state = ZPCI_FS_DISABLED;
             stl_p(&ressetpci->fh, pbdev->fh);
-- 
2.25.1


