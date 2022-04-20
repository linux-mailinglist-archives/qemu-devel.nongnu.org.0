Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDDC509139
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 22:12:48 +0200 (CEST)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGgw-00074q-Tc
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 16:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhGBz-0004id-GR; Wed, 20 Apr 2022 15:40:47 -0400
Received: from [187.72.171.209] (port=35275 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nhGBx-0007El-Nu; Wed, 20 Apr 2022 15:40:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Apr 2022 16:40:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E9C49800059;
 Wed, 20 Apr 2022 16:40:38 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 0/9] VDIV/VMOD Implementation
Date: Wed, 20 Apr 2022 16:40:28 -0300
Message-Id: <20220420194037.263661-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Apr 2022 19:40:39.0129 (UTC)
 FILETIME=[836C4490:01D854EE]
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

This patch series is an implementation of the vector divide, vector
divide extended and vector modulo instructions from PowerISA 3.1

The first patch are Matheus' patch, used here since the divs256 and
divu256 functions use int128_urshift.

Patches without review: 2, 4, 5 and 8

v3 changes:
    - Divided DO_VDIV_VMOD macro in 4 different new macros
    - Turned TRANS_VDIV_VMOD into a function and the instructions are
      now implemented with the TRANS macro and do_vdiv_vmod function
    - Moved clz128 to int128.h

v2 changes:
    - Dropped int128_lshift patch
    - Added missing int_min/-1 check
    - Changed invalid division to a division by 1
    - Created new macro responsible for invalid division check
      (replacing DIV_VEC, REM_VEC and the check in dives_i32/diveu_i32)
    - Turned GVecGen3 array into single element

Lucas Mateus Castro (alqotel) (8):
  target/ppc: Implemented vector divide instructions
  target/ppc: Implemented vector divide quadword
  target/ppc: Implemented vector divide extended word
  host-utils: Implemented unsigned 256-by-128 division
  host-utils: Implemented signed 256-by-128 division
  target/ppc: Implemented remaining vector divide extended
  target/ppc: Implemented vector module word/doubleword
  target/ppc: Implemented vector module quadword

Matheus Ferst (1):
  qemu/int128: add int128_urshift

 include/qemu/host-utils.h           |   3 +
 include/qemu/int128.h               |  57 +++++++++
 target/ppc/helper.h                 |   8 ++
 target/ppc/insn32.decode            |  23 ++++
 target/ppc/int_helper.c             | 106 ++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 155 ++++++++++++++++++++++++
 tests/unit/test-int128.c            |  32 +++++
 util/host-utils.c                   | 180 ++++++++++++++++++++++++++++
 8 files changed, 564 insertions(+)

-- 
2.31.1


