Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858F51F026
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 21:28:27 +0200 (CEST)
Received: from localhost ([::1]:42072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnmZt-0006sw-LN
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 15:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nnmZ4-0006Dm-2O
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:27:34 -0400
Received: from mout.web.de ([212.227.15.3]:56071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cvz185@web.de>) id 1nnmZ1-0002nT-SD
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1652038048;
 bh=8ArM4rgF5rLllZ/DGVwtAxoKVrkjpvMe/YjI+zaBTBA=;
 h=X-UI-Sender-Class:From:Subject:Date:References:To:In-Reply-To;
 b=B5SDB2+sNGevIYFgL7CNwATMXnQOSzpk5GPC9ImOLf+CdSiOspu8thmMTCyhFckSA
 ziO+KYI69cYgpKpTnuvvotpXE0U5P65BvEEKcsuxL07AsqFOCpy3PiLBDDxRUyRRfs
 KzZuWlZzEDVhPuOuHoou/Gh5w4LFFo0XjcQRc28Q=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.29.0.96] ([217.239.164.58]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7gXO-1nsxPp4Aew-014g5F; Sun, 08
 May 2022 21:27:28 +0200
From: Chris Howard <cvz185@web.de>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Possible bug in Aarch64 single-stepping [PATCH]
Date: Sun, 8 May 2022 21:27:27 +0200
References: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
 <7988B475-EEC0-4574-B0E2-BB61738B8964@web.de>
 <CAFEAcA-Dy=nY9SCtxv0omYCQqDqGq6Qwvja4c6f_9rPR8L-KCA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
In-Reply-To: <CAFEAcA-Dy=nY9SCtxv0omYCQqDqGq6Qwvja4c6f_9rPR8L-KCA@mail.gmail.com>
Message-Id: <C07CCAE4-1679-4D7C-A472-57B9939D5DE0@web.de>
X-Mailer: Apple Mail (2.3445.104.21)
X-Provags-ID: V03:K1:c/wLnMjtnSMbPW6Z/jcK3zege4tYmDqbv0V8YF4L+FSWtd0CLNR
 lLx8H7bXuLZG2goGezHLVtmOZ704nuQ3KzrBFIHta06EzpnKevoWxsp935fJZpeJ5xFSVfW
 6leb4QB2xNFTwx9GpWQnBLK6S313cFcqJ5GdZcTAMMG+uJRnULLqhpexHU2lRk04Iqi9gDK
 CzyBOrPWlkFMc4vFyspXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WiUH+qTZp2I=:AbhinQZR4vkHJPjDJexoGM
 jCofaUebJOO+Ak9546d8wLslLS5w7Qo8ygZzQfzP0FnixHmUhW9l9dFtx1Q9SloK3Jkw703SQ
 8l+13PCUvoxIRjBF7BOWXhkC9PJCHIQfJAfBBCqDIz/dnCehPsVSJEXZF7z+4VEEGufiuOv6D
 f9aA4/x8X6SW6lbn0qIuCQzhZtOxz4fti9jGU8S1YbXTcDgLuh8nd/a8AqtEtUKZ/mOOL5n1+
 dab+fVQpeTB9BhBOF4s+GJ+lqT+Ruiuj07aWzwhn73t6iqUiiA70Eio1EmefUmsirPdchAwQu
 gdLEAQMyLTzcnNataQSuIkPLTHtiH2ZPnMOj+xqgvAUAdE+OFzt12F6AFv9rxFp1KxFtIVzI4
 IEEw1IUDlKs+wteCl3U+l3UvDnkJ5vPl6BcYLtLTPI9H4tiiVKxfI+oPM+J8k90lLjvOYsOXQ
 kNoyqNeilIurQqE1DM4Uawvys97XRLyCD/Y9gmvcyMlNSrVYuJjGebhixPrMTVoBxqvS7azg4
 ebRoLi7N9/N3bbKidFt89wpdT+zYWeck78fuZNziX8VzI7bLHTgBll1ZiU2w2yeNFH2op/A9g
 b1qxU8Vb4dHskwxyJVC/qfnbhkdAW7S7lAzivFzrZKL5hMKD+wA+yGkaLzS8ZELBCNtlhkkwQ
 kvtoTIJ4yYrLiUqGuN6aotyvsz+qteuXmxrwwQLQZOF0fOkllAH0HUWk86fweapSJzVfxE7Gz
 opx1D/XcFTf7015rEAdCdUlMcPARV5N+tmbPWZ5pCAj7Frp2fJCMy3J/yjTrxSvDzxI/bp8+D
 0ETHK90PLwn8mPAVNRKdXWJSkwCWN8eaj8IeMdi0ET4llLRSnCFKL4bXtPsNGjgDWtp6cgzEP
 878AHdd7vQt4SenxpbTr2iCmUXq1k6GYJtuMXXunLv1om+9ROrPusiVI2YArkrYYgGCVWhCyj
 iNJcAlBbMSpsgSzF5daYctxOETspq7spmqq2dduRPEwnbTCeWLptew81LEL+W7y34SMnmTo05
 2qEszx2LfT0AMS777joEOzY1ru31BMyMzRWfF+Cl2tz/hSNmuaNu5BhTFOrTxwuSuVcpxijAZ
 qzRGwYJwQs9/C8=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=cvz185@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8. May 2022, at 14:18, Peter Maydell <peter.maydell@linaro.org> =
wrote:

> On Sat, 7 May 2022 at 15:18, Chris Howard <cvz185@web.de> wrote:
>> PS. In plain gdb (ie. no nice user interface) a large number (but not =
all) of the system registers gets displayed after each step. It would be =
nice if these were sorted in some way. At the moment they=E2=80=99re =
completely jumbled =E2=80=94 not alphabetic, not grouped by EL, nor by =
=E2=80=9Cmeaning=E2=80=9D  (DBGWVR0_EL1 isn=E2=80=99t necessarily next =
to DBGWCR0_EL1).
>>=20
>> Also, there are multiple (identical?) instances of =E2=80=9CDBGBVR=E2=80=
=9D and =E2=80=9CDBGBCR=E2=80=9D (and  =E2=80=9CDBGWVR=E2=80=9D and =
=E2=80=9CDBGWCR=E2=80=9D) rather than the expected =E2=80=9CDBGWVR0_EL1=E2=
=80=9D, =E2=80=9CDBGWVR1_EL1=E2=80=9D etc.
>>=20
>> Would this be a QEMU or a GDB issue? Or isn=E2=80=99t it an issue at =
all? :-)
>=20
> My gdb doesn't do that. Basically QEMU provides gdb with some XML
> telling it that the sysregs are present, but it's up to gdb at
> what points it chooses to display what registers and how it does that.
>=20
> The system register read access via the gdbstub is "best-effort"
> on QEMU's part -- we implement it to the extent that it wasn't too
> difficult to do, but there are some sharp edges, like the
> register names not always being quite right, and also the way
> that if you try to read a register that isn't supposed to be
> accessible by the current EL you might find it's not correct.
> Trying to read SP_EL2 while at EL2 is an example of that.
>=20
> The reason register names are sometimes funny is that the
> infrastructure for system registers within QEMU was originally
> written with the assumption that the name strings were merely
> for convenience when debugging QEMU itself, so it's sometimes
> a bit careless about them. We only added the "tell GDB about
> these" part later.
>=20
> That said, adding the numbers into the watchpoint and breakpoint
> registers would be pretty easy, so we should do that. That is,
> in this code:
> =
https://gitlab.com/qemu-project/qemu/-/blob/master/target/arm/helper.c#L65=
67
> we should use g_strdup_printf() to create unique per-register
> names, the same way we do for the PMU registers already here:
> =
https://gitlab.com/qemu-project/qemu/-/blob/master/target/arm/helper.c#L66=
32
>=20
> thanks
> -- PMM

Thanks for the explanation. What with this being =E2=80=9Cpretty easy=E2=80=
=9D I=E2=80=99m attempting my first ever patch!  :-)

BE WARNED!

This is a context diff with respect to the cloned git repository =
(Version 7.0.50)

$ git clone https://gitlab.com/qemu-project/qemu.git

created with

$ diff -c qemu/target/arm/helper.c qemu-patch/target/arm/helper.c > =
aarch-dbg-regnames.patch

to be applied (in the target/arm directory) with

$ patch -p3 <../../../aarch-dbg-regnames.patch


=E2=80=94 chris


=20
*** qemu/target/arm/helper.c	2022-05-08 20:41:48.000000000 +0200
--- qemu-patch/target/arm/helper.c	2022-05-08 20:55:25.000000000 =
+0200
***************
*** 6551,6559 ****
          define_one_arm_cp_reg(cpu, &dbgdidr);
      }
 =20
!     /* Note that all these register fields hold "number of Xs minus =
1". */
!     brps =3D arm_num_brps(cpu);
!     wrps =3D arm_num_wrps(cpu);
      ctx_cmps =3D arm_num_ctx_cmps(cpu);
 =20
      assert(ctx_cmps <=3D brps);
--- 6551,6559 ----
          define_one_arm_cp_reg(cpu, &dbgdidr);
      }
 =20
!     /* Note that all these reg fields (in ID_AA64DFR0_EL1) hold =
"number of Xs minus 1". */
!     brps =3D arm_num_brps(cpu);			/* returns =
actual number of breakpoints */
!     wrps =3D arm_num_wrps(cpu);			/* returns =
actual number of watchpoints */
      ctx_cmps =3D arm_num_ctx_cmps(cpu);
 =20
      assert(ctx_cmps <=3D brps);
***************
*** 6565,6578 ****
      }
 =20
      for (i =3D 0; i < brps; i++) {
          ARMCPRegInfo dbgregs[] =3D {
!             { .name =3D "DBGBVR", .state =3D ARM_CP_STATE_BOTH,
                .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D=
 i, .opc2 =3D 4,
                .access =3D PL1_RW, .accessfn =3D access_tda,
                .fieldoffset =3D offsetof(CPUARMState, cp15.dbgbvr[i]),
                .writefn =3D dbgbvr_write, .raw_writefn =3D raw_write
              },
!             { .name =3D "DBGBCR", .state =3D ARM_CP_STATE_BOTH,
                .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D=
 i, .opc2 =3D 5,
                .access =3D PL1_RW, .accessfn =3D access_tda,
                .fieldoffset =3D offsetof(CPUARMState, cp15.dbgbcr[i]),
--- 6565,6580 ----
      }
 =20
      for (i =3D 0; i < brps; i++) {
+ 		char *dbgbvr_el1_name =3D =
g_strdup_printf("DBGBVR%d_EL1", i);
+ 		char *dbgbcr_el1_name =3D =
g_strdup_printf("DBGBCR%d_EL1", i);
          ARMCPRegInfo dbgregs[] =3D {
!             { .name =3D dbgbvr_el1_name, .state =3D ARM_CP_STATE_BOTH,
                .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D=
 i, .opc2 =3D 4,
                .access =3D PL1_RW, .accessfn =3D access_tda,
                .fieldoffset =3D offsetof(CPUARMState, cp15.dbgbvr[i]),
                .writefn =3D dbgbvr_write, .raw_writefn =3D raw_write
              },
!             { .name =3D dbgbcr_el1_name, .state =3D ARM_CP_STATE_BOTH,
                .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D=
 i, .opc2 =3D 5,
                .access =3D PL1_RW, .accessfn =3D access_tda,
                .fieldoffset =3D offsetof(CPUARMState, cp15.dbgbcr[i]),
***************
*** 6580,6596 ****
              },
          };
          define_arm_cp_regs(cpu, dbgregs);
      }
 =20
      for (i =3D 0; i < wrps; i++) {
          ARMCPRegInfo dbgregs[] =3D {
!             { .name =3D "DBGWVR", .state =3D ARM_CP_STATE_BOTH,
                .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D=
 i, .opc2 =3D 6,
                .access =3D PL1_RW, .accessfn =3D access_tda,
                .fieldoffset =3D offsetof(CPUARMState, cp15.dbgwvr[i]),
                .writefn =3D dbgwvr_write, .raw_writefn =3D raw_write
              },
!             { .name =3D "DBGWCR", .state =3D ARM_CP_STATE_BOTH,
                .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D=
 i, .opc2 =3D 7,
                .access =3D PL1_RW, .accessfn =3D access_tda,
                .fieldoffset =3D offsetof(CPUARMState, cp15.dbgwcr[i]),
--- 6582,6602 ----
              },
          };
          define_arm_cp_regs(cpu, dbgregs);
+         g_free(dbgbvr_el1_name);
+         g_free(dbgbcr_el1_name);
      }
 =20
      for (i =3D 0; i < wrps; i++) {
+ 		char *dbgwvr_el1_name =3D =
g_strdup_printf("DBGWVR%d_EL1", i);
+ 		char *dbgwcr_el1_name =3D =
g_strdup_printf("DBGWCR%d_EL1", i);
          ARMCPRegInfo dbgregs[] =3D {
!             { .name =3D dbgwvr_el1_name, .state =3D ARM_CP_STATE_BOTH,
                .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D=
 i, .opc2 =3D 6,
                .access =3D PL1_RW, .accessfn =3D access_tda,
                .fieldoffset =3D offsetof(CPUARMState, cp15.dbgwvr[i]),
                .writefn =3D dbgwvr_write, .raw_writefn =3D raw_write
              },
!             { .name =3D dbgwcr_el1_name, .state =3D ARM_CP_STATE_BOTH,
                .cp =3D 14, .opc0 =3D 2, .opc1 =3D 0, .crn =3D 0, .crm =3D=
 i, .opc2 =3D 7,
                .access =3D PL1_RW, .accessfn =3D access_tda,
                .fieldoffset =3D offsetof(CPUARMState, cp15.dbgwcr[i]),
***************
*** 6598,6603 ****
--- 6604,6611 ----
              },
          };
          define_arm_cp_regs(cpu, dbgregs);
+         g_free(dbgwvr_el1_name);
+         g_free(dbgwcr_el1_name);
      }
  }
 =20


