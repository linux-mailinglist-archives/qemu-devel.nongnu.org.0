Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5792E4703DE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:29:46 +0100 (CET)
Received: from localhost ([::1]:33792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvhqD-0006mc-FK
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:29:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mvgww-0004aN-HE; Fri, 10 Dec 2021 09:32:38 -0500
Received: from [201.28.113.2] (port=6297 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1mvgwt-0002Cy-Rd; Fri, 10 Dec 2021 09:32:38 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 10 Dec 2021 11:13:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6323B8009F6;
 Fri, 10 Dec 2021 11:13:52 -0300 (-03)
From: Victor Colombo <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 0/4] target/ppc: Fix VSX instructions register access
Date: Fri, 10 Dec 2021 11:13:43 -0300
Message-Id: <20211210141347.38603-1-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Dec 2021 14:13:52.0748 (UTC)
 FILETIME=[28FEB2C0:01D7EDD0]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 10 Dec 2021 10:20:18 -0500
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
Cc: danielhb413@gmail.com, groug@kaod.org,
 Victor Colombo <victor.colombo@eldorado.org.br>, clg@kaod.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instructions xscvqpdp, xsmaxcdp, xsmincdp, xsmaxjdp, and xsminjdp are
using the wrong registers, which yields the wrong result when using
them.

This patch series fixes this issue by correcting the registers used.
It also takes the opportunity to move these instructions to decodetree.

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


