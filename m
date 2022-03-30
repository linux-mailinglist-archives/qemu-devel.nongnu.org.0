Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E24ECDF5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 22:29:55 +0200 (CEST)
Received: from localhost ([::1]:44706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZewz-0006jO-NS
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 16:29:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeuA-00040K-2P; Wed, 30 Mar 2022 16:26:58 -0400
Received: from [187.72.171.209] (port=8867 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1nZeu8-0001WS-C2; Wed, 30 Mar 2022 16:26:57 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 30 Mar 2022 17:25:33 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D40D78002AF;
 Wed, 30 Mar 2022 17:25:32 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 00/10] VDIV/VMOD Implementation
Date: Wed, 30 Mar 2022 17:25:05 -0300
Message-Id: <20220330202515.66554-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 30 Mar 2022 20:25:33.0286 (UTC)
 FILETIME=[4E974060:01D84474]
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

The first 2 patches are Matheus' patches used here since the divs256 and
divu256 functions use int128_lshift and int128_urshift.

Lucas Mateus Castro (alqotel) (8):
  target/ppc: Implemented vector divide instructions
  target/ppc: Implemented vector divide quadword
  target/ppc: Implemented vector divide extended word
  Implemented unsigned 256-by-128 division
  Implemented signed 256-by-128 division
  target/ppc: Implemented remaining vector divide extended
  target/ppc: Implemented vector module word/doubleword
  target/ppc: Implemented vector module quadword

Matheus Ferst (2):
  qemu/int128: avoid undefined behavior in int128_lshift
  qemu/int128: add int128_urshift

 include/qemu/host-utils.h           |  16 +++
 include/qemu/int128.h               |  53 +++++++-
 target/ppc/helper.h                 |   8 ++
 target/ppc/insn32.decode            |  23 ++++
 target/ppc/int_helper.c             | 109 +++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 148 +++++++++++++++++++++++
 tests/unit/test-int128.c            |  32 +++++
 util/host-utils.c                   | 179 ++++++++++++++++++++++++++++
 8 files changed, 566 insertions(+), 2 deletions(-)

-- 
2.31.1


