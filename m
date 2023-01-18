Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBFD67158E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:55:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fc-0001wF-1n; Wed, 18 Jan 2023 02:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FX-0001rn-I0; Wed, 18 Jan 2023 02:52:47 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FV-00022g-Kd; Wed, 18 Jan 2023 02:52:47 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N2m3G-1ob3W73gM8-0139ff; Wed, 18
 Jan 2023 08:52:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 05/15] hw/arm: Move various units to softmmu_ss[]
Date: Wed, 18 Jan 2023 08:52:24 +0100
Message-Id: <20230118075234.2322131-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/OQIQb7uRJgxHX13qherXBPcc5p2JRq2AEBDdJrVm27XhjKrLPq
 E/wqxm2c5ZnQpXaH8vBwnrVO+5cyuymwxgNoaBZ78MQDSXIMnFD4jn1rJpZkWyeMaK/gpru
 t2RNkiy7e7jjWsa2vUoEYSav+GhdtWaPqUuKpctCrt771eXJ5LyJNRjMXT9Zl7OpStGXJ+R
 h4RuayQMkBBvYGQ3o/Dmg==
UI-OutboundReport: notjunk:1;M01:P0:av8+fDtjqxQ=;eHirFiRHPDcEGtj7yt1jxZq8NdO
 NllPNG4WWSpAkpywBPcwsov5G1PO7oxyARtWMXZreNdaFjNnvM23ijKfKJOE0lUId0Xrj44dk
 zht/Ja6g6MFgRfeBrw79B+GjFbHCN8ea6oI1jgZr6BjSSko47lpFjNcDBGjM/kn2GW0OsvOb6
 zm/CU1xloNt82D2iRUHTI/MncniiV8YOgEfaWWY/HCDzq9w/SOfIDN5BR9DvYmAn2fFiZ6SXq
 VvfC8Nr3/4C6s5237hdL3pyHWvxKU5mSxmpG0x71w0oNpJllpKjkjG1as/3+Qe0N5qeexOJcM
 pzVrhuJa9RD5TZdLrx1CCLzWOYTo8mBqJAElG7e0duS37D/EKECJkpwKE4SHq6EEIsbm2MSx9
 5aOqD3mywZlm6r1P4L1adRXbbuYei9RR8mL2GSUSqKx3mZcNxsSTKzxBT2ocV3of1mgTbF9xd
 93uFYiFZau7sMW3K0biBqoQ3UDSAhHhZ/IYp1bxG+/sjVcqPMwv0YmgbG+KzU6/7Pokh0W3b6
 Jqb4mUUF16QL0nDHUTsCuTyMEvsVRCoVGyRHDjvPobkgJnOO67VG+Wko3SyGCkdFSsp1YAu8u
 Kaf6rNJ5IzK6+LClQvgSpcuKrj63RaizOqldipTl0OBw8d3vOyQvV8B1Rzc7q4GHPt3mCOu+Y
 xG3obfWlRHDWTH/8QesGDE0/8KjqntW1rjJQIare2A==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

arm_ss[] units are built twice: once for 32-bit word size and
once for 64-bit. The following units don't require any word
size knowledge and can be moved to softmmu_ss[] (where they
are built once):

 - smmu-common.c
 - exynos4_boards.c
 - bcm2835_peripherals.c
 - tosa.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230110164406.94366-2-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112134928.1026006-5-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/arm/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 76d4d650e42e..b03604560392 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -3,7 +3,6 @@ arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
@@ -19,7 +18,6 @@ arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 arm_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 arm_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
-arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
 arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
@@ -39,7 +37,7 @@ arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
 arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
-arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
 arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
@@ -60,8 +58,13 @@ arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
 arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
 arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
-arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 'smmuv3.c'))
+arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 
+softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+softmmu_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
+
 hw_arch += {'arm': arm_ss}
-- 
2.38.1


