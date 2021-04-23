Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88E369ADC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 21:23:01 +0200 (CEST)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la1OG-0004Fv-9r
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 15:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1la1K7-0002FL-Bh; Fri, 23 Apr 2021 15:18:43 -0400
Received: from [201.28.113.2] (port=29815 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1la1K1-0008Dq-R8; Fri, 23 Apr 2021 15:18:42 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 23 Apr 2021 16:18:32 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 9E85B80139F;
 Fri, 23 Apr 2021 16:18:32 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/4] target/ppc: code motion to compile translate_init
Date: Fri, 23 Apr 2021 16:18:03 -0300
Message-Id: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
X-OriginalArrivalTime: 23 Apr 2021 19:18:32.0779 (UTC)
 FILETIME=[7351D1B0:01D73875]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current patch series aims to isolate common code from translation-related
code. This isolation is required to disable TCG at build time, and the
final system still work.

This patch series is still WIP, so comments are welcome

Bruno Larsen (billionai) (4):
  target/ppc: move opcode table logic to translate.c
  target/ppc: isolated SPR read/write callbacks
  target/ppc: Move SPR generation to separate file
  target/ppc: isolated cpu init from translation logic

 .../ppc/{translate_init.c.inc => cpu_init.c}  | 5414 +----------------
 target/ppc/internal.h                         |  114 +
 target/ppc/meson.build                        |    2 +
 target/ppc/spr_common.c                       | 2943 +++++++++
 target/ppc/spr_tcg.c.inc                      | 1002 +++
 target/ppc/spr_tcg.h                          |  132 +
 target/ppc/translate.c                        |  446 +-
 7 files changed, 4863 insertions(+), 5190 deletions(-)
 rename target/ppc/{translate_init.c.inc => cpu_init.c} (50%)
 create mode 100644 target/ppc/spr_common.c
 create mode 100644 target/ppc/spr_tcg.c.inc
 create mode 100644 target/ppc/spr_tcg.h

-- 
2.17.1


