Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AC58FB9A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 13:48:57 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM6gH-0003VR-4O
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 07:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM6aw-0007gz-Vz
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 07:43:23 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM6av-0003BQ-BR
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 07:43:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 i128-20020a1c3b86000000b003a536d58f73so2561653wma.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 04:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=6yL8qt4Q2b/2Os/3Ap8GjGx1WK6fNgdpCqjVFOICsnY=;
 b=unz1bM7s5c7oyoHpAeUaxDvFu1Fen9z/wzj4xsm91fi3VQsUpBwu3z6LWVkmCkW37s
 y++vudYtetjQhF1MD5TEdr3lnLtvdCNCQsLScLN2qWr6sUltMBF01kyRAGre5SdJETHH
 NgpgqXlN4Z88/64XDRs8tsJGGZwrNaxew6QQo+VIzc3CnZfCpPEaGLlRu0Yuh6ydfCDB
 XeRzgWFRYmVH7InVqaKuGT3n1GmxSFzAPFdlMfb040hNL9GiUUbJOxHW4no5gHrMiDvY
 fYH9+DAWp27UUDFuUVSanS4pRdn+Y/EhjMsn7k1lbnBIArCLfLWXhjCVH+QBuG6HXb/P
 fw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=6yL8qt4Q2b/2Os/3Ap8GjGx1WK6fNgdpCqjVFOICsnY=;
 b=cPrwWJ0efry2ToCoFFQJxDu1NKRJPJ2Vrv3gs5eSptQISqpKmLV9NmK2IZuuBoCi4X
 9eqjabCUTXILrhw9XhUvDNVLMU9wDCOltTH6kPHEhSiuhz4uSJona7uJWbjBK/HYFKyW
 pWi+R83HnOi/k4Jo7S2c1Nupzh6z+18YHoB1USqPuGcbyforwzvTcQVYDghBQrGgj/Hi
 bs7YlH9LEHjrvfG6F0TWKPxU1LSR/ejOxq2+HuZVDxqgKcYy2Bv7LaxcLunnmBhx+1ko
 C4iMwu+5VFD9nhMY582fxMqaQO/0g3mqgpnlPVYpqxPtdibJA7Da1kAggVbi0AIcFbeW
 to0A==
X-Gm-Message-State: ACgBeo0P/VEbvRQNG/HFg599UgitMCcHV7VjuHhgrzvRZ5S57dE0Q0AF
 /BtuX0e/yTYjxYZ+euygTLuveQ==
X-Google-Smtp-Source: AA6agR7vKPjoFgrRBDU0F9CvUF4xy4kppOgakn/29ZSZthYAR5Qd5WLhWQI9Rtm2nMldV1di/8du9Q==
X-Received: by 2002:a7b:ce12:0:b0:3a5:4d8b:65df with SMTP id
 m18-20020a7bce12000000b003a54d8b65dfmr5453437wmc.27.1660218199362; 
 Thu, 11 Aug 2022 04:43:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c4eca00b003a3199c243bsm8955740wmq.0.2022.08.11.04.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 04:43:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D5EC01FFB7;
 Thu, 11 Aug 2022 12:43:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: apply a band aid to aspeed-evb login
Date: Thu, 11 Aug 2022 12:43:15 +0100
Message-Id: <20220811114315.3065951-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

This is really a limitation of the underlying console code which
doesn't allow us to detect the login: and following "#" prompts
because it reads input line wise. By adding a small delay we ensure
that the login prompt has appeared so we don't accidentally spaff the
shell commands to a confused getty in the guest.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>
Cc: John Snow <jsnow@redhat.com>
---
 tests/avocado/machine_aspeed.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index c54da0fd8f..65d38f4efa 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -101,7 +101,9 @@ def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
         self.wait_for_console_pattern('Starting kernel ...')
         self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
         self.wait_for_console_pattern('lease of 10.0.2.15')
+        # the line before login:
         self.wait_for_console_pattern('Aspeed EVB')
+        time.sleep(0.1)
         exec_command(self, 'root')
         time.sleep(0.1)
 
-- 
2.30.2


