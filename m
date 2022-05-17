Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C98652AB11
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:44:00 +0200 (CEST)
Received: from localhost ([::1]:44500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2Ah-0006MK-W9
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nr251-0003P3-M9; Tue, 17 May 2022 14:37:59 -0400
Received: from [187.72.171.209] (port=26849 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nr24y-00064z-7M; Tue, 17 May 2022 14:37:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 15:37:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D5316800603;
 Tue, 17 May 2022 15:37:36 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 0/8] VSX MMA Implementation
Date: Tue, 17 May 2022 15:37:27 -0300
Message-Id: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 18:37:37.0106 (UTC)
 FILETIME=[2E509B20:01D86A1D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Based-on: <20220517161522.36132-1-victor.colombo@eldorado.org.br>

This patch series is a patch series of the Matrix-Multiply Assist (MMA)
instructions implementation from the PowerISA 3.1

These and the VDIV/VMOD implementation are the last new PowerISA 3.1
instructions left to be implemented.

The XVFGER instructions accumulate the exception status and at the end
set the FPSCR and take a Program interrupt on a trap-enabled exception,
previous versions were based on Victor's rework of FPU exceptions, but
as that patch was rejected this version worked around the fact that
OX/UX/XX and invalid instructions were handled in different functions
by disabling all enable bits then re-enabling them and calling the mtfsf
deferred exception helper.

Patches without review: 3, 4, 5

v3 changes:
    - GER helpers now use ppc_acc_t instead of ppc_vsr_t for passing acc
    - Removed do_ger_XX3 and updated the decodetree to pass the masks in
      32 bits instructions
    - Removed unnecessary rounding mode function
    - Moved float32_neg to fpu_helper.c and renamed it bfp32_negate to
      make it clearer that it's a 32 bit version of the PowerISA
      bfp_NEGATE
    - Negated accumulation now a subtraction
    - Changed exception handling by disabling all enable FPSCR enable
      bits to set all FPSCR bits (except FEX) correctly, then re-enable
      them and call do_fpscr_check_status to raise the exception
      accordingly and set FEX if necessary

v2 changes:
    - Changed VSXGER, VSXGER16 and XVIGER macros to functions
    - Set rounding mode in floating-point instructions based on RN
      before operations
    - Separated accumulate and with saturation instructions in
      different helpers
    - Used FIELD, FIELD_EX32 and FIELD_DP32 for packing/unpacking masks

Joel Stanley (1):
  linux-user: Add PowerPC ISA 3.1 and MMA to hwcap

Lucas Mateus Castro (alqotel) (7):
  target/ppc: Implement xxm[tf]acc and xxsetaccz
  target/ppc: Implemented xvi*ger* instructions
  target/ppc: Implemented pmxvi*ger* instructions
  target/ppc: Implemented xvf*ger*
  target/ppc: Implemented xvf16ger*
  target/ppc: Implemented pmxvf*ger*
  target/ppc: Implemented [pm]xvbf16ger2*

 linux-user/elfload.c                |   4 +
 target/ppc/cpu.h                    |  13 ++
 target/ppc/fpu_helper.c             | 325 +++++++++++++++++++++++++++-
 target/ppc/helper.h                 |  33 +++
 target/ppc/insn32.decode            |  52 +++++
 target/ppc/insn64.decode            |  79 +++++++
 target/ppc/int_helper.c             | 130 +++++++++++
 target/ppc/internal.h               |  15 ++
 target/ppc/translate/vsx-impl.c.inc | 130 +++++++++++
 9 files changed, 779 insertions(+), 2 deletions(-)

-- 
2.31.1


