Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1185A8685
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:13:41 +0200 (CEST)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTT9h-00080G-3m
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoG-00031H-Gl; Wed, 31 Aug 2022 14:51:32 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36]:43656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoF-00082w-1L; Wed, 31 Aug 2022 14:51:32 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11eb44f520dso22004750fac.10; 
 Wed, 31 Aug 2022 11:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uZ5X6sO5txDhJMsU+AfGV3KjYkci9xh9yIC2kEE8xuQ=;
 b=PdflO1sbHJTvYU7pgWdSU5nLof3n8M3CnljzK+VeP4wrmeCR5FYCLnICtNNbChbWSz
 +OCPMFlTUOEOgVhIvqlefLElhrcjgW/5ARfWhYXoSBo+2UjGzNGSmj9SV2PgmC56U6EX
 fLYVku7ddS6eCYb7e0o8cUDHvZ/20r8Tx8vtn5aBzWHLeaNzG1SZV/ErgIEfjwl8cLSm
 vSlq+YAk6cCuM5nViCsl0VU7Q/nWZ7OHIcR5UvkxNB4/soemfJnV1gAWXteEYKMYKPPj
 Nte6gOXGKWqb4LriLHhMfyGqzEOWrlpD/34bns2PzYFe+5chIrE4XPTcrbdtfLhCKI9h
 MmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uZ5X6sO5txDhJMsU+AfGV3KjYkci9xh9yIC2kEE8xuQ=;
 b=E0AB+DEvJpUm7Jbq7fAErH7d/YDzFsku+ZFehZT2TyWqI1y5GgMusBcV7l94Undife
 sD8SEFklG2/fVDZfMaIB0dyOBP/WvPHSFCyTl4hEcacvfimTqcWK6QZlxnz9DMAn3sIc
 HA2xK57cs/X5I+AuQfhJvHCzqUOcAdfJarKItEsQqjKELuiCV6V25I6V6NpWMKDQWWzM
 pkRWZERs/+yUtPQK7SDUuZpSn0kbfsyOU+7tpv1e8YmppmgJ0MsGDQs3o0eRBkhCDzUr
 lmH19YmwTgidiMjYYP9itoNKkZNtkDRmRR2CcCf6PChBQ1TjWqciG1AnwWghW12hT4n/
 nstA==
X-Gm-Message-State: ACgBeo02JUjqWLkREU94br2oOdV+J/5lcUUQArkApj4uTWrJ1lq3Z+pS
 7TC+34TSsFK9RuhHSOwwdqsAW5Jx3vM=
X-Google-Smtp-Source: AA6agR6i0pg2DhZC6a+LEv5zXUitOSe9b5jzA4VG2nzP940KXMudT0SHEkz+5Buwn7s5UlberePw0g==
X-Received: by 2002:a05:6870:7012:b0:11e:d95d:1fe7 with SMTP id
 u18-20020a056870701200b0011ed95d1fe7mr2087724oae.274.1661971889206; 
 Wed, 31 Aug 2022 11:51:29 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:51:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PULL 16/60] ppc/pnv: remove PnvPHB4.version
Date: Wed, 31 Aug 2022 15:49:50 -0300
Message-Id: <20220831185034.23240-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
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

It's unused.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Message-Id: <20220624084921.399219-12-danielhb413@gmail.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 61a0cb9989..20aa4819d3 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -77,8 +77,6 @@ struct PnvPHB4 {
     uint32_t chip_id;
     uint32_t phb_id;
 
-    uint64_t version;
-
     /* The owner PEC */
     PnvPhb4PecState *pec;
 
-- 
2.37.2


