Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D788168AF3C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:07:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuE-0001go-Ai; Sun, 05 Feb 2023 05:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtp-00017j-Sb; Sun, 05 Feb 2023 05:05:36 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtm-0005JZ-9R; Sun, 05 Feb 2023 05:05:28 -0500
Received: by mail-oi1-x22e.google.com with SMTP id 20so6837503oix.5;
 Sun, 05 Feb 2023 02:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1R9zr0q+uRKbES0pn4fKFWQfEEy/QYGMZ5oIYwsvzk=;
 b=pFUEKO34HpwBHOWBA4+lDlOAJDNWQuYtHtnpA5aVsh8ulc9Ombamxwdp67z7CD1hsO
 WKmYZ3GKV0oycXgwy74xgrsqOqUJLKYEpUaANYwkxp4Cr8pCAIi4m1BtJf/mcNy1lmQV
 CMIlqOyHU4lMDr8K0admwNL1kLDjMqeAc4UYPhMvKE+Fj0+ZhI9VyKXkJlAILarAsQdu
 E1QFjAOAdDlHmb+pOYW0jypoRB8PRdrrKUUZMhierUh4WyVVc7Gq2inPptK2mcX33U+Z
 +w61ayh++DH6soU+84d4MD0u5p3BHDeL0lWzQjRfmSIeRhJgshAfD0i6U6XE5BGV2Z7j
 6JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1R9zr0q+uRKbES0pn4fKFWQfEEy/QYGMZ5oIYwsvzk=;
 b=M5t2V5oCXO+/ttKrpfam+B/zRJobcixKFFs7MBILNN13VkdLvj/I9ZAa1OK0A+WHpv
 EO0wDbHiPABcTyphKCI2fX4+S3wPN9Fp/eESE6wIEoYCkvsCtjQCfYoBIjMIVMz+fVnI
 YOp4f5lWFUYpF1wWT6B3SxBI/s6KPWwTVxZevxPTjPTfhvMtPRDxi8lywqN2CH2x+ZCS
 YWbdtP7gNLLhsG1VO7sYS7XNpIeK3/e3tEqcwjVknut49Zf3+S6F5IkdHVkdmk5MwRnk
 YmAYciBYcguipohRVg+1ZdpJtb02ASHuGI3ywhxK7dMx9DKKgdwg4DiaHylEM0lcAZQg
 MdKw==
X-Gm-Message-State: AO0yUKVndOIMOL1cy68+GHYEgsJbxBCNurSXCFeAAjzNanO86xKU9nDV
 CqSxLD/M9QlJcbDBaSAosERA2Y90Bjg=
X-Google-Smtp-Source: AK7set8/30tagWF8SS8v2Kl/skWyLLpQsvYWsqwuJiX4Ux4PzL/EAz8t8krbkg46x0EWR6+jXJjrtw==
X-Received: by 2002:aca:916:0:b0:36d:e19d:158 with SMTP id
 22-20020aca0916000000b0036de19d0158mr6732262oij.59.1675591524533; 
 Sun, 05 Feb 2023 02:05:24 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:24 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/16] hw/display/sm501: Remove parenthesis around constant
 macro definitions
Date: Sun,  5 Feb 2023 07:04:47 -0300
Message-Id: <20230205100449.2352781-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

No need to wrap constants in parenthesis.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <9194546b73b05e7098761ec62b2dfd0699b97b65.1674333199.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/display/sm501.c | 394 ++++++++++++++++++++++-----------------------
 1 file changed, 197 insertions(+), 197 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 52e42585af..0cbd1fecd5 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -50,10 +50,10 @@
 
 /* System Configuration area */
 /* System config base */
-#define SM501_SYS_CONFIG                (0x000000)
+#define SM501_SYS_CONFIG                0x000000
 
 /* config 1 */
-#define SM501_SYSTEM_CONTROL            (0x000000)
+#define SM501_SYSTEM_CONTROL            0x000000
 
 #define SM501_SYSCTRL_PANEL_TRISTATE    (1 << 0)
 #define SM501_SYSCTRL_MEM_TRISTATE      (1 << 1)
@@ -72,13 +72,13 @@
 
 /* miscellaneous control */
 
-#define SM501_MISC_CONTROL              (0x000004)
+#define SM501_MISC_CONTROL              0x000004
 
-#define SM501_MISC_BUS_SH               (0x0)
-#define SM501_MISC_BUS_PCI              (0x1)
-#define SM501_MISC_BUS_XSCALE           (0x2)
-#define SM501_MISC_BUS_NEC              (0x6)
-#define SM501_MISC_BUS_MASK             (0x7)
+#define SM501_MISC_BUS_SH               0x0
+#define SM501_MISC_BUS_PCI              0x1
+#define SM501_MISC_BUS_XSCALE           0x2
+#define SM501_MISC_BUS_NEC              0x6
+#define SM501_MISC_BUS_MASK             0x7
 
 #define SM501_MISC_VR_62MB              (1 << 3)
 #define SM501_MISC_CDR_RESET            (1 << 7)
@@ -103,22 +103,22 @@
 
 
 
-#define SM501_GPIO31_0_CONTROL          (0x000008)
-#define SM501_GPIO63_32_CONTROL         (0x00000C)
-#define SM501_DRAM_CONTROL              (0x000010)
+#define SM501_GPIO31_0_CONTROL          0x000008
+#define SM501_GPIO63_32_CONTROL         0x00000C
+#define SM501_DRAM_CONTROL              0x000010
 
 /* command list */
-#define SM501_ARBTRTN_CONTROL           (0x000014)
+#define SM501_ARBTRTN_CONTROL           0x000014
 
 /* command list */
-#define SM501_COMMAND_LIST_STATUS       (0x000024)
+#define SM501_COMMAND_LIST_STATUS       0x000024
 
 /* interrupt debug */
-#define SM501_RAW_IRQ_STATUS            (0x000028)
-#define SM501_RAW_IRQ_CLEAR             (0x000028)
-#define SM501_IRQ_STATUS                (0x00002C)
-#define SM501_IRQ_MASK                  (0x000030)
-#define SM501_DEBUG_CONTROL             (0x000034)
+#define SM501_RAW_IRQ_STATUS            0x000028
+#define SM501_RAW_IRQ_CLEAR             0x000028
+#define SM501_IRQ_STATUS                0x00002C
+#define SM501_IRQ_MASK                  0x000030
+#define SM501_DEBUG_CONTROL             0x000034
 
 /* power management */
 #define SM501_POWERMODE_P2X_SRC         (1 << 29)
@@ -126,74 +126,74 @@
 #define SM501_POWERMODE_M_SRC           (1 << 12)
 #define SM501_POWERMODE_M1_SRC          (1 << 4)
 
-#define SM501_CURRENT_GATE              (0x000038)
-#define SM501_CURRENT_CLOCK             (0x00003C)
-#define SM501_POWER_MODE_0_GATE         (0x000040)
-#define SM501_POWER_MODE_0_CLOCK        (0x000044)
-#define SM501_POWER_MODE_1_GATE         (0x000048)
-#define SM501_POWER_MODE_1_CLOCK        (0x00004C)
-#define SM501_SLEEP_MODE_GATE           (0x000050)
-#define SM501_POWER_MODE_CONTROL        (0x000054)
+#define SM501_CURRENT_GATE              0x000038
+#define SM501_CURRENT_CLOCK             0x00003C
+#define SM501_POWER_MODE_0_GATE         0x000040
+#define SM501_POWER_MODE_0_CLOCK        0x000044
+#define SM501_POWER_MODE_1_GATE         0x000048
+#define SM501_POWER_MODE_1_CLOCK        0x00004C
+#define SM501_SLEEP_MODE_GATE           0x000050
+#define SM501_POWER_MODE_CONTROL        0x000054
 
 /* power gates for units within the 501 */
-#define SM501_GATE_HOST                 (0)
-#define SM501_GATE_MEMORY               (1)
-#define SM501_GATE_DISPLAY              (2)
-#define SM501_GATE_2D_ENGINE            (3)
-#define SM501_GATE_CSC                  (4)
-#define SM501_GATE_ZVPORT               (5)
-#define SM501_GATE_GPIO                 (6)
-#define SM501_GATE_UART0                (7)
-#define SM501_GATE_UART1                (8)
-#define SM501_GATE_SSP                  (10)
-#define SM501_GATE_USB_HOST             (11)
-#define SM501_GATE_USB_GADGET           (12)
-#define SM501_GATE_UCONTROLLER          (17)
-#define SM501_GATE_AC97                 (18)
+#define SM501_GATE_HOST                 0
+#define SM501_GATE_MEMORY               1
+#define SM501_GATE_DISPLAY              2
+#define SM501_GATE_2D_ENGINE            3
+#define SM501_GATE_CSC                  4
+#define SM501_GATE_ZVPORT               5
+#define SM501_GATE_GPIO                 6
+#define SM501_GATE_UART0                7
+#define SM501_GATE_UART1                8
+#define SM501_GATE_SSP                  10
+#define SM501_GATE_USB_HOST             11
+#define SM501_GATE_USB_GADGET           12
+#define SM501_GATE_UCONTROLLER          17
+#define SM501_GATE_AC97                 18
 
 /* panel clock */
-#define SM501_CLOCK_P2XCLK              (24)
+#define SM501_CLOCK_P2XCLK              24
 /* crt clock */
-#define SM501_CLOCK_V2XCLK              (16)
+#define SM501_CLOCK_V2XCLK              16
 /* main clock */
-#define SM501_CLOCK_MCLK                (8)
+#define SM501_CLOCK_MCLK                8
 /* SDRAM controller clock */
-#define SM501_CLOCK_M1XCLK              (0)
+#define SM501_CLOCK_M1XCLK              0
 
 /* config 2 */
-#define SM501_PCI_MASTER_BASE           (0x000058)
-#define SM501_ENDIAN_CONTROL            (0x00005C)
-#define SM501_DEVICEID                  (0x000060)
+#define SM501_PCI_MASTER_BASE           0x000058
+#define SM501_ENDIAN_CONTROL            0x00005C
+#define SM501_DEVICEID                  0x000060
 /* 0x050100A0 */
 
-#define SM501_DEVICEID_SM501            (0x05010000)
-#define SM501_DEVICEID_IDMASK           (0xffff0000)
-#define SM501_DEVICEID_REVMASK          (0x000000ff)
+#define SM501_DEVICEID_SM501            0x05010000
+#define SM501_DEVICEID_IDMASK           0xffff0000
+#define SM501_DEVICEID_REVMASK          0x000000ff
 
-#define SM501_PLLCLOCK_COUNT            (0x000064)
-#define SM501_MISC_TIMING               (0x000068)
-#define SM501_CURRENT_SDRAM_CLOCK       (0x00006C)
+#define SM501_PLLCLOCK_COUNT            0x000064
+#define SM501_MISC_TIMING               0x000068
+#define SM501_CURRENT_SDRAM_CLOCK       0x00006C
 
-#define SM501_PROGRAMMABLE_PLL_CONTROL  (0x000074)
+#define SM501_PROGRAMMABLE_PLL_CONTROL  0x000074
 
 /* GPIO base */
-#define SM501_GPIO                      (0x010000)
-#define SM501_GPIO_DATA_LOW             (0x00)
-#define SM501_GPIO_DATA_HIGH            (0x04)
-#define SM501_GPIO_DDR_LOW              (0x08)
-#define SM501_GPIO_DDR_HIGH             (0x0C)
-#define SM501_GPIO_IRQ_SETUP            (0x10)
-#define SM501_GPIO_IRQ_STATUS           (0x14)
-#define SM501_GPIO_IRQ_RESET            (0x14)
+#define SM501_GPIO                      0x010000
+#define SM501_GPIO_DATA_LOW             0x00
+#define SM501_GPIO_DATA_HIGH            0x04
+#define SM501_GPIO_DDR_LOW              0x08
+#define SM501_GPIO_DDR_HIGH             0x0C
+#define SM501_GPIO_IRQ_SETUP            0x10
+#define SM501_GPIO_IRQ_STATUS           0x14
+#define SM501_GPIO_IRQ_RESET            0x14
 
 /* I2C controller base */
-#define SM501_I2C                       (0x010040)
-#define SM501_I2C_BYTE_COUNT            (0x00)
-#define SM501_I2C_CONTROL               (0x01)
-#define SM501_I2C_STATUS                (0x02)
-#define SM501_I2C_RESET                 (0x02)
-#define SM501_I2C_SLAVE_ADDRESS         (0x03)
-#define SM501_I2C_DATA                  (0x04)
+#define SM501_I2C                       0x010040
+#define SM501_I2C_BYTE_COUNT            0x00
+#define SM501_I2C_CONTROL               0x01
+#define SM501_I2C_STATUS                0x02
+#define SM501_I2C_RESET                 0x02
+#define SM501_I2C_SLAVE_ADDRESS         0x03
+#define SM501_I2C_DATA                  0x04
 
 #define SM501_I2C_CONTROL_START         (1 << 2)
 #define SM501_I2C_CONTROL_ENABLE        (1 << 0)
@@ -204,25 +204,25 @@
 #define SM501_I2C_RESET_ERROR           (1 << 2)
 
 /* SSP base */
-#define SM501_SSP                       (0x020000)
+#define SM501_SSP                       0x020000
 
 /* Uart 0 base */
-#define SM501_UART0                     (0x030000)
+#define SM501_UART0                     0x030000
 
 /* Uart 1 base */
-#define SM501_UART1                     (0x030020)
+#define SM501_UART1                     0x030020
 
 /* USB host port base */
-#define SM501_USB_HOST                  (0x040000)
+#define SM501_USB_HOST                  0x040000
 
 /* USB slave/gadget base */
-#define SM501_USB_GADGET                (0x060000)
+#define SM501_USB_GADGET                0x060000
 
 /* USB slave/gadget data port base */
-#define SM501_USB_GADGET_DATA           (0x070000)
+#define SM501_USB_GADGET_DATA           0x070000
 
 /* Display controller/video engine base */
-#define SM501_DC                        (0x080000)
+#define SM501_DC                        0x080000
 
 /* common defines for the SM501 address registers */
 #define SM501_ADDR_FLIP                 (1 << 31)
@@ -237,12 +237,12 @@
 #define SM501_FIFO_11                   (0x3 << 16)
 
 /* common registers for panel and the crt */
-#define SM501_OFF_DC_H_TOT              (0x000)
-#define SM501_OFF_DC_V_TOT              (0x008)
-#define SM501_OFF_DC_H_SYNC             (0x004)
-#define SM501_OFF_DC_V_SYNC             (0x00C)
+#define SM501_OFF_DC_H_TOT              0x000
+#define SM501_OFF_DC_V_TOT              0x008
+#define SM501_OFF_DC_H_SYNC             0x004
+#define SM501_OFF_DC_V_SYNC             0x00C
 
-#define SM501_DC_PANEL_CONTROL          (0x000)
+#define SM501_DC_PANEL_CONTROL          0x000
 
 #define SM501_DC_PANEL_CONTROL_FPEN     (1 << 27)
 #define SM501_DC_PANEL_CONTROL_BIAS     (1 << 26)
@@ -277,65 +277,65 @@
 #define SM501_DC_PANEL_CONTROL_32BPP    (2 << 0)
 
 
-#define SM501_DC_PANEL_PANNING_CONTROL  (0x004)
-#define SM501_DC_PANEL_COLOR_KEY        (0x008)
-#define SM501_DC_PANEL_FB_ADDR          (0x00C)
-#define SM501_DC_PANEL_FB_OFFSET        (0x010)
-#define SM501_DC_PANEL_FB_WIDTH         (0x014)
-#define SM501_DC_PANEL_FB_HEIGHT        (0x018)
-#define SM501_DC_PANEL_TL_LOC           (0x01C)
-#define SM501_DC_PANEL_BR_LOC           (0x020)
-#define SM501_DC_PANEL_H_TOT            (0x024)
-#define SM501_DC_PANEL_H_SYNC           (0x028)
-#define SM501_DC_PANEL_V_TOT            (0x02C)
-#define SM501_DC_PANEL_V_SYNC           (0x030)
-#define SM501_DC_PANEL_CUR_LINE         (0x034)
-
-#define SM501_DC_VIDEO_CONTROL          (0x040)
-#define SM501_DC_VIDEO_FB0_ADDR         (0x044)
-#define SM501_DC_VIDEO_FB_WIDTH         (0x048)
-#define SM501_DC_VIDEO_FB0_LAST_ADDR    (0x04C)
-#define SM501_DC_VIDEO_TL_LOC           (0x050)
-#define SM501_DC_VIDEO_BR_LOC           (0x054)
-#define SM501_DC_VIDEO_SCALE            (0x058)
-#define SM501_DC_VIDEO_INIT_SCALE       (0x05C)
-#define SM501_DC_VIDEO_YUV_CONSTANTS    (0x060)
-#define SM501_DC_VIDEO_FB1_ADDR         (0x064)
-#define SM501_DC_VIDEO_FB1_LAST_ADDR    (0x068)
-
-#define SM501_DC_VIDEO_ALPHA_CONTROL    (0x080)
-#define SM501_DC_VIDEO_ALPHA_FB_ADDR    (0x084)
-#define SM501_DC_VIDEO_ALPHA_FB_OFFSET  (0x088)
-#define SM501_DC_VIDEO_ALPHA_FB_LAST_ADDR (0x08C)
-#define SM501_DC_VIDEO_ALPHA_TL_LOC     (0x090)
-#define SM501_DC_VIDEO_ALPHA_BR_LOC     (0x094)
-#define SM501_DC_VIDEO_ALPHA_SCALE      (0x098)
-#define SM501_DC_VIDEO_ALPHA_INIT_SCALE (0x09C)
-#define SM501_DC_VIDEO_ALPHA_CHROMA_KEY (0x0A0)
-#define SM501_DC_VIDEO_ALPHA_COLOR_LOOKUP (0x0A4)
-
-#define SM501_DC_PANEL_HWC_BASE         (0x0F0)
-#define SM501_DC_PANEL_HWC_ADDR         (0x0F0)
-#define SM501_DC_PANEL_HWC_LOC          (0x0F4)
-#define SM501_DC_PANEL_HWC_COLOR_1_2    (0x0F8)
-#define SM501_DC_PANEL_HWC_COLOR_3      (0x0FC)
+#define SM501_DC_PANEL_PANNING_CONTROL  0x004
+#define SM501_DC_PANEL_COLOR_KEY        0x008
+#define SM501_DC_PANEL_FB_ADDR          0x00C
+#define SM501_DC_PANEL_FB_OFFSET        0x010
+#define SM501_DC_PANEL_FB_WIDTH         0x014
+#define SM501_DC_PANEL_FB_HEIGHT        0x018
+#define SM501_DC_PANEL_TL_LOC           0x01C
+#define SM501_DC_PANEL_BR_LOC           0x020
+#define SM501_DC_PANEL_H_TOT            0x024
+#define SM501_DC_PANEL_H_SYNC           0x028
+#define SM501_DC_PANEL_V_TOT            0x02C
+#define SM501_DC_PANEL_V_SYNC           0x030
+#define SM501_DC_PANEL_CUR_LINE         0x034
+
+#define SM501_DC_VIDEO_CONTROL          0x040
+#define SM501_DC_VIDEO_FB0_ADDR         0x044
+#define SM501_DC_VIDEO_FB_WIDTH         0x048
+#define SM501_DC_VIDEO_FB0_LAST_ADDR    0x04C
+#define SM501_DC_VIDEO_TL_LOC           0x050
+#define SM501_DC_VIDEO_BR_LOC           0x054
+#define SM501_DC_VIDEO_SCALE            0x058
+#define SM501_DC_VIDEO_INIT_SCALE       0x05C
+#define SM501_DC_VIDEO_YUV_CONSTANTS    0x060
+#define SM501_DC_VIDEO_FB1_ADDR         0x064
+#define SM501_DC_VIDEO_FB1_LAST_ADDR    0x068
+
+#define SM501_DC_VIDEO_ALPHA_CONTROL    0x080
+#define SM501_DC_VIDEO_ALPHA_FB_ADDR    0x084
+#define SM501_DC_VIDEO_ALPHA_FB_OFFSET  0x088
+#define SM501_DC_VIDEO_ALPHA_FB_LAST_ADDR 0x08C
+#define SM501_DC_VIDEO_ALPHA_TL_LOC     0x090
+#define SM501_DC_VIDEO_ALPHA_BR_LOC     0x094
+#define SM501_DC_VIDEO_ALPHA_SCALE      0x098
+#define SM501_DC_VIDEO_ALPHA_INIT_SCALE 0x09C
+#define SM501_DC_VIDEO_ALPHA_CHROMA_KEY 0x0A0
+#define SM501_DC_VIDEO_ALPHA_COLOR_LOOKUP 0x0A4
+
+#define SM501_DC_PANEL_HWC_BASE         0x0F0
+#define SM501_DC_PANEL_HWC_ADDR         0x0F0
+#define SM501_DC_PANEL_HWC_LOC          0x0F4
+#define SM501_DC_PANEL_HWC_COLOR_1_2    0x0F8
+#define SM501_DC_PANEL_HWC_COLOR_3      0x0FC
 
 #define SM501_HWC_EN                    (1 << 31)
 
-#define SM501_OFF_HWC_ADDR              (0x00)
-#define SM501_OFF_HWC_LOC               (0x04)
-#define SM501_OFF_HWC_COLOR_1_2         (0x08)
-#define SM501_OFF_HWC_COLOR_3           (0x0C)
+#define SM501_OFF_HWC_ADDR              0x00
+#define SM501_OFF_HWC_LOC               0x04
+#define SM501_OFF_HWC_COLOR_1_2         0x08
+#define SM501_OFF_HWC_COLOR_3           0x0C
 
-#define SM501_DC_ALPHA_CONTROL          (0x100)
-#define SM501_DC_ALPHA_FB_ADDR          (0x104)
-#define SM501_DC_ALPHA_FB_OFFSET        (0x108)
-#define SM501_DC_ALPHA_TL_LOC           (0x10C)
-#define SM501_DC_ALPHA_BR_LOC           (0x110)
-#define SM501_DC_ALPHA_CHROMA_KEY       (0x114)
-#define SM501_DC_ALPHA_COLOR_LOOKUP     (0x118)
+#define SM501_DC_ALPHA_CONTROL          0x100
+#define SM501_DC_ALPHA_FB_ADDR          0x104
+#define SM501_DC_ALPHA_FB_OFFSET        0x108
+#define SM501_DC_ALPHA_TL_LOC           0x10C
+#define SM501_DC_ALPHA_BR_LOC           0x110
+#define SM501_DC_ALPHA_CHROMA_KEY       0x114
+#define SM501_DC_ALPHA_COLOR_LOOKUP     0x118
 
-#define SM501_DC_CRT_CONTROL            (0x200)
+#define SM501_DC_CRT_CONTROL            0x200
 
 #define SM501_DC_CRT_CONTROL_TVP        (1 << 15)
 #define SM501_DC_CRT_CONTROL_CP         (1 << 14)
@@ -353,89 +353,89 @@
 #define SM501_DC_CRT_CONTROL_16BPP      (1 << 0)
 #define SM501_DC_CRT_CONTROL_32BPP      (2 << 0)
 
-#define SM501_DC_CRT_FB_ADDR            (0x204)
-#define SM501_DC_CRT_FB_OFFSET          (0x208)
-#define SM501_DC_CRT_H_TOT              (0x20C)
-#define SM501_DC_CRT_H_SYNC             (0x210)
-#define SM501_DC_CRT_V_TOT              (0x214)
-#define SM501_DC_CRT_V_SYNC             (0x218)
-#define SM501_DC_CRT_SIGNATURE_ANALYZER (0x21C)
-#define SM501_DC_CRT_CUR_LINE           (0x220)
-#define SM501_DC_CRT_MONITOR_DETECT     (0x224)
+#define SM501_DC_CRT_FB_ADDR            0x204
+#define SM501_DC_CRT_FB_OFFSET          0x208
+#define SM501_DC_CRT_H_TOT              0x20C
+#define SM501_DC_CRT_H_SYNC             0x210
+#define SM501_DC_CRT_V_TOT              0x214
+#define SM501_DC_CRT_V_SYNC             0x218
+#define SM501_DC_CRT_SIGNATURE_ANALYZER 0x21C
+#define SM501_DC_CRT_CUR_LINE           0x220
+#define SM501_DC_CRT_MONITOR_DETECT     0x224
 
-#define SM501_DC_CRT_HWC_BASE           (0x230)
-#define SM501_DC_CRT_HWC_ADDR           (0x230)
-#define SM501_DC_CRT_HWC_LOC            (0x234)
-#define SM501_DC_CRT_HWC_COLOR_1_2      (0x238)
-#define SM501_DC_CRT_HWC_COLOR_3        (0x23C)
+#define SM501_DC_CRT_HWC_BASE           0x230
+#define SM501_DC_CRT_HWC_ADDR           0x230
+#define SM501_DC_CRT_HWC_LOC            0x234
+#define SM501_DC_CRT_HWC_COLOR_1_2      0x238
+#define SM501_DC_CRT_HWC_COLOR_3        0x23C
 
-#define SM501_DC_PANEL_PALETTE          (0x400)
+#define SM501_DC_PANEL_PALETTE          0x400
 
-#define SM501_DC_VIDEO_PALETTE          (0x800)
+#define SM501_DC_VIDEO_PALETTE          0x800
 
-#define SM501_DC_CRT_PALETTE            (0xC00)
+#define SM501_DC_CRT_PALETTE            0xC00
 
 /* Zoom Video port base */
-#define SM501_ZVPORT                    (0x090000)
+#define SM501_ZVPORT                    0x090000
 
 /* AC97/I2S base */
-#define SM501_AC97                      (0x0A0000)
+#define SM501_AC97                      0x0A0000
 
 /* 8051 micro controller base */
-#define SM501_UCONTROLLER               (0x0B0000)
+#define SM501_UCONTROLLER               0x0B0000
 
 /* 8051 micro controller SRAM base */
-#define SM501_UCONTROLLER_SRAM          (0x0C0000)
+#define SM501_UCONTROLLER_SRAM          0x0C0000
 
 /* DMA base */
-#define SM501_DMA                       (0x0D0000)
+#define SM501_DMA                       0x0D0000
 
 /* 2d engine base */
-#define SM501_2D_ENGINE                 (0x100000)
-#define SM501_2D_SOURCE                 (0x00)
-#define SM501_2D_DESTINATION            (0x04)
-#define SM501_2D_DIMENSION              (0x08)
-#define SM501_2D_CONTROL                (0x0C)
-#define SM501_2D_PITCH                  (0x10)
-#define SM501_2D_FOREGROUND             (0x14)
-#define SM501_2D_BACKGROUND             (0x18)
-#define SM501_2D_STRETCH                (0x1C)
-#define SM501_2D_COLOR_COMPARE          (0x20)
-#define SM501_2D_COLOR_COMPARE_MASK     (0x24)
-#define SM501_2D_MASK                   (0x28)
-#define SM501_2D_CLIP_TL                (0x2C)
-#define SM501_2D_CLIP_BR                (0x30)
-#define SM501_2D_MONO_PATTERN_LOW       (0x34)
-#define SM501_2D_MONO_PATTERN_HIGH      (0x38)
-#define SM501_2D_WINDOW_WIDTH           (0x3C)
-#define SM501_2D_SOURCE_BASE            (0x40)
-#define SM501_2D_DESTINATION_BASE       (0x44)
-#define SM501_2D_ALPHA                  (0x48)
-#define SM501_2D_WRAP                   (0x4C)
-#define SM501_2D_STATUS                 (0x50)
-
-#define SM501_CSC_Y_SOURCE_BASE         (0xC8)
-#define SM501_CSC_CONSTANTS             (0xCC)
-#define SM501_CSC_Y_SOURCE_X            (0xD0)
-#define SM501_CSC_Y_SOURCE_Y            (0xD4)
-#define SM501_CSC_U_SOURCE_BASE         (0xD8)
-#define SM501_CSC_V_SOURCE_BASE         (0xDC)
-#define SM501_CSC_SOURCE_DIMENSION      (0xE0)
-#define SM501_CSC_SOURCE_PITCH          (0xE4)
-#define SM501_CSC_DESTINATION           (0xE8)
-#define SM501_CSC_DESTINATION_DIMENSION (0xEC)
-#define SM501_CSC_DESTINATION_PITCH     (0xF0)
-#define SM501_CSC_SCALE_FACTOR          (0xF4)
-#define SM501_CSC_DESTINATION_BASE      (0xF8)
-#define SM501_CSC_CONTROL               (0xFC)
+#define SM501_2D_ENGINE                 0x100000
+#define SM501_2D_SOURCE                 0x00
+#define SM501_2D_DESTINATION            0x04
+#define SM501_2D_DIMENSION              0x08
+#define SM501_2D_CONTROL                0x0C
+#define SM501_2D_PITCH                  0x10
+#define SM501_2D_FOREGROUND             0x14
+#define SM501_2D_BACKGROUND             0x18
+#define SM501_2D_STRETCH                0x1C
+#define SM501_2D_COLOR_COMPARE          0x20
+#define SM501_2D_COLOR_COMPARE_MASK     0x24
+#define SM501_2D_MASK                   0x28
+#define SM501_2D_CLIP_TL                0x2C
+#define SM501_2D_CLIP_BR                0x30
+#define SM501_2D_MONO_PATTERN_LOW       0x34
+#define SM501_2D_MONO_PATTERN_HIGH      0x38
+#define SM501_2D_WINDOW_WIDTH           0x3C
+#define SM501_2D_SOURCE_BASE            0x40
+#define SM501_2D_DESTINATION_BASE       0x44
+#define SM501_2D_ALPHA                  0x48
+#define SM501_2D_WRAP                   0x4C
+#define SM501_2D_STATUS                 0x50
+
+#define SM501_CSC_Y_SOURCE_BASE         0xC8
+#define SM501_CSC_CONSTANTS             0xCC
+#define SM501_CSC_Y_SOURCE_X            0xD0
+#define SM501_CSC_Y_SOURCE_Y            0xD4
+#define SM501_CSC_U_SOURCE_BASE         0xD8
+#define SM501_CSC_V_SOURCE_BASE         0xDC
+#define SM501_CSC_SOURCE_DIMENSION      0xE0
+#define SM501_CSC_SOURCE_PITCH          0xE4
+#define SM501_CSC_DESTINATION           0xE8
+#define SM501_CSC_DESTINATION_DIMENSION 0xEC
+#define SM501_CSC_DESTINATION_PITCH     0xF0
+#define SM501_CSC_SCALE_FACTOR          0xF4
+#define SM501_CSC_DESTINATION_BASE      0xF8
+#define SM501_CSC_CONTROL               0xFC
 
 /* 2d engine data port base */
-#define SM501_2D_ENGINE_DATA            (0x110000)
+#define SM501_2D_ENGINE_DATA            0x110000
 
 /* end of register definitions */
 
-#define SM501_HWC_WIDTH                       (64)
-#define SM501_HWC_HEIGHT                      (64)
+#define SM501_HWC_WIDTH                 64
+#define SM501_HWC_HEIGHT                64
 
 /* SM501 local memory size taken from "linux/drivers/mfd/sm501.c" */
 static const uint32_t sm501_mem_local_size[] = {
-- 
2.39.1


