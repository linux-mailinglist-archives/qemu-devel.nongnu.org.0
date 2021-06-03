Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C63399CA9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:36:41 +0200 (CEST)
Received: from localhost ([::1]:34344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiqG-0005nO-37
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidO-00076o-0A; Thu, 03 Jun 2021 04:23:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33271 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidM-00006R-6r; Thu, 03 Jun 2021 04:23:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5m1GWRz9sjD; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708556;
 bh=w6/y2CGUVXvjb9ePeAHCk8KLGaE7zKPrFYuBQTcPxzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G2FN3aGwUFUjz8XdQkwnlfSmJGIslQDs6x7v6C3iyth7OXui6pgi6uy5RXrrBaEVT
 qCBLlCwHAWpo0eLHz0OG/wtv1o4Ev7Sovi2PSoiKY3CpCYA8qluw7eIuEkW3yCHywc
 mKMq/tTNv9TJEse9qB922GP5UFv1qRP5rl8e6/PU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 15/42] target/ppc: updated meson.build to support disable-tcg
Date: Thu,  3 Jun 2021 18:22:04 +1000
Message-Id: <20210603082231.601214-16-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

updated build file to not compile some sources that are unnecessary if
TCG is disabled on the system.

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210525115355.8254-5-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 848e625302..a6a53a8d5c 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -3,11 +3,14 @@ ppc_ss.add(files(
   'cpu-models.c',
   'cpu.c',
   'cpu_init.c',
-  'dfp_helper.c',
   'excp_helper.c',
-  'fpu_helper.c',
   'gdbstub.c',
   'helper_regs.c',
+))
+
+ppc_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'dfp_helper.c',
+  'fpu_helper.c',
   'int_helper.c',
   'mem_helper.c',
   'misc_helper.c',
-- 
2.31.1


