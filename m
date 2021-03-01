Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02867327DCE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 13:04:20 +0100 (CET)
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGhHf-0007BU-0N
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 07:04:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGhGA-0006SD-Hw; Mon, 01 Mar 2021 07:02:46 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:59697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lGhG8-0004LH-Hx; Mon, 01 Mar 2021 07:02:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 3694A92B80CE;
 Mon,  1 Mar 2021 13:02:39 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 13:02:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d0a4660c-29f9-4d1a-b7a6-3dbdaf8a50fd,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 06/21] sd: emmc: Update CMD8 to send EXT_CSD register
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Markus Armbruster
 <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, 
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>, Vincent
 Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Alistair
 Francis <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, Paolo
 Bonzini <pbonzini@redhat.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1614540807-30686-7-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b60d056c-96a6-4cfe-39bf-9d43e6abc993@kaod.org>
Date: Mon, 1 Mar 2021 13:02:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1614540807-30686-7-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9f4f0e70-26bf-4ae0-a2a6-102d0575ad6d
X-Ovh-Tracer-Id: 15555151641345755917
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehsrghirdhprghvrghnrdgsohguughuseigihhlihhngidrtghomh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 8:33 PM, Sai Pavan Boddu wrote:
> From: Vincent Palatin <vpalatin@chromium.org>
> 
> Sends the EXT_CSD register as response to CMD8.
> 
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/sd/sd.c | 52 ++++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index a26695b..181e7e2 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1141,24 +1141,37 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          }
>          break;
>  
> -    case 8: /* CMD8:   SEND_IF_COND */
> -        if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
> -            break;
> -        }
> -        if (sd->state != sd_idle_state) {
> -            break;
> -        }
> -        sd->vhs = 0;
> -
> -        /* No response if not exactly one VHS bit is set.  */
> -        if (!(req.arg >> 8) || (req.arg >> (ctz32(req.arg & ~0xff) + 1))) {
> -            return sd->spi ? sd_r7 : sd_r0;
> -        }
> +    case 8:    /* CMD8:   SEND_IF_COND / SEND_EXT_CSD */
> +        if (sd->emmc) {
> +            switch (sd->state) {
> +            case sd_transfer_state:
> +                /* MMC : Sends the EXT_CSD register as a Block of data */
> +                sd->state = sd_sendingdata_state;
> +                memcpy(sd->data, sd->ext_csd, sizeof(sd->ext_csd));
> +                sd->data_start = addr;
> +                sd->data_offset = 0;
> +                return sd_r1;
> +            default:
> +                break;
> +            }

This is big enough to be a SDCardClass handler.

Thanks,

C.


> +        } else {
> +            if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
> +                break;
> +            }
> +            if (sd->state != sd_idle_state) {
> +                break;
> +            }
> +            sd->vhs = 0;
>  
> -        /* Accept.  */
> -        sd->vhs = req.arg;
> -        return sd_r7;
> +            /* No response if not exactly one VHS bit is set.  */
> +            if (!(req.arg >> 8) || (req.arg >> (ctz32(req.arg & ~0xff) + 1))) {
> +                return sd->spi ? sd_r7 : sd_r0;
> +            }
>  
> +            /* Accept.  */
> +            sd->vhs = req.arg;
> +            return sd_r7;
> +        }
>      case 9: /* CMD9:   SEND_CSD */
>          switch (sd->state) {
>          case sd_standby_state:
> @@ -2081,6 +2094,13 @@ uint8_t sd_read_byte(SDState *sd)
>              sd->state = sd_transfer_state;
>          break;
>  
> +    case 8:     /* CMD8: SEND_EXT_CSD on MMC */
> +        ret = sd->data[sd->data_offset++];
> +        if (sd->data_offset >= sizeof(sd->ext_csd)) {
> +            sd->state = sd_transfer_state;
> +        }
> +        break;
> +
>      case 9:     /* CMD9:   SEND_CSD */
>      case 10:    /* CMD10:  SEND_CID */
>          ret = sd->data[sd->data_offset ++];
> 


