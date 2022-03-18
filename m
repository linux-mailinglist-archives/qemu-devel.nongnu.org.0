Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B474DDA8F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:29:02 +0100 (CET)
Received: from localhost ([::1]:32862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCf7-0006PO-Th
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:29:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZa-0006Br-7Y
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:18 -0400
Received: from [2a00:1450:4864:20::32c] (port=43661
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZY-0002Ag-Gu
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l1-20020a05600c4f0100b00389645443d2so4803370wmq.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dOFSsJD7GyN8WerJViFJLtaAtHU5mpmh2G7A0ZQ4yoM=;
 b=sY14NSzvDheoxaUkhuk0MsQyCS+QfMtinJPKOEIHy0kUSKzQfR/WEMenGqdSWsfKS8
 P9fXjcmPVVnjf6K1jrGBfYuYIC1IMGwtTc75gT1XpCMj3xDLgvCLZ5/11ieM8uUfpQTK
 zGc2IvfuGniExu1oEF6V/WjukMA9M40rXZLLMvQMUeOmC3CwoqCcZBkvIGjxatqnkYuL
 yNTWX9sL1tKVNWIBFcZxXgfZ0rzPoZ5FlHHwJrElJ5HAc0nAA4uRKCQ2U6mWBrdCajMe
 kn7Ys+5pLsOkpgXryXrAODViFF3Ge8ujyr1/iHIZbRV6EYghzwMJDFIP9PMrydVHCOo5
 R2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dOFSsJD7GyN8WerJViFJLtaAtHU5mpmh2G7A0ZQ4yoM=;
 b=Zw2ohx7gdClr1DeSPN0D5KKVNH9EvfRTEAvnoHUKqKL16Y9cOyGc72Wscg9wOyPfcc
 vsKxMDt9kyrw0MT6w0S59vT2ePn4i4tevB23qlCUxM4/7ayLl+eEHCrP3qVoTAKQSV+s
 NawbpX1OZUXZDGysatUU9HXf6IcoRNyP+/RMWVbAJpKIuKcZ/b5VyF1xWtIDhXM4gIeb
 9L4C8oxEbdN45SAFdMfOSVfyd4/80RGaFuvjDEClYnpgsSkaufcyfZPIZ4RBk9/M1v8v
 kUkjg2zBZxPOfUDFZwsRivirUQgU0f5kimJu03jcnS/ZKWQsrjiyvHj1PCcY7QIdHNMs
 iXKw==
X-Gm-Message-State: AOAM531emAw6uo3ha8XeJ2ttXPIL80KRHMcdNKl5QF89bWsSocgbadMs
 kETaL1CXwet55v7fDT7hdLaFmjg0TL/ApQ==
X-Google-Smtp-Source: ABdhPJzK83QKdSu5hGglcWeyMwWuKX2CO40kcKTqdE8ezAgGM04zgOeHTMsaUUVASrS+/wjjiCUxmg==
X-Received: by 2002:a1c:7c03:0:b0:38c:804d:d477 with SMTP id
 x3-20020a1c7c03000000b0038c804dd477mr5598911wmc.32.1647609795120; 
 Fri, 18 Mar 2022 06:23:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
Date: Fri, 18 Mar 2022 13:22:49 +0000
Message-Id: <20220318132306.3254960-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

In commit 00f05c02f9e7342f we gave the TYPE_XLNX_CSU_DMA object its
own class struct, but forgot to update the TypeInfo::class_size
accordingly.  This meant that not enough memory was allocated for the
class struct, and the initialization of xcdc->read in the class init
function wrote off the end of the memory. Add the missing line.

Found by running 'check-qtest-aarch64' with a clang
address-sanitizer build, which complains:

==2542634==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61000000ab00 at pc 0x559a20aebc29 bp 0x7fff97df74d0 sp 0x7fff97df74c8
WRITE of size 8 at 0x61000000ab00 thread T0
    #0 0x559a20aebc28 in xlnx_csu_dma_class_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../hw/dma/xlnx_csu_dma.c:722:16
    #1 0x559a21bf297c in type_initialize /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:365:9
    #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
    #3 0x7f09bcb641b7 in g_hash_table_foreach (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x401b7)
    #4 0x559a21bf3c27 in object_class_foreach /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1092:5
    #5 0x559a21bf3c27 in object_class_get_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1149:5
    #6 0x559a2081a2fd in select_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:1661:24
    #7 0x559a2081a2fd in qemu_create_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:2146:35
    #8 0x559a2081a2fd in qemu_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:3706:5
    #9 0x559a20720ed5 in main /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/main.c:49:5
    #10 0x7f09baec00b2 in __libc_start_main /build/glibc-sMfBJT/glibc-2.31/csu/../csu/libc-start.c:308:16
    #11 0x559a2067673d in _start (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xf4b73d)

0x61000000ab00 is located 0 bytes to the right of 192-byte region [0x61000000aa40,0x61000000ab00)
allocated by thread T0 here:
    #0 0x559a206eeff2 in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xfc3ff2)
    #1 0x7f09bcb7bef0 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)
    #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5

Fixes: 00f05c02f9e7342f ("hw/dma/xlnx_csu_dma: Support starting a read transfer through a class method")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220308150207.2546272-1-peter.maydell@linaro.org
---
 hw/dma/xlnx_csu_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 84f782fcdc0..60ada3286b4 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -744,6 +744,7 @@ static const TypeInfo xlnx_csu_dma_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(XlnxCSUDMA),
     .class_init    = xlnx_csu_dma_class_init,
+    .class_size    = sizeof(XlnxCSUDMAClass),
     .instance_init = xlnx_csu_dma_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_STREAM_SINK },
-- 
2.25.1


