Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5F135E025
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 15:34:22 +0200 (CEST)
Received: from localhost ([::1]:54518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWJBN-0006Wm-3w
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 09:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWJ8t-0005Lq-Uc; Tue, 13 Apr 2021 09:31:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:18560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lWJ8r-0000wi-HR; Tue, 13 Apr 2021 09:31:47 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DD3Dnt036464; Tue, 13 Apr 2021 09:31:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3wpDD4dsJmAGYdIzSQXZt2XJCS7q6hMKM3xqak9B+iY=;
 b=d5JokogmY3gap62AKS7PxkhzacVb23skj2RHZa8prbNhUQCuqr0LG5dyMEQQCRpZ2Xk+
 kExcm3y8rvvic/qalsXf9uZWsMc6hK+AJR1NYQjaIuLwNi4ckbj5W+xMP0MaYPM/J7i8
 f0ae8EKCkglwOHy8bJ0k2bsnIsGhd3BwO5MYVWTvBY11jErs+M/bvptsah/27587oWz/
 yW8v8PfvvTV1Wea/8eM99YMW0ev4gXrlwdnbglSzrD/lNIpm2AGStSm7bze0TVdi7KmC
 LZlA1KR4Cby18ghHdC5M+qXRiTide6qmZOj9LqdInavlhivp8SE7MVKZyNWBUTImA5nB Pw== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37vkpjtc6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 09:31:37 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DDRxmL027504;
 Tue, 13 Apr 2021 13:31:36 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 37u3na0xb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 13:31:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DDVZKt24445324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 13:31:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B96F7805F;
 Tue, 13 Apr 2021 13:31:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AF1878063;
 Tue, 13 Apr 2021 13:31:34 +0000 (GMT)
Received: from localhost (unknown [9.211.159.146])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Apr 2021 13:31:34 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
In-Reply-To: <CP2PR80MB4499015423A3D0B49610C929C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <20210412190442.114467-1-bruno.larsen@eldorado.org.br>
 <874kgb5ibs.fsf@linux.ibm.com>
 <CP2PR80MB4499015423A3D0B49610C929C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
Date: Tue, 13 Apr 2021 10:31:31 -0300
Message-ID: <871rbe5n0s.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XTLcQLJ--y4V2VG4gsg4A6xcbiKGKrv7
X-Proofpoint-ORIG-GUID: XTLcQLJ--y4V2VG4gsg4A6xcbiKGKrv7
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104130091
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Bruno Piazera Larsen <bruno.larsen@eldorado.org.br> writes:

> All the code and git related feedback as been done, with the exception of
>
>> > +gchar *ppc_gdb_arch_name(CPUState *cs);
>> > +
>> > +
>> >  #endif /* PPC_CPU_H */
>> > diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
>> > index c28319fb97..0c016b8483 100644
>> > --- a/target/ppc/gdbstub.c
>> > +++ b/target/ppc/gdbstub.c
>> > @@ -20,6 +20,10 @@
>> >  #include "qemu/osdep.h"
>> >  #include "cpu.h"
>> >  #include "exec/gdbstub.h"
>> > +#ifdef CONFIG_TCG
>> > +#include "exec/helper-proto.h"
>> > +#endif
>> We still need to figure out where to move the vscr helpers so that both
>> TCG and !TCG code can see them. But we cannot build without TCG
>> currently anyway so I guess it's ok to leave the ifdef.
>
> Actually, since we're moving the helpers away, I think it's better to rem=
ove the ifdefs...
> The helper-proto.h is here only for the vscr, so it's going away before w=
e support the !tcg build anyway. Thoughts?

Sure, that's reasonable.

>
>> > +
>> > +void ppc_cpu_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
>> > +{
>> > +
>> > +    if (pcc->insns_flags & PPC_FLOAT) {
>> > +        gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float=
_reg,
>> > +                                 33, "power-fpu.xml", 0);
>> > +    }
>> > +    if (pcc->insns_flags & PPC_ALTIVEC) {
>> > +        gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
>> > +                                 34, "power-altivec.xml", 0);
>> > +    }
>> > +    if (pcc->insns_flags & PPC_SPE) {
>> > +        gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
>> > +                                 34, "power-spe.xml", 0);
>> > +    }
>> > +    if (pcc->insns_flags2 & PPC2_VSX) {
>> > +        gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
>> > +                                 32, "power-vsx.xml", 0);
>> > +    }
>> > +#ifndef CONFIG_USER_ONLY
>> > +    gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
>> > +                             pcc->gdb_num_sprs, "power-spr.xml", 0);
>> > +#endif
>> > +}
>>
>> Same here.
>
> This function was actually created by me, wasn't in the translate_init.c.=
inc. Since we're moving gdb fuinctions to gdbstub.c, I thought it made sens=
e to hide the logic behind how to register coprocessors correctly as well. =
that's why there is no removal of this function on the diff. Should I move =
it back to ppc_cpu_realize or is this a good plan?

Right, but you created the function by refactoring the existing code in
translate_init.c.inc so the diff still needs to contain the removal of
the gdb_register_coprocessor calls from that file.

>
>
>
> Bruno Piazera Larsen
>
> Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/c=
lick?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuK=
XZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1u=
UipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI=
1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5i=
XWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IW=
DcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDY=
IvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>
>
> Departamento Computa=C3=A7=C3=A3o Embarcada
>
> Analista de Software Trainee
>
> Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

