Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642CD4B8372
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:56:49 +0100 (CET)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKG7E-00067t-H3
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:56:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKDy7-0000QQ-Ac; Wed, 16 Feb 2022 01:39:15 -0500
Received: from [2607:f8b0:4864:20::432] (port=38850
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKDy4-0008Mv-WC; Wed, 16 Feb 2022 01:39:15 -0500
Received: by mail-pf1-x432.google.com with SMTP id e17so1376992pfv.5;
 Tue, 15 Feb 2022 22:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8saAjQILxZ8CaggHHHXQP67/rH9Sks9TT/Y58ROx85g=;
 b=MIQxx9rF+Am3+Wz8A25ml9+VyKSSeh43rBL+6idrjqdC6Uf5QQtFF2YJ0c6NCeGPwD
 FE68WUVMiRAAOPErzn2Pxma9VW48SucEVfJSd6JRHCzeYDJzMocUPW9bn6tpOp21Y0QO
 tooTllrXDbKYHrS9C8/6m/DBIcAgtwYC3Qu1VO4S57sQ7IzC7WqYSodxIRy0/SxXN+qM
 2iYof6FTp9NukNLRN8NrnJ3QQSxzQmJ6rwUvtV1UZ4Vcj1BiClLAN3i3qNU7Qx+jb1SM
 zs6CBlaawtFS3utG1nzWdi9R89VukPrRWDEBpzTzz2vr+9cjCTM4bp2DtR1oxDv9rAm+
 PJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8saAjQILxZ8CaggHHHXQP67/rH9Sks9TT/Y58ROx85g=;
 b=EXL/tA0PMCOU9o0M3m85mt3ePUN8NWpOhJ5+WEQTHw2lj2dPPosquHQR3gTMcpWd/z
 bs/D4lBi2HKbY1GtmeDVHuzJrTjFInVctYvDiobF+9fcDe3PKiZ7P0viAKYa0NLqvkkk
 CaWHQ14/+Qsj0YzMIyeIazqAX8L1+UVwUfL9zf6cMv255gqmzTrwQ7He8xQaCj3JKGmc
 MtQrMmeVSBBatDP0Nzioe+woLiH1+U3O42Ac4j21vsKM/qx6d00X8nRdYM2k015SZ13E
 c4DiMN1AU+lyHk1V36IaanA9dtKosSfmAOXmGxOMaPPXHHmGmgnBCmNf8YAA31iiakf8
 DY7A==
X-Gm-Message-State: AOAM533/WiYkGOLM6EL2yZESyZsHCTm7mQ/BfA7aiW/lCp0e1ABkxH0z
 R8byFq4WQwBbq6vlsv5nwtLo7lXUkC8=
X-Google-Smtp-Source: ABdhPJwmGF+1xgC3Tx/g+tfrsin9eXcPlFZ1sa9rdCJK8pRo3AZqis9moUrG7ZugaU2JF3O/bo7SrQ==
X-Received: by 2002:a63:d252:0:b0:363:271c:fe63 with SMTP id
 t18-20020a63d252000000b00363271cfe63mr1120983pgi.524.1644993551099; 
 Tue, 15 Feb 2022 22:39:11 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-241-140-189.static.tpgi.com.au.
 [60.241.140.189])
 by smtp.gmail.com with ESMTPSA id dw20sm18379814pjb.3.2022.02.15.22.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 22:39:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 1/3] target/ppc: Fix POWER9 DD2.0 PVR, add DD2.1
Date: Wed, 16 Feb 2022 16:39:01 +1000
Message-Id: <20220216063903.1782281-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The POWER9 DD2.0 PVR is incorrect. It doesn't cause problems because
the pvr check is masking it and matching against the base.

Correct it, add a PVR for DD2.1.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1: new patch

 target/ppc/cpu-models.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index 76775a74a9..9902285ac8 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -349,7 +349,8 @@ enum {
     CPU_POWERPC_POWER8NVL_v10      = 0x004C0100,
     CPU_POWERPC_POWER9_BASE        = 0x004E0000,
     CPU_POWERPC_POWER9_DD1         = 0x004E0100,
-    CPU_POWERPC_POWER9_DD20        = 0x004E1200,
+    CPU_POWERPC_POWER9_DD20        = 0x004E0200,
+    CPU_POWERPC_POWER9_DD21        = 0x004E0201,
     CPU_POWERPC_POWER10_BASE       = 0x00800000,
     CPU_POWERPC_POWER10_DD1        = 0x00800100,
     CPU_POWERPC_POWER10_DD20       = 0x00800200,
-- 
2.23.0


