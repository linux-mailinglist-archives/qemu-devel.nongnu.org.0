Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E504677D3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 14:07:59 +0100 (CET)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt8IA-0000pF-9G
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 08:07:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mt8ED-000532-DJ; Fri, 03 Dec 2021 08:03:55 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1mt8E7-0006Aj-2e; Fri, 03 Dec 2021 08:03:52 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3CqcSt028495; 
 Fri, 3 Dec 2021 13:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=J1luGhM0ciohQrWNPbGjkcSwi8ebrKNHPK+bEBssvyg=;
 b=grOnya7Fn6hF0P9Vy0SVjhGMJccuqJn6h6UDWhhlBqGEBHb1PNMg0SJmM7FDa2sPDITi
 7UCK7Ha5VQYryrps9anpyhVsjtM4nJV1A7Fvcg7/rjcVzgRRLpuPkYwfUBzIXvzRmfmw
 n8SwbcyaQ2/ktwRzHwSzQyjC7TyH8p+kfbNOj6eevmGic0SyKTOM2ZdAWFwuiMd1liNf
 Yt7JIaT6GtUzh/lboguWDo9U+SPQLY5HTgW57oy23gGBFCeTVbc4NqCanSG+GHANM6Fk
 nDUHor1gyWkIFOsnvxa75QTFPL6e+zYSWCLPJ66J/Mg6A7V8U6fVEi9jCS6z1OunQ9CQ 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqkmj868y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 13:03:38 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3Cvvh0002533;
 Fri, 3 Dec 2021 13:03:38 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqkmj868q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 13:03:38 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3D3AIK020428;
 Fri, 3 Dec 2021 13:03:37 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 3ckcadbvg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 13:03:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3D3aCi54526402
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 13:03:36 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72FC4AE066;
 Fri,  3 Dec 2021 13:03:36 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BFAAAE067;
 Fri,  3 Dec 2021 13:03:35 +0000 (GMT)
Received: from localhost (unknown [9.211.34.214])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Dec 2021 13:03:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v9 00/10] PMU-EBB support for PPC64 TCG
In-Reply-To: <27d2eb41-f34a-5c2d-e1f1-977f08ac58d8@kaod.org>
References: <20211201151734.654994-1-danielhb413@gmail.com>
 <27d2eb41-f34a-5c2d-e1f1-977f08ac58d8@kaod.org>
Date: Fri, 03 Dec 2021 10:03:32 -0300
Message-ID: <87r1atj0wr.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6eEMNbiOuaR1D_w8tKAqnBgGQAAcjMZQ
X-Proofpoint-ORIG-GUID: w3LZR1iNyzcwvjshkEsjsDnQk7Eb-tYb
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_06,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, richard.henderson@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

C=C3=A9dric Le Goater <clg@kaod.org> writes:

> Hello,
>
> On 12/1/21 16:17, Daniel Henrique Barboza wrote:
>> Hi,
>>=20
>> In this new version the most significant change is in patch 6,
>> where a new hflag allows us to not call the instruction helper
>> inside translate.c unless we're absolutely certain that there
>> is an instruction count event being sampled and active in the
>> PMU. This change turned out to be a big boost in performance
>> in the PMU emulation overall, most notably when dealing with
>> cycle events that were calling the helper needlessly.
>>=20
>> This and all other changes were suggested by David in his review
>> of the previous version.
>
>
> patch 1-8 look good. I still have some questions on the exception
> handling and how EBB are gated.
>
> I am asking to get the model right for the next step which should
> be to modify the XIVE interrupt controller to generate External
> EBB exceptions.
>
> One more comment, not for now, since the EBB patchset is nearly
> ready.
>
> May be, it is time to think about introducing a per-CPU model
> excp_handlers[] array indexed by POWERPC_EXCP_* exception
> numbers and to duplicate some code for the sake of clarity.
>
> Fabiano, isn't it what you had in mind ?

I had basically changed env->excp_vectors to be an array of objects of
the kind:

  struct PPCInterrupt {
      Object parent;
=20=20
      int id;
      const char *name;
      target_ulong addr;
      ppc_intr_fn_t setup_regs;
  };

we would access it from powerpc_excp() with:

  intr =3D &env->excp_vectors[excp];
  if (intr->setup_regs) {
      intr->setup_regs(cpu, intr, excp_model, &regs, &ignore);
  }

I also had another series to move the exception models into QOM like
this:

  struct PPCIntrModel {
      Object parent;
=20=20
      int id;
      const char *name;
      target_ulong hreset_vector;
      target_ulong ivor_mask;
      target_ulong ivpr_mask;
      target_ulong excp_prefix;
      PPCInterrupt excp_vectors[POWERPC_EXCP_NB];
  };

  struct PPCIntrModelClass {
      ObjectClass parent_class;
=20=20
      bool (*intr_little_endian)(CPUPPCState *env, bool hv);
      bool (*lpar_env_selection)(CPUPPCState *env);
      target_ulong (*filter_msr)(CPUPPCState *env);
      bool (*set_sixty_four_bit_mode)(CPUPPCState *env, target_ulong *msr);
      bool (*set_ail)(CPUPPCState *env, bool mmu_all_on, bool hv_escalation,
                      bool hv, int *_ail);
      void (*prepare_tlb_miss)(PowerPCCPU *cpu, int excp, target_ulong *new=
_msr,
                               target_ulong *msr);
      void (*debug_software_tlb)(CPUPPCState *env, int excp);
      void (*init_excp)(PPCIntrModel *im);
  };

So the powerpc_excp() code would become:

    PPCIntrModel *intr_model =3D &env->im;
    PPCInterrupt *intr;
    ...

    intr =3D &intr_model->entry_points[excp];
    if (!intr->setup_regs) {
        cpu_abort(cs, "Raised an exception without defined vector %d\n",
                  excp);
    }

    regs.new_nip =3D intr->addr | intr_model->excp_prefix;
    intr->setup_regs(cpu, intr, intr_model, &regs, &ignore);

I'll rebase it all and work on reducing some of the complexity around
QOM, which was pointed out by David in the previous version:

https://lists.nongnu.org/archive/html/qemu-ppc/2021-06/msg00140.html

Any other suggestions are welcome.

>
> Thanks,
>
> C.

