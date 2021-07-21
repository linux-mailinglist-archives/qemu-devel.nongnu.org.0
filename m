Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390BF3D0F65
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:22:30 +0200 (CEST)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CBB-0005lD-8t
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joerg@thalheim.io>) id 1m6AVo-00017R-Om
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:35:40 -0400
Received: from mail.thalheim.io ([2a01:4f9:2b:1605::1]:48713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joerg@thalheim.io>) id 1m6AVm-0005ZY-Ui
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:35:40 -0400
Received: from mail.thalheim.io (eve.i [IPv6:2a01:4f9:2b:1605::1])
 by mail.thalheim.io (Postfix) with ESMTPSA id DAECACD5906;
 Wed, 21 Jul 2021 11:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thalheim.io; s=default;
 t=1626867334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5OXGRc6wfrw7X7F+YU/YxUsctjAJSGLSyJtLGARM14w=;
 b=VFZbtvWS1HkrI0DMCt8BFCMP327RXiQJ6sZ1FPXYn5RGUe5GJaos5AhzVd141FGebWLiHC
 dYFaxbax2iIzoxm157hx8xNQncAzSmxiQL955lNF7hzpetODPmtuc8ij8f6/qUsdJhqqJJ
 WkieFc3RxjChN+gpN1lnx29pZosAlS0=
MIME-Version: 1.0
Date: Wed, 21 Jul 2021 11:35:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.16.0
From: "=?utf-8?B?SsO2cmcgVGhhbGhlaW0=?=" <joerg@thalheim.io>
Message-ID: <0b3132692ee53e98082b4dd12e41b4a3@thalheim.io>
Subject: [PATCH] hw/i386: fix phys-bits on cpus with AMD SEV/SMD
To: qemu-devel@nongnu.org
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=joerg@higgsboson.tk smtp.mailfrom=joerg@thalheim.io
Received-SPF: pass client-ip=2a01:4f9:2b:1605::1;
 envelope-from=joerg@thalheim.io; helo=mail.thalheim.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Jul 2021 09:19:24 -0400
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
Cc: okelmann@in.tum.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On AMD machines with SEV/SMD the physical address space needs
to be reduced by a number of bits. Linux does this correctly
and shows this information in /proc/cpuinfo. CPUID set by qemu
however reports too big physical addresses i.e. 48 bit instead of 43.

This patch has been tested on both Intel and AMD.

Signed-off-by: J=C3=B6rg Thalheim <joerg@thalheim.io>
---
target/i386/host-cpu.c | 23 ++++++++++++++++++++---
1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
index 4ea9e354ea..0fb98ca566 100644
--- a/target/i386/host-cpu.c
+++ b/target/i386/host-cpu.c
@@ -13,22 +13,39 @@
#include "qapi/error.h"
#include "sysemu/sysemu.h"

+static uint32_t sme_sev_bits(void) {
+ uint32_t eax, ebx;
+ // get AMD Encrypted Memory Capabilities information according to AMD d=
oc 24594=E2=80=94Rev. 3.32
+ host_cpuid(0x8000001f, 0, &eax, &ebx, NULL, NULL);
+ // bits:
+ // 0:1 SME
+ // 1:2 SEV
+ // ...
+ if (eax & 1 || eax & 2) {
+ // bits:
+ // 11:6 PhysAddrReduction
+ return (ebx >> 6) & 0x3f;
+ } else {
+ return 0;
+ }
+}
+
/* Note: Only safe for use on x86(-64) hosts */
static uint32_t host_cpu_phys_bits(void)
{
- uint32_t eax;
+ uint32_t eax, ebx;
uint32_t host_phys_bits;

host_cpuid(0x80000000, 0, &eax, NULL, NULL, NULL);
if (eax >=3D 0x80000008) {
- host_cpuid(0x80000008, 0, &eax, NULL, NULL, NULL);
+ host_cpuid(0x80000008, 0, &eax, &ebx, NULL, NULL);
/*
* Note: According to AMD doc 25481 rev 2.34 they have a field
* at 23:16 that can specify a maximum physical address bits for
* the guest that can override this value; but I've not seen
* anything with that set.
*/
- host_phys_bits =3D eax & 0xff;
+ host_phys_bits =3D (eax & 0xff) - sme_sev_bits();
} else {
/*
* It's an odd 64 bit machine that doesn't have the leaf for
--=20
2.32.0

