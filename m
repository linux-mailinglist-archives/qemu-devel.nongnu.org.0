Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70B3B59CC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 09:33:05 +0200 (CEST)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxllQ-0003dV-4F
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 03:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lxlk4-0001um-NN
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:31:40 -0400
Received: from 2.mo52.mail-out.ovh.net ([178.33.105.233]:52632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lxlk2-00035T-NX
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:31:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 95C472819FC;
 Mon, 28 Jun 2021 09:31:35 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Mon, 28 Jun
 2021 09:31:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006f23180ba-c59d-4742-8f3c-1db38ebebc84,
 A5942444232ACF3D755B1638A42E9F49C81D83AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [RFC PATCH 05/10] hw/sd: Add sd_cmd_illegal() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-6-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <780c3813-9440-1ac9-1cd6-a8c3674599a8@kaod.org>
Date: Mon, 28 Jun 2021 09:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624142209.1193073-6-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: acd288f5-7322-403c-af41-05eac7faadd5
X-Ovh-Tracer-Id: 8851543592665778982
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo52.mail-out.ovh.net
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 Joel Stanley <joel@jms.id.au>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 4:22 PM, Philippe Mathieu-Daudé wrote:
> Log illegal commands as GUEST_ERROR.
> 
> Note: we are logging back the SDIO commands (CMD5, CMD52-54).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 57 ++++++++++++++++++++++--------------------------------
>  1 file changed, 23 insertions(+), 34 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index ce1eec0374f..0215bdb3689 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -965,6 +965,14 @@ static sd_rsp_type_t sd_invalid_state_for_cmd(SDState *sd, SDRequest req)
>      return sd_illegal;
>  }
>  
> +static sd_rsp_type_t sd_cmd_illegal(SDState *sd, SDRequest req)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: Unknown CMD%i\n",
> +                  sd->proto->name, req.cmd);
> +
> +    return sd_illegal;
> +}>  static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>  {
>      uint32_t rca = 0x0000;
> @@ -1017,15 +1025,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>  
>      case 1:	/* CMD1:   SEND_OP_CMD */
> -        if (!sd->spi)
> -            goto bad_cmd;
> -
>          sd->state = sd_transfer_state;
>          return sd_r1;
>  
>      case 2:	/* CMD2:   ALL_SEND_CID */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_ready_state:
>              sd->state = sd_identification_state;
> @@ -1037,8 +1040,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>  
>      case 3:	/* CMD3:   SEND_RELATIVE_ADDR */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_identification_state:
>          case sd_standby_state:
> @@ -1052,8 +1053,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>  
>      case 4:	/* CMD4:   SEND_DSR */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_standby_state:
>              break;
> @@ -1063,9 +1062,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          }
>          break;
>  
> -    case 5: /* CMD5: reserved for SDIO cards */
> -        return sd_illegal;
> -
>      case 6:	/* CMD6:   SWITCH_FUNCTION */
>          switch (sd->mode) {
>          case sd_data_transfer_mode:
> @@ -1081,8 +1077,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>  
>      case 7:	/* CMD7:   SELECT/DESELECT_CARD */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_standby_state:
>              if (sd->rca != rca)
> @@ -1212,8 +1206,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>  
>      case 15:	/* CMD15:  GO_INACTIVE_STATE */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->mode) {
>          case sd_data_transfer_mode:
>              if (sd->rca != rca)
> @@ -1320,8 +1312,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>  
>      case 26:	/* CMD26:  PROGRAM_CID */
> -        if (sd->spi)
> -            goto bad_cmd;
>          switch (sd->state) {
>          case sd_transfer_state:
>              sd->state = sd_receivingdata_state;
> @@ -1466,15 +1456,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          }
>          break;
>  
> -    case 52 ... 54:
> -        /* CMD52, CMD53, CMD54: reserved for SDIO cards
> -         * (see the SDIO Simplified Specification V2.0)
> -         * Handle as illegal command but do not complain
> -         * on stderr, as some OSes may use these in their
> -         * probing for presence of an SDIO card.
> -         */
> -        return sd_illegal;
> -
>      /* Application specific commands (Class 8) */
>      case 55:	/* CMD55:  APP_CMD */
>          switch (sd->state) {
> @@ -1515,19 +1496,12 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          break;
>  
>      case 58:    /* CMD58:   READ_OCR (SPI) */
> -        if (!sd->spi) {
> -            goto bad_cmd;
> -        }
>          return sd_r3;
>  
>      case 59:    /* CMD59:   CRC_ON_OFF (SPI) */
> -        if (!sd->spi) {
> -            goto bad_cmd;
> -        }
>          return sd_r1;
>  
>      default:
> -    bad_cmd:
>          qemu_log_mask(LOG_GUEST_ERROR, "SD: Unknown CMD%i\n", req.cmd);
>          return sd_illegal;
>      }
> @@ -2114,10 +2088,25 @@ void sd_enable(SDState *sd, bool enable)
>  
>  static const SDProto sd_proto_spi = {
>      .name = "SPI",
> +    .cmd = {
> +        [2 ... 4]   = sd_cmd_illegal,
> +        [5]         = sd_cmd_illegal,
> +        [7]         = sd_cmd_illegal,
> +        [15]        = sd_cmd_illegal,
> +        [26]        = sd_cmd_illegal,
> +        [52 ... 54] = sd_cmd_illegal,
> +    },
>  };
>  
>  static const SDProto sd_proto_sd = {
>      .name = "SD",
> +    .cmd = {
> +        [1]         = sd_cmd_illegal,
> +        [5]         = sd_cmd_illegal,
> +        [52 ... 54] = sd_cmd_illegal,
> +        [58]        = sd_cmd_illegal,
> +        [59]        = sd_cmd_illegal,
> +    },
>  };
>  
>  static void sd_instance_init(Object *obj)
> 



Looks good. 

I would start to move these commands in a sd_cmd.c file or sd_common.c
may be.

Thanks,

C.


