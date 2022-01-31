Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6CF4A4BA8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:17:34 +0100 (CET)
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZMz-0007TZ-6v
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nEYxb-0005vy-3z; Mon, 31 Jan 2022 10:51:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nEYxV-00031r-Fo; Mon, 31 Jan 2022 10:51:15 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VFjiXB020357; 
 Mon, 31 Jan 2022 15:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=i2k9MLC/vMjzdzkEILVS6dhFDxeMVv7Krkxf2Ls1V2E=;
 b=L9oRIcxkX0u5kjKIE0ycZqKRvWVUSwL492UBuyEn4xJa6w1zNk0rfL54ZzWbBjxfQMBx
 AsqR21NtJ7DzbSVTmWVAJe37MdepE0e86gvycaePtWS7orIWmUKvnhDKVwyfhD1rtKxO
 yK2enAdCn1tr62uMDA9Xpw24lT504Xas50SWXoM2T2a2msbxOXobO1iIkwbC23Ij4np9
 Utxz4tXSRQFkuH5rhc9yPJESco6Cci7Q7v8D6gQFRG1YeSEIkUX4s8lDWdquQS237HYx
 G0q+qB+rQeDeORCF5JbwzPdILAXCTEM7tkPHbTcttO10rU1POTKiGpgukvMmdXoV9+XX yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxfdp5633-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:51:08 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VFmfaC029347;
 Mon, 31 Jan 2022 15:51:07 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxfdp562n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:51:07 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VFmRk6016046;
 Mon, 31 Jan 2022 15:51:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3dvw79wht1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 15:51:06 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VFp5eC31457608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 15:51:05 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36DB9AE063;
 Mon, 31 Jan 2022 15:51:05 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30980AE071;
 Mon, 31 Jan 2022 15:51:04 +0000 (GMT)
Received: from localhost (unknown [9.211.96.126])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 31 Jan 2022 15:51:03 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
In-Reply-To: <20220129065007.103681-1-npiggin@gmail.com>
References: <20220129065007.103681-1-npiggin@gmail.com>
Date: Mon, 31 Jan 2022 12:51:00 -0300
Message-ID: <87y22vdhuj.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WMG7Ta5K0FNdLGIUHAM89IyfVjChaxQN
X-Proofpoint-GUID: cwD31tQ5IYiVfkZdDpqNK8rn_1LqxKVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310101
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The behaviour of the Address Translation Mode on Interrupt resource is
> not consistently supported by all CPU versions or all KVM versions.  In
> particular KVM HV only supports mode 0 on POWER7 processors, and does
> not support mode 2 on any processors. KVM PR only supports mode 0. TCG
> can support all modes (0,2,3).
>
> This leads to inconsistencies in guest behaviour and could cause
> problems migrating guests.
>
> This was not too noticable for Linux guests for a long time because the
> kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
> advisory (KVM would not always honor it either) and it kept both sets of
> interrupt vectors around.
>
> Recent Linux guests depend on the AIL mode working as defined by the ISA
> to support the SCV facility interrupt. If AIL mode 3 can not be provided,
> then Linux must be given an error so it can disable the SCV facility.
>
> Add the ail-modes capability which is a bitmap of the supported values
> for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
> a new KVM CAP that exports the same thing, and provide defaults for PR
> and HV KVM that predate the cap.
> ---
>
> I just wanted to get some feedback on the approach before submitting a
> patch for the KVM cap.

Could you expand a bit on what is the use case for setting this in the
QEMU cmdline? I looks to me we already have all the information we need
with just the KVM cap.

> The reason I don't make that a boolean cap for AIL=3 is that future
> processors might implement new modes a guest would like to use even
> though it's not the nicest interface.
>
> Thanks,
> Nick
>
>  hw/ppc/spapr.c            |  1 +
>  hw/ppc/spapr_caps.c       | 81 +++++++++++++++++++++++++++++++++++++++
>  hw/ppc/spapr_hcall.c      | 16 ++------
>  include/hw/ppc/spapr.h    | 10 ++++-
>  linux-headers/linux/kvm.h |  1 +
>  target/ppc/kvm.c          | 25 ++++++++++++
>  target/ppc/kvm_ppc.h      |  6 +++
>  7 files changed, 126 insertions(+), 14 deletions(-)
>
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 163c90388a..2a7a510aa7 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4604,6 +4604,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
>      smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
>      smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;
> +    smc->default_caps.caps[SPAPR_CAP_AIL_MODES] = SPAPR_CAP_AIL_MODES_DEFAULT;
>      spapr_caps_add_properties(smc);
>      smc->irq = &spapr_irq_dual;
>      smc->dr_phb_enabled = true;
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index ed7c077a0d..21cc93af86 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -94,6 +94,30 @@ static void spapr_cap_set_bool(Object *obj, Visitor *v, const char *name,
>      spapr->eff.caps[cap->index] = value ? SPAPR_CAP_ON : SPAPR_CAP_OFF;
>  }
>  
> +static void spapr_cap_get_uint8(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
> +{
> +    SpaprCapabilityInfo *cap = opaque;
> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> +    uint8_t value = spapr_get_cap(spapr, cap->index) == SPAPR_CAP_ON;
> +
> +    visit_type_uint8(v, name, &value, errp);
> +}
> +
> +static void spapr_cap_set_uint8(Object *obj, Visitor *v, const char *name,
> +                               void *opaque, Error **errp)
> +{
> +    SpaprCapabilityInfo *cap = opaque;
> +    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> +    uint8_t value;
> +
> +    if (!visit_type_uint8(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    spapr->cmd_line_caps[cap->index] = true;
> +    spapr->eff.caps[cap->index] = value;
> +}
>  
>  static void  spapr_cap_get_string(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
> @@ -613,6 +637,54 @@ static void cap_rpt_invalidate_apply(SpaprMachineState *spapr,
>      }
>  }
>  
> +static void cap_ail_apply(SpaprMachineState *spapr,
> +                                     uint8_t val, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (!(val & (0x01 << 0))) {
> +        error_setg(errp, "cap-ail-modes mode must include AIL=0");
> +        error_append_hint(errp,
> +                          "Ensure bit 0 (value 1) is set in cap-ail-modes\n");
> +        return;
> +    }
> +
> +    if (val & ~((0x01 << 0) | (0x01 << 1) | (0x01 << 2) | (0x01 << 3))) {
> +        error_setg(errp, "Unknown cap-ail-modes value");
> +        error_append_hint(errp,
> +                          "Ensure only bits between 0 and 3 are set in cap-ail-modes\n");
> +        return;
> +    }
> +
> +    if (val & (0x01 << 1)) {
> +        error_setg(errp, "Unsupported cap-ail-modes mode AIL=1");
> +        error_append_hint(errp,
> +                          "Ensure bit 1 (value 2) is clear in cap-ail-modes\n");
> +        return;
> +    }
> +
> +    if (kvm_enabled()) {
> +        if (val & (0x01 << 2)) {
> +            error_setg(errp, "KVM does not support cap-ail-modes mode AIL=2");

Isn't this something KVM should tell us via the capability?

> +            error_append_hint(errp,
> +                              "Ensure bit 2 (value 4) is clear in cap-ail-modes\n");
> +            if (kvmppc_has_cap_ail_3()) {
> +                error_append_hint(errp, "Try appending -machine cap-ail-modes=9\n");
> +            } else {
> +                error_append_hint(errp, "Try appending -machine cap-ail-modes=1\n");
> +            }
> +            return;
> +        }
> +        if ((val & (0x01 << 3)) && !kvmppc_has_cap_ail_3()) {
> +            error_setg(errp, "KVM implementation does not support cap-ail-modes AIL=3");
> +            error_append_hint(errp,
> +                              "Ensure bit 3 (value 8) is clear in cap-ail-modes\n");
> +            error_append_hint(errp, "Try appending -machine cap-ail-modes=1\n");
> +            return;
> +        }
> +    }
> +}

I think the error reporting here is too complex. A user who just wants
to make their guest start will not bother thinking about binary
representation. There's also some room for confusion in having three
numbers present in the error message (bit #, decimal value and AIL
mode). Imagine dealing with this in a bug report, for instance.

I would just tell outright what the supported values are. Perhaps in a
little table:

Supported AIL modes:
 AIL = 0   | cap-ail-modes=1
 AIL = 2   | cap-ail-modes=5
 AIL = 3   | cap-ail-modes=9
 AIL = 2&3 | cap-ail-modes=13

We could then make the code a bit more generic. Roughly:

---
if (kvm_enabled())
    ail_supported = kvmppc_cap_ail();
else
    ail_supported = ((0x01 << 0) | (0x01 << 2) | (0x01 << 3));

if ((val & ail_supported) != val)
   print_ail_hint(ail_supported);

void print_ail_hint(int ail) {
    printf("Supported AIL modes:\n");

    if (ail & 0x1)
        printf(" AIL = 0   | cap-ail-modes=1\n");
    
    if (ail & 0x5)
        printf(" AIL = 2   | cap-ail-modes=5\n");
    
    if (ail & 0x9)
        printf(" AIL = 3   | cap-ail-modes=9\n");
    
    if (ail & 0xd)
        printf(" AIL = 2&3 | cap-ail-modes=13\n");
}
---

> +
>  SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>      [SPAPR_CAP_HTM] = {
>          .name = "htm",
> @@ -730,6 +802,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>          .type = "bool",
>          .apply = cap_rpt_invalidate_apply,
>      },
> +    [SPAPR_CAP_AIL_MODES] = {
> +        .name = "ail-modes",
> +        .description = "Bitmap of AIL (alternate interrupt location) mode support",
> +        .index = SPAPR_CAP_AIL_MODES,
> +        .get = spapr_cap_get_uint8,
> +        .set = spapr_cap_set_uint8,
> +        .type = "uint8",
> +        .apply = cap_ail_apply,
> +    },
>  };
>  
>  static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 222c1b6bbd..3de4553b35 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -811,15 +811,11 @@ static target_ulong h_set_mode_resource_le(PowerPCCPU *cpu,
>  }
>  
>  static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
> +                                                        SpaprMachineState *spapr,
>                                                          target_ulong mflags,
>                                                          target_ulong value1,
>                                                          target_ulong value2)
>  {
> -    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
> -
> -    if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> -        return H_P2;
> -    }
>      if (value1) {
>          return H_P3;
>      }
> @@ -827,13 +823,7 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
>          return H_P4;
>      }
>  
> -    if (mflags == 1) {
> -        /* AIL=1 is reserved in POWER8/POWER9/POWER10 */
> -        return H_UNSUPPORTED_FLAG;
> -    }
> -
> -    if (mflags == 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
> -        /* AIL=2 is reserved in POWER10 (ISA v3.1) */
> +    if (!(spapr_get_cap(spapr, SPAPR_CAP_AIL_MODES) & (0x01 << mflags))) {
>          return H_UNSUPPORTED_FLAG;
>      }
>  
> @@ -853,7 +843,7 @@ static target_ulong h_set_mode(PowerPCCPU *cpu, SpaprMachineState *spapr,
>          ret = h_set_mode_resource_le(cpu, spapr, args[0], args[2], args[3]);
>          break;
>      case H_SET_MODE_RESOURCE_ADDR_TRANS_MODE:
> -        ret = h_set_mode_resource_addr_trans_mode(cpu, args[0],
> +        ret = h_set_mode_resource_addr_trans_mode(cpu, spapr, args[0],
>                                                    args[2], args[3]);
>          break;
>      }
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index ee7504b976..307b89adb7 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -49,6 +49,12 @@ typedef enum {
>      SPAPR_RESIZE_HPT_REQUIRED,
>  } SpaprResizeHpt;
>  
> +/**
> + * This cap is a bitmask of supported modes. Default to always supporting
> + * 0 and 3 (PR KVM and POWER7 and earlier only support 0).
> + */
> +#define SPAPR_CAP_AIL_MODES_DEFAULT     ((0x01 << 0) | (0x01 << 3))
> +
>  /**
>   * Capabilities
>   */
> @@ -77,8 +83,10 @@ typedef enum {
>  #define SPAPR_CAP_FWNMI                 0x0A
>  /* Support H_RPT_INVALIDATE */
>  #define SPAPR_CAP_RPT_INVALIDATE        0x0B
> +/* Support for AIL modes */
> +#define SPAPR_CAP_AIL_MODES             0x0C
>  /* Num Caps */
> -#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
> +#define SPAPR_CAP_NUM                   (SPAPR_CAP_AIL_MODES + 1)
>  
>  /*
>   * Capability Values
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index bcaf66cc4d..5e94ecaa8e 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1112,6 +1112,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_BINARY_STATS_FD 203
>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>  #define KVM_CAP_ARM_MTE 205
> +#define KVM_CAP_PPC_AIL_MODES 206
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index dc93b99189..c6a5a8e6e5 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
>  static int cap_large_decr;
>  static int cap_fwnmi;
>  static int cap_rpt_invalidate;
> +static int cap_ail_modes;
>  
>  static uint32_t debug_inst_opcode;
>  
> @@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      }
>  
>      cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
> +    cap_ail_modes = kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODES);
>      kvm_ppc_register_host_cpu_type();
>  
>      return 0;
> @@ -2563,6 +2565,29 @@ int kvmppc_has_cap_rpt_invalidate(void)
>      return cap_rpt_invalidate;
>  }
>  
> +int kvmppc_has_cap_ail_3(void)
> +{
> +    if (!cap_ail_modes) {
> +        PowerPCCPUClass *pcc = kvm_ppc_get_host_cpu_class();
> +
> +        /*
> +         * KVM HV hosts which do not support CAP_AIL_MODES capability still
> +         * support AIL=3 on POWER8 and above. Special-case this so as not to
> +         * lose performance on those hosts.
> +         */
> +        if (!(pcc->insns_flags2 & PPC2_ISA207S)) {
> +            return 0;
> +        }
> +
> +        if (kvmppc_is_pr(kvm_state)) {
> +            return 0;
> +        } else {
> +            return 1;
> +        }
> +    }
> +    return !!(cap_ail_modes & (1 << 3));
> +}
> +
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void)
>  {
>      uint32_t host_pvr = mfpvr();
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..efafa67b83 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -73,6 +73,7 @@ int kvmppc_set_cap_nested_kvm_hv(int enable);
>  int kvmppc_get_cap_large_decr(void);
>  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
>  int kvmppc_has_cap_rpt_invalidate(void);
> +int kvmppc_has_cap_ail_3(void);
>  int kvmppc_enable_hwrng(void);
>  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> @@ -393,6 +394,11 @@ static inline int kvmppc_has_cap_rpt_invalidate(void)
>      return false;
>  }
>  
> +static inline int kvmppc_has_cap_ail_3(void)
> +{
> +    return false;
> +}
> +
>  static inline int kvmppc_enable_hwrng(void)
>  {
>      return -1;

