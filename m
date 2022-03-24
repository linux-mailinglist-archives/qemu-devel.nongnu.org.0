Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B34E6483
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 14:57:16 +0100 (CET)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXNxj-00039B-Q7
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 09:57:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nXNpB-0005Zh-Ko
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:48:25 -0400
Received: from [2607:f8b0:4864:20::1034] (port=47005
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nXNp9-0007iM-U3
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:48:25 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso5179669pjb.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 06:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNVJ5jv2bqnaPQd1RqdCh7cId4WL6F9C+utnUPv/gGs=;
 b=m5qe9Vk+cw+10pztfJPytcDQY83RY/Zn02gU/o2UknwY+hOqokJ4yRuCvXtqC/LfsS
 BOafs0DZ6M1O/2GinH86dg8dH/HCSfJBLabN6E2gWIR/RiECA9KbxnzcCuYMwRdysTqB
 AcJrl5Zt9+d7CwO8OfCS25hzFb9gH35sHI4wiAQevAJJ62TZ7WZumOV/i3z7ia4w73Dh
 QFDkeyx2R+ZLa9/xeQzqPR0W33NLEgTVKaFbsM1pFFz6caHiE/Jj2STVuPm2hIXNPbhz
 +CPjuT5kYopo9moPGOAndFPKeuBkMYfTz3CjIAHLfM26SsshsZI1cBP4T1L3MD4Xr4ck
 uaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNVJ5jv2bqnaPQd1RqdCh7cId4WL6F9C+utnUPv/gGs=;
 b=7eZUUJBatgu4gehH52QXBFfAwWzaoWgiHx4EoCS6RFZ/zBLzW3RPtub6ZlUcao0aNN
 N2KDsvicegKY/HH9ot8zcGEinyuY1Cv9DRt1+qTJCqpr98YKACwN1NBTjaiwH8SN4ONT
 2jchCvo7Vbs3cEqfn1eLzKUjRwvIwqLKaHAzrF7myE2tbrlE4kkG1eizLsg98Ka7sw2J
 9fkIpQcZgxNK757ww0Gl5S/ULxnnbIgGliu6T2OPcxXTHvAEKN4yOZoLpRUr+WAzYlcQ
 S14MYrTzoJQlmPJQUXZaDqp/wlTdhNs35tUe7vHderQnYBOudN1Y8kym7GjIoZGsgnB0
 rrxg==
X-Gm-Message-State: AOAM532BVpwCb9NDys31E9RfnL4wdMGaXhv+fXgVKabEBFfNpY7UTEst
 cHRmHRzRZ7xiq+BUBh1+CJ4=
X-Google-Smtp-Source: ABdhPJxFdu6HP20rghY9nbjPDc+k2Ye8o4C8UpHw+WkrBI516SxvH44w+n+1+BifeJrE5il7n8UF5A==
X-Received: by 2002:a17:902:d2cd:b0:154:38c5:f91d with SMTP id
 n13-20020a170902d2cd00b0015438c5f91dmr6094242plc.59.1648129702617; 
 Thu, 24 Mar 2022 06:48:22 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm3855566pfh.177.2022.03.24.06.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 06:48:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/core: loader: Set is_linux to true for VxWorks
 uImage
Date: Thu, 24 Mar 2022 21:48:12 +0800
Message-Id: <20220324134812.541274-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324134812.541274-1-bmeng.cn@gmail.com>
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

VxWorks 7 uses the same boot interface as the Linux kernel on Arm
(64-bit only), PowerPC and RISC-V architectures. Add logic to set
is_linux to true for VxWorks uImage for these architectures in
load_uboot_image().

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

Changes in v2:
- update commit message & comments regarding Arm64

 hw/core/loader.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index ca2f2431fb..94d045517f 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -697,6 +697,21 @@ static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *loadaddr,
         if (is_linux) {
             if (hdr->ih_os == IH_OS_LINUX) {
                 *is_linux = 1;
+            } else if (hdr->ih_os == IH_OS_VXWORKS) {
+                /*
+                 * VxWorks 7 uses the same boot interface as the Linux kernel
+                 * on Arm (64-bit only), PowerPC and RISC-V architectures.
+                 */
+                switch (hdr->ih_arch) {
+                case IH_ARCH_ARM64:
+                case IH_ARCH_PPC:
+                case IH_ARCH_RISCV:
+                    *is_linux = 1;
+                    break;
+                default:
+                    *is_linux = 0;
+                    break;
+                }
             } else {
                 *is_linux = 0;
             }
-- 
2.25.1


