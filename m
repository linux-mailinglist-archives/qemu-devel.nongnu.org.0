Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA79113A7FB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:09:31 +0100 (CET)
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irK4g-0007PJ-HR
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clement.deschamps@greensocs.com>) id 1irJvn-00084n-En
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:00:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clement.deschamps@greensocs.com>) id 1irJvl-0006Ug-5V
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:00:18 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:39838)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clement.deschamps@greensocs.com>)
 id 1irJvZ-0006Ni-TQ; Tue, 14 Jan 2020 06:00:06 -0500
Received: from chartreuse.bar.greensocs.com (chartreuse.bar.greensocs.com
 [172.16.11.101])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4852196EF0;
 Tue, 14 Jan 2020 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1578999603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cloNL1VrTlkhCC6UnZZJThf+E4DFKBoc5EfntjStdqo=;
 b=dDOPSdNsAQCjW9r/uyr8fBSQgpCH5gpLr1w3zT87aCHwbOmCVj2rNRvFTEGOWj2t9Q4gpp
 pV1LgwkoLNVMbfupY3sLs5Rcpf9N6JgHgxnF1EAqHMjV796GB8+/i8ZYyyKoLELeSKsJ+4
 DjcOtjTrn3byYdVWtzsxjZfJzAXCIjI=
From: Clement Deschamps <clement.deschamps@greensocs.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH] target/arm: add PMU feature to cortex-r5 and cortex-r5f
Date: Tue, 14 Jan 2020 11:59:18 +0100
Message-Id: <20200114105918.2366370-1-clement.deschamps@greensocs.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1578999603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cloNL1VrTlkhCC6UnZZJThf+E4DFKBoc5EfntjStdqo=;
 b=364B+66qvjcdhvbbo0/4rzpG43KCVxq/1nKMyoivs+98cp4HGUsqogsR2dl8yE/zMNs1J1
 6suFj7wP+fkoauhNYUMaTDgyDRyZ5uS0id9ucDtQqqco5lOT7hwQAoHp3+ikkySgYp8h/4
 68jZL4LqhWckL+YY0Pqlr+LsnZa2HsI=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1578999603; a=rsa-sha256; cv=none;
 b=0iUNkvtfSNeovBu0JCjXzcbB0dLQJiEO5/2oKJ/t0/aex51hViz4jH33wMncwuAxiVUifL
 MZteASG+s4VrB3sjkngS000mtxWFhG7TUeCkQ9R8eDXIurvbe+lxvDjSGTKE0EbCDfb9r9
 UZ1iLQpAQY9piNDbqRfhWvHZbZcqa2Q=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Clement Deschamps <clement.deschamps@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Clement Deschamps <clement.deschamps@greensocs.com>
---
See cortex-r5 TRM - 1.3 Features

PMU is not optional on cortex-r5 and cortex-r5f
---
 target/arm/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d62fd5fdc6..64cd0a7d73 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2121,6 +2121,7 @@ static void cortex_r5_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V7);
     set_feature(&cpu->env, ARM_FEATURE_V7MP);
     set_feature(&cpu->env, ARM_FEATURE_PMSA);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->midr =3D 0x411fc153; /* r1p3 */
     cpu->id_pfr0 =3D 0x0131;
     cpu->id_pfr1 =3D 0x001;
--=20
2.24.1


