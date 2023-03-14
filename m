Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0396B9DBA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:59:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8vG-00084V-UN; Tue, 14 Mar 2023 13:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pc8vD-00083X-OO; Tue, 14 Mar 2023 13:58:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>)
 id 1pc8vB-0005xq-SU; Tue, 14 Mar 2023 13:58:51 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EGvMER019707; Tue, 14 Mar 2023 17:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ForIrXgZnkrYz/GVgwW+9CSgxfFcXpLTTpehUbb/1tI=;
 b=dNv9RL2LDdyEWUsW2jKcY7NXhiPH2UoFWl8HraN/o/1a1kWEWsIfEKYc0sY0xbPL++F3
 EynFAEH6K/pu7Q9aRyujRyznofyymU8Zc30dpiA1rPRIL/DFzW1id8crq6pb3ZvVg16E
 Yv/CuSnrDJAKCfnvdCETwkoOsHY0tG6isUkNTqFZXm1faFxtr/+9gQ2heswieJe9W1JQ
 h/fDGSeCZjUK1ZwHjzT9lWn4+JVNZLv7v1OMHoqp/iFiVXqMtDgQ1r8zu3UPssIGhzXO
 d0IE+ETlIC0LJLTgmFl30UJ+Gk8L/dUU/Kg+Gtkgv4v4vE7AdR5qvENK6pdTkSHSQAHD TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pavw9hneh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 17:58:45 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32EGvpJ1020352;
 Tue, 14 Mar 2023 17:58:45 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pavw9hnb2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 17:58:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32E8dNc9028582;
 Tue, 14 Mar 2023 17:58:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3p8gwfm3v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 17:58:42 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32EHwdVD36503834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 17:58:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C206820043;
 Tue, 14 Mar 2023 17:58:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F71420040;
 Tue, 14 Mar 2023 17:58:39 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.152.224.238])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Mar 2023 17:58:39 +0000 (GMT)
Message-ID: <bf44bcc551c1537eeda24cde88ed353a7a9bea31.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] target/s390x: Implement Early Exception Recognition
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 14 Mar 2023 18:58:39 +0100
In-Reply-To: <20230314110022.184717-2-iii@linux.ibm.com>
References: <20230314110022.184717-1-iii@linux.ibm.com>
 <20230314110022.184717-2-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YRtkv89KujVS-rVz-qbSjHx8VXcMm_ct
X-Proofpoint-ORIG-GUID: 5ICy2kuoZ1NE5OYZgdJzVJ1kIDDeBycL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_10,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140144
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

On Tue, 2023-03-14 at 12:00 +0100, Ilya Leoshkevich wrote:
> Generate specification exception if a reserved bit is set in the PSW

Generate a ...
> mask or if the PSW address is out of bounds dictated by the addresing

addresSing

> mode.

Does this approach also work with SET SYSTEM MASK and STORE THEN OR SYSTEM
MASK, i.e. do these call s390_cpu_set_psw via some code path I'm not seeing=
?

In any case, you don't seem to implement their special requirements with re=
gards
to the ilen, so you should at least mention that.

>=20
> Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/cpu.c             | 26 ++++++++++++++++++++++++++
>  target/s390x/cpu.h             |  1 +
>  target/s390x/tcg/excp_helper.c |  3 ++-
>  3 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index b10a8541ff8..8e6e46aa3d8 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -41,6 +41,26 @@
>  #define CR0_RESET       0xE0UL
>  #define CR14_RESET      0xC2000000UL;
> =20
> +#ifndef CONFIG_USER_ONLY
> +static bool is_early_exception_recognized(uint64_t mask, uint64_t addr)
> +{
> +    if (mask & PSW_MASK_RESERVED) {
> +        return true;
> +    }
> +
> +    switch (mask & (PSW_MASK_32 | PSW_MASK_64)) {
> +    case 0:
> +        return addr & ~0xffffffULL;
> +    case PSW_MASK_32:
> +        return addr & ~0x7fffffffULL;
> +    case PSW_MASK_32 | PSW_MASK_64:
> +        return false;
> +    default: /* PSW_MASK_64 */
> +        return true;
> +    }
> +}
> +#endif
> +
>  void s390_cpu_set_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
>  {
>  #ifndef CONFIG_USER_ONLY
> @@ -57,6 +77,12 @@ void s390_cpu_set_psw(CPUS390XState *env, uint64_t mas=
k, uint64_t addr)
>      env->cc_op =3D (mask >> 44) & 3;
> =20
>  #ifndef CONFIG_USER_ONLY
> +    if (is_early_exception_recognized(mask, addr)) {
> +        env->int_pgm_ilen =3D 0;
> +        trigger_pgm_exception(env, PGM_SPECIFICATION);
> +        return;
> +    }
> +
>      if ((old_mask ^ mask) & PSW_MASK_PER) {
>          s390_cpu_recompute_watchpoints(env_cpu(env));
>      }
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 7d6d01325b2..b4de6945936 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -292,6 +292,7 @@ extern const VMStateDescription vmstate_s390_cpu;
>  #define PSW_MASK_32             0x0000000080000000ULL
>  #define PSW_MASK_SHORT_ADDR     0x000000007fffffffULL
>  #define PSW_MASK_SHORT_CTRL     0xffffffff80000000ULL
> +#define PSW_MASK_RESERVED       0xb800007e7fffffffULL

What about bit 12?

With bit 12 added:
I haven't checked, but I don't think that would be sufficient for short PSW=
s loaded
with lpsw. I'm not seeing op_lpsw flipping the 12th bit.
op_lpsw looks pretty broken to me overall, putting the BA bit into the addr=
ess.
I think it should look something like this (didn't actually try it):

static DisasJumpType op_lpsw(DisasContext *s, DisasOps *o)
{
    TCGv_i64 t1, t2;

    per_breaking_event(s);

    t1 =3D tcg_temp_new_i64();
    t2 =3D tcg_temp_new_i64();
    tcg_gen_qemu_ld_i64(t1, o->in2, get_mem_index(s),
                        MO_TEUQ | MO_ALIGN);		//load 8byte instead of 4
    tcg_gen_addi_i64(o->in2, o->in2, 4);
    tcg_gen_qemu_ld32u(t2, o->in2, get_mem_index(s));
    tcg_gen_andi_i64(t2, t2, PSW_MASK_SHORT_ADDR);
    /* Convert the 32-bit PSW_MASK into the 64-bit PSW_MASK.  */
    tcg_gen_andi_i64(t1, t1, PSW_MASK_SHORT_CTRL);
    tcg_gen_xori_i64(t1, t1, PSW_MASK_SHORTPSW);
    gen_helper_load_psw(cpu_env, t1, t2);
    return DISAS_NORETURN;
}
> =20
>  #undef PSW_ASC_PRIMARY
>  #undef PSW_ASC_ACCREG
> diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helpe=
r.c
> index bc767f04438..a7829b1e494 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -212,7 +212,8 @@ static void do_program_interrupt(CPUS390XState *env)
>      LowCore *lowcore;
>      int ilen =3D env->int_pgm_ilen;
> =20
> -    assert(ilen =3D=3D 2 || ilen =3D=3D 4 || ilen =3D=3D 6);
> +    assert((env->int_pgm_code =3D=3D PGM_SPECIFICATION && ilen =3D=3D 0)=
 ||
> +           ilen =3D=3D 2 || ilen =3D=3D 4 || ilen =3D=3D 6);
> =20
>      switch (env->int_pgm_code) {
>      case PGM_PER:


