Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB368AF3A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:06:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuH-0001ya-Te; Sun, 05 Feb 2023 05:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObte-00013q-M6; Sun, 05 Feb 2023 05:05:20 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtd-0005Kk-7E; Sun, 05 Feb 2023 05:05:18 -0500
Received: by mail-oi1-x230.google.com with SMTP id c15so7453937oic.8;
 Sun, 05 Feb 2023 02:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bYC5ezcKQ8Ug4r49X6lfdepBziknoUgrqqLq88u/tJk=;
 b=T1Ape8A2dor5soh+Tfh06RG4TAzJO7whajPYceAnlPweiO8exqJ0Pejfb0oZ+caqAM
 ZSgm06a1n8RCkW1Ifkoufec976KVW51qhSIxnhF/kYHWJ902gyA3vP9hJccNhgTH3cG2
 VjayTozSpzxapN+/uqwnYYP9mrcZOd5VoYs/oziQ4iJY77HaY67O8aUkvM6V5hM4g8XG
 yYoONaY5oesizVDA+X9uZA/xchJ/qdadBZvQpA1Q4QwCFLPrvq+naadtwDdsHpkYklAN
 LFw1auEkeRngVzvZ1ycpVmSL9XNwJoiz25+U6tJ8KuUwGX/UpeUdAkswzqgo/oyokdtz
 YsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bYC5ezcKQ8Ug4r49X6lfdepBziknoUgrqqLq88u/tJk=;
 b=IvbOlxfbRisQqkdt8PpCUiSQqj5l+G+9KDQtZAAr1G7ZtjEGC+F69gsXW6RcD4xLbX
 AdfiQEe95VCNlQt7I3tLq4inyJOPzMey5SmOy5RSjRHRPcxFZrfGyNgRORYZpMQ7COLA
 99KPrSqvhrB+H0FA8YEpm0NWtky20YY5wtIHzB2W/GrKgKnqWG9TAiIZd1V5YHBlBCTc
 qiA3OvflgZvMT/fvjHdWXiwAvk1WslcRtE1WOFC7To2e6IoROMGaIgOsKcrFYFVvyU4g
 zHj6Yy2lH5BZyE8fbDHzj8R6JObM+WoQYAQkF/msFSccOtSQzNmT3/Ab6JDqE1DFNaBD
 nZ3Q==
X-Gm-Message-State: AO0yUKXKt7FS0NsB/8MymAa7sTGK+T2mF/V7pwzWNuOsWaiBhLv0UEhi
 xnz55VYvsBNnRAWdlqKngPYTIo+j138=
X-Google-Smtp-Source: AK7set8Qtcd3lbZEsmfTPkOuTx1YjvJCem5k/rR8n5dtAaMLWhvnA0cj+wcq0SzIloI3sdzgML+vTg==
X-Received: by 2002:a05:6808:ecb:b0:364:d6be:a442 with SMTP id
 q11-20020a0568080ecb00b00364d6bea442mr8923219oiv.57.1675591515735; 
 Sun, 05 Feb 2023 02:05:15 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:15 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 10/16] ppc/pnv/pci: Remove duplicate definition of
 PNV_PHB5_DEVICE_ID
Date: Sun,  5 Feb 2023 07:04:43 -0300
Message-Id: <20230205100449.2352781-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
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

From: Frederic Barrat <fbarrat@linux.ibm.com>

PNV_PHB5_DEVICE_ID is defined in two different headers. The definition
in hw/pci-host/pnv_phb4.h was left out in a previous rework.

Remaining definition is in hw/pci-host/pnv_phb.h.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230127122848.550083-3-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 17aef08f91..761525686e 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -215,7 +215,6 @@ struct PnvPhb4PecClass {
     OBJECT_CHECK(PnvPhb4, (obj), TYPE_PNV_PHB5)
 
 #define PNV_PHB5_VERSION           0x000000a500000001ull
-#define PNV_PHB5_DEVICE_ID         0x0652
 
 #define TYPE_PNV_PHB5_PEC "pnv-phb5-pec"
 #define PNV_PHB5_PEC(obj) \
-- 
2.39.1


