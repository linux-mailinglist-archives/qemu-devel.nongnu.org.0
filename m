Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C78C6F6982
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:05:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWmM-0007ur-Mw; Thu, 04 May 2023 07:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>) id 1puWmJ-0007tH-Fk
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:05:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsg@linux.ibm.com>) id 1puWmG-0003JY-NN
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:05:39 -0400
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344Adb55031054; Thu, 4 May 2023 11:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=UroErleK60vpRc1TOxZACROEUFKkYQPb17vzVe0JFHo=;
 b=H5veoE00VHcp5BIEhCRUBH71u5aI/zw+yTm9m1AhfTTQxjVnuJSJDue3m/PEB3B4d0KP
 Z/LtwunYdoGkacYTBnqqIVxLbbuze3K1hPqVWk6JK9GAzsmSm9qQgV0D19Dts0iQRRl3
 qwH2ggkMnypd0pNHw0JRM0/AvDE8gJp62lv3oz5mcJQNVp6xRMD2Bq8ng+w8eI5JfAk9
 d/mwAeDbvbw8pHeuDRt8Nq83PImOO5FYaeIMsuoCfXRGjChpaI+q2saeur6rkrcrCYwV
 XQ2o7sSqYIDzDonLbfevRPN6UJstr5XBaGi3sI5rg5xnWb1lkWcq1103fVRjP+y8q3F5 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qca122nqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 11:03:21 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344AmRVN005306;
 Thu, 4 May 2023 11:03:21 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qca122npe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 11:03:20 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3444P042018678;
 Thu, 4 May 2023 11:03:18 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3q8tv6janj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 11:03:18 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 344B3DoE30933324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 May 2023 11:03:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F41A1201F7;
 Thu,  4 May 2023 11:03:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D80D201F6;
 Thu,  4 May 2023 11:03:11 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.36.58]) by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  4 May 2023 11:03:11 +0000 (GMT)
Message-ID: <ffc6bf647f1d7238f15b9d08ae20683bdb116eb4.camel@linux.ibm.com>
Subject: Re: [PATCH v20 06/21] s390x/cpu topology: interception of PTF
 instruction
From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Thu, 04 May 2023 13:03:10 +0200
In-Reply-To: <20230425161456.21031-7-pmorel@linux.ibm.com>
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-7-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZUkmcHyfjvYu_Fyxm4tkvvzezxETm3C_
X-Proofpoint-GUID: t_ESf3W_lMKj1HXLgbYhIq0vdlj-OUkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_06,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040086
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nsg@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2023-04-25 at 18:14 +0200, Pierre Morel wrote:
> When the host supports the CPU topology facility, the PTF
> instruction with function code 2 is interpreted by the SIE,
> provided that the userland hypervisor activates the interpretation
> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
>=20
> The PTF instructions with function code 0 and 1 are intercepted
> and must be emulated by the userland hypervisor.
>=20
> During RESET all CPU of the configuration are placed in
> horizontal polarity.
>=20
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>

Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

See nit below.
> ---
>  include/hw/s390x/s390-virtio-ccw.h |  6 ++++
>  hw/s390x/cpu-topology.c            | 51 ++++++++++++++++++++++++++++++
>  target/s390x/kvm/kvm.c             | 11 +++++++
>  3 files changed, 68 insertions(+)
>=20
> diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-v=
irtio-ccw.h
> index 9bba21a916..c1d46e78af 100644
> --- a/include/hw/s390x/s390-virtio-ccw.h
> +++ b/include/hw/s390x/s390-virtio-ccw.h
> @@ -30,6 +30,12 @@ struct S390CcwMachineState {
>      uint8_t loadparm[8];
>  };
> =20
> +#define S390_PTF_REASON_NONE (0x00 << 8)
> +#define S390_PTF_REASON_DONE (0x01 << 8)
> +#define S390_PTF_REASON_BUSY (0x02 << 8)
> +#define S390_TOPO_FC_MASK 0xffUL
> +void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
> +
>  struct S390CcwMachineClass {
>      /*< private >*/
>      MachineClass parent_class;
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index c98439ff7a..3c7bbff4bc 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -96,6 +96,56 @@ static void s390_topology_init(MachineState *ms)
>      QTAILQ_INSERT_HEAD(&s390_topology.list, entry, next);
>  }
> =20
> +/*
> + * s390_handle_ptf:
> + *
> + * @register 1: contains the function code
> + *
> + * Function codes 0 (horizontal) and 1 (vertical) define the CPU
> + * polarization requested by the guest.
> + *
> + * Function code 2 is handling topology changes and is interpreted
> + * by the SIE.
> + */
> +void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra)
> +{
> +    CPUS390XState *env =3D &cpu->env;
> +    uint64_t reg =3D env->regs[r1];
> +    int fc =3D reg & S390_TOPO_FC_MASK;
> +
> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
> +        s390_program_interrupt(env, PGM_OPERATION, ra);
> +        return;
> +    }
> +
> +    if (env->psw.mask & PSW_MASK_PSTATE) {
> +        s390_program_interrupt(env, PGM_PRIVILEGED, ra);
> +        return;
> +    }
> +
> +    if (reg & ~S390_TOPO_FC_MASK) {
> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +        return;
> +    }
> +
> +    switch (fc) {
> +    case S390_CPU_POLARIZATION_VERTICAL:
> +    case S390_CPU_POLARIZATION_HORIZONTAL:

I'd give this a name.
bool requested_vertical =3D !!fc;

> +        if (s390_topology.vertical_polarization =3D=3D !!fc) {
> +            env->regs[r1] |=3D S390_PTF_REASON_DONE;
> +            setcc(cpu, 2);
> +        } else {
> +            s390_topology.vertical_polarization =3D !!fc;
> +            s390_cpu_topology_set_changed(true);
> +            setcc(cpu, 0);
> +        }
> +        break;
> +    default:
> +        /* Note that fc =3D=3D 2 is interpreted by the SIE */
> +        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
> +    }
> +}
> +

[...]


