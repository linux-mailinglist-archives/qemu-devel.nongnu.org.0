Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57286357610
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 22:30:30 +0200 (CEST)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUEon-0003cE-DX
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 16:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eajames@linux.ibm.com>)
 id 1lUEnm-00033w-G7; Wed, 07 Apr 2021 16:29:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eajames@linux.ibm.com>)
 id 1lUEnb-00085r-2p; Wed, 07 Apr 2021 16:29:26 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137K3gKF146311; Wed, 7 Apr 2021 16:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=FNrZXGdGATpqTaN3EdS09LqNE5NE1sMRSEVIlIThm+g=;
 b=P5+WX1a7GHOIDc48sRxU6s9n7D1dMhQEuU7oXMQLMcAUf6tb0hlmj3Vx71uxFYrZHhtf
 rJZZXKirQucXpFhmB8umtE+QV4qpwRnbwNhf34wLxBbgXU3MH+BPuk3dt+X6oiez00a3
 lkCed6Xn+ocCj6Nz4bHVFgNCeu8W5/KhJy+yMdOAnO0OoBJTbs98ViENufUOI1wPNxj6
 A4IQhAiaLGgrnWPY8eUC4mo/23/jKz8dYh2m771pOjiGz+dwMtWk96AaPx8fQobes/Sc
 vTVMo3iSnqaivTHbTkSlEWGxoKZJGougJzZwi8rGi7e080bDxNf4Fs4LfEfT0mRKnAWO PA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvn0vfky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 16:29:06 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137KSEL9013900;
 Wed, 7 Apr 2021 20:29:04 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 37ryqc6xrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 20:29:04 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137KT4uc30015908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 20:29:04 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 521EA112061;
 Wed,  7 Apr 2021 20:29:04 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0A28112062;
 Wed,  7 Apr 2021 20:29:03 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.105.252])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 20:29:03 +0000 (GMT)
Message-ID: <5f0d0a86266582660d4d6a60fe8d9777b150c62b.camel@linux.ibm.com>
Subject: Re: [PATCH 13/24] hw/misc/aspeed_xdma: Add AST2600 support
From: Eddie James <eajames@linux.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>
Date: Wed, 07 Apr 2021 15:29:03 -0500
In-Reply-To: <20210407171637.777743-14-clg@kaod.org>
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-14-clg@kaod.org>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -o9GFAAlc4j3YSwB9pzq7QDhVD47U6ev
X-Proofpoint-ORIG-GUID: -o9GFAAlc4j3YSwB9pzq7QDhVD47U6ev
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_10:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070140
Received-SPF: pass client-ip=148.163.156.1; envelope-from=eajames@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2021-04-07 at 19:16 +0200, Cédric Le Goater wrote:
> When we introduced support for the AST2600 SoC, the XDMA controller
> was forgotten. It went unnoticed because it's not used under
> emulation.
> But the register layout being different, the reset procedure is bogus
> and this breaks kexec.
> 
> Add a AspeedXDMAClass to take into account the register differences.

Thanks Cedric!

Reviewed-by: Eddie James <eajames@linux.ibm.com>

> 
> Cc: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/misc/aspeed_xdma.h |  17 ++++-
>  hw/arm/aspeed_ast2600.c       |   3 +-
>  hw/arm/aspeed_soc.c           |   3 +-
>  hw/misc/aspeed_xdma.c         | 124 +++++++++++++++++++++++++++-----
> --
>  4 files changed, 121 insertions(+), 26 deletions(-)
> 
> diff --git a/include/hw/misc/aspeed_xdma.h
> b/include/hw/misc/aspeed_xdma.h
> index a2dea96984f3..b1478fd1c681 100644
> --- a/include/hw/misc/aspeed_xdma.h
> +++ b/include/hw/misc/aspeed_xdma.h
> @@ -13,7 +13,10 @@
>  #include "qom/object.h"
>  
>  #define TYPE_ASPEED_XDMA "aspeed.xdma"
> -OBJECT_DECLARE_SIMPLE_TYPE(AspeedXDMAState, ASPEED_XDMA)
> +#define TYPE_ASPEED_2400_XDMA TYPE_ASPEED_XDMA "-ast2400"
> +#define TYPE_ASPEED_2500_XDMA TYPE_ASPEED_XDMA "-ast2500"
> +#define TYPE_ASPEED_2600_XDMA TYPE_ASPEED_XDMA "-ast2600"
> +OBJECT_DECLARE_TYPE(AspeedXDMAState, AspeedXDMAClass, ASPEED_XDMA)
>  
>  #define ASPEED_XDMA_NUM_REGS (ASPEED_XDMA_REG_SIZE /
> sizeof(uint32_t))
>  #define ASPEED_XDMA_REG_SIZE 0x7C
> @@ -28,4 +31,16 @@ struct AspeedXDMAState {
>      uint32_t regs[ASPEED_XDMA_NUM_REGS];
>  };
>  
> +struct AspeedXDMAClass {
> +    SysBusDeviceClass parent_class;
> +
> +    uint8_t cmdq_endp;
> +    uint8_t cmdq_wrp;
> +    uint8_t cmdq_rdp;
> +    uint8_t intr_ctrl;
> +    uint32_t intr_ctrl_mask;
> +    uint8_t intr_status;
> +    uint32_t intr_complete;
> +};
> +
>  #endif /* ASPEED_XDMA_H */
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index e0fbb020c770..c60824bfeecb 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -187,7 +187,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
>          object_initialize_child(obj, "mii[*]", &s->mii[i],
> TYPE_ASPEED_MII);
>      }
>  
> -    object_initialize_child(obj, "xdma", &s->xdma,
> TYPE_ASPEED_XDMA);
> +    snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s",
> socname);
> +    object_initialize_child(obj, "xdma", &s->xdma, typename);
>  
>      snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
>      object_initialize_child(obj, "gpio", &s->gpio, typename);
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 8ed29113f79f..4a95d27d9d63 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -199,7 +199,8 @@ static void aspeed_soc_init(Object *obj)
>                                  TYPE_FTGMAC100);
>      }
>  
> -    object_initialize_child(obj, "xdma", &s->xdma,
> TYPE_ASPEED_XDMA);
> +    snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s",
> socname);
> +    object_initialize_child(obj, "xdma", &s->xdma, typename);
>  
>      snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
>      object_initialize_child(obj, "gpio", &s->gpio, typename);
> diff --git a/hw/misc/aspeed_xdma.c b/hw/misc/aspeed_xdma.c
> index 533d237e3ce2..1c21577c98c9 100644
> --- a/hw/misc/aspeed_xdma.c
> +++ b/hw/misc/aspeed_xdma.c
> @@ -30,6 +30,19 @@
>  #define  XDMA_IRQ_ENG_STAT_US_COMP BIT(4)
>  #define  XDMA_IRQ_ENG_STAT_DS_COMP BIT(5)
>  #define  XDMA_IRQ_ENG_STAT_RESET   0xF8000000
> +
> +#define XDMA_AST2600_BMC_CMDQ_ADDR   0x14
> +#define XDMA_AST2600_BMC_CMDQ_ENDP   0x18
> +#define XDMA_AST2600_BMC_CMDQ_WRP    0x1c
> +#define XDMA_AST2600_BMC_CMDQ_RDP    0x20
> +#define XDMA_AST2600_IRQ_CTRL        0x38
> +#define  XDMA_AST2600_IRQ_CTRL_US_COMP    BIT(16)
> +#define  XDMA_AST2600_IRQ_CTRL_DS_COMP    BIT(17)
> +#define  XDMA_AST2600_IRQ_CTRL_W_MASK     0x017003FF
> +#define XDMA_AST2600_IRQ_STATUS      0x3c
> +#define  XDMA_AST2600_IRQ_STATUS_US_COMP  BIT(16)
> +#define  XDMA_AST2600_IRQ_STATUS_DS_COMP  BIT(17)
> +
>  #define XDMA_MEM_SIZE              0x1000
>  
>  #define TO_REG(addr) ((addr) / sizeof(uint32_t))
> @@ -52,56 +65,48 @@ static void aspeed_xdma_write(void *opaque,
> hwaddr addr, uint64_t val,
>      unsigned int idx;
>      uint32_t val32 = (uint32_t)val;
>      AspeedXDMAState *xdma = opaque;
> +    AspeedXDMAClass *axc = ASPEED_XDMA_GET_CLASS(xdma);
>  
>      if (addr >= ASPEED_XDMA_REG_SIZE) {
>          return;
>      }
>  
> -    switch (addr) {
> -    case XDMA_BMC_CMDQ_ENDP:
> +    if (addr == axc->cmdq_endp) {
>          xdma->regs[TO_REG(addr)] = val32 & XDMA_BMC_CMDQ_W_MASK;
> -        break;
> -    case XDMA_BMC_CMDQ_WRP:
> +    } else if (addr == axc->cmdq_wrp) {
>          idx = TO_REG(addr);
>          xdma->regs[idx] = val32 & XDMA_BMC_CMDQ_W_MASK;
> -        xdma->regs[TO_REG(XDMA_BMC_CMDQ_RDP)] = xdma->regs[idx];
> +        xdma->regs[TO_REG(axc->cmdq_rdp)] = xdma->regs[idx];
>  
>          trace_aspeed_xdma_write(addr, val);
>  
>          if (xdma->bmc_cmdq_readp_set) {
>              xdma->bmc_cmdq_readp_set = 0;
>          } else {
> -            xdma->regs[TO_REG(XDMA_IRQ_ENG_STAT)] |=
> -                XDMA_IRQ_ENG_STAT_US_COMP |
> XDMA_IRQ_ENG_STAT_DS_COMP;
> +            xdma->regs[TO_REG(axc->intr_status)] |= axc-
> >intr_complete;
>  
> -            if (xdma->regs[TO_REG(XDMA_IRQ_ENG_CTRL)] &
> -                (XDMA_IRQ_ENG_CTRL_US_COMP |
> XDMA_IRQ_ENG_CTRL_DS_COMP))
> +            if (xdma->regs[TO_REG(axc->intr_ctrl)] & axc-
> >intr_complete) {
>                  qemu_irq_raise(xdma->irq);
> +            }
>          }
> -        break;
> -    case XDMA_BMC_CMDQ_RDP:
> +    } else if (addr == axc->cmdq_rdp) {
>          trace_aspeed_xdma_write(addr, val);
>  
>          if (val32 == XDMA_BMC_CMDQ_RDP_MAGIC) {
>              xdma->bmc_cmdq_readp_set = 1;
>          }
> -        break;
> -    case XDMA_IRQ_ENG_CTRL:
> -        xdma->regs[TO_REG(addr)] = val32 & XDMA_IRQ_ENG_CTRL_W_MASK;
> -        break;
> -    case XDMA_IRQ_ENG_STAT:
> +    } else if (addr == axc->intr_ctrl) {
> +        xdma->regs[TO_REG(addr)] = val32 & axc->intr_ctrl_mask;
> +    } else if (addr == axc->intr_status) {
>          trace_aspeed_xdma_write(addr, val);
>  
>          idx = TO_REG(addr);
> -        if (val32 & (XDMA_IRQ_ENG_STAT_US_COMP |
> XDMA_IRQ_ENG_STAT_DS_COMP)) {
> -            xdma->regs[idx] &=
> -                ~(XDMA_IRQ_ENG_STAT_US_COMP |
> XDMA_IRQ_ENG_STAT_DS_COMP);
> +        if (val32 & axc->intr_complete) {
> +            xdma->regs[idx] &= ~axc->intr_complete;
>              qemu_irq_lower(xdma->irq);
>          }
> -        break;
> -    default:
> +    } else {
>          xdma->regs[TO_REG(addr)] = val32;
> -        break;
>      }
>  }
>  
> @@ -127,10 +132,11 @@ static void aspeed_xdma_realize(DeviceState
> *dev, Error **errp)
>  static void aspeed_xdma_reset(DeviceState *dev)
>  {
>      AspeedXDMAState *xdma = ASPEED_XDMA(dev);
> +    AspeedXDMAClass *axc = ASPEED_XDMA_GET_CLASS(xdma);
>  
>      xdma->bmc_cmdq_readp_set = 0;
>      memset(xdma->regs, 0, ASPEED_XDMA_REG_SIZE);
> -    xdma->regs[TO_REG(XDMA_IRQ_ENG_STAT)] = XDMA_IRQ_ENG_STAT_RESET;
> +    xdma->regs[TO_REG(axc->intr_status)] = XDMA_IRQ_ENG_STAT_RESET;
>  
>      qemu_irq_lower(xdma->irq);
>  }
> @@ -144,6 +150,73 @@ static const VMStateDescription
> aspeed_xdma_vmstate = {
>      },
>  };
>  
> +static void aspeed_2600_xdma_class_init(ObjectClass *klass, void
> *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedXDMAClass *axc = ASPEED_XDMA_CLASS(klass);
> +
> +    dc->desc = "ASPEED 2600 XDMA Controller";
> +
> +    axc->cmdq_endp = XDMA_AST2600_BMC_CMDQ_ENDP;
> +    axc->cmdq_wrp = XDMA_AST2600_BMC_CMDQ_WRP;
> +    axc->cmdq_rdp = XDMA_AST2600_BMC_CMDQ_RDP;
> +    axc->intr_ctrl = XDMA_AST2600_IRQ_CTRL;
> +    axc->intr_ctrl_mask = XDMA_AST2600_IRQ_CTRL_W_MASK;
> +    axc->intr_status = XDMA_AST2600_IRQ_STATUS;
> +    axc->intr_complete = XDMA_AST2600_IRQ_STATUS_US_COMP |
> +        XDMA_AST2600_IRQ_STATUS_DS_COMP;
> +}
> +
> +static const TypeInfo aspeed_2600_xdma_info = {
> +    .name = TYPE_ASPEED_2600_XDMA,
> +    .parent = TYPE_ASPEED_XDMA,
> +    .class_init = aspeed_2600_xdma_class_init,
> +};
> +
> +static void aspeed_2500_xdma_class_init(ObjectClass *klass, void
> *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedXDMAClass *axc = ASPEED_XDMA_CLASS(klass);
> +
> +    dc->desc = "ASPEED 2500 XDMA Controller";
> +
> +    axc->cmdq_endp = XDMA_BMC_CMDQ_ENDP;
> +    axc->cmdq_wrp = XDMA_BMC_CMDQ_WRP;
> +    axc->cmdq_rdp = XDMA_BMC_CMDQ_RDP;
> +    axc->intr_ctrl = XDMA_IRQ_ENG_CTRL;
> +    axc->intr_ctrl_mask = XDMA_IRQ_ENG_CTRL_W_MASK;
> +    axc->intr_status = XDMA_IRQ_ENG_STAT;
> +    axc->intr_complete = XDMA_IRQ_ENG_STAT_US_COMP |
> XDMA_IRQ_ENG_STAT_DS_COMP;
> +};
> +
> +static const TypeInfo aspeed_2500_xdma_info = {
> +    .name = TYPE_ASPEED_2500_XDMA,
> +    .parent = TYPE_ASPEED_XDMA,
> +    .class_init = aspeed_2500_xdma_class_init,
> +};
> +
> +static void aspeed_2400_xdma_class_init(ObjectClass *klass, void
> *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedXDMAClass *axc = ASPEED_XDMA_CLASS(klass);
> +
> +    dc->desc = "ASPEED 2400 XDMA Controller";
> +
> +    axc->cmdq_endp = XDMA_BMC_CMDQ_ENDP;
> +    axc->cmdq_wrp = XDMA_BMC_CMDQ_WRP;
> +    axc->cmdq_rdp = XDMA_BMC_CMDQ_RDP;
> +    axc->intr_ctrl = XDMA_IRQ_ENG_CTRL;
> +    axc->intr_ctrl_mask = XDMA_IRQ_ENG_CTRL_W_MASK;
> +    axc->intr_status = XDMA_IRQ_ENG_STAT;
> +    axc->intr_complete = XDMA_IRQ_ENG_STAT_US_COMP |
> XDMA_IRQ_ENG_STAT_DS_COMP;
> +};
> +
> +static const TypeInfo aspeed_2400_xdma_info = {
> +    .name = TYPE_ASPEED_2400_XDMA,
> +    .parent = TYPE_ASPEED_XDMA,
> +    .class_init = aspeed_2400_xdma_class_init,
> +};
> +
>  static void aspeed_xdma_class_init(ObjectClass *classp, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(classp);
> @@ -158,10 +231,15 @@ static const TypeInfo aspeed_xdma_info = {
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(AspeedXDMAState),
>      .class_init    = aspeed_xdma_class_init,
> +    .class_size    = sizeof(AspeedXDMAClass),
> +    .abstract      = true,
>  };
>  
>  static void aspeed_xdma_register_type(void)
>  {
>      type_register_static(&aspeed_xdma_info);
> +    type_register_static(&aspeed_2400_xdma_info);
> +    type_register_static(&aspeed_2500_xdma_info);
> +    type_register_static(&aspeed_2600_xdma_info);
>  }
>  type_init(aspeed_xdma_register_type);


