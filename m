Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512FA6A43B1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:06:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8e-0004hb-RA; Mon, 27 Feb 2023 09:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8M-0004cQ-Pg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:47 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8K-0008P7-QO
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:05:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id bw19so6314416wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IhuV0d5qQy+FV+jJNXdu8LUM/kunpfBbQzrkBv7Z+wQ=;
 b=uEVoVhUObMydO8btZ1rAGEIGHqnk4N1IfOIL0CGdfMowv8B7G7Q9RpBtdSJzln6Ldh
 e05SictgQvjbijM6NDQGpCKoUIr9YndMqnIF4gxBeyZMMKjFZZG8paZ4aNueyOhR5J3l
 yclxHNPlODVy8EPNWGYfUR3c0fZhMvAN/2TFHv0TJuxcMA/C07Nwy0NxsxmCLmOO7pxs
 tZ5VPFdPT6Xn14G2u3D8xLSOhtwiJ9SZOwgfh1DMjaoboT0qCSzg5FqfN1KcTvbswrsP
 mSmFwuSQmk48SIh+ha9rl3IEadzuimFayMnaR9mwE/wiGNCBntj3VusndlfFvHdLX5Zi
 kroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IhuV0d5qQy+FV+jJNXdu8LUM/kunpfBbQzrkBv7Z+wQ=;
 b=c90G7dOiAzWgUe7PxlmhObCgHQkrN9NdLoq1BzbCoNXbwrzcj1wfxJi0UusdD3yS30
 uN8ZYP7YBdQUSdFedLmug9ULd9B5FtMlitt3yuM1xtgXaBcKmcqzQdxIc7CkG99nov5N
 63NGnGNKjJp5LN9pXBVzFtNxvt8Wpp0VwIg95F1VecVePcrkNtr4xUPdpL32a8O6M/tt
 0HgOuJOV/SO00XNo+Jvq844oIEhPmvSLG8ethrf7cRVmaUap5ruSo/O3pIHc3+IcPq8M
 4xeDMvt7xsFx5egZRZePbjcmEGVWV91yZlExapYAvOuMyd+7NJl35nALTAH3OSWivoBB
 cv1w==
X-Gm-Message-State: AO0yUKW0U3esyzoT4pILCgczAF8oxzWL6bBeJTM4Wtp/q077xTP756tL
 iqZDBsiZ+ifVwJYafJyWRZXEozRJxGrHy3SB
X-Google-Smtp-Source: AK7set/lnVvE7cGrxky3RrlDPn4sqn/BolL6/hcbWXFFLHVhegAGSakgRMGxiix8+R1ePiCUuDh59g==
X-Received: by 2002:a5d:4d4b:0:b0:2bf:d0a4:3e63 with SMTP id
 a11-20020a5d4d4b000000b002bfd0a43e63mr21043169wru.44.1677506738333; 
 Mon, 27 Feb 2023 06:05:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5947000000b002c5a07e940csm7229548wri.33.2023.02.27.06.05.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:05:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 047/126] hw/isa/lpc_ich9: Remove redundant ich9_lpc_reset()
 invocation
Date: Mon, 27 Feb 2023 15:00:54 +0100
Message-Id: <20230227140213.35084-38-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

ich9_lpc_reset() is the dc->reset callback which is called
automatically. No need to call it explicitly during k->realize.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-9-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/lpc_ich9.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index c5060d145f..2a4baac129 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -57,8 +57,6 @@
 /*****************************************************************************/
 /* ICH9 LPC PCI to ISA bridge */
 
-static void ich9_lpc_reset(DeviceState *qdev);
-
 /* chipset configuration register
  * to access chipset configuration registers, pci_[sg]et_{byte, word, long}
  * are used.
@@ -439,8 +437,6 @@ static void ich9_lpc_pm_init(ICH9LPCState *lpc)
                                  sizeof lpc->smi_features_ok,
                                  true);
     }
-
-    ich9_lpc_reset(DEVICE(lpc));
 }
 
 /* APM */
-- 
2.38.1


