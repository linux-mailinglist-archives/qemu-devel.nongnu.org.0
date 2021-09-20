Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2991541270E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 21:57:35 +0200 (CEST)
Received: from localhost ([::1]:57986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSPPx-00044I-NR
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 15:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPOc-0002aw-Pj
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:56:10 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPOa-0005vN-Qj
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 15:56:10 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDPuq-1mcojJ0GG6-00AWCl; Mon, 20 Sep 2021 21:56:07 +0200
Subject: Re: [PATCH v4 05/20] nubus: move slot bitmap checks from NubusDevice
 realize() to BusClass check_address()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1ba42a8c-d7b7-4717-0432-63c0c0b39d2a@vivier.eu>
Date: Mon, 20 Sep 2021 21:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qbasNzUiOG8kKwdcVESIwQLrer+iG0ZZaAVnqZcKHL1DAXYf0J/
 lyMtD+jZzyxlCXut2bnUUQlNGlCyk5YGSRnL983Z/rr5pHMiE5ngUL8plat3Z5ED9GbUeFd
 +F9iE7W4qqAPyyqQXEQIjzMQacd9RHXkaAlWYIcl0bmbxAfy5Fk6Bcf6kCFDudevD2IgRA8
 q7zePvBhS3104memZPaBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:88IfVgcgcnE=:qE57grLOhSHIQEWVj+hFYK
 93ZExAusSoRCLISczjFPGJDKXvUO2QVDstUy5RgcfO6QDFbPzW5rrVKd3C/hZdaLzpjCHmdrF
 0T77GqxF49IqWF9REDzmpw/ET2gFnbpjtQ5pOtkZAzlnSVTBaoxS0NLf5UC66xyz/YBDL7mL+
 6ic2A8WEuAyVYMsy5SriiZDQtvgE6iLaGlbr/efKLKmqAVeNoDV0rq5vuULZZLgduHXZPdzCp
 0qlaaYhq/El7+asBpEA1gJi0QtZ1QaGCVR7T8cg1wv4DfHvR0RyeWny/CAU1ncnAo3WDu4j4C
 h9Luzv0HKB7Pv4yt2bXf6k6sEIwORmZQKb8ZHrLfbFEk6GPOwQpZw+SxLh53ifZRDb6DlN+HO
 txgeGsDBmNN0qLPTT6M1b8pdTEsLz72hDS9l6j/4c3qXfp9C5klQZjrKF6IlT+//tOVCgVAah
 Yy7wrYDVpRfjN35nwq5aH3pxvHPzXkyMwtfRGs8J+l+Psyjn6sNk4Hm6eapry0nXdVSEAYZ61
 vv0GwVpBMaDfwEQzRrKRVfoExuJxwenjwwDKzos+LIoy45utWGzgawRXzTlKATkyElL96ekoI
 SFf/G2rRbaN/quaC69xRoRNRY5MyAhFxXabxRUe6pmmFKs9Ui926ssMncMjEbnXV2Aa8tQtAT
 pjQO6MqM8b44TU83TEkPsPK8bmO8iTTztt3vKA0LzhDxQsB1OHXzDWA0PTW7tb1EkN3JVPoha
 1wtWcTsozFjyOC8Ir3v1TqHln+4Oi+2CT+B63Q==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> Allow Nubus to manage the slot allocations itself using the BusClass check_address()
> virtual function rather than managing this during NubusDevice realize().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bus.c    | 37 +++++++++++++++++++++++++++++++++++++
>  hw/nubus/nubus-device.c | 29 -----------------------------
>  2 files changed, 37 insertions(+), 29 deletions(-)
> 
> diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
> index 404c1032e0..141876b579 100644
> --- a/hw/nubus/nubus-bus.c
> +++ b/hw/nubus/nubus-bus.c
> @@ -87,11 +87,48 @@ static void nubus_init(Object *obj)
>      nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);
>  }
>  
> +static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
> +{
> +    NubusDevice *nd = NUBUS_DEVICE(dev);
> +    NubusBus *nubus = NUBUS_BUS(bus);
> +    uint16_t s;
> +
> +    if (nd->slot == -1) {
> +        /* No slot specified, find first available free slot */
> +        s = ctz32(nubus->slot_available_mask);
> +        if (s != 32) {
> +            nd->slot = s;
> +        } else {
> +            error_setg(errp, "Cannot register nubus card, no free slot "
> +                             "available");
> +            return false;
> +        }
> +    } else {
> +        /* Slot specified, make sure the slot is available */
> +        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
> +            error_setg(errp, "Cannot register nubus card, slot %d is "
> +                             "unavailable or already occupied", nd->slot);
> +            return false;
> +        }
> +    }
> +
> +    if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
> +        error_setg(errp, "Cannot register nubus card, slot must be "
> +                         "between %d and %d", NUBUS_FIRST_SLOT,
> +                         NUBUS_LAST_SLOT);
> +        return false;
> +    }
> +
> +    nubus->slot_available_mask &= ~BIT(nd->slot);
> +    return true;
> +}
> +
>  static void nubus_class_init(ObjectClass *oc, void *data)
>  {
>      BusClass *bc = BUS_CLASS(oc);
>  
>      bc->realize = nubus_realize;
> +    bc->check_address = nubus_check_address;
>  }
>  
>  static const TypeInfo nubus_bus_info = {
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index d91a1e4af3..7a32c8c95b 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -160,35 +160,6 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      NubusDevice *nd = NUBUS_DEVICE(dev);
>      char *name;
>      hwaddr slot_offset;
> -    uint16_t s;
> -
> -    if (nd->slot == -1) {
> -        /* No slot specified, find first available free slot */
> -        s = ctz32(nubus->slot_available_mask);
> -        if (s != 32) {
> -            nd->slot = s;
> -        } else {
> -            error_setg(errp, "Cannot register nubus card, no free slot "
> -                             "available");
> -            return;
> -        }
> -    } else {
> -        /* Slot specified, make sure the slot is available */
> -        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
> -            error_setg(errp, "Cannot register nubus card, slot %d is "
> -                             "unavailable or already occupied", nd->slot);
> -            return;
> -        }
> -    }
> -
> -    if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
> -        error_setg(errp, "Cannot register nubus card, slot must be "
> -                         "between %d and %d", NUBUS_FIRST_SLOT,
> -                         NUBUS_LAST_SLOT);
> -        return;
> -    }
> -
> -    nubus->slot_available_mask &= ~BIT(nd->slot);
>  
>      /* Super */
>      slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> 

For the code move (but I think it needs some update in patch 4):

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

