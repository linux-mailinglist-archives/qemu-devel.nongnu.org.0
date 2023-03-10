Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1514E6B5100
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:34:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paiVm-0007ET-J8; Fri, 10 Mar 2023 14:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paiVS-00077U-Iq; Fri, 10 Mar 2023 14:34:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1paiVQ-0000im-GU; Fri, 10 Mar 2023 14:34:22 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32AJVQpI000532; Fri, 10 Mar 2023 19:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4H1Cmlea1hrzuI8amBVLvqje2srE6AE5Gl8zkq5zgvg=;
 b=gWYgA88xmPk6L1vsAGDtrtLZGubMB4rJq99fX48Qej/f/iWs3i1yFT01Brm/0waneFSP
 24QmseY74QNFyyNj3qrYcySOa3uYMw0CFYrR9k7SujKkbyXd7fziDuIW8pcIrbYYTcSQ
 i7pTKhVnVksR4sronGgtyzstdfFo3UauY25o1SNybqnk2yJEfsd69jIoAGKXD734flx+
 0nZIXpURgGAybL/fyZr9PrBZ3Ku4VzBR47Hz9T67dM/1sDhyXNBykpi0MsE5s4GHNg2m
 Tc5+iZMLgwa6pn1IMm/tbZAe062pPAOCb/cu9ZZcA9uUi4BAFxwFj1ziRLabPNA4grJo fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p8aseg29b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 19:34:17 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32AJWJ1O004403;
 Fri, 10 Mar 2023 19:34:16 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p8aseg288-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 19:34:16 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32A84csR002694;
 Fri, 10 Mar 2023 19:34:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3p6g0pk7et-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Mar 2023 19:34:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32AJYBV957213256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Mar 2023 19:34:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E142620040;
 Fri, 10 Mar 2023 19:34:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5479D20043;
 Fri, 10 Mar 2023 19:34:11 +0000 (GMT)
Received: from [9.171.22.18] (unknown [9.171.22.18])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Mar 2023 19:34:11 +0000 (GMT)
Message-ID: <f75b53839aebc414c45da99b7b9e6fccef72b2d2.camel@linux.ibm.com>
Subject: Re: [PATCH 01/12] target/s390x: Handle branching to odd addresses
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Harold Grovesteen <h.grovsteen@tx.rr.com>, Nina
 Schoetterl-Glausch <nsg@linux.ibm.com>
Date: Fri, 10 Mar 2023 20:34:10 +0100
In-Reply-To: <ac8534ad-6cf5-6ba6-d1a5-10f4135490b2@linaro.org>
References: <20230310174223.944843-1-iii@linux.ibm.com>
 <20230310174223.944843-2-iii@linux.ibm.com>
 <ac8534ad-6cf5-6ba6-d1a5-10f4135490b2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GaDKyTsCe2E_KRensMuoGqePT3YFc6-l
X-Proofpoint-GUID: BJR5qB2_PvZSOKvTZHwWuZA98ovDw4pO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 clxscore=1015 mlxlogscore=556 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100155
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

On Fri, 2023-03-10 at 11:24 -0800, Richard Henderson wrote:
> On 3/10/23 09:42, Ilya Leoshkevich wrote:
> > @@ -381,6 +382,14 @@ static inline int cpu_mmu_index(CPUS390XState
> > *env, bool ifetch)
> > =C2=A0 static inline void cpu_get_tb_cpu_state(CPUS390XState* env,
> > target_ulong *pc,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_ulong *cs_base,
> > uint32_t *flags)
> > =C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 if (env->psw.addr & 1) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Instructions must b=
e at even addresses.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This needs to be ch=
ecked before address translation.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->int_pgm_ilen =3D 2; /*=
 see s390_cpu_tlb_fill() */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcg_s390_program_interrupt(=
env, PGM_SPECIFICATION, 0);
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> This is incorrect placement.=C2=A0 You can't raise an exception from all
> of the places from=20
> which this is called.
>=20
> You need to do this at the start of s390x_tr_translate_insn.
> Compare aarch64_tr_translate_insn and the test for (pc & 3).
>=20
>=20
> r~

The problem is that it's too late - for non-mapped memory we would get
a translation exception instead of a specification exception.

I see the following call sites:

- HELPER(lookup_tb_ptr) - for helpers the exceptions should work;
- cpu_exec_loop(), cpu_exec_step_atomic - these are wrapped in setjmp,
  so it should be ok too?
- tb_check_watchpoint() - is this the problematic one?

Am I missing something?

