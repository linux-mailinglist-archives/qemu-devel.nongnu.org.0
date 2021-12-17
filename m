Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9608478EAB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:58:35 +0100 (CET)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEgs-0003xT-RS
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:58:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1myERg-0003no-Hf; Fri, 17 Dec 2021 09:42:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1myERe-0001me-F3; Fri, 17 Dec 2021 09:42:52 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHCJbBm028999; 
 Fri, 17 Dec 2021 14:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WxYleZczGYu2Mg2lmKq3FExjq+yFi4izcbo5p69ECWw=;
 b=SHtOAugsVek9a8ALrUHCkqtP9o9TX6pUb85NweyG/Th2JTV9jSzCt9QfSZyzuk2t7c7+
 ianRG2mQQee7XDlBrCYsBqmJ1nS4+woM8vweIqm/JrJvCRe8C9eNUNvdmQqcPa7Lpdv1
 dB8Mkmxyt3OAKmZ4xGhvBipkgcn2bwxS5OgoTyxZvdn9/0hZi5XekyBUObd61qT+uYdc
 Yi8+OO7R40tBjB66OW0M7ymO0DCxopfgqVqsMNFdF58FVSrI7ETUoJo8+O6NY/fqYf3a
 65czGxaxtfxymIQpOvVJeas/B0crOg9ZmDxgzCiqVv2askKgwUj3QkomkWSyriKVbyyl Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d0tf5k1u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 14:42:38 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BHESNfp012900;
 Fri, 17 Dec 2021 14:42:37 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d0tf5k1t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 14:42:37 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BHEbZaa020147;
 Fri, 17 Dec 2021 14:42:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3cy7jrjbht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Dec 2021 14:42:34 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BHEgWDO45941146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 14:42:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6EAB252052;
 Fri, 17 Dec 2021 14:42:32 +0000 (GMT)
Received: from [9.171.60.51] (unknown [9.171.60.51])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 978155204E;
 Fri, 17 Dec 2021 14:42:31 +0000 (GMT)
Message-ID: <590e7086-0b96-bdc1-42b3-46a5b72909fc@de.ibm.com>
Date: Fri, 17 Dec 2021 15:42:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] hw: Add compat machines for 7.0
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>
References: <20211217143948.289995-1-cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <20211217143948.289995-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: D0WgNUR28QTSlnCm3Nqc8i8VeOzWCSst
X-Proofpoint-ORIG-GUID: U31DSn-CW1R3qOlAWvcF-fGSNqHkx_Ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-17_05,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170084
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 17.12.21 um 15:39 schrieb Cornelia Huck:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Acked-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

s390 parts
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
> 
> v1->v2: fix typo in i386 function chaining (thanks danpb!)
> 
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 6bce595aba20..4593fea1ce8a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2856,10 +2856,17 @@ static void machvirt_machine_init(void)
>   }
>   type_init(machvirt_machine_init);
>   
> +static void virt_machine_7_0_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
> +
>   static void virt_machine_6_2_options(MachineClass *mc)
>   {
> +    virt_machine_7_0_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>   }
> -DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
> +DEFINE_VIRT_MACHINE(6, 2)
>   
>   static void virt_machine_6_1_options(MachineClass *mc)
>   {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 53a99abc5605..a9c15479fe1d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-pci.h"
>   
> +GlobalProperty hw_compat_6_2[] = {};
> +const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
> +
>   GlobalProperty hw_compat_6_1[] = {
>       { "vhost-user-vsock-device", "seqpacket", "off" },
>       { "nvme-ns", "shared", "off" },
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc24..fccde2ef39f6 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -94,6 +94,9 @@
>   #include "trace.h"
>   #include CONFIG_DEVICES
>   
> +GlobalProperty pc_compat_6_2[] = {};
> +const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
> +
>   GlobalProperty pc_compat_6_1[] = {
>       { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
>       { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 223dd3e05d15..19991902761e 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>       machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>   }
>   
> -static void pc_i440fx_6_2_machine_options(MachineClass *m)
> +static void pc_i440fx_7_0_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_i440fx_machine_options(m);
> @@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;
>   }
>   
> +DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
> +                      pc_i440fx_7_0_machine_options);
> +
> +static void pc_i440fx_6_2_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_7_0_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> +}
> +
>   DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
>                         pc_i440fx_6_2_machine_options);
>   
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index e1e100316d93..2e981f436ce5 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
>       m->max_cpus = 288;
>   }
>   
> -static void pc_q35_6_2_machine_options(MachineClass *m)
> +static void pc_q35_7_0_machine_options(MachineClass *m)
>   {
>       PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>       pc_q35_machine_options(m);
> @@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
>       pcmc->default_cpu_version = 1;
>   }
>   
> +DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
> +                   pc_q35_7_0_machine_options);
> +
> +static void pc_q35_6_2_machine_options(MachineClass *m)
> +{
> +    pc_q35_7_0_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> +}
> +
>   DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
>                      pc_q35_6_2_machine_options);
>   
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 3b5fd749be89..837342932586 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4665,15 +4665,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>       }                                                                \
>       type_init(spapr_machine_register_##suffix)
>   
> +/*
> + * pseries-7.0
> + */
> +static void spapr_machine_7_0_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(7_0, "7.0", true);
> +
>   /*
>    * pseries-6.2
>    */
>   static void spapr_machine_6_2_class_options(MachineClass *mc)
>   {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_7_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>   }
>   
> -DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
> +DEFINE_SPAPR_MACHINE(6_2, "6.2", false);
>   
>   /*
>    * pseries-6.1
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 653587ea62f4..84e3e63c430d 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>       }                                                                         \
>       type_init(ccw_machine_register_##suffix)
>   
> +static void ccw_machine_7_0_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_7_0_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(7_0, "7.0", true);
> +
>   static void ccw_machine_6_2_instance_options(MachineState *machine)
>   {
> +    ccw_machine_7_0_instance_options(machine);
>   }
>   
>   static void ccw_machine_6_2_class_options(MachineClass *mc)
>   {
> +    ccw_machine_7_0_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
>   }
> -DEFINE_CCW_MACHINE(6_2, "6.2", true);
> +DEFINE_CCW_MACHINE(6_2, "6.2", false);
>   
>   static void ccw_machine_6_1_instance_options(MachineState *machine)
>   {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 9c1c1901046c..b7b68471ffc1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -375,6 +375,9 @@ struct MachineState {
>       } \
>       type_init(machine_initfn##_register_types)
>   
> +extern GlobalProperty hw_compat_6_2[];
> +extern const size_t hw_compat_6_2_len;
> +
>   extern GlobalProperty hw_compat_6_1[];
>   extern const size_t hw_compat_6_1_len;
>   
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 9ab39e428f80..b38947c224cd 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -196,6 +196,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>   /* sgx.c */
>   void pc_machine_init_sgx_epc(PCMachineState *pcms);
>   
> +extern GlobalProperty pc_compat_6_2[];
> +extern const size_t pc_compat_6_2_len;
> +
>   extern GlobalProperty pc_compat_6_1[];
>   extern const size_t pc_compat_6_1_len;
>   
> 

