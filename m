Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4C8689F12
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:23:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyq4-0005yG-1N; Fri, 03 Feb 2023 11:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNypz-0005sT-FA; Fri, 03 Feb 2023 11:22:57 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNypx-0005Z2-TR; Fri, 03 Feb 2023 11:22:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A4350746377;
 Fri,  3 Feb 2023 17:20:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6A0C8745712; Fri,  3 Feb 2023 17:20:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 685B77456E3;
 Fri,  3 Feb 2023 17:20:23 +0100 (CET)
Date: Fri, 3 Feb 2023 17:20:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 12/15] hw/display/sm501: Unify common QOM properties
In-Reply-To: <20230203145536.17585-13-philmd@linaro.org>
Message-ID: <d4127cf0-3006-9143-36c4-e059acf8908d@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-13-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2106383846-1675441223=:20219"
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

--3866299591-2106383846-1675441223=:20219
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> Since now PCI and SysBus properties are identical, unify them.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/sm501.c | 11 +++--------
> 1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index efebd93f1e..98375138b2 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1975,7 +1975,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>     /* TODO : chain irq to IRL */
> }
>
> -static Property sm501_sysbus_properties[] = {
> +static Property sm501_common_properties[] = {
>     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>     DEFINE_PROP_END_OF_LIST(),
> };
> @@ -2004,7 +2004,7 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
>     dc->realize = sm501_realize_sysbus;
>     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>     dc->desc = "SM501 Multimedia Companion";
> -    device_class_set_props(dc, sm501_sysbus_properties);
> +    device_class_set_props(dc, sm501_common_properties);
>     dc->reset = sm501_reset_sysbus;
>     dc->vmsd = &vmstate_sm501_sysbus;
> }
> @@ -2062,11 +2062,6 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
>                      &s->state.mmio_region);
> }
>
> -static Property sm501_pci_properties[] = {
> -    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> static void sm501_reset_pci(DeviceState *dev)
> {
>     SM501PCIState *s = PCI_SM501(dev);
> @@ -2098,7 +2093,7 @@ static void sm501_pci_class_init(ObjectClass *klass, void *data)
>     k->class_id = PCI_CLASS_DISPLAY_OTHER;
>     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>     dc->desc = "SM501 Display Controller";
> -    device_class_set_props(dc, sm501_pci_properties);
> +    device_class_set_props(dc, sm501_common_properties);
>     dc->reset = sm501_reset_pci;
>     dc->hotpluggable = false;
>     dc->vmsd = &vmstate_sm501_pci;
>
--3866299591-2106383846-1675441223=:20219--

