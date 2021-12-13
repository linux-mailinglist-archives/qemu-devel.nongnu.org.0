Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08B472C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 13:14:58 +0100 (CET)
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwkEL-0000bm-Eb
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 07:14:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mwkAH-0006uu-RO; Mon, 13 Dec 2021 07:10:46 -0500
Received: from [201.28.113.2] (port=36754 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mwkAD-0008FP-In; Mon, 13 Dec 2021 07:10:43 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 13 Dec 2021 09:10:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D24F1800A5A;
 Mon, 13 Dec 2021 09:10:34 -0300 (-03)
From: Victor Colombo <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 0/4] target/ppc: Fix VSX instructions register access
Date: Mon, 13 Dec 2021 09:09:54 -0300
Message-Id: <20211213120958.24443-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Dec 2021 12:10:35.0256 (UTC)
 FILETIME=[6EFC3F80:01D7F01A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instructions xscvqpdp, xsmaxcdp, xsmincdp, xsmaxjdp, and xsminjdp are
using the wrong registers, which yields the wrong result when using
them.

This patch series fixes this issue by correcting the registers used.
It also takes the opportunity to move these instructions to decodetree.

v2:
- Change ISA310 flag to ISA300 in xscvqpdp

Matheus Ferst (2):
  target/ppc: fix xscvqpdp register access
  target/ppc: move xscvqpdp to decodetree

Victor Colombo (2):
  target/ppc: Fix xs{max,min}[cj]dp to use VSX registers
  target/ppc: Move xs{max,min}[cj]dp to decodetree

 target/ppc/fpu_helper.c             | 14 +++-----
 target/ppc/helper.h                 | 10 +++---
 target/ppc/insn32.decode            | 21 +++++++++--
 target/ppc/translate/vsx-impl.c.inc | 55 +++++++++++++++++++++--------
 target/ppc/translate/vsx-ops.c.inc  |  5 ---
 5 files changed, 68 insertions(+), 37 deletions(-)

-- 
2.25.1


