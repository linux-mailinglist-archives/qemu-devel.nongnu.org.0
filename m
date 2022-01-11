Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45A648AA22
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:07:22 +0100 (CET)
Received: from localhost ([::1]:60506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7D7h-0005of-8o
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:07:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mario@locati.it>) id 1n7D59-0004ID-3c
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:04:45 -0500
Received: from smtpcmd01-d.aruba.it ([62.149.158.245]:47329)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mario@locati.it>) id 1n7D54-0007hr-Oi
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:04:42 -0500
Received: from locati.it ([10.10.9.171]) by Aruba Outgoing Smtp  with ESMTPA
 id 7D50nXO4ProAh7D50nCIzy; Tue, 11 Jan 2022 10:04:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641891874; bh=Qz8syEjcGHqOlLBXE2ZhgVeqirlFQDFPGSLb7i3x/hg=;
 h=Date:Subject:MIME-Version:Content-Type:From:To;
 b=fl3DVx8HB1HL4E26Twp13DfdUzpcmewXjGkkrd4sRz4HtWojdYNuCWegJiXRHzJ05
 3EdBvz/sAv6YPt569YzL/yGYM4HPGqw5rOVo/1f+dJJQm2XPBr8y3PveCdTM3DrBEs
 ahY3JaRRlwPBxx7qZSJq/AbyjSCmU9fiogfQFLtr+N/FZ52tqTsTZfF4hxPVlNI0Qn
 LYY7ZQYJzbq/hsvnSpFL8QenHdTngpHhAtvLEky16IU84CYkJ5GpbRh4LCuTsyuq9O
 go5Ym+6NTTMaId3wAyCPru0MQez2kDe3E2jMwqEwk+lNh9Kl3O0tFIcm4kA0Fp7i8Q
 OAK2iNc6Kf4mw==
Date: Tue, 11 Jan 2022 10:04:34 +0100
Message-Id: <R5JFVM$911E343FF81933B99D53FD0992D8848F@locati.it>
In-Reply-To: <10391a07-e5e1-99e6-ed68-c93520534f29@kaod.org>
References: =?iso-8859-1?q?=3C20211213133542=2E2608540=2D1=2Dfarosas=40linux=2Eib?=
 =?iso-8859-1?q?m=2Ecom=3E_=3C724f7563=2Df36c=2D2c37=2D3b94=2D951c3d92?=
 =?iso-8859-1?q?2861=40eik=2Ebme=2Ehu=3E_=3CR4OPHT=247F12C66D110739799?=
 =?iso-8859-1?q?1E0E4C978FE6AF1=40locati=2Eit=3E_=3C10391a07=2De5e1=2D?=
 =?iso-8859-1?q?99e6=2Ded68=2Dc93520534f29=40kaod=2Eorg=3E?=
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
MIME-Version: 1.0
X-Sensitivity: 3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "mario@locati.it" <mario@locati.it>
To: clg@kaod.org
X-XaM3-API-Version: V4(R2)
X-type: 0
X-SenderIP: 2.36.99.146
X-CMAE-Envelope: MS4wfNMB/p3JU1xJzyCoog9RF7c4DAsyV7ZCCYG2QE/zQZwV8KOluJA1AuZm93bnUEqT/GPwytF2/1qTXp7haS6vNDSioVeZpXXsYPMTkmLJDe+zPPapYOWX
 HQ3D3Qf9feleLxY1WAlI9LMRAZcHVnkBXcLnSup+ofFnz8KKLFlsm1kOOh6SP9iHmfqHgZOgCCcIvA9n6TC/oSp2aSscDN5KN/aU21St2qRR8HhVKBA3VJ40
 b7CHSZUv68URHcjjcX86BR3XCMeaACVW5HsrpdAxeQVjZfQ8z2QL776NcaPxuDBraWwg0sOEp1G/MvcAogqKnA==
Received-SPF: none client-ip=62.149.158.245; envelope-from=mario@locati.it;
 helo=smtpcmd01-d.aruba.it
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, farosas@linux.ibm.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>From: "C=C3=A9dric Le Goater" clg@kaod.org=0A>To: "mario@locati.it" mari=
o@locati.it, balaton@eik.bme.hu=0A>Cc: farosas@linux.ibm.com, qemu-devel@=
nongnu.org, qemu-ppc@nongnu.org, danielhb413@gmail.com=0A>Date: Mon, 10 J=
an 2022 09:04:39 +0100=0A>Subject: Re: [PATCH] target/ppc: Fix e6500 boot=
=0A>=0A>Hello Mario,=0A>=C2=A0=0A>> =0A>> I have tried to launch a freshl=
y compiled qemu from git master on a NXP T2080RDB devkit that has a e6500=
 CPU in combination with a freshly compiled kernel 5.16-rc6=0A>> I have D=
ebian SID ppc64 up and running using such a kernel, and when I launch qem=
u to run a VM with the same debian sid for ppc64 and the same kernel usin=
g --enable-kvm I end up with a kernel panic=0A>> =0A>> [....]=0A>> Run /s=
bin/init as init process=0A>> random: fast init done=0A>> systemd[1]: ill=
egal instruction (4) at 3fff96562ac8 nip 3fff96562ac8 lr 3fff96562aa8 cod=
e 1 in libc-2.32.so[3fff96516000+1f7000]=0A>> systemd[1]: code: 60000000 =
38600006 9122b7e8 4801bead 60000000 60000000 8122b7e8 2c090004=0A>> syste=
md[1]: code: 40820014 39200005 60000000 9122b7e8 <00000000> 60000000 8122=
b7e8 2c090005=0A>> Kernel panic - not syncing: Attempted to kill init! ex=
itcode=3D0x00000004=0A>> Rebooting in 180 seconds..=0A>=C2=A0=0A>I spend =
sometime looking at the kernel and QEMU and I noticed that=0A>TCG e6500 m=
achines have an issue when the kernel has KVM support.=0A>I have limited =
knowledge on that topic but e6500 has extra MMU=0A>features that an hyper=
visor could use for the guest and the e6500=0A>emulation clearly doesn't =
have support for it.=0A>=C2=A0=0A>In the guest, could you try with to run=
 the KVM guest with a kernel=0A>without KVM support and let us know ?=0A>=
=C2=A0=0A>Thanks,=0A>=C2=A0=0A>C.=0A=0AUnfortunately using a kernel with =
KVM disabled on the guest did not solve the problem on the NXP T2080RDB d=
evkit, here's how qemu log ends=0A=0A[...]=0ALoading compiled-in X.509 ce=
rtificates=0Azswap: loaded using pool lzo/zbud=0AKey type ._fscrypt regis=
tered=0AKey type .fscrypt registered=0AKey type fscrypt-provisioning regi=
stered=0ABtrfs loaded, crc32c=3Dcrc32c-generic, zoned=3Dno, fsverity=3Dno=
=0AKey type encrypted registered=0AALSA device list:=0A  #0: Virtual MIDI=
 Card 1=0AEXT4-fs (vda): recovery complete=0AEXT4-fs (vda): mounted files=
ystem with ordered data mode. Opts: (null). Quota mode: none.=0AVFS: Moun=
ted root (ext4 filesystem) on device 254:0.=0Adevtmpfs: mounted=0AFreeing=
 unused kernel image (initmem) memory: 460K=0AThis architecture does not =
have kernel memory protection.=0ARun /sbin/init as init process=0Arandom:=
 fast init done=0Asystemd[1]: illegal instruction (4) at 3fffb412415c nip=
 3fffb412415c lr 3fffb412413c code 1 in libc-2.33.so[3fffb40d7000+1fe000]=
=0Asystemd[1]: code: 60000000 38600006 9122b7d0 4801bf19 60000000 6000000=
0 8122b7d0 2c090004 =0Asystemd[1]: code: 40820014 39200005 60000000 9122b=
7d0 <00000000> 60000000 8122b7d0 2c090005 =0AKernel panic - not syncing: =
Attempted to kill init! exitcode=3D0x00000004=0ARebooting in 180 seconds.=
.=0A=0A=0AHowever, when using such a kernel without KVM on my x86_64 linu=
x machine, qemu works just fine with an e6500 cpu using the following par=
ameters=0Aqemu-system-ppc64 -M ppce500 -cpu e6500 -m 2G -kernel uImage_5.=
16_no_kvm -append "root=3D/dev/vda rw" -drive format=3Dqcow2,file=3Dhdd_d=
ebian_sid_ppc64.qcow2,index=3D0,if=3Dvirtio -net nic -net user -vga none =
-nographic=0A=0A=0AHere the recompiled kernel 5.16 configuration used on =
the host that has KVM enable=0Ahttps://repo.powerprogress.org/t2080rdb/qe=
mu/2022-01-11_kernel_5.16_with_kvm.config=0AAnd here the compiled kernel=0A=
https://repo.powerprogress.org/t2080rdb/qemu/uImage_5.16_with_kvm=0A=0AHe=
re the recompiled kernel 5.16 configuration without KVM enabled for the g=
uest=0Ahttps://repo.powerprogress.org/t2080rdb/qemu/2022-01-11_kernel_5.1=
6_no_kvm.config=0AAnd here the compiled kernel=0Ahttps://repo.powerprogre=
ss.org/t2080rdb/qemu/uImage_5.16_no_kvm=0A=0AHere the complete log of QEM=
U I have just recompiled today from git=0Ahttps://repo.powerprogress.org/=
t2080rdb/qemu/2022-01-11_qemu_git_log_kernel_5.16_no_kvm_guest.txt=0A=0AC=
=C3=A9dric, I can provide you remote access (either ssh or remote desktop=
) to the computer with the NXP T2080 cpu for doing some debugging if you =
want, just drop me a private email and we will arrange the time for a ses=
sion.=0A

