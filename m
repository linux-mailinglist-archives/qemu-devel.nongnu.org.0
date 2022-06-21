Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7052D552F27
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:51:40 +0200 (CEST)
Received: from localhost ([::1]:38448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3aXp-0000zh-Qc
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQx-0007m6-KL; Tue, 21 Jun 2022 05:44:33 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:40858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o3aQu-0007O5-MF; Tue, 21 Jun 2022 05:44:30 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-101cdfddfacso9532313fac.7; 
 Tue, 21 Jun 2022 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3RRMoys7qX1NzX5bYgdLFUw70oXiZ53EQ8nVjhmz0U=;
 b=l1Ru2pBx7yQUuMREAppGw2u8pu+9x9mSckE6E7ZEIbi5Ge4Osu6Vw7py1hfWuWvTwz
 eZSedsMX5xZ3SAgWSsCqOpcqFW/h4iDrYNYwlYCHXu6leu7NNvXJYk9nPDTpqKzYg/N2
 CZMvXSP86HPCy3mLziuQEituNdu4osT0kN739JAi9w4VpOzdOqcisyY/MHWJuzvYu5cO
 vvG8qafUOs4hQ8ebZtkDqQ3B16rlBk61HiAiHPBzX1ekt8/18gyb6xBqQYctwsb5ZGFD
 6nP6saQ36YBaE9UlSYIHP6zB6NWXvOZIj/E+dbh+HtfqShQSNYwcELiiVROSsW9MRcFP
 duXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3RRMoys7qX1NzX5bYgdLFUw70oXiZ53EQ8nVjhmz0U=;
 b=u9sgERqJKjsD1qXGFYS/bkLtll9sAaWkEMiZp9uQD30nLaCsVlzEar/omgzr2CMVJ0
 +jMzXYHO7TBktiy/2NINhKLWGPLjVPBCaQhw9SZFeipvfF4xPqEewzMEyUr/56Dnt8cb
 L0RbU0qTmPafhgISJBa6xWN0dknvC0xHCIgO1Yex5Wmh8PPn5f0ZFA3HI/+5I6ayxQ51
 qICcNWc75iz76IlvRM+5l+IVciM54EJWY7WeHM1xa03pqi6+7DkVt2OlkPp1lnGWoGVM
 NizjiY57S6e8+V/3KLaSLqdY20xG0WuyrVEJnngwUjn+vIGe9iPrGzfaenf+aw38fEzO
 0ZQQ==
X-Gm-Message-State: AJIora8z1O5dl0tE9UT/CO7kL7MZMIHZEiwIV9V/c0Icat9l+gz7RZoT
 m3GmcWb0THtxR8nmSJBdsZo9Ay2pMGxNzw==
X-Google-Smtp-Source: AGRyM1v3cSVwaWIH6dp+qXY2oAYeaqKV4nbsFIPWQCMkJOhaw8sABrNtABtAieJBhr8k/wNiskDEPA==
X-Received: by 2002:a05:6870:d350:b0:fe:1e87:ed13 with SMTP id
 h16-20020a056870d35000b000fe1e87ed13mr20210180oag.166.1655804667213; 
 Tue, 21 Jun 2022 02:44:27 -0700 (PDT)
Received: from balboa.ibmuc.com ([187.34.29.129])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a9d7a49000000b0061020865f1asm7555119otm.50.2022.06.21.02.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 02:44:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/15] ppc: fix boot with sam460ex
Date: Tue, 21 Jun 2022 06:43:54 -0300
Message-Id: <20220621094400.122800-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621094400.122800-1-danielhb413@gmail.com>
References: <20220621094400.122800-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

From: "Michael S. Tsirkin" <mst@redhat.com>

Recent changes to pcie_host corrected size of its internal region to
match what it expects: only the low 28 bits are ever decoded. Previous
code just ignored bit 29 (if size was 1 << 29) in the address which does
not make much sense.  We are now asserting on size > 1 << 28 instead,
but PPC 4xx actually allows guest to configure different sizes, and some
firmwares seem to set it to 1 << 29.

This caused e.g. qemu-system-ppc -M sam460ex to exit with an assert when
the guest writes a value to CFGMSK register when trying to map config
space. This is done in the board firmware in ppc4xx_init_pcie_port() in
roms/u-boot-sam460ex/arch/powerpc/cpu/ppc4xx/4xx_pcie.c

It's not clear what the proper fix should be but for now let's force the
size to 256MB, so anything outside the expected address range is
ignored.

Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX")
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220526224229.95183-1-mst@redhat.com>
[danielhb: changed commit msg as BALATON Zoltan suggested]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc440_uc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 993e3ba955..a1ecf6dd1c 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
     case PEGPL_CFGMSK:
         s->cfg_mask = val;
         size = ~(val & 0xfffffffe) + 1;
+        /*
+         * Firmware sets this register to E0000001. Why we are not sure,
+         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
+         * ignored.
+         */
+        if (size > PCIE_MMCFG_SIZE_MAX) {
+            size = PCIE_MMCFG_SIZE_MAX;
+        }
         pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
         break;
     case PEGPL_MSGBAH:
-- 
2.36.1


