Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085EF65EEBA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRCR-0008Ks-Rt; Thu, 05 Jan 2023 09:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pDRCP-0008Ka-JU; Thu, 05 Jan 2023 09:26:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pDRCN-0000fw-Iz; Thu, 05 Jan 2023 09:26:29 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305DJl1j005101; Thu, 5 Jan 2023 14:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=I7GgfDbYrrOSAYRWqcOd0rU33MVA9zTsS+vea8tt4uI=;
 b=Hwgvsqi2eXePLqjUJX7UGVPngtbKCs2qL++Qp++nEVLbnQBuhLvwwalfL/WX4ZReoC0R
 WAPxLToLSdSQ/jtfizG74A6QY+KfTIqXR1vyKh7uODaGUCkcceNis85ZeKT48kyZuuZM
 3ebBSgg9dAtB9cIIEaVqo+bPRNuX9zk481K8mL+HeaSk1IGw9Nn7HnB27ytIki5M8x8U
 dRjBoivPDz07yDRgqPo57uPVbpzw3paPScWnU45BWQdFGpgadyL6FXujYnmd70wPr0CM
 zsOyP8tTyNijVU6wcdr9S8CQiCsAYvEc0YCo+IHxz7BV9vyjGNGVNQbCxA72P1okUX4L xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwybc1swb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:26:21 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 305EJCaU014905;
 Thu, 5 Jan 2023 14:26:21 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwybc1svq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:26:21 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3051detc000865;
 Thu, 5 Jan 2023 14:26:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6n1fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 14:26:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 305EQGs846793160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Jan 2023 14:26:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 129FA20049;
 Thu,  5 Jan 2023 14:26:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7AF5920040;
 Thu,  5 Jan 2023 14:26:15 +0000 (GMT)
Received: from p-imbrenda (unknown [9.171.26.82])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
 Thu,  5 Jan 2023 14:26:15 +0000 (GMT)
Date: Thu, 5 Jan 2023 15:24:41 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, Thomas Huth
 <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, frankja@linux.ibm.com
Subject: Re: [PATCH 4/5] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Message-ID: <20230105152441.0227f965@p-imbrenda>
In-Reply-To: <20230104115111.3240594-5-clg@kaod.org>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-5-clg@kaod.org>
Organization: IBM
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vedYoOJXxsndgetswW9X_N4yMKLbDfz3
X-Proofpoint-ORIG-GUID: l-F6vrIST_WiC636Dmt2CKSEmJxV4dXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1011 spamscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301050111
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

On Wed,  4 Jan 2023 12:51:10 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> From: C=C3=A9dric Le Goater <clg@redhat.com>
>=20
> If a secure kernel is started in a non-protected VM, the OS will hang
> during boot without giving a proper error message to the user.
>=20
> Perform the checks on Confidential Guest support at runtime with an
> helper called from the service call switching the guest to protected
> mode.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  include/hw/s390x/pv.h |  2 ++
>  hw/s390x/pv.c         | 14 ++++++++++++++
>  target/s390x/diag.c   |  7 +++++++
>  3 files changed, 23 insertions(+)
>=20
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index 9360aa1091..ca7dac2e20 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -55,6 +55,7 @@ int kvm_s390_dump_init(void);
>  int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
>  int kvm_s390_dump_mem_state(uint64_t addr, size_t len, void *dest);
>  int kvm_s390_dump_completion_data(void *buff);
> +bool s390_pv_check(Error **errp);
>  #else /* CONFIG_KVM */
>  static inline bool s390_is_pv(void) { return false; }
>  static inline int s390_pv_query_info(void) { return 0; }
> @@ -75,6 +76,7 @@ static inline int kvm_s390_dump_cpu(S390CPU *cpu, void =
*buff) { return 0; }
>  static inline int kvm_s390_dump_mem_state(uint64_t addr, size_t len,
>                                            void *dest) { return 0; }
>  static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
> +static inline bool s390_pv_check(Error **errp) { return false; }
>  #endif /* CONFIG_KVM */
> =20
>  int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 8d0d3f4adc..96c0728ec9 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -307,6 +307,20 @@ static bool s390_pv_guest_check(const Object *obj, E=
rror **errp)
>      return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
>  }
> =20
> +bool s390_pv_check(Error **errp)
> +{
> +    MachineState *ms =3D MACHINE(qdev_get_machine());
> +    Object *obj =3D OBJECT(ms->cgs);
> +
> +    if (!obj) {
> +        error_setg(errp, "Protected VM started without a Confidential"
> +                   " Guest support interface");
> +        return false;
> +    }
> +
> +    return s390_pv_guest_check(obj, errp);
> +}
> +
>  OBJECT_DEFINE_TYPE_WITH_INTERFACES(S390PVGuest,
>                                     s390_pv_guest,
>                                     S390_PV_GUEST,
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index 76b01dcd68..9b16e25930 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -79,6 +79,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, u=
int64_t r3, uintptr_t ra)
>      uint64_t addr =3D  env->regs[r1];
>      uint64_t subcode =3D env->regs[r3];
>      IplParameterBlock *iplb;
> +    Error *local_err =3D NULL;
> =20
>      if (env->psw.mask & PSW_MASK_PSTATE) {
>          s390_program_interrupt(env, PGM_PRIVILEGED, ra);
> @@ -176,6 +177,12 @@ out:
>              return;
>          }
> =20
> +        if (!s390_pv_check(&local_err)) {
> +            error_report_err(local_err);
> +            env->regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;
> +            return;
> +        }
> +

in general yes

however I have noticed that we don't always return a PGM_SPECIFICATION
when PV is not available (we currently do it only for DIAG308_PV_SET). I
think we should return the PGM_SPECIFICATION for all PV subcodes when
the feature is not present (but this is a separate issue)

let me add Janosch in CC since he wrote that code

>          s390_ipl_reset_request(cs, S390_RESET_PV);
>          break;
>      default:


