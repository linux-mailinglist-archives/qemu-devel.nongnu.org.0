Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA19973B0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:38:03 +0200 (CEST)
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LBx-0007jg-GN
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0M-0004UM-UR
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L0L-00080c-5i
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:02 -0400
Received: from ozlabs.org ([203.11.71.1]:60027)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L0K-0007v7-Hq; Wed, 21 Aug 2019 03:26:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46Czj96Bmbz9sNy; Wed, 21 Aug 2019 17:25:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372349;
 bh=0dWKqVmlK2exHuzprTgcVoL1/9FViLIL4ZD9+4OJrYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oEpLNhgDSZdutOA95xMilbrgfWcbi/HzsGw06oEWoZ06uMRKI5heKGuo5eWv57+CX
 wVe0cZ+mxRxzQodRmmDaW2aJOxLbi0s8A+fbAIXruydRbSJwjOvylqd4or2eFXKeXz
 pV07tl4UenkwVoS4I4MDL9eVNKCxPGK8FboxH3M0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:19 +1000
Message-Id: <20190821072542.23090-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 19/42] docs/specs: initial spec summary for
 Ultravisor-related hcalls
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Roth <mdroth@linux.vnet.ibm.com>

For now this only covers hcalls relating to TPM communication since
it's the only one particularly important from a QEMU perspective atm,
but others can be added here where it makes sense.

The full specification for all hcalls/ucalls will eventually be made
available in the public/OpenPower version of the PAPR specification.

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Message-Id: <20190717205842.17827-2-mdroth@linux.vnet.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 docs/specs/ppc-spapr-uv-hcalls.txt | 76 ++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 docs/specs/ppc-spapr-uv-hcalls.txt

diff --git a/docs/specs/ppc-spapr-uv-hcalls.txt b/docs/specs/ppc-spapr-uv=
-hcalls.txt
new file mode 100644
index 0000000000..389c2740d7
--- /dev/null
+++ b/docs/specs/ppc-spapr-uv-hcalls.txt
@@ -0,0 +1,76 @@
+On PPC64 systems supporting Protected Execution Facility (PEF), system
+memory can be placed in a secured region where only an "ultravisor"
+running in firmware can provide to access it. pseries guests on such
+systems can communicate with the ultravisor (via ultracalls) to switch t=
o a
+secure VM mode (SVM) where the guest's memory is relocated to this secur=
ed
+region, making its memory inaccessible to normal processes/guests runnin=
g on
+the host.
+
+The various ultracalls/hypercalls relating to SVM mode are currently
+only documented internally, but are planned for direct inclusion into th=
e
+public OpenPOWER version of the PAPR specification (LoPAPR/LoPAR). An in=
ternal
+ACR has been filed to reserve a hypercall number range specific to this
+use-case to avoid any future conflicts with the internally-maintained PA=
PR
+specification. This document summarizes some of these details as they re=
late
+to QEMU.
+
+=3D=3D hypercalls needed by the ultravisor =3D=3D
+
+Switching to SVM mode involves a number of hcalls issued by the ultravis=
or
+to the hypervisor to orchestrate the movement of guest memory to secure
+memory and various other aspects SVM mode. Numbers are assigned for thes=
e
+hcalls within the reserved range 0xEF00-0xEF80. The below documents the
+hcalls relevant to QEMU.
+
+- H_TPM_COMM (0xef10)
+
+  For TPM_COMM_OP_EXECUTE operation:
+    Send a request to a TPM and receive a response, opening a new TPM se=
ssion
+    if one has not already been opened.
+
+  For TPM_COMM_OP_CLOSE_SESSION operation:
+    Close the existing TPM session, if any.
+
+  Arguments:
+
+    r3 : H_TPM_COMM (0xef10)
+    r4 : TPM operation, one of:
+         TPM_COMM_OP_EXECUTE (0x1)
+         TPM_COMM_OP_CLOSE_SESSION (0x2)
+    r5 : in_buffer, guest physical address of buffer containing the requ=
est
+         - Caller may use the same address for both request and response
+    r6 : in_size, size of the in buffer
+         - Must be less than or equal to 4KB
+    r7 : out_buffer, guest physical address of buffer to store the respo=
nse
+         - Caller may use the same address for both request and response
+    r8 : out_size, size of the out buffer
+         - Must be at least 4KB, as this is the maximum request/response=
 size
+           supported by most TPM implementations, including the TPM Reso=
urce
+           Manager in the linux kernel.
+
+  Return values:
+
+    r3 : H_Success    request processed successfully
+         H_PARAMETER  invalid TPM operation
+         H_P2         in_buffer is invalid
+         H_P3         in_size is invalid
+         H_P4         out_buffer is invalid
+         H_P5         out_size is invalid
+         H_RESOURCE   problem communicating with TPM
+         H_FUNCTION   TPM access is not currently allowed/configured
+    r4 : For TPM_COMM_OP_EXECUTE, the size of the response will be store=
d here
+         upon success.
+
+  Use-case/notes:
+
+    SVM filesystems are encrypted using a symmetric key. This key is the=
n
+    wrapped/encrypted using the public key of a trusted system which has=
 the
+    private key stored in the system's TPM. An Ultravisor will use this
+    hcall to unwrap/unseal the symmetric key using the system's TPM devi=
ce
+    or a TPM Resource Manager associated with the device.
+
+    The Ultravisor sets up a separate session key with the TPM in advanc=
e
+    during host system boot. All sensitive in and out values will be
+    encrypted using the session key. Though the hypervisor will see the =
'in'
+    and 'out' buffers in raw form, any sensitive contents will generally=
 be
+    encrypted using this session key.
--=20
2.21.0


