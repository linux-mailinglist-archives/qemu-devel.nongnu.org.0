Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39AB648734
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:04:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3gkl-00012b-SM; Fri, 09 Dec 2022 12:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gkA-0000qi-0v
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:01:09 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3gk8-00056t-Ak
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:01:01 -0500
Received: by mail-wr1-x429.google.com with SMTP id o5so5834612wrm.1
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JDrTynuhE3D242jgYLaA9iTdbHmcB3pb00lIlByxkno=;
 b=sthz8JM1FZ0DLAS6HZZ3a+qE7aOfOZ0I3dxXnXEY32r13yprH387/eIAbYOVN4tEBQ
 ACTaI0V1xpVvM3aMyIa/JX7sIjPukTbl+CpDq8T04bmCG1zeJMRBN1CaAR/Tn6MO18JB
 0aTVm/yM/gGtFu6vPSKCTgg1Sye9JfAHzSTu0cG9ifjsQTpfoJWEfSf1IgmjDZd1fjv8
 K0Y9h4Wo/ijpKv49hBCeKunq4UVUscUe0xaeQcM2BdSHWD8r6qC++0tseibudfscftyR
 Jr1092zPiUQhdxSVcysX2roddYXNsrrTR0mefwXaubZat8HV46sKa5x1qwiwZiuwGBX5
 F5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JDrTynuhE3D242jgYLaA9iTdbHmcB3pb00lIlByxkno=;
 b=w4gN4RhxTcbcW3r3LbALGXGI2qOdNVP5xnrTdjS1Y+RFgi14JkAWb+cM9+TeBjkXit
 pMbFUCTFifx9u9dAusoV75UpNaFwzLzCESY99/gGIYmXkM12cwqtjvyn5iZDd5RdiLuQ
 tLSfDzjud9s1AIIx5fTw/HxwSKisot48O6gyZsgbWzepKWZXZVIQ1h8A1lX6jMrocOAR
 RV4LEhck4JwbQdQf55rvBWiTL3+Mx79GXkuZqb5isAomZpRfxN76DW2B1lAnLxY76P4z
 aZRaAM7y3DPfqOznz6fIjldUNvP8PYMo2B/zD9hpcTgszJf/cOqkWc3DY1jlof1gVDhz
 x+Dw==
X-Gm-Message-State: ANoB5pm/QEZx0nDfzYPJSQkLPgyFG3gWq5zy1cE+JPJwKf882XdzrX6j
 HQl0uvoe9P8iE600Zd4y/CU6B/bgjMFEGkL12zY=
X-Google-Smtp-Source: AA0mqf4JOqP2iyEpnpapsZCrUByGS8WZL+c+7BirdkFrs3QPlX5tGB+lDDPfSYiPelMp24kMqZRhRw==
X-Received: by 2002:adf:dcc7:0:b0:242:4c5c:a696 with SMTP id
 x7-20020adfdcc7000000b002424c5ca696mr4547036wrm.33.1670605258737; 
 Fri, 09 Dec 2022 09:00:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bv28-20020a0560001f1c00b002423620d356sm1868089wrb.35.2022.12.09.09.00.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 09:00:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 3/3] hw/tpm: Move tpm_ppc.c out of target-specific
 source set
Date: Fri,  9 Dec 2022 18:00:42 +0100
Message-Id: <20221209170042.71169-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209170042.71169-1-philmd@linaro.org>
References: <20221209170042.71169-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The TPM Physical Presence Interface is not target specific.
Build this file once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/tpm/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
index 1c68d81d6a..3eacbe8c5d 100644
--- a/hw/tpm/meson.build
+++ b/hw/tpm/meson.build
@@ -3,6 +3,6 @@ softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
 softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
 
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
-specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
+softmmu_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
+softmmu_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
 specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))
-- 
2.38.1


