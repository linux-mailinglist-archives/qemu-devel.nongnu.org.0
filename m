Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92448D98C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 15:12:17 +0100 (CET)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n80pr-0004yW-0F
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 09:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n80kt-0001Dt-JM
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:07:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n80kc-0002cV-I6
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 09:07:05 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20DDaS2K023440; 
 Thu, 13 Jan 2022 14:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4www2mCds6vnZnam2u1nlBzwPjzDBvUnEAMn6Fv/GoM=;
 b=YY2Uo1q7cNiOvj6vChs/qX2MC/+Rxz1tuLK9ky53repDncXsVarJtSXVKP3pQrOSZStG
 5xjUU4vpuceJXrhTMmh/f9sa3g5vNRr5egp+NbfPQFe67e3EbCNh3hIEuK4CKOeSbjLr
 +6/l2ql2++4z3MShH14JkW/Zq+pnXEZ6BJosoE6hi0bVyqhS+8Win/5TOEKiXTBH/HWW
 pCzi3859i1SiiAjp5mhelkIsRCKKfwd3byIVRorQ2ntSkfxKZzpcpS8giBKoSoRMYlsB
 d6EEKz1JOQWt9I6eMZ+KU7QmFgSO6O/yEh1DDv4z2glSXhqW+pWyL8pmPmtxKwJa8rUs AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djkkgtwbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 14:06:43 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20DE2oJC013173;
 Thu, 13 Jan 2022 14:06:43 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3djkkgtwb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 14:06:43 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20DE2Fl4023153;
 Thu, 13 Jan 2022 14:06:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3df28c1w7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Jan 2022 14:06:42 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20DE6eKt18284888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Jan 2022 14:06:41 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D21A428064;
 Thu, 13 Jan 2022 14:06:40 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4D772805C;
 Thu, 13 Jan 2022 14:06:40 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 13 Jan 2022 14:06:40 +0000 (GMT)
Message-ID: <75a7ffde-5ca4-cd98-2221-203fc5d771d6@linux.ibm.com>
Date: Thu, 13 Jan 2022 09:06:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20220113103757.2801389-1-eric.auger@redhat.com>
 <20220113103757.2801389-2-eric.auger@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220113103757.2801389-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: O-fnyrmIdozU0wAguZtPdZy6ikySsdbV
X-Proofpoint-GUID: ETLuX0uldCm-qV8CUYJTNmAmKZYMLUQM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_04,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 mlxscore=0 clxscore=1011 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201130086
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: cohuck@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/13/22 05:37, Eric Auger wrote:
> Representing the CRB cmd/response buffer as a standard
> RAM region causes some trouble when the device is used
> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> as usual RAM but this latter does not have a valid page
> size alignment causing such an error report:
> "vfio_listener_region_add received unaligned region".
> To allow VFIO to detect that failing dma mapping
> this region is not an issue, let's use a ram_device
> memory region type instead.
>
> The change in meson.build is required to include the
> cpu.h header.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/tpm/meson.build |  2 +-
>   hw/tpm/tpm_crb.c   | 10 ++++++++--
>   2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/hw/tpm/meson.build b/hw/tpm/meson.build
> index 1c68d81d6a..3e74df945b 100644
> --- a/hw/tpm/meson.build
> +++ b/hw/tpm/meson.build
> @@ -1,8 +1,8 @@
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS', if_true: files('tpm_tis_common.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_ISA', if_true: files('tpm_tis_isa.c'))
>   softmmu_ss.add(when: 'CONFIG_TPM_TIS_SYSBUS', if_true: files('tpm_tis_sysbus.c'))
> -softmmu_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>
> +specific_ss.add(when: 'CONFIG_TPM_CRB', if_true: files('tpm_crb.c'))
>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_TIS'], if_true: files('tpm_ppi.c'))
>   specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TPM_CRB'], if_true: files('tpm_ppi.c'))
>   specific_ss.add(when: 'CONFIG_TPM_SPAPR', if_true: files('tpm_spapr.c'))
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index 58ebd1469c..25f8e685e4 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -25,6 +25,7 @@
>   #include "sysemu/tpm_backend.h"
>   #include "sysemu/tpm_util.h"
>   #include "sysemu/reset.h"
> +#include "cpu.h"
>   #include "tpm_prop.h"
>   #include "tpm_ppi.h"
>   #include "trace.h"
> @@ -43,6 +44,7 @@ struct CRBState {
>
>       bool ppi_enabled;
>       TPMPPI ppi;
> +    uint8_t *crb_cmd_buf;
>   };
>   typedef struct CRBState CRBState;
>
> @@ -291,10 +293,14 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>
> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
> +

Do we need an unrealize function now to qemu_vfree() this memory?


>       memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>           "tpm-crb-mmio", sizeof(s->regs));
> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
> +                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
> +    vmstate_register_ram(&s->cmdmem, DEVICE(s));
>       memory_region_add_subregion(get_system_memory(),
>           TPM_CRB_ADDR_BASE, &s->mmio);

