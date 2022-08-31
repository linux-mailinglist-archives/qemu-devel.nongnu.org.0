Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56C5A8770
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:17:49 +0200 (CEST)
Received: from localhost ([::1]:46910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTU9k-0005ir-GG
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSqL-0006zp-QT; Wed, 31 Aug 2022 14:53:41 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:45919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSq7-0008JS-Sk; Wed, 31 Aug 2022 14:53:38 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so26229565fac.12; 
 Wed, 31 Aug 2022 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CBtZGw63uCSpJxpboeQnOJqJCFmsITd0PPZMoDBvg8E=;
 b=Y3lRVnJfx2/WN3ok99v2xhR+FpxBIdEaNNIz+73AKCAWE+9UdWoPHnfTfYAuwSPB3x
 ADJw8yNm209d4DYFkGpPWz5nNamowEuPFgnfTe9iAuSX9j7LYZv87I/YznfaPi685cWL
 eRc5+I5qNR1pSWZEOkY/f63hnl5wE3LcQbZmV8ZlwhE2yNeKJ26zLWptj1YXjui0twLH
 htuzI7WRcNB9mbMWVCyXKZuPKdMVRCxXp5D0NKgZrckqw5iUKbHDuXQBaJgF6Eby3Txq
 NAVsuW+44d71wFl4QL+rD9eDYSEBIv5eMoOQVaaJiy+GvMs1rH6rBgDrzwb/ox1HSvA5
 QtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CBtZGw63uCSpJxpboeQnOJqJCFmsITd0PPZMoDBvg8E=;
 b=TZvWVCJXeQWHGxRVIKM/bu1vfMoLrX9aRth15sF243kthrDl7vVQjsa1V3FHEXylpm
 dG7QmuV0tcLOTqQfKY+KUUa/vGT0eYHSYI19xSvEf5LWjzrb8usjbinGE+yYUdLFbMwu
 RjoRIaS9S7elaTCHcgwhok7wSVdGxa2PrZiLyTaKvXCQa212e72lmQiwR3cLTQbxvbml
 5xHupxYu6rhRaKmo8WtSKkPaCC1WweXklLmrwZu9S/Vx8QDDL6k+582Hgkat0Tt+F6Vf
 wQQSqcnw4qCI/NvPLdKDb/L8HdA5cxrmB0ccEBXI6AOGckZ3K5hrxILDwkjLvlLCld2I
 C9XQ==
X-Gm-Message-State: ACgBeo2vn3H5C+b1S/yXej2ZmevwUWQtGtJrJoHcSfHQcWCD+R9DyP77
 NHh0SZjStH4FSr7Brl/NBH8nNJntKG0=
X-Google-Smtp-Source: AA6agR493TdUnAKaRga+RPxNQUwuwrUeNMY8wrnaG9MnVZsTtYZBbtllo/od6d31vkyoGs2Ml65rOQ==
X-Received: by 2002:a05:6870:5804:b0:11c:b6d0:b844 with SMTP id
 r4-20020a056870580400b0011cb6d0b844mr2220756oap.184.1661972006191; 
 Wed, 31 Aug 2022 11:53:26 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 59/60] ppc/ppc4xx: Fix sdram trace events
Date: Wed, 31 Aug 2022 15:50:33 -0300
Message-Id: <20220831185034.23240-60-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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

From: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <0a3e454eb7fd5f2b807a9c752c28693f27829f1d.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc4xx_devs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 37e3b87c2e..27ebbb2ffc 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -142,7 +142,7 @@ static void sdram_set_bcr(ppc4xx_sdram_t *sdram, int i,
     }
     sdram->bcr[i] = bcr & 0xFFDEE001;
     if (enabled && (bcr & 0x00000001)) {
-        trace_ppc4xx_sdram_unmap(sdram_base(bcr), sdram_size(bcr));
+        trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
         memory_region_init(&sdram->containers[i], NULL, "sdram-containers",
                            sdram_size(bcr));
         memory_region_add_subregion(&sdram->containers[i], 0,
-- 
2.37.2


