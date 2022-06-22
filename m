Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A15544B7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 10:47:36 +0200 (CEST)
Received: from localhost ([::1]:38908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3w1P-0003sw-KA
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 04:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1o3vze-00038I-9v; Wed, 22 Jun 2022 04:45:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22072
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1o3vzc-0002Gy-9X; Wed, 22 Jun 2022 04:45:46 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25M8hojG002213;
 Wed, 22 Jun 2022 08:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eCW7hPcTUQ1ORXP5aGH3idnEELQfmhYbixrEb6pCaNw=;
 b=WHyU8VGjaeJyMYXXKp0odT//RQm4X9ap3GyVKldCkE7oJR1n0bvc4QiFpalLwdXNbJ50
 UyQJtjVi3hI7O0GNq+/DXR/RDO9hOHL/gj/SkPCpWzh4PtQcZt9Lq9Rb34FFL2Uh675J
 P7jr1/kihiZmwBwvE7J2ty67LZF6qExuV6W4ZdbP6OquWftg7V7qzYcVTZz+mSh2OUuI
 HZgZxS67EwsAmLzX3z3IntQmIWTOLpHSa512DfX8Gy3gB+R9HO3C8vlAABTMUlDkWMNG
 tLEUo7QmA4bqNpqZvYVQZcSQSqIjRTfsWbBoU+lrjU4d0HTz0ki0m9Muha0MvqsIvFUm cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3guytrr15p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 08:45:42 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25M8iAjt003308;
 Wed, 22 Jun 2022 08:45:41 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3guytrr14s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 08:45:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25M8ZBX6009223;
 Wed, 22 Jun 2022 08:45:39 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3gs6b8v5hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jun 2022 08:45:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25M8jaMV23724440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 08:45:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 280A74204B;
 Wed, 22 Jun 2022 08:45:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6026042041;
 Wed, 22 Jun 2022 08:45:35 +0000 (GMT)
Received: from [9.171.38.79] (unknown [9.171.38.79])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jun 2022 08:45:35 +0000 (GMT)
Message-ID: <a39b5023-8db2-fb13-8afd-67c18fbe7d53@linux.ibm.com>
Date: Wed, 22 Jun 2022 10:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 8/8] s390x/s390-virtio-ccw: add zpcii-disable machine
 property
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220606203614.110928-1-mjrosato@linux.ibm.com>
 <20220606203614.110928-9-mjrosato@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <20220606203614.110928-9-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pE2EZ41IEr5ahrwobLX3paSjssnL-eyd
X-Proofpoint-ORIG-GUID: tISO2IhQJ0aK9Y2OKKmReVM5sK9Yx_jM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_11,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220041
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/6/22 22:36, Matthew Rosato wrote:
> The zpcii-disable machine property can be used to force-disable the use
> of zPCI interpretation facilities for a VM.  By default, this setting
> will be off for machine 7.1 and newer.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/s390-pci-kvm.c            |  4 +++-
>   hw/s390x/s390-virtio-ccw.c         | 24 ++++++++++++++++++++++++
>   include/hw/s390x/s390-virtio-ccw.h |  1 +
>   qemu-options.hx                    |  8 +++++++-
>   util/qemu-config.c                 |  4 ++++
>   5 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-kvm.c b/hw/s390x/s390-pci-kvm.c
> index 9134fe185f..5eb7fd12e2 100644
> --- a/hw/s390x/s390-pci-kvm.c
> +++ b/hw/s390x/s390-pci-kvm.c
> @@ -22,7 +22,9 @@
>   
>   bool s390_pci_kvm_interp_allowed(void)
>   {
> -    return kvm_s390_get_zpci_op() && !s390_is_pv();
> +    return (kvm_s390_get_zpci_op() && !s390_is_pv() &&
> +            !object_property_get_bool(OBJECT(qdev_get_machine()),
> +                                      "zpcii-disable", NULL));
>   }

Isn't it a duplication of machine_get_zpcii_disable?

Wouldn't it better go to hw/s390x/kvm/ ?

There get the MachineState *ms = MACHINE(qdev_get_machine()) and return 
the ms->zpcii_disable

?

>   
>   int s390_pci_kvm_aif_enable(S390PCIBusDevice *pbdev, ZpciFib *fib, bool assist)
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index cc3097bfee..70229b102b 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -645,6 +645,21 @@ static inline void machine_set_dea_key_wrap(Object *obj, bool value,
>       ms->dea_key_wrap = value;
>   }
>   
> +static inline bool machine_get_zpcii_disable(Object *obj, Error **errp)
> +{
> +    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
> +
> +    return ms->zpcii_disable;
> +}
> +
> +static inline void machine_set_zpcii_disable(Object *obj, bool value,
> +                                             Error **errp)
> +{
> +    S390CcwMachineState *ms = S390_CCW_MACHINE(obj);
> +
> +    ms->zpcii_disable = value;
> +}
> +
>   static S390CcwMachineClass *current_mc;
>   
>   /*
> @@ -740,6 +755,13 @@ static inline void s390_machine_initfn(Object *obj)
>               "Up to 8 chars in set of [A-Za-z0-9. ] (lower case chars converted"
>               " to upper case) to pass to machine loader, boot manager,"
>               " and guest kernel");
> +
> +    object_property_add_bool(obj, "zpcii-disable",
> +                             machine_get_zpcii_disable,
> +                             machine_set_zpcii_disable);
> +    object_property_set_description(obj, "zpcii-disable",
> +            "disable zPCI interpretation facilties");
> +    object_property_set_bool(obj, "zpcii-disable", false, NULL);
>   }
>   
>   static const TypeInfo ccw_machine_info = {
> @@ -804,9 +826,11 @@ DEFINE_CCW_MACHINE(7_1, "7.1", true);
>   static void ccw_machine_7_0_instance_options(MachineState *machine)
>   {
>       static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_0 };
> +    S390CcwMachineState *ms = S390_CCW_MACHINE(machine);
>   
>       ccw_machine_7_1_instance_options(machine);
>       s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
> +    ms->zpcii_disable = true;
>   }
>   
>   static void ccw_machine_7_0_class_options(MachineClass *mc)
> diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
> index 3331990e02..8a0090a071 100644
> --- a/include/hw/s390x/s390-virtio-ccw.h
> +++ b/include/hw/s390x/s390-virtio-ccw.h
> @@ -27,6 +27,7 @@ struct S390CcwMachineState {
>       bool aes_key_wrap;
>       bool dea_key_wrap;
>       bool pv;
> +    bool zpcii_disable;
>       uint8_t loadparm[8];
>   };
>   
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 60cf188da4..fafe335b4a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -36,7 +36,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>       "                nvdimm=on|off controls NVDIMM support (default=off)\n"
>       "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
>       "                hmat=on|off controls ACPI HMAT support (default=off)\n"
> -    "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n",
> +    "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n"
> +    "                zpcii-disable=on|off disables zPCI interpretation facilities (default=off)\n",
>       QEMU_ARCH_ALL)
>   SRST
>   ``-machine [type=]name[,prop=value[,...]]``
> @@ -124,6 +125,11 @@ SRST
>               -object memory-backend-ram,id=pc.ram,size=512M,x-use-canonical-path-for-ramblock-id=off
>               -machine memory-backend=pc.ram
>               -m 512M
> +
> +    ``zpcii-disable=on|off``
> +        Disables zPCI interpretation facilties on s390-ccw hosts.

s/facilties/facility/

> +        This feature can be used to disable hardware virtual assists
> +        related to zPCI devices. The default is off.
>   ERST
>   
>   DEF("M", HAS_ARG, QEMU_OPTION_M,
> diff --git a/util/qemu-config.c b/util/qemu-config.c
> index 433488aa56..5325f6bf80 100644
> --- a/util/qemu-config.c
> +++ b/util/qemu-config.c
> @@ -236,6 +236,10 @@ static QemuOptsList machine_opts = {
>               .help = "Up to 8 chars in set of [A-Za-z0-9. ](lower case chars"
>                       " converted to upper case) to pass to machine"
>                       " loader, boot manager, and guest kernel",
> +        },{
> +            .name = "zpcii-disable",
> +            .type = QEMU_OPT_BOOL,
> +            .help = "disable zPCI interpretation facilities",
>           },
>           { /* End of list */ }
>       }
> 

-- 
Pierre Morel
IBM Lab Boeblingen

