Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098563FB1C2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:17:48 +0200 (CEST)
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbY6-0002gF-0a
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mKbWE-0008Ei-9Q; Mon, 30 Aug 2021 03:15:47 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:58579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mKbWC-0006Mc-Kn; Mon, 30 Aug 2021 03:15:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D8405BB80013;
 Mon, 30 Aug 2021 09:15:42 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 30 Aug
 2021 09:15:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00428eac520-684d-4cd7-ac3a-754230d4b329,
 A410DCCBFF6448DFF799E1C977766415213BDB3F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: [PATCH 10/26] ppc/xive2: Introduce a presenter matching routine
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-11-clg@kaod.org> <YSXcze1dKtUWEMIl@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2f8d3f5a-038b-85da-3e85-e15a97aac4ca@kaod.org>
Date: Mon, 30 Aug 2021 09:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSXcze1dKtUWEMIl@yekko>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1aaf9da1-81e6-48d2-a337-8e33357f1470
X-Ovh-Tracer-Id: 9628133056352127968
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddukedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeglefgjeevheeifeffudeuhedvveeftdeliedukeejgeeviefgieefhfdtffeftdenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.58,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/25/21 8:01 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 03:45:31PM +0200, Cédric Le Goater wrote:
>> The VP space is larger in XIVE2 (P10), 24 bits instead of 19bits on
>> XIVE (P9), and the CAM line can use a 7bits or 8bits thread id.
>>
>> For now, we only use 7bits thread ids, same as P9, but because of the
>> change of the size of the VP space, the CAM matching routine is
>> different between P9 and P10. It is easier to duplicate the whole
>> routine than to add extra handlers in xive_presenter_tctx_match() used
>> for P9.
>>
>> We might come with a better solution later on, after we have added
>> some more support for the XIVE2 controller.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/ppc/xive2.h |  9 +++++
>>  hw/intc/xive2.c        | 87 ++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 96 insertions(+)
>>
>> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
>> index a14f430a09f7..8a74fa7e4c7e 100644
>> --- a/include/hw/ppc/xive2.h
>> +++ b/include/hw/ppc/xive2.h
>> @@ -60,6 +60,15 @@ int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
>>  
>>  void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
>>  
>> +/*
>> + * XIVE2 Presenter (POWER10)
>> + */
>> +
>> +int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
>> +                               uint8_t format,
>> +                               uint8_t nvt_blk, uint32_t nvt_idx,
>> +                               bool cam_ignore, uint32_t logic_serv);
>> +
>>  /*
>>   * XIVE2 END ESBs  (POWER10)
>>   */
>> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
>> index b1c216b10006..55400628467b 100644
>> --- a/hw/intc/xive2.c
>> +++ b/hw/intc/xive2.c
>> @@ -20,6 +20,11 @@
>>  #include "hw/ppc/xive2.h"
>>  #include "hw/ppc/xive2_regs.h"
>>  
>> +static inline uint32_t xive_tctx_word2(uint8_t *ring)
>> +{
>> +    return *((uint32_t *) &ring[TM_WORD2]);
>> +}
>> +
>>  static uint8_t priority_to_ipb(uint8_t priority)
>>  {
>>      return priority > XIVE_PRIORITY_MAX ?
>> @@ -215,6 +220,88 @@ static int xive2_router_get_block_id(Xive2Router *xrtr)
>>     return xrc->get_block_id(xrtr);
>>  }
>>  
>> +/*
>> + * Encode the HW CAM line with 7bit or 8bit thread id. The thread id
>> + * width and block id width is configurable at the IC level.
>> + *
>> + *    chipid << 24 | 0000 0000 0000 0000 1 threadid (7Bit)
>> + *    chipid << 24 | 0000 0000 0000 0001 threadid   (8Bit)
>> + */
>> +static uint32_t xive2_tctx_hw_cam_line(XivePresenter *xptr, XiveTCTX *tctx)
>> +{
>> +    Xive2Router *xrtr = XIVE2_ROUTER(xptr);
>> +    CPUPPCState *env = &POWERPC_CPU(tctx->cs)->env;
>> +    uint32_t pir = env->spr_cb[SPR_PIR].default_value;
>> +    uint8_t blk = xive2_router_get_block_id(xrtr);
>> +    uint8_t tid_shift = 7;
>> +    uint8_t tid_mask = (1 << tid_shift) - 1;
>> +
>> +    return xive2_nvp_cam_line(blk, 1 << tid_shift | (pir & tid_mask));
>> +}
>> +
>> +/*
>> + * The thread context register words are in big-endian format.
>> + */
>> +int xive2_presenter_tctx_match(XivePresenter *xptr, XiveTCTX *tctx,
>> +                               uint8_t format,
>> +                               uint8_t nvt_blk, uint32_t nvt_idx,
>> +                               bool cam_ignore, uint32_t logic_serv)
>> +{
>> +    uint32_t cam =   xive2_nvp_cam_line(nvt_blk, nvt_idx);
>> +    uint32_t qw3w2 = xive_tctx_word2(&tctx->regs[TM_QW3_HV_PHYS]);
>> +    uint32_t qw2w2 = xive_tctx_word2(&tctx->regs[TM_QW2_HV_POOL]);
>> +    uint32_t qw1w2 = xive_tctx_word2(&tctx->regs[TM_QW1_OS]);
>> +    uint32_t qw0w2 = xive_tctx_word2(&tctx->regs[TM_QW0_USER]);
>> +
>> +    /*
>> +     * TODO (PowerNV): ignore mode. The low order bits of the NVT
>> +     * identifier are ignored in the "CAM" match.
>> +     */
>> +
>> +    if (format == 0) {
>> +        if (cam_ignore == true) {
>> +            /*
>> +             * F=0 & i=1: Logical server notification (bits ignored at
>> +             * the end of the NVT identifier)
>> +             */
>> +            qemu_log_mask(LOG_UNIMP, "XIVE: no support for LS NVT %x/%x\n",
>> +                          nvt_blk, nvt_idx);
>> +             return -1;
> 
> You seem to have copied a small indentation error here from
> xive_presenter_tctx_match().

Indeed. 

Thanks,

C.


>> +        }
>> +
>> +        /* F=0 & i=0: Specific NVT notification */
>> +
>> +        /* PHYS ring */
>> +        if ((be32_to_cpu(qw3w2) & TM2_QW3W2_VT) &&
>> +            cam == xive2_tctx_hw_cam_line(xptr, tctx)) {
>> +            return TM_QW3_HV_PHYS;
>> +        }
>> +
>> +        /* HV POOL ring */
>> +        if ((be32_to_cpu(qw2w2) & TM2_QW2W2_VP) &&
>> +            cam == xive_get_field32(TM2_QW2W2_POOL_CAM, qw2w2)) {
>> +            return TM_QW2_HV_POOL;
>> +        }
>> +
>> +        /* OS ring */
>> +        if ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
>> +            cam == xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) {
>> +            return TM_QW1_OS;
>> +        }
>> +    } else {
>> +        /* F=1 : User level Event-Based Branch (EBB) notification */
>> +
>> +        /* USER ring */
>> +        if  ((be32_to_cpu(qw1w2) & TM2_QW1W2_VO) &&
>> +             (cam == xive_get_field32(TM2_QW1W2_OS_CAM, qw1w2)) &&
>> +             (be32_to_cpu(qw0w2) & TM2_QW0W2_VU) &&
>> +             (logic_serv == xive_get_field32(TM2_QW0W2_LOGIC_SERV, qw0w2))) {
>> +            return TM_QW0_USER;
>> +        }
>> +    }
>> +    return -1;
>> +}
>> +
>>  static void xive2_router_realize(DeviceState *dev, Error **errp)
>>  {
>>      Xive2Router *xrtr = XIVE2_ROUTER(dev);
> 


