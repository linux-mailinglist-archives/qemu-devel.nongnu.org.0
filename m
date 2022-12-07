Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999766463E3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 23:09:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p32bQ-0001XY-Oy; Wed, 07 Dec 2022 17:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p32bO-0001Tr-K2
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 17:09:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p32bL-0003eY-Tp
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 17:09:18 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7KvkSp014034; Wed, 7 Dec 2022 22:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=564XpP5XiK37XR/SMsmqH2D061/2c5H2VLaHEd3RhDw=;
 b=NUy1vTwD9NngTmlsflk8RUVYCvir9Q55RUR5KUJw0KNY1bFUdQBjjzXoazOcP+sSmiod
 FZJA8Vj69Tl5crbVoMq9QCbNcgS9oPuoPkRzog8dkDe0ylXp/lkg06lIPD09pPeS94mb
 0+2HSYFu1gC6ZyyDSC6ZcCIOJm/tQ/zciS2D4AWxWYXZuLY/KuF2QKNIqbFUN8463l5z
 //fomQl8MZ/JXWa5Omo9jWLnhmdwzc0BFjEJNNwWqa2jWU3HT1MiYp03sCqJENgk8K5U
 6Hm3UskGiHWXmmXRbYbSF0V7decIDNnBtTqi2OHcud7oozV9RtjW/UNT0JHIVlAOf7ab jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mb0025e92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 22:09:13 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B7LqOEK032151;
 Wed, 7 Dec 2022 22:09:12 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mb0025e86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 22:09:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7HHVix027321;
 Wed, 7 Dec 2022 22:09:10 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3m9ks43h7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 22:09:10 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B7M97RI23134878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Dec 2022 22:09:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D829D20043;
 Wed,  7 Dec 2022 22:09:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97E6220040;
 Wed,  7 Dec 2022 22:09:07 +0000 (GMT)
Received: from [9.171.70.83] (unknown [9.171.70.83])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  7 Dec 2022 22:09:07 +0000 (GMT)
Message-ID: <d3672f3db80fa495e9af23680f0926901bb99b86.camel@linux.ibm.com>
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
Date: Wed, 07 Dec 2022 23:09:07 +0100
In-Reply-To: <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
 <20221206192947.fi6c3ftrueuiqmch@heavy>
 <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MruFTJu6gmgzhzCMAbHJvt3nFDDrktQ1
X-Proofpoint-GUID: 7KM1KBDUJ3Ubh5eRpROcQd6yMVBwZN90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_11,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxlogscore=866 malwarescore=0 bulkscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070187
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 2022-12-06 at 16:22 -0600, Richard Henderson wrote:
> On 12/6/22 13:29, Ilya Leoshkevich wrote:
> > On Thu, Dec 01, 2022 at 10:51:49PM -0800, Richard Henderson wrote:
> > > This reverts 829e1376d940 ("tcg/s390: Introduce TCG_REG_TB"), and
> > > several follow-up patches.=C2=A0 The primary motivation is to reduce
> > > the
> > > less-tested code paths, pre-z10.=C2=A0 Secondarily, this allows the
> > > unconditional use of TCG_TARGET_HAS_direct_jump, which might be
> > > more
> > > important for performance than any slight increase in code size.
> > >=20
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> > > =C2=A0 tcg/s390x/tcg-target.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2=
 +-
> > > =C2=A0 tcg/s390x/tcg-target.c.inc | 176 +++++------------------------=
-
> > > -------
> > > =C2=A0 2 files changed, 23 insertions(+), 155 deletions(-)
> >=20
> > Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> >=20
> > I have a few questions/ideas for the future below.=C2=A0=20
> > >=20
...

> >=20
> > > -=C2=A0=C2=A0=C2=A0 /* Use the constant pool if USE_REG_TB, but not f=
or small
> > > constants.=C2=A0 */
> > > -=C2=A0=C2=A0=C2=A0 if (maybe_out_small_movi(s, type, TCG_TMP0, val))=
 {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (type =3D=3D TCG_TYPE_=
I32) {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
cg_out_insn(s, RR, XR, dest, TCG_TMP0);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
cg_out_insn(s, RRE, XGR, dest, TCG_TMP0);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > -=C2=A0=C2=A0=C2=A0 } else if (USE_REG_TB) {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_out_insn(s, RXY, XG, =
dest, TCG_REG_TB, TCG_REG_NONE,
> > > 0);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_pool_label(s, val, R_=
390_20, s->code_ptr - 2,
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_tbre=
l_diff(s, NULL));
> > > +=C2=A0=C2=A0=C2=A0 tcg_out_movi(s, type, TCG_TMP0, val);
> > > +=C2=A0=C2=A0=C2=A0 if (type =3D=3D TCG_TYPE_I32) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_out_insn(s, RR, XR, d=
est, TCG_TMP0);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Perform the xor by par=
ts.=C2=A0 */
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_debug_assert(HAVE_FAC=
ILITY(EXT_IMM));
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val & 0xffffffff) {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
cg_out_insn(s, RIL, XILF, dest, val);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (val > 0xffffffff) {
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
cg_out_insn(s, RIL, XIHF, dest, val >> 32);
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_out_insn(s, RRE, XGR,=
 dest, TCG_TMP0);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > =C2=A0 }
> >=20
> > Wouldn't it be worth keeping XILF/XIFH here?
>=20
> I don't know.=C2=A0 It's difficult for me to guess whether a dependency
> chain like
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 val -> xor -> xor
>=20
> (3 insns with serial dependencies) is better than
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 val=C2=A0=C2=A0 --> xor
> =C2=A0=C2=A0=C2=A0=C2=A0 load=C2=A0 -/
>=20
> (3 insns, but only one serial dependency) is better.=C2=A0 But there may
> also be instruction=20
> fusion going on at the micro-architectural level, so that there's
> really only one xor.
>=20
> If you have suggestions, I'm all ears.

I ran some experiments, and it turned out you were right: xilf+xihf is
slower exactly because of dependency chains.
So no need to change anything here and sorry for the noise.

> > I don't have any numbers right now, but it looks more
> > compact/efficient
> > than a load + XGR.
>=20
> If we assume general-instruction-extension-facility (z10?), LGRL +
> XGR is smaller than=20
> XILF + XIFH, ignoring the constant pool entry which might be shared,
> and modulo the =C2=B5arch=20
> questions above.
>=20
>=20
> > Same for OGR above; I even wonder if both implementations could be
> > unified.
>=20
> Sadly not, because of OILL et al.=C2=A0 There are no 16-bit xor immediate
> insns.
>=20
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * branch displaceme=
nt must be aligned for atomic
> > > patching;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * see if we need to=
 add extra nop before branch
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!QEMU_PTR_IS_ALIGNED(=
s->code_ptr + 1, 4)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
cg_out16(s, NOP);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_out16(s, RIL_BRCL | (=
S390_CC_ALWAYS << 4));
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s->tb_jmp_insn_offset[a0]=
 =3D tcg_current_code_size(s);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_out32(s, 0);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_jmp_reset_=
offset(s, a0);
> >=20
> > This seems to work in practice, but I don't think patching branch
> > offsets is allowed by PoP (in a multi-threaded environment). For
> > example, I had to do [2] in order to work around this limitation in
> > ftrace.
>=20
> Really?=C2=A0 How does the processor distinguish between overwriting
> opcode/condition vs=20
> overwriting immediate operand when invalidating cached instructions?

The problem is that nothing in PoP prevents a CPU from fetching
instruction bytes one by one, in random order and more than one time.
It's not that this is necessarily going to happen, rather, it's just
that this has never been verified for all instructions and formally
stated. The observation that I use in the ftrace patch is not
formalized either, but it's specific to a single instruction and should
hold in practice for the existing hardware to the best of my knowledge.

> If overwriting operand truly isn't correct, then I think we have to
> use indirect branch=20
> always for goto_tb.
>=20
> > A third benefit seems to be that we now have one more register to
> > allocate.
>=20
> Yes.=C2=A0 It's call clobbered, so it isn't live so often, but sometimes.
>=20
>=20
> r~


