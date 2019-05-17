Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B4212CE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 06:21:08 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRUMk-0007pQ-Gd
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 00:21:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hRUKa-0006us-9G
	for qemu-devel@nongnu.org; Fri, 17 May 2019 00:18:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hRUKZ-0002dv-8a
	for qemu-devel@nongnu.org; Fri, 17 May 2019 00:18:52 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45147 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hRUKY-0002Oi-0C; Fri, 17 May 2019 00:18:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 454w5Q3pYzz9sBK; Fri, 17 May 2019 14:18:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558066714;
	bh=ktLXqkDC94VTlhMfK/zG3coYvIcnf6/lScKx9mdLL8o=;
	h=From:To:Cc:Subject:Date:From;
	b=ZjuI6jBu3PUwpisaD1gKpL0oNnLQqxN57c0MzN4CqNmwmZhz+rw3DKaJmLcGFtLyg
	5SN6Eid/3K7n/gWCb9r2wrtp3xW26P+GmgavooOJEE0xDRZ2kgEAsG9UROKvz4gxhp
	K7firL+LloujeWgNBCOW/nwDIzb4Ze3ZQidnLw/g=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-ppc@nongnu.org
Date: Fri, 17 May 2019 14:18:23 +1000
Message-Id: <20190517041823.23871-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PATCH] spapr: Add forgotten capability to migration
 stream
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr machine capabilities are supposed to be sent in the migration strea=
m
so that we can sanity check the source and destination have compatible
configuration.  Unfortunately, when we added the hpt-max-page-size
capability, we forgot to add it to the migration state.  This means that =
we
can generate spurious warnings when both ends are configured for large
pages, or potentially fail to warn if the source is configured for huge
pages, but the destination is not.

Fixes: 2309832afda "spapr: Maximum (HPT) pagesize property"

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 1 +
 hw/ppc/spapr_caps.c    | 1 +
 include/hw/ppc/spapr.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8580a8dc67..bcae30ad26 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2125,6 +2125,7 @@ static const VMStateDescription vmstate_spapr =3D {
         &vmstate_spapr_cap_cfpc,
         &vmstate_spapr_cap_sbbc,
         &vmstate_spapr_cap_ibs,
+        &vmstate_spapr_cap_hpt_maxpagesize,
         &vmstate_spapr_irq_map,
         &vmstate_spapr_cap_nested_kvm_hv,
         &vmstate_spapr_dtb,
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 9b1c10baa6..658eb15a14 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -703,6 +703,7 @@ SPAPR_CAP_MIG_STATE(dfp, SPAPR_CAP_DFP);
 SPAPR_CAP_MIG_STATE(cfpc, SPAPR_CAP_CFPC);
 SPAPR_CAP_MIG_STATE(sbbc, SPAPR_CAP_SBBC);
 SPAPR_CAP_MIG_STATE(ibs, SPAPR_CAP_IBS);
+SPAPR_CAP_MIG_STATE(hpt_maxpagesize, SPAPR_CAP_HPT_MAXPAGESIZE);
 SPAPR_CAP_MIG_STATE(nested_kvm_hv, SPAPR_CAP_NESTED_KVM_HV);
 SPAPR_CAP_MIG_STATE(large_decr, SPAPR_CAP_LARGE_DECREMENTER);
 SPAPR_CAP_MIG_STATE(ccf_assist, SPAPR_CAP_CCF_ASSIST);
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 7e32f309c2..9fc91c8f5e 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -849,6 +849,7 @@ extern const VMStateDescription vmstate_spapr_cap_dfp=
;
 extern const VMStateDescription vmstate_spapr_cap_cfpc;
 extern const VMStateDescription vmstate_spapr_cap_sbbc;
 extern const VMStateDescription vmstate_spapr_cap_ibs;
+extern const VMStateDescription vmstate_spapr_cap_hpt_maxpagesize;
 extern const VMStateDescription vmstate_spapr_cap_nested_kvm_hv;
 extern const VMStateDescription vmstate_spapr_cap_large_decr;
 extern const VMStateDescription vmstate_spapr_cap_ccf_assist;
--=20
2.21.0


