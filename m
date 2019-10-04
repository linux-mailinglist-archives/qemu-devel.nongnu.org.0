Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128B9CB77B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 11:40:52 +0200 (CEST)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGK4u-00073y-7Q
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 05:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2C-0004ou-FH
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2B-0004yg-2b
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:00 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51021)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2A-0004va-Gt; Fri, 04 Oct 2019 05:37:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YF4hfZz9sPq; Fri,  4 Oct 2019 19:37:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181873;
 bh=QtLigFzyG5lWATpnB7x5uc2V72hn22nMMiIWruxS/Nw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GJgJSy048GTkWPjwxXF6Udppzg1/DO4tyWDR0pGySS4dFfMB9jX/aEueReFcM2bsa
 vs8FJB1aofv2y9LG0tm/vU+UEX69fVdp+D3ETVZVlzKTs3IpP3W4wBHu0tPB84QWmg
 RM8JgLtYZU7PSung3Vg9YHAjPlbaBMXSJGoMgTOw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 03/53] spapr-tpm-proxy: Drop misleading check
Date: Fri,  4 Oct 2019 19:36:57 +1000
Message-Id: <20191004093747.31350-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, Michael Roth <mdroth@linux.vnet.ibm.com>, aik@ozlabs.ru,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Coverity is reporting in CID 1405304 that tpm_execute() may pass a NULL
tpm_proxy->host_path pointer to open(). This is based on the fact that
h_tpm_comm() does a NULL check on tpm_proxy->host_path and then passes
tpm_proxy to tpm_execute().

The check in h_tpm_comm() is abusive actually since a spapr-proxy-tpm
requires a non NULL host_path property, as checked during realize.

Fixes: 0fb6bd073230
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <156805260916.1779401.11054185183758185247.stgit@bahia.lan>
Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_tpm_proxy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c
index b835d25be6..ca1caec113 100644
--- a/hw/ppc/spapr_tpm_proxy.c
+++ b/hw/ppc/spapr_tpm_proxy.c
@@ -114,7 +114,7 @@ static target_ulong h_tpm_comm(PowerPCCPU *cpu,
         return H_FUNCTION;
     }
=20
-    trace_spapr_h_tpm_comm(tpm_proxy->host_path ?: "null", op);
+    trace_spapr_h_tpm_comm(tpm_proxy->host_path, op);
=20
     switch (op) {
     case TPM_COMM_OP_EXECUTE:
--=20
2.21.0


