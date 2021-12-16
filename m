Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A9D4767F8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 03:32:33 +0100 (CET)
Received: from localhost ([::1]:47496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxgZM-0002XN-KU
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 21:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mxgX4-0000RU-9R
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:30:10 -0500
Received: from relay64.bu.edu ([128.197.228.104]:60699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mxgWy-0006zt-SH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:30:09 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1BG2ShGd027532
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 15 Dec 2021 21:28:46 -0500
Date: Wed, 15 Dec 2021 21:28:43 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: dhbbb <504224090@qq.com>
Subject: Re: =?utf-8?B?5Zue5aSN77yaIOWbnuWkje+8miAg5Zue5aSN77yaICDlm54=?=
 =?utf-8?B?5aSN77ya?= Questiones About MORPHUZZ (the generic-fuzzer)
Message-ID: <20211216022843.skjgj25vabbw2zhm@mozz.bu.edu>
References: <tencent_4282D21D3B35A32FF5838C42AA1C387D1606@qq.com>
 <20211201165950.v55p4bubcxgm2tom@mozz.bu.edu>
 <20211201170201.t2imhfbtwf7vseij@mozz.bu.edu>
 <tencent_94FD82719BDA4B2631B51D3C3BEB45898205@qq.com>
 <20211202185406.pq3zwpblqmw7prz6@mozz.bu.edu>
 <tencent_1EC093B2609482D9191809A96B649C527D09@qq.com>
 <20211210041545.nkgnu6dknaj72lxe@mozz.bu.edu>
 <tencent_0E2E3841168C1238FB0A2318B5AB8C54AA06@qq.com>
 <20211215154744.jdmspuqrotevwy6r@mozz.bu.edu>
 <tencent_ACAD547770EF2C22251E766AC61FEA071907@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <tencent_ACAD547770EF2C22251E766AC61FEA071907@qq.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 211216 1011, dhbbb wrote:
> Hello Alex,
> I have found some crashes with&nbsp;qemu-fuzz-i386 (generic-fuzz) such as=
 heap-buffer-overflow.But some of the crashes can't reproduce in qemu-syste=
m-i386(No segment fault).Are these crashes false positives?&nbsp;

Usually, when we can't reproduce bugs in qemu-system-i386, it is because
they: 1.) Relied on Double-Fetches. There is no reliable way to
reproduce these bugs, because they are timing-sensitive. An easy way to
check if a bug is a double fetch is to re-run the crash- file with
QEMU_AVOID_DOUBLE_FETCH

2.) Relied on the sparse memory device. In generic_fuzz.c there is a
line: sparse_mem_init(0, UINT64_MAX); Essentially this creates a special
device that we use to simulate "infinite" memory, which makes DMA
fuzzing easier. The problem is that once a bug is found, we need to
somehow remove sparse-memory device, so that we can reproduce in
qemu-system-i386.
For example, look at:
https://gitlab.com/qemu-project/qemu/-/issues/383

The reproducer has a very large address:
write 0xab2c00000001 ...
(The VM would need over 188 TB of ram)
So, to account for this, I added an additional memory slot at that
location:
-device pc-dimm,id=3Dnv1,memdev=3Dmem1,addr=3D0xab2c00000000 -object \
memory-backend-ram,id=3Dmem1,size=3D2M

Another alternative is to try to minimize the crash- file until it does
not contain any large addresses, anymore, however there's not script for
this upstream, yet
-Alex

>=20
>=20
>=20
> ------------------&nbsp;=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6&nbsp;-------=
-----------
> =E5=8F=91=E4=BB=B6=E4=BA=BA:                                             =
                                                                           =
"Alexander Bulekov"                                                        =
                            <alxndr@bu.edu&gt;;
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:&nbsp;2021=E5=B9=B412=E6=9C=8815=E6=
=97=A5(=E6=98=9F=E6=9C=9F=E4=B8=89) =E6=99=9A=E4=B8=8A11:47
> =E6=94=B6=E4=BB=B6=E4=BA=BA:&nbsp;"dhbbb"<504224090@qq.com&gt;;
>=20
> =E4=B8=BB=E9=A2=98:&nbsp;Re: =E5=9B=9E=E5=A4=8D=EF=BC=9A  =E5=9B=9E=E5=A4=
=8D=EF=BC=9A  =E5=9B=9E=E5=A4=8D=EF=BC=9A Questiones About MORPHUZZ (the ge=
neric-fuzzer)
>=20
>=20
>=20
> Nice! You can send them to qemu-security@nongnu.org or with GPG to
> secalert@redhat.com
>=20
> Here are the official instructions:
> https://www.qemu.org/contribute/security-process/
>=20
> On 211215 1626, dhbbb wrote:
> &gt; Hello Alex,
> &gt; Thanks for your kind reply!It really helps a lot.
> &gt; I seem to have found some bugs in QEMU. Who should I report these pr=
oblems to? If I want to apply for some CVE numbers, what should I do?
> &gt;=20
> &gt;=20
> &gt;=20
> &gt;=20
> &gt; ------------------&amp;nbsp;=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6&amp=
;nbsp;------------------
> &gt; =E5=8F=91=E4=BB=B6=E4=BA=BA:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
"Alexander Bulekov"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <alxndr=
@bu.edu&amp;gt;;
> &gt; =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:&amp;nbsp;2021=E5=B9=B412=E6=9C=
=8810=E6=97=A5(=E6=98=9F=E6=9C=9F=E4=BA=94) =E4=B8=AD=E5=8D=8812:15
> &gt; =E6=94=B6=E4=BB=B6=E4=BA=BA:&amp;nbsp;"dhbbb"<504224090@qq.com&amp;g=
t;;
> &gt;=20
> &gt; =E4=B8=BB=E9=A2=98:&amp;nbsp;Re:&nbsp; =E5=9B=9E=E5=A4=8D=EF=BC=9A&n=
bsp; =E5=9B=9E=E5=A4=8D=EF=BC=9A Questiones About MORPHUZZ (the generic-fuz=
zer)
> &gt;=20
> &gt;=20
> &gt;=20
> &gt; On 211210 1050, dhbbb wrote:
> &gt; &amp;gt; Hello Alex,
> &gt; &amp;gt; When I try to find the memoryregion with info MTREE, it dis=
plays Info: no menu item 'MTREE' in node '(DIR) top'.Do I need to start QEM=
U before running this command?
> &gt;=20
> &gt; Yes - this command goes into the qemu monitor, after you start QEMU.
> &gt; https://en.wikibooks.org/wiki/QEMU/Monitor
> &gt;=20
> &gt; e.g. start qemu with
> &gt; qemu-system-i386&amp;nbsp; -monitor stdio -serial none
> &gt; Then type
> &gt; "info mtree" into the monitor
> &gt;=20
> &gt; -Alex
> &gt;=20
> &gt; &amp;gt;=20
> &gt; &amp;gt;=20
> &gt; &amp;gt;=20
> &gt; &amp;gt;=20
> &gt; &amp;gt; ------------------&amp;amp;nbsp;=E5=8E=9F=E5=A7=8B=E9=82=AE=
=E4=BB=B6&amp;amp;nbsp;------------------
> &gt; &amp;gt; =E5=8F=91=E4=BB=B6=E4=BA=BA:&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; "Alexander Bulekov"&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;n=
bsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&=
amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; <alxndr@bu.edu&=
amp;amp;gt;;
> &gt; &amp;gt; =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:&amp;amp;nbsp;2021=E5=
=B9=B412=E6=9C=883=E6=97=A5(=E6=98=9F=E6=9C=9F=E4=BA=94) =E5=87=8C=E6=99=A8=
2:54
> &gt; &amp;gt; =E6=94=B6=E4=BB=B6=E4=BA=BA:&amp;amp;nbsp;"dhbbb"<504224090=
@qq.com&amp;amp;gt;;
> &gt; &amp;gt;=20
> &gt; &amp;gt; =E4=B8=BB=E9=A2=98:&amp;amp;nbsp;Re:&amp;nbsp; =E5=9B=9E=E5=
=A4=8D=EF=BC=9A Questiones About MORPHUZZ (the generic-fuzzer)
> &gt; &amp;gt;=20
> &gt; &amp;gt;=20
> &gt; &amp;gt;=20
> &gt; &amp;gt; Our priority was fuzzing on Google OSS-Fuzz (which required=
 us to use
> &gt; &amp;gt; libfuzzer). At the time, libfuzzer also had some of the bes=
t lossless
> &gt; &amp;gt; coverage and comparison-coverage features. Of course it wou=
ld have been
> &gt; &amp;gt; nice to have a fork-server as well :)
> &gt; &amp;gt; Since then there has been a lot of work on AFL++, and it se=
ems to beat
> &gt; &amp;gt; all of the benchmarks, but since OSS-Fuzz is still centered=
 around
> &gt; &amp;gt; libfuzzer, that is what we focus on, upstream.
> &gt; &amp;gt;=20
> &gt; &amp;gt; On 211202 2259, dhbbb wrote:
> &gt; &amp;gt; &amp;amp;gt; Hello Alex,
> &gt; &amp;gt; &amp;amp;gt; Because I really don't know much about libfuzz=
er and haven't used it much before.I want to know is there any reason why y=
ou chose libfuzzer instead of other Fuzzers?
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; ------------------&amp;amp;amp;nbsp;=E5=8E=9F=
=E5=A7=8B=E9=82=AE=E4=BB=B6&amp;amp;amp;nbsp;------------------
> &gt; &amp;gt; &amp;amp;gt; =E5=8F=91=E4=BB=B6=E4=BA=BA:&amp;amp;nbsp;&amp=
;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;=
nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;=
&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;=
amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;n=
bsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&=
amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;a=
mp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nb=
sp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&a=
mp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;am=
p;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbs=
p;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&am=
p;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp=
;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp=
;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp=
;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;=
nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;=
&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;=
amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;n=
bsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&=
amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;a=
mp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nb=
sp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; "=
Alexander Bulekov"&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&=
amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;a=
mp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nb=
sp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&a=
mp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;am=
p;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbs=
p;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&am=
p;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp=
;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp=
;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp=
;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;=
nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;=
&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;=
amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;n=
bsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&=
amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp;&amp;amp;nbsp; <alxndr@bu.edu&amp;=
amp;amp;gt;;
> &gt; &amp;gt; &amp;amp;gt; =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:&amp;amp;=
amp;nbsp;2021=E5=B9=B412=E6=9C=882=E6=97=A5(=E6=98=9F=E6=9C=9F=E5=9B=9B) =
=E5=87=8C=E6=99=A81:02
> &gt; &amp;gt; &amp;amp;gt; =E6=94=B6=E4=BB=B6=E4=BA=BA:&amp;amp;amp;nbsp;=
"dhbbb"<504224090@qq.com&amp;amp;amp;gt;;
> &gt; &amp;gt; &amp;amp;gt; =E6=8A=84=E9=80=81:&amp;amp;amp;nbsp;"qemu-dev=
el"<qemu-devel@nongnu.org&amp;amp;amp;gt;;
> &gt; &amp;gt; &amp;amp;gt; =E4=B8=BB=E9=A2=98:&amp;amp;amp;nbsp;Re: Quest=
iones About MORPHUZZ (the generic-fuzzer)
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; On 211201 1537, dhbbb wrote:
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;gt; Hello Alex=EF=BC=8C
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;gt; Thanks for your kind reply,it=
 really helped me a lot! I am more
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;gt; familiar with AFL than libfuz=
zer=EF=BC=8Cand i noticed that you said "This
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;gt; minimal init/exec interface i=
s also supported by other fuzzers, such
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;gt; as AFL[++]".But your project =
seems to be highly integrated with
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;gt; QEMU,so if I want to use othe=
r fuzzers as&amp;amp;amp;amp;nbsp;QMORPHUZZ's
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;gt; &amp;amp;amp;amp;nbsp;fuzzing=
-backend&amp;amp;amp;amp;nbsp;, could you please tell me where to start?
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;
> &gt; &amp;gt; &amp;amp;gt; Sure. (I am cc-ing the qemu-mailing list, as o=
thers are interested in
> &gt; &amp;gt; &amp;amp;gt; this as well.)
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; Here's how the execution looks for something l=
ike
> &gt; &amp;gt; &amp;amp;gt; ./qemu-fuzz- --fuzz_target=3Dgeneric-fuzz -job=
s=3D2 -workers=3D2
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp; LLVMFuzzerInitialize
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp; qemu_init
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; +-------------- fork ----------+
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; fork&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; v&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp; worker1&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; w=
orker2
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; v&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; RunOne&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp=
;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nb=
sp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;=
&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp; RunOne
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; v&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp; pre_fuzz&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp=
;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;am=
p;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; pre_fuzz
> &gt; &amp;gt; &amp;amp;gt; (init shared memory)&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; (init shared memory)
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; v&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp; generic_fuzz ---fork-+&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; generic_fu=
zz ---fork-+
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp; v&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; (run the input)&amp;amp;amp;nbsp;&=
amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp=
;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; (run th=
e input)
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; v&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp; v&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; v&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; wait&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; exit&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp=
;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nb=
sp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; wait&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&=
amp;amp;amp;nbsp; exit
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp; v&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp; RunOne&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp=
;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nb=
sp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;=
&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp; RunOne
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; v&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;=
amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp=
;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;generic_fuzz ---fork-+&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; generic_fuz=
z ---fork-+
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |=
&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |=
&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;am=
p;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; v=
&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&am=
p;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;a=
mp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp; |&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;=
nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbs=
p;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; v
> &gt; &amp;gt; &amp;amp;gt; &amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;a=
mp;nbsp;&amp;amp;amp;nbsp; ...&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;=
amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp=
;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nb=
sp;&amp;amp;amp;nbsp; ...&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;n=
bsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; .=
=2E.&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp=
;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&a=
mp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp;&amp;amp;amp;nbsp; ...
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; LibFuzzer essentially provides two main interf=
aces that we use.
> &gt; &amp;gt; &amp;amp;gt; The first, LLVMFuzzerInitialize, runs a single=
 time when you first run
> &gt; &amp;gt; &amp;amp;gt; ./qemu-fuzz-...
> &gt; &amp;gt; &amp;amp;gt; It is defined in tests/qtest/fuzz/fuzz.c
> &gt; &amp;gt; &amp;amp;gt; Most of the code is there so we can specify wh=
ich --fuzz-target we want
> &gt; &amp;gt; &amp;amp;gt; to run, and select the corresponding qemu argu=
ments that we would
> &gt; &amp;gt; &amp;amp;gt; normally pass to ./qemu-system-i386. Then we c=
all qemu_init, which
> &gt; &amp;gt; &amp;amp;gt; initializes the VM correspondingly. None of th=
is should be very
> &gt; &amp;gt; &amp;amp;gt; libfuzzer specific.
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; The second interface, LLVMFuzzerTestOneInput, =
is the one that LibFuzzer
> &gt; &amp;gt; &amp;amp;gt; calls for every single input. This is also def=
ined in fuzz.c.
> &gt; &amp;gt; &amp;amp;gt; Importantly, in between FuzzerInitialize and F=
uzzerTestOneInput,
> &gt; &amp;gt; &amp;amp;gt; libFuzzer might fork the process multiple time=
s in order to create
> &gt; &amp;gt; &amp;amp;gt; additional workers (if --jobs and --workers ar=
guments are specified).
> &gt; &amp;gt; &amp;amp;gt; Since we hacked on our own forkserver onto Lib=
Fuzzer, and this requires
> &gt; &amp;gt; &amp;amp;gt; separate shared memory for each worker, we als=
o run some initialization
> &gt; &amp;gt; &amp;amp;gt; code a single time in each worker. This is the=
 "!pre_fuzz_done &amp;amp;amp;amp;&amp;amp;amp;amp;
> &gt; &amp;gt; &amp;amp;gt; fuzz_target-&amp;amp;amp;gt;pre_fuzz" part. Fo=
r the generic fuzzer, here we also do all
> &gt; &amp;gt; &amp;amp;gt; of the generic-fuzz-specific initialization (s=
uch as finding all of the
> &gt; &amp;gt; &amp;amp;gt; MemoryRegions we want to fuzz). I think the on=
ly thing specific to
> &gt; &amp;gt; &amp;amp;gt; LibFuzzer here should be the call to counter_s=
hm_init(), which we use to
> &gt; &amp;gt; &amp;amp;gt; establish the LibFuzzer-specific shared memory=
 regions (since LibFuzzer
> &gt; &amp;gt; &amp;amp;gt; has no built-in fork-server feature).
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; The final important libFuzzer-specific part is=
 that in the actual fuzz()
> &gt; &amp;gt; &amp;amp;gt; function (aka generic_fuzz for the generic-fuz=
zer, which is called for
> &gt; &amp;gt; &amp;amp;gt; each input), we manually fork() the process an=
d re-establish timers for
> &gt; &amp;gt; &amp;amp;gt; the timeout. For other fuzzers, which have bui=
lt-in forkservers,
> &gt; &amp;gt; &amp;amp;gt; presumably, we wouldn't need this.
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; I think AFL++ provides interoperability with t=
he
> &gt; &amp;gt; &amp;amp;gt; LLVMFuzzerInitialize/LLVMFuzzerTestOneInput in=
terface. So in order to
> &gt; &amp;gt; &amp;amp;gt; use AFL++ we would need to strip out the libfu=
zzer-specific shm and
> &gt; &amp;gt; &amp;amp;gt; fork-server parts, and see how we can integrat=
e AFL++' built-in
> &gt; &amp;gt; &amp;amp;gt; forkserver. I am happy to help more with this =
if you are interested in
> &gt; &amp;gt; &amp;amp;gt; adding AFL++ support, upstream.
> &gt; &amp;gt; &amp;amp;gt;=20
> &gt; &amp;gt; &amp;amp;gt; -Alex

