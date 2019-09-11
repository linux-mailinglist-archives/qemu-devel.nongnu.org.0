Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DAAF4CE
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 06:08:30 +0200 (CEST)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7tvg-0003MB-Pj
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 00:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i7tsW-0000Tq-2G
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 00:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i7tsU-0002v9-JF
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 00:05:11 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:38643 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i7tsU-0002oS-5M; Wed, 11 Sep 2019 00:05:10 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46SpFh35nkz9sPK; Wed, 11 Sep 2019 14:04:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1568174696;
 bh=uLh2TErb7o3yTJbd+R/IE8x2VY0Sd7delo2pPs+T6HQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YOImvHkMBRO8DyMCaYBR0XpP+7BClvCE6lTWZ/chlGZbZjIMZoDHgY6lD72DS2n6E
 PdL3s0Jg+naCmCDt0ytG+5cijaMdCsn93wzk1BAP+BcMCum1eeT6fzhDlLajjPV61s
 o9LRJ14lYy9KMWDK7ENkSnvyw5WdsDgfYjggvc0s=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Wed, 11 Sep 2019 14:04:48 +1000
Message-Id: <20190911040452.8341-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911040452.8341-1-david@gibson.dropbear.id.au>
References: <20190911040452.8341-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PATCH 3/7] spapr: Fixes a leak in CAS
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, groug@kaod.org, clg@kaod.org,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

Add a missing g_free(fdt) if the resulting tree is bigger
than the space allocated by SLOF.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e03e874d94..d93dacd483 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1024,6 +1024,7 @@ int spapr_h_cas_compose_response(SpaprMachineState =
*spapr,
     _FDT((fdt_pack(fdt)));
=20
     if (fdt_totalsize(fdt) + sizeof(hdr) > size) {
+        g_free(fdt);
         trace_spapr_cas_failed(size);
         return -1;
     }
--=20
2.21.0


