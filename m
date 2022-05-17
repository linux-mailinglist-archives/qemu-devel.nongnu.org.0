Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F8252A89C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:52:11 +0200 (CEST)
Received: from localhost ([::1]:57086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0QW-0001eq-UH
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nr0Mh-0007Mt-B2; Tue, 17 May 2022 12:48:07 -0400
Received: from [187.72.171.209] (port=63178 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nr0Mf-0006ji-Ox; Tue, 17 May 2022 12:48:06 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 13:47:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 240D9800603;
 Tue, 17 May 2022 13:47:59 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH RESEND 00/10] BCDA and mffscdrn implementations
Date: Tue, 17 May 2022 13:47:34 -0300
Message-Id: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 16:47:59.0419 (UTC)
 FILETIME=[DDB538B0:01D86A0D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set of patches containing implementations for some instructions that
were missing before. Also, moves some related instructions to
decodetree.

Rebased against current master and resend

Matheus Ferst (4):
  target/ppc: Add flag for ISA v2.06 BCDA instructions
  target/ppc: implement addg6s
  target/ppc: implement cbcdtd
  target/ppc: implement cdtbcd

Víctor Colombo (6):
  target/ppc: Fix insn32.decode style issues
  target/ppc: Move mffs[.] to decodetree
  target/ppc: Move mffsl to decodetree
  target/ppc: Move mffsce to decodetree
  target/ppc: Move mffscrn[i] to decodetree
  target/ppc: Implement mffscdrn[i] instructions

 target/ppc/cpu.h                           |   4 +-
 target/ppc/cpu_init.c                      |   9 +-
 target/ppc/dfp_helper.c                    |  65 ++++++++
 target/ppc/helper.h                        |   2 +
 target/ppc/insn32.decode                   |  55 +++++--
 target/ppc/internal.h                      |   3 -
 target/ppc/translate/fixedpoint-impl.c.inc |  49 ++++++
 target/ppc/translate/fp-impl.c.inc         | 168 ++++++++++-----------
 target/ppc/translate/fp-ops.c.inc          |   9 --
 9 files changed, 245 insertions(+), 119 deletions(-)

-- 
2.25.1


