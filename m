Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9257E7D8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:04:19 +0200 (CEST)
Received: from localhost ([::1]:50328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEysk-0008Tn-Fu
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyov-0002sE-DV; Fri, 22 Jul 2022 16:00:21 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:45996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oEyor-0005C9-OB; Fri, 22 Jul 2022 16:00:20 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 r22-20020a056830419600b0061c6edc5dcfso4092028otu.12; 
 Fri, 22 Jul 2022 13:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9JxcmPY5cRnsfdU9CxHMKESf5qPzNpvz9n+hCJIAKF8=;
 b=hlFpPKGLj+MpDBYY6Vo8KeLXGsG10xnociaYKgpxAeZp+lxEu4lQleNhHDCeRj1WVn
 /b7GlWV5ycqiJ9wHHG1JeoaW3oUC1Xp6gHvLcA1UFlDKKEZbOeAeBQojYcwspXdqdmT6
 Ap3etde7fuQHGaxqYXS2iu7Lqen7zx/fNJx+vAvItSJOU3fDHHPNoeiyoOQSg42LyQCv
 WamVgZI9Av6QLcl5EgiSEHBc1OQHmeI+FqdWh9gsQZTWbZXOUHbAwNpTUiRxZL+Q2now
 pq7JSqslhKcDxRSS+Rrwrnm29wh90XX2QDaX35GSfNB9kPrRGC78+ORwZaFAvxg3F+be
 96rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JxcmPY5cRnsfdU9CxHMKESf5qPzNpvz9n+hCJIAKF8=;
 b=3XHmpcLz8KWqNNlFEk0B/86EKI0qJGWfPfX3TYi3uAFi0ogM4DYBpEDDuLxzC7QAcF
 QQmYmQBzlYff9O3l4iWEQHzAaaFjjFAhU2MCZWC6BtHpxEpRi/k0kJY3QBKBc1bQg3UC
 ZfvwZ18wfCmNoBvK5DeRnT1AxWDuqssAmSGtCTCltKPd548NH7tL1p5Es7JqBcZbnd9P
 uaEh4IG9LajYpv6y4xgGwAuv+1Ljg4QyOVrPVHIyYadCD88yo6pfkEQ6Hwvxo/60QrPj
 sM/4r1eopfAnwv1/Ujb7uDt5x3XLhfrylEMxpvrQASNeROPpDneD1xnj+eMfcDXvWPhL
 y5Eg==
X-Gm-Message-State: AJIora9ibHfISAvMhbcGKBhDfhc6fh1hJ1uhZrusoDArVHJR+uw2YlFo
 hdiOMNQ4AEidFuCJxMCFvh/MS0iqoGY=
X-Google-Smtp-Source: AGRyM1vviHyHF0k+Y92kY/EXlekhqmbp7lodeTnHmsRttGeyjgFFMvcxIU4aarCjfKcfRqkgsw/xgw==
X-Received: by 2002:a05:6830:4188:b0:60b:83f8:e8d0 with SMTP id
 r8-20020a056830418800b0060b83f8e8d0mr615946otu.32.1658520014778; 
 Fri, 22 Jul 2022 13:00:14 -0700 (PDT)
Received: from balboa.COMFAST ([152.254.206.198])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a9d740e000000b0061cae62aafcsm2388218otk.20.2022.07.22.13.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 13:00:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH for-7.2 01/10] hw/arm/boot.c: do not free machine->fdt in
 arm_load_dtb()
Date: Fri, 22 Jul 2022 16:59:58 -0300
Message-Id: <20220722200007.1602174-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722200007.1602174-1-danielhb413@gmail.com>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

This is not an issue right now because there's no code that access
machine->fdt after arm_load_dtb(), but we're going to add a couple do
FDT HMP commands that will rely on machine->fdt being valid.

Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
machine->fdt. This will allow the FDT of ARM machines that relies on
arm_load_dtb() to be accessed later on.

Since all ARM machines allocates the FDT only once, we don't need to
worry about leaking the existing FDT during a machine reset (which is
something that other machines have to look after, e.g. the ppc64 pSeries
machine).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..1d9c6047b1 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -684,7 +684,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
-    g_free(fdt);
+    /* Update ms->fdt pointer */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.36.1


