Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF325DB9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:39:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJyg-0000CC-0Z
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:39:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJAT-0004l2-9z
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJAS-0007Zk-7P
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:57 -0400
Received: from ozlabs.org ([203.11.71.1]:57913)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJAR-0007JR-Sy; Wed, 22 May 2019 00:47:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T403f7z9sRD; Wed, 22 May 2019 14:46:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500376;
	bh=KAhfRGXxmk0mvhBDeynaZTAXX7FnxsaPZJh4L/X8UYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OPewhcKyPDLuO2taoFPdqkH5/sMajerrl5VzYB1U/Xo6izNSTA0LfV/vVj20byMdF
	hZvBtDFyQuQyDkG0Dusz9aE+H3cT70MB7lq7nfieqK3/A0PUmgoglIXoLafSn2jC9c
	RDca9yDtvZ3bJSK/kyilneAMktWf902B3C1W8pfk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:43 +1000
Message-Id: <20190522044600.16534-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 21/38] spapr: Add forgotten capability to
 migration stream
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
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


