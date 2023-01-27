Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F305F67E490
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 13:05:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLNST-0004Ut-FA; Fri, 27 Jan 2023 07:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pLNSQ-0004Tx-MF
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:03:50 -0500
Received: from shirlock.uni-paderborn.de ([2001:638:502:c003::15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pLNSO-0004Hw-39
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 07:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q+44jjuysiRFX5aFRmyhl0wB32A6jlALwVpzrp9WNxo=; b=SDVdEussI+6Q3YvecOhvxjaZsD
 foc7cX3l84CUI2ofRAxGuqe/Z5ACscDrd7aLPTYlYisqnu/W8uZ3STwVxeh86Ai2uBAMDJbbQQBUU
 QwcrXsFk/y2HaC+utSKFrfA+/ur/tIN34I6nTeo65cH/0dp8ziEJK5gL+J+vxl6Jp6AM=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de,
	anton.kochkov@proton.me
Subject: [PATCH 0/5] TriCore instruction bugfixes
Date: Fri, 27 Jan 2023 13:03:23 +0100
Message-Id: <20230127120328.2520624-1-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-IMT-Source: Intern
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.1.27.115416, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::15;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=shirlock.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

while resolving [1], I noticed a few more bugs in DEXTR and LD_BU_PREINC which
this patch series fixes. 

I also included the solo patch [1] into this series.

Cheers,
Bastian

[1] https://gitlab.com/qemu-project/qemu/-/issues/653
[2] https://lore.kernel.org/qemu-devel/20230113123759.677960-1-kbastian@mail.uni-paderborn.de/


Bastian Koppelmann (5):
  target/tricore: Fix OPC2_32_RCRW_IMASK translation
  target/tricore: Fix OPC2_32_RCRW_INSERT translation
  target/tricore: Fix RRPW_DEXTR
  target/tricore: Fix OPC2_32_RRRR_DEXTR
  target/tricore: Fix OPC2_32_BO_LD_BU_PREINC

 target/tricore/translate.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

-- 
2.39.1


