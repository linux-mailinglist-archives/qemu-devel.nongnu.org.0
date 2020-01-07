Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495BD131EC1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 06:07:48 +0100 (CET)
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iogtV-0003JE-OP
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 23:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iognI-0005Kg-Ao
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iognH-0004ch-9C
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 23:48:40 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34477 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iognG-0004Vu-VC; Mon, 06 Jan 2020 23:48:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47sKdX1c7qz9sRf; Tue,  7 Jan 2020 15:48:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1578372512;
 bh=TfQTmXYbC8QhW9e6z4YK15NqUFRWl/4wKLoSPI7wBfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XnO7c4g4M44yHzlm8HFUJdT1t8yBD1JJUIv4f/H6ea5UdulOLl/a0Fj/x4pA4k8tx
 cX5jQEHsEuRUvezFlGXaqYdNdU7jRbzmej68JtpD3KVwrjqt05HCssABHpYi6RRTPH
 zXOYuFc3RYQ7NisC2MjmKy7sDlhDI3uJwseIJpZg=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	groug@kaod.org,
	philmd@redhat.com,
	clg@kaod.org
Subject: [PATCH v2 01/10] ppc: Drop PPC_EMULATE_32BITS_HYPV stub
Date: Tue,  7 Jan 2020 15:48:18 +1100
Message-Id: <20200107044827.471355-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107044827.471355-1-david@gibson.dropbear.id.au>
References: <20200107044827.471355-1-david@gibson.dropbear.id.au>
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
Cc: lvivier@redhat.com, aik@ozlabs.ru,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 paulus@samba.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only effect of the PPC_EMULATE_32BITS_HYPV define is to change how
MSR_HVB is defined.  This appears to be something to handle hypervisor mo=
de
for 32-bit CPUs, but there's really no other code to handle this.  The
MSR_THV bit, which it uses is implemented for no cpus we model.

It's unlikely anyone is going to implement this any time soon, so just dr=
op
it.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 103bfe9dc2..2de9e2fa2b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -26,8 +26,6 @@
 #include "exec/cpu-defs.h"
 #include "cpu-qom.h"
=20
-/* #define PPC_EMULATE_32BITS_HYPV */
-
 #define TCG_GUEST_DEFAULT_MO 0
=20
 #define TARGET_PAGE_BITS_64K 16
@@ -450,14 +448,9 @@ typedef struct ppc_v3_pate_t {
 #define MSR_HVB (1ULL << MSR_SHV)
 #define msr_hv  msr_shv
 #else
-#if defined(PPC_EMULATE_32BITS_HYPV)
-#define MSR_HVB (1ULL << MSR_THV)
-#define msr_hv  msr_thv
-#else
 #define MSR_HVB (0ULL)
 #define msr_hv  (0)
 #endif
-#endif
=20
 /* DSISR */
 #define DSISR_NOPTE              0x40000000
--=20
2.24.1


