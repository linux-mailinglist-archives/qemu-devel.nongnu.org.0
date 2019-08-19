Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B78924F1
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 15:27:43 +0200 (CEST)
Received: from localhost ([::1]:51366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzhhG-0003aR-Q7
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 09:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41826)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <owen.si@ucloud.cn>) id 1hzeiw-0007YZ-ST
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <owen.si@ucloud.cn>) id 1hzeit-0006g0-WC
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:17:13 -0400
Received: from m9785.mail.qiye.163.com ([220.181.97.85]:10558)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <owen.si@ucloud.cn>) id 1hzeit-0006d7-Lx
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 06:17:11 -0400
Received: from localhost.localdomain (unknown [120.132.1.230])
 by m9785.mail.qiye.163.com (Hmail) with ESMTPA id 526C15C19D2
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 18:11:41 +0800 (CST)
From: Bingsong Si <owen.si@ucloud.cn>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 18:09:24 +0800
Message-Id: <20190819100924.14968-1-owen.si@ucloud.cn>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VPTkpCQkJNTU9IS01NT1lXWShZQU
 lCN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MxA6Shw5KTg*CzgeMAoaGjwv
 PxwwCxNVSlVKTk1NSUtCTktKTkxLVTMWGhIXVRQMHhVVCBI7DhgXFA4fVRgVRVlXWRILWUFZSklL
 VUpISVVKVUlIS1lXWQgBWUFKTkNONwY+
X-HM-Tid: 0a6ca95c68b52087kuqy526c15c19d2
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.97.85
X-Mailman-Approved-At: Mon, 19 Aug 2019 09:23:44 -0400
Subject: [Qemu-devel] [PATCH] Revert "i386: correct cpu_x86_cpuid(0xd)"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit de2e68c902f7b6e438b0fa3cfedd74a06a20704f.

Initial value of env->xcr0 =3D=3D 0, then CPUID(EAX=3D0xd,ECX=3D0).EBX =3D=
=3D 0, after kvm
upstream commit 412a3c41, It is ok.
On host before commit 412a3c41, some legacy guest, i.e. CentOS 6, get
xstate_size =3D=3D 0, will crash the guest.

Signed-off-by: Bingsong Si <owen.si@ucloud.cn>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ff65e11008..69562e21ed 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4416,7 +4416,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index=
, uint32_t count,
             *ecx =3D xsave_area_size(x86_cpu_xsave_components(cpu));
             *eax =3D env->features[FEAT_XSAVE_COMP_LO];
             *edx =3D env->features[FEAT_XSAVE_COMP_HI];
-            *ebx =3D xsave_area_size(env->xcr0);
+            *ebx =3D *ecx;
         } else if (count =3D=3D 1) {
             *eax =3D env->features[FEAT_XSAVE];
         } else if (count < ARRAY_SIZE(x86_ext_save_areas)) {
--=20
2.22.0


