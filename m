Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00B51D78C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 14:25:55 +0200 (CEST)
Received: from localhost ([::1]:48880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmx1u-0001Vw-M8
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 08:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nmwvC-0005t1-RH; Fri, 06 May 2022 08:18:58 -0400
Received: from [187.72.171.209] (port=63199 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nmwvB-0005am-1j; Fri, 06 May 2022 08:18:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 6 May 2022 09:18:46 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 21C868000CB;
 Fri,  6 May 2022 09:18:46 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, Joel Stanley <joel@jms.id.au>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [RFC PATCH v2 0/7] VSX MMA Implementation
Date: Fri,  6 May 2022 09:18:37 -0300
Message-Id: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 May 2022 12:18:46.0627 (UTC)
 FILETIME=[6F598330:01D86143]
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

This patch series is an RFC of the Matrix-Multiply Assist (MMA)
instructions implementation from the PowerISA 3.1

These and the VDIV/VMOD implementation are the last new PowerISA 3.1
instructions left to be implemented.

The XVFGER instructions accumulate the exception status and at the end
set the FPSCR and take a Program interrupt on a trap-enabled exception,
but as the exception functions are currently set up in
target/ppc/fpu_helper.c a call to set a FPSCR bit could raise an
exception before all bits could be set and it doesn't set the invalid
operation bits.

Victor is working on a patch series to fix the FPSCR.FI bit that will
reorganize do_float_check_status (in a way that would solve the
aforementioned problem), so for now I sent thin RFC without trying to
solve that problem.

v2 changes:
    - Changed VSXGER, VSXGER16 and XVIGER macros to functions
    - Set rounding mode in floating-point instructions based on RN
      before operations
    - Separated accumulate and with saturations instructions in
      different helpers
    - Used FIELD, FIELD_EX32 and FIELD_DP32 for packing/unpacking masks

Lucas Mateus Castro (alqotel) (7):
  target/ppc: Implement xxm[tf]acc and xxsetaccz
  target/ppc: Implemented xvi*ger* instructions
  target/ppc: Implemented pmxvi*ger* instructions
  target/ppc: Implemented xvf*ger*
  target/ppc: Implemented xvf16ger*
  target/ppc: Implemented pmxvf*ger*
  target/ppc: Implemented [pm]xvbf16ger2*

 include/fpu/softfloat.h             |   9 +
 target/ppc/cpu.h                    |  13 ++
 target/ppc/fpu_helper.c             | 303 ++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  29 +++
 target/ppc/insn32.decode            |  49 +++++
 target/ppc/insn64.decode            |  79 ++++++++
 target/ppc/int_helper.c             | 130 ++++++++++++
 target/ppc/internal.h               |  15 ++
 target/ppc/translate/vsx-impl.c.inc | 145 +++++++++++++
 9 files changed, 772 insertions(+)

-- 
2.31.1


