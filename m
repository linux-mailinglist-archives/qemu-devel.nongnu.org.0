Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7613B59C4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 09:31:42 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxlk5-0000qt-FU
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 03:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lxlhp-0007om-Ft
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:29:21 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:48168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lxlhn-0001S9-Iz
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 03:29:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.98])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 771CA284497;
 Mon, 28 Jun 2021 09:29:15 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Mon, 28 Jun
 2021 09:29:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0010458d80a-5846-4bfc-b720-e92b5ee72d2f,
 A5942444232ACF3D755B1638A42E9F49C81D83AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [RFC PATCH 04/10] hw/sd: Introduce sd_cmd_handler type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-5-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <76d91bb6-c8ac-6d33-a5f1-9f196ea54756@kaod.org>
Date: Mon, 28 Jun 2021 09:29:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624142209.1193073-5-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1166d9d9-d540-4666-840b-40ed7d8b971f
X-Ovh-Tracer-Id: 8812137097908161318
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehfgegsuhhgsegrmhhsrghtrdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 Joel Stanley <joel@jms.id.au>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 4:22 PM, Philippe Mathieu-Daudé wrote:
> Add 2 command handler arrays in SDProto, for CMD and ACMD.
> Have sd_normal_command() / sd_app_command() use these arrays:
> if an command handler is registered, call it, otherwise fall
> back to current code base.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index a1cc8ab0be8..ce1eec0374f 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -88,8 +88,12 @@ enum SDCardStates {
>      sd_disconnect_state,
>  };
>  
> +typedef sd_rsp_type_t (*sd_cmd_handler)(SDState *sd, SDRequest req);
> +
>  typedef struct SDProto {
>      const char *name;
> +    sd_cmd_handler cmd[SDMMC_CMD_MAX];
> +    sd_cmd_handler acmd[SDMMC_CMD_MAX];
>  } SDProto;


A class would be better but it's no big deal for the moment.

>  
>  struct SDState {
> @@ -994,6 +998,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>          return sd_illegal;
>      }
>  
> +    if (sd->proto->cmd[req.cmd]) {
> +        return sd->proto->cmd[req.cmd](sd, req);
> +    }
> +

I expect that some default array will be used to initialize ->cmd ? 

Thanks,

C.


>      switch (req.cmd) {
>      /* Basic commands (Class 0 and Class 1) */
>      case 0:	/* CMD0:   GO_IDLE_STATE */
> @@ -1533,6 +1541,11 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
>      trace_sdcard_app_command(sd->proto->name, sd_acmd_name(req.cmd),
>                               req.cmd, req.arg, sd_state_name(sd->state));
>      sd->card_status |= APP_CMD;
> +
> +    if (sd->proto->acmd[req.cmd]) {
> +        return sd->proto->acmd[req.cmd](sd, req);
> +    }
> +
>      switch (req.cmd) {
>      case 6:	/* ACMD6:  SET_BUS_WIDTH */
>          if (sd->spi) {
> 


