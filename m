Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F20248A5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 09:03:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47860 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSyng-00027m-4n
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 03:03:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHv-0006TF-70
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHt-0008Kt-UM
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:15 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:51791)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyHt-0007vL-Ds; Tue, 21 May 2019 02:30:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qpj4NKkz9sP6; Tue, 21 May 2019 16:29:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420173;
	bh=KAhfRGXxmk0mvhBDeynaZTAXX7FnxsaPZJh4L/X8UYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZltNME+zk40ip5o8v8ZDmnT7BINBvU6NI7G5YZ7W1xfLe+7IHwN8ix/IqWyhiD1h
	VrcSOvawd8HWrdlQAff422Jl+4nPYsJopRTuua5FGR0lJaiADPv8zkN5PNaFd/62qW
	aTXN5OYf1Cf71rUm1gSz55QcQV5o0DRAVhF2wzFg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:29:07 +1000
Message-Id: <20190521062924.6930-22-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, gkurz@kaod.org, qemu-devel@nongnu.org,
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


