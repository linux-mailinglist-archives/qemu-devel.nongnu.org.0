Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302C9327CC3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:03:40 +0100 (CET)
Received: from localhost ([::1]:50926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgKx-0003A3-7r
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lGgJw-0002ii-E0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:02:36 -0500
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:50422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lGgJu-0001Vs-E7
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:02:36 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.238])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 7F111244D95;
 Mon,  1 Mar 2021 12:02:29 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 12:02:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005be38bf7b-5a2b-4334-aa64-e9ad3dba0534,
 79E354DF6B7F793720F6EA4F82BCB5A412373A8E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 02/21] sd: emmc: Add support for eMMC cards
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
 <1614540807-30686-3-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <8485f4b6-376a-9f2e-aa05-b7fcef84c790@kaod.org>
Date: Mon, 1 Mar 2021 12:02:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1614540807-30686-3-git-send-email-sai.pavan.boddu@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e2af06ad-bd5b-4909-9d5b-93ab5e7da864
X-Ovh-Tracer-Id: 14539026974355524365
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshgrihdrphgrvhgrnhdrsghougguuhesgihilhhinhigrdgtohhm
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo52.mail-out.ovh.net
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
> Add eMMC device built on top of SD card.
> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  include/hw/sd/sd.h |  2 ++
>  hw/sd/sd.c         | 20 ++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
> index 05ef9b7..b402dad 100644
> --- a/include/hw/sd/sd.h
> +++ b/include/hw/sd/sd.h
> @@ -90,6 +90,8 @@ typedef struct {
>  } SDRequest;
>  
>  
> +#define TYPE_EMMC "emmc"
> +OBJECT_DECLARE_SIMPLE_TYPE(EMMCState, EMMC)
>  #define TYPE_SD_CARD "sd-card"
>  OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
>  
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 74b9162..a23af6d 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -108,6 +108,7 @@ struct SDState {
>      uint8_t spec_version;
>      BlockBackend *blk;
>      bool spi;
> +    bool emmc;
>  
>      /* Runtime changeables */
>  
> @@ -143,6 +144,10 @@ struct SDState {
>      bool cmd_line;
>  };
>  
> +struct EMMCState {
> +    SDState parent;
> +};
> +
>  static void sd_realize(DeviceState *dev, Error **errp);
>  
>  static const char *sd_state_name(enum SDCardStates state)
> @@ -2105,6 +2110,13 @@ static void sd_instance_init(Object *obj)
>      sd->ocr_power_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sd_ocr_powerup, sd);
>  }
>  
> +static void emmc_instance_init(Object *obj)
> +{
> +    SDState *sd = SD_CARD(obj);
> +
> +    sd->emmc = true;
> +}
I think field 'emmc' would fit better in SDCardClass since it is a device 
constant. You should not need 'struct EMMCState'. So something like below.
Then you can add handlers for specific emmc commands.

Thanks,

C.


diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 47360ba4ee98..80e7cd526a57 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -93,6 +93,8 @@ typedef struct {
 #define TYPE_SD_CARD "sd-card"
 OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
 
+#define TYPE_EMMC "emmc"
+
 struct SDCardClass {
     /*< private >*/
     DeviceClass parent_class;
@@ -124,6 +126,8 @@ struct SDCardClass {
     void (*enable)(SDState *sd, bool enable);
     bool (*get_inserted)(SDState *sd);
     bool (*get_readonly)(SDState *sd);
+
+    bool emmc;
 };
 
 #define TYPE_SD_BUS "sd-bus"
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 660026f2a667..95608f11b36e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2447,9 +2447,24 @@ static const TypeInfo sd_info = {
     .instance_finalize = sd_instance_finalize,
 };
 
+static void emmc_class_init(ObjectClass *klass, void *data)
+{
+    SDCardClass *sc = SD_CARD_CLASS(klass);
+
+    sc->emmc = true;
+}
+
+static const TypeInfo emmc_info = {
+    .name = TYPE_EMMC,
+    .parent = TYPE_SD_CARD,
+    .instance_size = sizeof(SDState),
+    .class_init = emmc_class_init,
+};
+
 static void sd_register_types(void)
 {
     type_register_static(&sd_info);
+    type_register_static(&emmc_info);
 }
 
 type_init(sd_register_types)


