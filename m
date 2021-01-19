Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C40C2FB15C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:26:52 +0100 (CET)
Received: from localhost ([::1]:33872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kTa-00032q-Mb
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQb-0001D6-Dh; Tue, 19 Jan 2021 01:23:45 -0500
Received: from ozlabs.org ([203.11.71.1]:36789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQW-0000LS-A3; Tue, 19 Jan 2021 01:23:45 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrW37SDz9sWV; Tue, 19 Jan 2021 17:23:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037403;
 bh=xxmvz4OB5N2cFqIicRajYQ8j7Dwknrym5stSSTgyNMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MSpQhUPx3pS26iGfF5kF8z2fVVCvDI3LY9EEXmJ8FKJ6Am9RpY+sAcUCGQuWxZc37
 bhw6GpAgzqt+o26wtM1cGWwIwE1zMepMaSSWrET/tNvlhrbXwRi9f88feGBvLjzRtj
 eS3bud1KxANymPTf9keQ5IwVC428HX8s/uIhBfl8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 03/13] hw/intc/ppc-uic: Make default dcr-base 0xc0, not 0x30
Date: Tue, 19 Jan 2021 17:23:08 +1100
Message-Id: <20210119062318.13857-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

In commit 34d0831f38fd8 the ppc-uic device was added, with a dcr-base
property. The intention was that the default value of dcr-base should be
the one that most of our boards need, so that in the common case they
don't need to specify a property value.

All QEMU boards with a UIC use a dcr-base of 0xc0, with the exception of
sam460ex which has four UICs and so puts them at 0xc0, 0xd0, 0xe0, 0xf0.
So 0xc0 is the obvious right choice for the default dcr-base.

The board code conversions in commits 0270d74ef88623505 (bamboo) and
c5ac9dc64fa552a6 (virtex_ml507) assumed that default was 0xc0. Unfortunately
the actual default in 34d0831f38fd8 was 0x30, by mistake, so the
bamboo and virtex_ml507 boards were broken as they were converted
away from ppcuic_init() (which always specifies the dcr_base property
value explicitly).

Set the default dcr-base to 0xc0 as was intended, fixing bamboo and
virtex_ml507.

Fixes: 34d0831f38fd8
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210111213007.7381-1-peter.maydell@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/ppc-uic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
index b21951eea8..7171de7b35 100644
--- a/hw/intc/ppc-uic.c
+++ b/hw/intc/ppc-uic.c
@@ -274,7 +274,7 @@ static void ppc_uic_realize(DeviceState *dev, Error **errp)
 
 static Property ppc_uic_properties[] = {
     DEFINE_PROP_LINK("cpu", PPCUIC, cpu, TYPE_CPU, CPUState *),
-    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0x30),
+    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0xc0),
     DEFINE_PROP_BOOL("use-vectors", PPCUIC, use_vectors, true),
     DEFINE_PROP_END_OF_LIST()
 };
-- 
2.29.2


