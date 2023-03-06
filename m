Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4216AD082
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:34:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZISf-0006aD-8J; Mon, 06 Mar 2023 16:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pZISc-0006Zw-Mj; Mon, 06 Mar 2023 16:33:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pZISa-0001RM-1f; Mon, 06 Mar 2023 16:33:34 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326KqVpE018291; Mon, 6 Mar 2023 21:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eqeEu4Zgf/6is1l0c95Ng30p6/TTIkt+4cgCbq+/eX4=;
 b=iFcPbwoxIhMleA0A8e8NI3H6AVkX+Y1vFouI/XcB95Rl2tIeDARWEIXp/SGjRoMwSbPx
 ZakX8SH+0BIly7ubD9NWXs4L16W06+PzC7c1VcsNJ3qBQymXzCXaR/4zCwuKFm66K3iB
 +9QS4xv1+U6EC3YzukXmUMf+6dyWBNnoshklagEedA6vzahWrin7szR3gtL3rhXKBPvb
 v1KedfjccZrYZV70i5FqTXhzHl9jv32lBGx/Wmq2r2au3sikb9aVKPzJ7ep9W4q4H4Oc
 K5sqW6iqrKdiLDFazEh9uO+D9aqjNtx50kTpQlrAYu3tmwPO5bggZoi9E3O6DPHCSN5p aA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p500dx7pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 21:33:28 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326LE7JK012758;
 Mon, 6 Mar 2023 21:33:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p500dx7p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 21:33:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326C4UKk005943;
 Mon, 6 Mar 2023 21:33:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p418cua3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 21:33:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326LXLh726804618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 21:33:21 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80BE920049;
 Mon,  6 Mar 2023 21:33:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 564DC20040;
 Mon,  6 Mar 2023 21:33:21 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.196.196])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  6 Mar 2023 21:33:21 +0000 (GMT)
Message-ID: <d8421c57084a32f1ed5f1c813657e16fdac878a4.camel@linux.ibm.com>
Subject: Re: [PATCH v1 1/2] target/s390x: Fix emulation of C(G)HRL
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Date: Mon, 06 Mar 2023 22:33:21 +0100
In-Reply-To: <8e162045-a39a-9e9e-ff49-e4fb08e20c6d@linaro.org>
References: <20230306205554.2070579-1-nsg@linux.ibm.com>
 <20230306205554.2070579-2-nsg@linux.ibm.com>
 <8e162045-a39a-9e9e-ff49-e4fb08e20c6d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pePvgsDbL4KE-N-kC3p5E086AHx3R69p
X-Proofpoint-GUID: tSkayfgmdbdMUy6hU0tDZwav2HtRro0P
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=922 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060187
Received-SPF: pass client-ip=148.163.156.1; envelope-from=nsg@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2023-03-06 at 12:59 -0800, Richard Henderson wrote:
> On 3/6/23 12:55, Nina Schoetterl-Glausch wrote:
> > The second operand of COMPARE HALFWORD RELATIVE LONG is a signed
> > halfword, it does not have the same size as the first operand.
> >=20
> > Fixes: a7e836d5eb ("target-s390: Convert COMPARE, COMPARE LOGICAL")
> > Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> > ---
> >   target/s390x/tcg/insn-data.h.inc | 4 ++--
> >   target/s390x/tcg/translate.c     | 7 +++++++
> >   2 files changed, 9 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-d=
ata.h.inc
> > index 9d2d35f084..6fe8ca5143 100644
> > --- a/target/s390x/tcg/insn-data.h.inc
> > +++ b/target/s390x/tcg/insn-data.h.inc
> > @@ -199,8 +199,8 @@
> >       C(0xe55c, CHSI,    SIL,   GIE, m1_32s, i2, 0, 0, 0, cmps64)
> >       C(0xe558, CGHSI,   SIL,   GIE, m1_64, i2, 0, 0, 0, cmps64)
> >   /* COMPARE HALFWORD RELATIVE LONG */
> > -    C(0xc605, CHRL,    RIL_b, GIE, r1_o, mri2_32s, 0, 0, 0, cmps32)
> > -    C(0xc604, CGHRL,   RIL_b, GIE, r1_o, mri2_64, 0, 0, 0, cmps64)
> > +    C(0xc605, CHRL,    RIL_b, GIE, r1_o, mri2_16s, 0, 0, 0, cmps32)
> > +    C(0xc604, CGHRL,   RIL_b, GIE, r1_o, mri2_16s, 0, 0, 0, cmps64)
> >   /* COMPARE HIGH */
> >       C(0xb9cd, CHHR,    RRE,   HW,  r1_sr32, r2_sr32, 0, 0, 0, cmps32)
> >       C(0xb9dd, CHLR,    RRE,   HW,  r1_sr32, r2_o, 0, 0, 0, cmps32)
> > diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> > index 811049ea28..60b1254bb2 100644
> > --- a/target/s390x/tcg/translate.c
> > +++ b/target/s390x/tcg/translate.c
> > @@ -5974,6 +5974,13 @@ static void in2_m2_64a(DisasContext *s, DisasOps=
 *o)
> >   #define SPEC_in2_m2_64a 0
> >   #endif
> >=20=20=20
> > +static void in2_mri2_16s(DisasContext *s, DisasOps *o)
> > +{
> > +    in2_ri2(s, o);
> > +    tcg_gen_qemu_ld16s(o->in2, o->in2, get_mem_index(s));
> > +}
> > +#define SPEC_in2_mri2_16s 0
>=20
> This is incorrect.  See
>=20
> https://patchew.org/QEMU/20230227054233.390271-1-richard.henderson@linaro=
.org/20230227054233.390271-51-richard.henderson@linaro.org/
>=20

Ah, that got merged yesterday, didn't it?
base-commit: a2b5f8b8ab7b2c947823088103a40f0ff11fe06b
which is a bit older, I'll rebase.

>=20
> r~
>=20


