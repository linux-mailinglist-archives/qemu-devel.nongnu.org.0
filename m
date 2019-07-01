Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBF21FBD8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 22:56:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hR0wR-0001Hb-Us
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 16:55:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0rV-0005vt-Fr
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:50:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0rT-0001FV-JF
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:50:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hR0rR-0001Cy-K8
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:50:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74B9944FB1;
	Wed, 15 May 2019 20:50:47 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 89D625C557;
	Wed, 15 May 2019 20:50:46 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 May 2019 22:50:18 +0200
Message-Id: <1557953433-19663-7-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
References: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 15 May 2019 20:50:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/21] hvf: Add missing break statement
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
Cc: Chen Zhang <tgfbeta@me.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Zhang via Qemu-devel <qemu-devel@nongnu.org>

In target/i386/hvf/hvf.c, a break statement was probably missing in
`hvf_vcpu_exec()`, in handling EXIT_REASON_HLT.

These lines seemed to be equivalent to `kvm_handle_halt()`.

Signed-off-by: Chen Zhang <tgfbeta@me.com>
Message-Id: <087F1D9C-109D-41D1-BE2C-CE5D840C981B@me.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 42f9447..2751c81 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -708,6 +708,7 @@ int hvf_vcpu_exec(CPUState *cpu)
                 !(idtvec_info & VMCS_IDT_VEC_VALID)) {
                 cpu->halted =3D 1;
                 ret =3D EXCP_HLT;
+                break;
             }
             ret =3D EXCP_INTERRUPT;
             break;
--=20
1.8.3.1



