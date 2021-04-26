Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94A136B628
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:52:21 +0200 (CEST)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb3X3-0003Nm-1g
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lb3Vx-0002lP-B3; Mon, 26 Apr 2021 11:51:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53883
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lb3Vu-0000Vn-Ap; Mon, 26 Apr 2021 11:51:13 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFWsBE079691; Mon, 26 Apr 2021 11:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=jmAjgvSEs1LtRh/xTR+mlse3fDpiCbVkdi7ywgjKClo=;
 b=BOfQ21MNGdiVHuYILOxckjflA8V6LtKYFYd1D0CYdenj1XQUTZUbYnDi7vMOJI5jfATB
 DlAMqsWuOVy1635HSjQ8+OhMfGbJRsayZ9Wl/uq7QqpAfst7baN8cc7sJYH1n3EqVLG1
 gWEEQuN5VGy7cKCqbCy2cD1MAjv5WEl3fxKjgSCjhuyc60vkZkduNZDVb8M+y0rolAEs
 3/oGLmxjEHJJ8VM/lNGAvfEIINtNB/56i+4I6UXTSDV/u/o+K+KHI55ibXIkgh53qVx6
 bLv2oU1ZQ8ZWGcIgenSUkoF5YrG8kS1Y4buZtXV3m7CVLUAJyt+te0X25qucCO3Ckcfa 9A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 385yymhase-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 11:50:59 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13QFnKvL030286;
 Mon, 26 Apr 2021 15:50:58 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 384ay9b088-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 15:50:58 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13QFovg923200240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 15:50:57 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5CBA112063;
 Mon, 26 Apr 2021 15:50:57 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3E02112061;
 Mon, 26 Apr 2021 15:50:56 +0000 (GMT)
Received: from localhost (unknown [9.163.28.241])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Apr 2021 15:50:56 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v3] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
In-Reply-To: <YHkIHYx77a2XHMQN@yekko.fritz.box>
References: <20210414145947.30155-1-bruno.larsen@eldorado.org.br>
 <74b629d5-0b7f-e53c-2d2c-29de23c564b7@linaro.org>
 <YHkIHYx77a2XHMQN@yekko.fritz.box>
Date: Mon, 26 Apr 2021 12:50:54 -0300
Message-ID: <87sg3d2gf5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CI9GOeJXTrCX9u-PF5tt6cRA_lmMglXU
X-Proofpoint-GUID: CI9GOeJXTrCX9u-PF5tt6cRA_lmMglXU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104260121
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Gibson <david@gibson.dropbear.id.au> writes:

> On Wed, Apr 14, 2021 at 01:09:19PM -0700, Richard Henderson wrote:
>> On 4/14/21 7:59 AM, Bruno Larsen (billionai) wrote:
>> > All the code related to gdb has been moved from translate_init.c.inc
>> > file to the gdbstub.c file, where it makes more sense.
>> >=20
>> > This new version puts the prototypes in internal.h, to not expose
>> > them unnecessarily.
>> >=20
>> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>> > Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
>> > ---
>> >   target/ppc/gdbstub.c            | 258 ++++++++++++++++++++++++++++++=
++
>> >   target/ppc/internal.h           |   5 +
>> >   target/ppc/translate_init.c.inc | 254 +------------------------------
>> >   3 files changed, 264 insertions(+), 253 deletions(-)
>>=20
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Applied to ppc-for-6.1, thanks.


The prototypes moved to internal.h in v3 so gdbstub.c needs to include
it now. The linux-user build is breaking with:

$ ../configure --target-list=3Dppc64le-linux-user
$ make -j$(nproc)
(...)
[316/959] Compiling C object libqemu-ppc64le-linux-user.fa.p/target_ppc_gdb=
stub.c.o=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
FAILED: libqemu-ppc64le-linux-user.fa.p/target_ppc_gdbstub.c.o=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
cc -Ilibqemu-ppc64le-linux-user.fa.p -I. -I.. -Itarget/ppc -I../target/ppc =
-I../linux-user/host/x86_64 -Ilinux-user -I../linux-user -Ilinux-user/ppc -=
I../linux-user/ppc -I../capstone/include/capstone -Itrace -Iqap
i -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -fdiagn=
ostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -=
isystem /home/fabiano/kvm/qemu-patch-testing/linux-headers -isystem
 linux-headers -iquote . -iquote /home/fabiano/kvm/qemu-patch-testing -iquo=
te /home/fabiano/kvm/qemu-patch-testing/include -iquote /home/fabiano/kvm/q=
emu-patch-testing/disas/libvixl -iquote /home/fabiano/kvm/qemu-
patch-testing/tcg/i386 -iquote /home/fabiano/kvm/qemu-patch-testing/accel/t=
cg -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SOUR=
CE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
 -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict=
-aliasing -fno-common -fwrapv -Wold-style-declaration -Wold-style-definitio=
n -Wtype-limits -Wformat-security -Wformat-y2k -Winit-self -Wig
nored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-t=
o-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs -Wno-shift-n=
egative-value -Wno-psabi -fstack-protector-strong -fPIC -isystem.
./linux-headers -isystemlinux-headers -DNEED_CPU_H '-DCONFIG_TARGET=3D"ppc6=
4le-linux-user-config-target.h"' '-DCONFIG_DEVICES=3D"ppc64le-linux-user-co=
nfig-devices.h"' -MD -MQ libqemu-ppc64le-linux-user.fa.p/target_ppc
_gdbstub.c.o -MF libqemu-ppc64le-linux-user.fa.p/target_ppc_gdbstub.c.o.d -=
o libqemu-ppc64le-linux-user.fa.p/target_ppc_gdbstub.c.o -c ../target/ppc/g=
dbstub.c=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
../target/ppc/gdbstub.c:615:8: error: no previous prototype for =E2=80=98pp=
c_gdb_arch_name=E2=80=99 [-Werror=3Dmissing-prototypes]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  615 | gchar *ppc_gdb_arch_name(CPUState *cs)=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
      |        ^~~~~~~~~~~~~~~~~=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
../target/ppc/gdbstub.c:624:6: error: no previous prototype for =E2=80=98pp=
c_gdb_init=E2=80=99 [-Werror=3Dmissing-prototypes]=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  624 | void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
      |      ^~~~~~~~~~~~=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
cc1: all warnings being treated as errors

>> > +void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
>> > +{
>> > +
>> > +    if (pcc->insns_flags & PPC_FLOAT) {
>>=20
>> Watch the extra blank lines.
>
> Fixed in my tree.

