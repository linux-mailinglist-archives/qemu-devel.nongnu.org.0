Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7652D4DA194
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 18:51:52 +0100 (CET)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBKp-0006tf-2O
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 13:51:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nUBDF-0004fZ-QQ; Tue, 15 Mar 2022 13:44:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11382
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nUBDD-0004zg-FX; Tue, 15 Mar 2022 13:44:01 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22FHMHwV022378; 
 Tue, 15 Mar 2022 17:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : reply-to :
 cc : subject : date : message-id : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=Q5ymWDPPHozij2Letzpx94WUzQ8vMduMQgrq2wlsu0M=;
 b=mVsIriQz4n5HaqPsDMsdDX5uJMPqyyV8xnZaipIu8rpWg9cJuFsZnQqPaNhAX212/rlz
 T6xtfiANYh1AUk+krBq6G7nod6aFT6AGgb9mBa4Pq9JhFKcM+zEGBCl+3TZroys3MmuH
 GoJt6R1OM9wMHmLGzqoE4MZV814T+O8XYM2ohIooSGQXk5tKxB1FUKHQpFsuwa/aRFDU
 QTK61JOPM6EPF975aLRiIofm2EUQv5rjNAgnL38RVQvyzOLObJRY9kKVF7Jn3c7Yq9hO
 ArEFpsTi1+KdO6bIKyTmA2DriUrcDvcki2y558HeupC6zGaGEyXx8R16SD5S1CyhclJl 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ety51gff4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:43:52 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22FHhV5Z022564;
 Tue, 15 Mar 2022 17:43:52 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ety51gfeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:43:52 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22FHX7RB015317;
 Tue, 15 Mar 2022 17:43:51 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3erk59f8dd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 17:43:51 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22FHhnVU28246512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 17:43:50 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCC0FAC066;
 Tue, 15 Mar 2022 17:43:49 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DB91AC064;
 Tue, 15 Mar 2022 17:43:49 +0000 (GMT)
Received: from localhost (unknown [9.160.176.198])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 15 Mar 2022 17:43:48 +0000 (GMT)
From: Murilo Opsfelder =?ISO-8859-1?Q?Ara=FAjo?= <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] block-qdict: Fix -Werror=maybe-uninitialized build
 failure
Date: Tue, 15 Mar 2022 14:43:47 -0300
Message-ID: <11970663.O9o76ZdvQC@localhost.localdomain>
Organization: IBM
In-Reply-To: <a7ce477a-ebed-dbb0-3257-8bc82fe27ce4@gmail.com>
References: <20220311221634.58288-1-muriloo@linux.ibm.com>
 <a7ce477a-ebed-dbb0-3257-8bc82fe27ce4@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l9xPIdQsm6U1bmJ0KSQ2HCnxuUxrReji
X-Proofpoint-ORIG-GUID: qjCxleOnNvqPnjyq6QY_v4TpOUVVylXj
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-15_08,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203150106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: muriloo@linux.ibm.com
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe.

On Monday, March 14, 2022 10:47:11 AM -03 Philippe Mathieu-Daud=E9 wrote:
> On 11/3/22 23:16, Murilo Opsfelder Araujo wrote:
> > Building QEMU on Fedora 37 (Rawhide Prerelease) ppc64le failed with the
> > following error:
> >
> >      $ ../configure --prefix=3D/usr/local/qemu-disabletcg --target-list=
=3Dppc-softmmu,ppc64-softmmu --disable-tcg --disable-linux-user
> >      ...
> >      $ make -j$(nproc)
> >      ...
> >      FAILED: libqemuutil.a.p/qobject_block-qdict.c.o
>
> This part >>>
>
> >      cc -m64 -mlittle-endian -Ilibqemuutil.a.p -I. -I.. -Isubprojects/l=
ibvhost-user -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader=
 -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/syspr=
of-4 -I/usr/include/lib
> >      mount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 -I/usr/incl=
ude/p11-kit-1 -I/usr/include/pixman-1 -fdiagnostics-color=3Dauto -Wall -Win=
valid-pch -Werror -std=3Dgnu11 -O2 -g -isystem /root/qemu/linux-headers -is=
ystem linux-headers -iquote
> >       . -iquote /root/qemu -iquote /root/qemu/include -iquote /root/qem=
u/disas/libvixl -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOU=
RCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredu=
ndant-decls -Wundef -Wwrite
> >      -strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fw=
rapv -Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-=
security -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wneste=
d-externs -Wendif-label
> >      s -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-i=
nclude-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -=
fPIE -MD -MQ libqemuutil.a.p/qobject_block-qdict.c.o -MF libqemuutil.a.p/qo=
bject_block-qdict.c.o.d -
> >      o libqemuutil.a.p/qobject_block-qdict.c.o -c ../qobject/block-qdic=
t.c
>
> <<< is noise (doesn't provide any value) and could be stripped.

Is this something the committer/maintainer could edit when applying the com=
mit
or do you need I resend the v3?

Cheers!

>
> >      In file included from /root/qemu/include/qapi/qmp/qdict.h:16,
> >                       from /root/qemu/include/block/qdict.h:13,
> >                       from ../qobject/block-qdict.c:11:
> >      /root/qemu/include/qapi/qmp/qobject.h: In function =E2=80=98qdict_=
array_split=E2=80=99:
> >      /root/qemu/include/qapi/qmp/qobject.h:49:17: error: =E2=80=98subqd=
ict=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialized]
> >         49 |     typeof(obj) _obj =3D (obj);                           =
        \
> >            |                 ^~~~
> >      ../qobject/block-qdict.c:227:16: note: =E2=80=98subqdict=E2=80=99 =
declared here
> >        227 |         QDict *subqdict;
> >            |                ^~~~~~~~
> >      cc1: all warnings being treated as errors
> >
> > Fix build failure by expanding the ternary operation.
> > Tested with `make check-unit` (the check-block-qdict test passed).
> >
> > Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Cc: Hanna Reitz <hreitz@redhat.com>
> > Cc: Markus Armbruster <armbru@redhat.com>
> > ---
> > v1: https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03224.h=
tml
> >
> >   qobject/block-qdict.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
> > index 1487cc5dd8..4a83bda2c3 100644
> > --- a/qobject/block-qdict.c
> > +++ b/qobject/block-qdict.c
> > @@ -251,12 +251,12 @@ void qdict_array_split(QDict *src, QList **dst)
> >           if (is_subqdict) {
> >               qdict_extract_subqdict(src, &subqdict, prefix);
> >               assert(qdict_size(subqdict) > 0);
> > +            qlist_append_obj(*dst, QOBJECT(subqdict));
> >           } else {
> >               qobject_ref(subqobj);
> >               qdict_del(src, indexstr);
> > +            qlist_append_obj(*dst, subqobj);
> >           }
> > -
> > -        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
> >       }
> >   }
> >
>
>
>
>

--
Murilo


