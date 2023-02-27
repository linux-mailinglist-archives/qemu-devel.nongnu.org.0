Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A16A445A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:28:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe5B-0002MD-Vk; Mon, 27 Feb 2023 09:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4C-0000eF-Oc
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:33 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4A-0007WH-Pv
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:24 -0500
Received: by mail-wr1-x436.google.com with SMTP id bx12so3174848wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WQzF5MTagtjkGDrk69RrslbmWiJlU48DYJ35+pc8mww=;
 b=EtWk3QH2phsRLcsm659fppzGznMqpUatI66BWLuJk2Hq/Yz4kj8aLTvzbltsunmTRx
 PMDkTXoksJVVtTFwQ/hVmIDTFUlx3/Wf62JohUYWjE9F8+xig0KpUrKjTva4PhLsDTG/
 seQdHyzizMOajhg8PjtuVf2LCbQ7KDVmBgTSK8QPgC1fme9nlAgM280tdqh9uQyqAoPV
 vlD2/U/wECBHBX3qih5KFv39GzrXUhCPIWyB1Vop8gAOQ5l89rimnyaMP6a7JX7SQfRQ
 nSeN2iRdi/0LtUXTG1I3Wz09xbxYu+n3r0TGLkgSOh/Ap0kuaBb3fB3lkJBeQFXCAapY
 Js9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQzF5MTagtjkGDrk69RrslbmWiJlU48DYJ35+pc8mww=;
 b=18qRa4YdKpaKZLaB2pacUJRwgngxiw3t0njR5npMalnWCS3G0/EyB4FNDWLEkX+v8q
 gBKwvzxNUllKYvBpcrHGyrPodtJ/3Nd/0qsY0OT7pyf7URm3mc1LWOiapiHx5WtpxCLr
 UE8M3ChDewchS9W8gMtvjZPav/4tQ20VZ1iOCbHhV+PKTKMQ2QCR7ACPJaYhPgvhW7w2
 1XNunh26aL4IRk2MVEcVQbjJ3aE7njsmbogho+ompKGEfsx/toejbxKCP+Vm0OSdyxhK
 W+rVTl2/fCMuHgohrdgeLK5RKM3ZgixXrF3DloGAoDVVJmtpSlvNoMm4JISfVg518yK8
 27FA==
X-Gm-Message-State: AO0yUKWZANrkcaau4Ud3y+okDGkAmN2uqooXgeNMDyNGIEpxNPv3Ejt5
 nkon53JYYlHVUA58AmMYaOIjPM2TFztAcevF
X-Google-Smtp-Source: AK7set+XUlu7HLC/VVAdfr1Rsvfm1VufgVzGF74HwZSZ3vkF6mt4OXuFFZjYw2Aa990UKiJu76iYPg==
X-Received: by 2002:a5d:5a97:0:b0:2c5:561f:fda with SMTP id
 bp23-20020a5d5a97000000b002c5561f0fdamr6738641wrb.5.1677506482124; 
 Mon, 27 Feb 2023 06:01:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/25] tests/avocado: add machine:none tag to version.py
Date: Mon, 27 Feb 2023 14:00:49 +0000
Message-Id: <20230227140102.3712344-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Fabiano Rosas <farosas@suse.de>

This test currently fails when run on a host for which the QEMU target
has no default machine set:

ERROR| Output: qemu-system-aarch64: No machine specified, and there is
no default

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/version.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/avocado/version.py b/tests/avocado/version.py
index ded7f039c1b..dd775955eb8 100644
--- a/tests/avocado/version.py
+++ b/tests/avocado/version.py
@@ -15,6 +15,7 @@
 class Version(QemuSystemTest):
     """
     :avocado: tags=quick
+    :avocado: tags=machine:none
     """
     def test_qmp_human_info_version(self):
         self.vm.add_args('-nodefaults')
-- 
2.34.1


