Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFA3310CA6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:47:00 +0100 (CET)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82Nv-0004Sw-Vt
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82L5-0002Tb-BQ; Fri, 05 Feb 2021 09:44:03 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82L3-0002IJ-Q9; Fri, 05 Feb 2021 09:44:03 -0500
Received: by mail-ej1-x629.google.com with SMTP id w2so12228234ejk.13;
 Fri, 05 Feb 2021 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5evm7ZSskwEzcmWuSglI+6mAOCvHUIp+CaSdo/EhioA=;
 b=knA0/DNEN+J6r5N0LMxv/4w0HzFCCbw/cP0NtYeKLDwZxuCNQtfk9ug4cZAJvgBycC
 qr4E8XMPAtAYioZA6UvPPHGCTJJi+ZKY7iHQqycdUC6nbgpFtjHA+YXkNKdbAzbmK8BD
 5eDgGkdw/7hg/6iDftkL3KaRMmHrZOdP0VEuJ5Jjlae6fmSsOI2XeWaSNdJiH440oc/h
 9f6jeP/RRO2XuCdfpHhIh7G6YdVr3OnfQgOA2YqDc3AaOT+UDGfXULePeDVFmrkFRhI6
 lxAehMWzw4GA3zjaAacZzz4JMSY4ExiP3LQmHWz8DsBxmB6Ff/MpnP2qOPCvH2nRGX0m
 UmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5evm7ZSskwEzcmWuSglI+6mAOCvHUIp+CaSdo/EhioA=;
 b=cbAB7lcrCExZ9alxeBf6GF0eufg8ViXUTFKjLFARXKKkav7wqvTzjTF1ys/X89Wff6
 3PmHhIJcf6AfpOcBvghslZ1rZtZx2RzvxjwJmZgnEG6Y6ZJh1IKrYQIM4LoI/tB8xrnU
 z7OkJoENUL41pm9Ht9JgwpEQ/ID/czMiN5fXG2uQxrbhumrlQ0P1vISCP/4mLdIfiTE7
 1yBqhhG7MxBEI8H0HPzvh1hlsH2ri/MMXdaA/ZXUzgg802H35mBIUup2JM6hf0Bm9rc3
 pmBjzJg/ptxzqTmq65RAmJqXTjMZB3OyzyiQld9G3yba5li7xFLCYC97wY6Gqv7og6Qj
 ZY/g==
X-Gm-Message-State: AOAM532GvXvIQTcvRP1rnzxdI2FyuB/Ok3WNTyvmvqIcIQqiNBJpsJTd
 bJ7FxFav553sWAIpYLRc/oQ3u71VhR8=
X-Google-Smtp-Source: ABdhPJyZ+1oifxJWzXIBLvDe3Eqlb4kZypcVFevwEUY5rXxJD4fEtVvJfiQpIKfJpLBJnh+O4BfV+A==
X-Received: by 2002:a17:906:a082:: with SMTP id
 q2mr4286120ejy.483.1612536239401; 
 Fri, 05 Feb 2021 06:43:59 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a25sm936260edt.16.2021.02.05.06.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:43:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] tests/qtest: Restrict xlnx-can-test to TCG builds
Date: Fri,  5 Feb 2021 15:43:38 +0100
Message-Id: <20210205144345.2068758-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Xilinx CAN controller test is uses the ZCU102 board which is
based on a ZynqMP SoC. In the default configuration - used by this
test - this SoC creates 2 Cortex R5F cores. Such cores are not
v8A archicture, thus can not be run under KVM. Therefore restrict
this test to TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c83bc211b6a..d8ebd5bf98e 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -159,10 +159,10 @@
   (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
+  (config_all.has_key('CONFIG_TCG') ? ['xlnx-can-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-   'xlnx-can-test',
    'migration-test']
 
 qtests_s390x = \
-- 
2.26.2


