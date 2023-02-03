Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB12689939
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 13:54:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvYz-0008KV-Rm; Fri, 03 Feb 2023 07:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNvYt-0008I9-Dn; Fri, 03 Feb 2023 07:53:03 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNvYr-0008KG-3Q; Fri, 03 Feb 2023 07:53:03 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 259BF746392;
 Fri,  3 Feb 2023 13:50:26 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DF32C746377; Fri,  3 Feb 2023 13:50:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DE1917456E3;
 Fri,  3 Feb 2023 13:50:25 +0100 (CET)
Date: Fri, 3 Feb 2023 13:50:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 2/9] hw/ppc/sam460ex: Correctly set MAL properties
In-Reply-To: <20230203113650.78146-3-philmd@linaro.org>
Message-ID: <4745a58c-c5b0-a851-e3c2-6efc43d5f944@eik.bme.hu>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1090112839-1675428625=:62709"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1090112839-1675428625=:62709
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> MAL properties are declared as uint8_t:
>
>  static Property ppc4xx_mal_properties[] = {
>      DEFINE_PROP_UINT8("txc-num", Ppc4xxMalState, txcnum, 0),
>      DEFINE_PROP_UINT8("rxc-num", Ppc4xxMalState, rxcnum, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> Set the property using qdev_prop_set_uint8().
>
> Fixes: da116a8aab ("ppc/ppc405: QOM'ify MAL")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Apparently this makes no difference but MAL is also only there so the 
firmware can program it but does nothing otherwise.

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/sam460ex.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 4a22ce3761..cf065aae0e 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -389,8 +389,8 @@ static void sam460ex_init(MachineState *machine)
>
>     /* MAL */
>     dev = qdev_new(TYPE_PPC4xx_MAL);
> -    qdev_prop_set_uint32(dev, "txc-num", 4);
> -    qdev_prop_set_uint32(dev, "rxc-num", 16);
> +    qdev_prop_set_uint8(dev, "txc-num", 4);
> +    qdev_prop_set_uint8(dev, "rxc-num", 16);
>     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
>     object_unref(OBJECT(dev));
>     sbdev = SYS_BUS_DEVICE(dev);
>
--3866299591-1090112839-1675428625=:62709--

