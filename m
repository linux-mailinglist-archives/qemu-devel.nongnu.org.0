Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C8C68AF39
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObuD-0001gO-Un; Sun, 05 Feb 2023 05:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObte-00013L-7s; Sun, 05 Feb 2023 05:05:18 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtb-0005KN-9f; Sun, 05 Feb 2023 05:05:17 -0500
Received: by mail-oi1-x232.google.com with SMTP id j21so7619265oie.4;
 Sun, 05 Feb 2023 02:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=79IGtA6DQyNywTYzy/kQ6iBsuz9L/1nryFMneINAXEU=;
 b=Y0F9rBunc7BU7XRtMshIfen/4ttTmIg3UY6uET/Vwl3sGSHM9GAaTdcZunbVrSOCJ8
 dDCSiAZHWrlfsHZyjO/HxFGu5yuBkM+Al22EcZs2RJw7yF8thpgmw0WtBMr2LU4HIu2g
 EoDLFuN+HC3Tsa9300jE6m40Pa1E8jjKE5VgGHWVurOWz3QYtAXFXeMSuQN4TXyG62mq
 fNUR0Mj/eC20zDwRcf+radp5kZvEtkgKM7XGcuG3aQqmKfkJYfwuq0pI95Gvy8iPG2PA
 X05kxVhtg64fDDuDk7FQZaay6QB/AjlYN7d9rP5KjWDHRppCC7K8GW8wjDEgoYg3eNng
 g4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=79IGtA6DQyNywTYzy/kQ6iBsuz9L/1nryFMneINAXEU=;
 b=XOLUuTByNCEhRR38v9qs857/xEF98PQ9R/7sxp2OEoQfqajdIAVRrJDjblwcYaRfub
 w2KIlmlnhmQ346X3Fj6BIDMDbDvCms16e2jNVlmWTCPLcooJOO+80eEg/oR4K9yI2opq
 aa6MK1PNhX+E3tIvhZFsJ/OPay0ut1nU8nj5bXSpPc3FpmpWZTrsehW/9RCvm29FRFHe
 tgp99XRnRGPgV6LYeTa8Y/BvVpQMzSH2ZuJdMjOURSCqXau7+RYLL5fkWoZJqMIs91NA
 bgdIAebmgFdyxKMHZLGu56IONKQt58Ei18CvfF0Pgpk7B7+7k8gWHt7A0c+YhEfcuQRP
 nBTg==
X-Gm-Message-State: AO0yUKU/D0Cd+asmfGoXcclYE6pZirRnR7t9LRivZx6fQviubZW7Wuay
 f7Y7B73GKhfeEjtinI6RlPxttmke1Bc=
X-Google-Smtp-Source: AK7set+vFu/XcFR1xnhA0zZJE8GfLJcSB9/D3XCVYhY+CafyIdPQ5nD4rPpaVxzAkyIz34ovRQuueg==
X-Received: by 2002:a05:6808:1b07:b0:36e:cc57:33a3 with SMTP id
 bx7-20020a0568081b0700b0036ecc5733a3mr9368592oib.22.1675591513662; 
 Sun, 05 Feb 2023 02:05:13 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:05:13 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 09/16] ppc/pnv/pci: Cleanup PnvPHBPecState structure
Date: Sun,  5 Feb 2023 07:04:42 -0300
Message-Id: <20230205100449.2352781-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
References: <20230205100449.2352781-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x232.google.com
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

Remove unused structure member 'system_memory'.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230127122848.550083-2-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 1f3237c9d5..17aef08f91 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -173,8 +173,6 @@ struct PnvPhb4PecState {
     uint32_t index;
     uint32_t chip_id;
 
-    MemoryRegion *system_memory;
-
     /* Nest registers, excuding per-stack */
 #define PHB4_PEC_NEST_REGS_COUNT    0xf
     uint64_t nest_regs[PHB4_PEC_NEST_REGS_COUNT];
-- 
2.39.1


