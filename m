Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF33677166
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 19:15:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJerT-0004gy-QJ; Sun, 22 Jan 2023 13:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJerS-0004gU-2r; Sun, 22 Jan 2023 13:14:34 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJerQ-0004dh-Ho; Sun, 22 Jan 2023 13:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gfjp1Nx7NH8bVcRSzMGkcgXlZ8HK3pjnoBAY813c6F8=; b=Jfe2Lq97bC2rT45xqyRKBktOVH
 FCG3AAXKCQm6v/F8MUFbaP7YQk1elwq+H17WjgIHxDmCCe1glFwZ7Zq1Zojx1u02dEyBq/Qa6mqYd
 g/DdBOMMmWIauYAEdALIIzfoO5eTUB+DPa8e0s5yEapZcN/WyRzsCe0nLGR8iIs9mkbSZF4xMn0o7
 P0iLiAyw/BhLPJ8zd+9kQ8+x2P+i60b9jChZEK1En5BdSA1oxHMTXufTwLgOeZ4jIxwQYeDMhZ6x8
 93xdBkLptNejwTBuzIJ6KS/jpl/UAbUL0OImZmrJ5vvb3S8/8v7HTEvzcD8KodGWwoSI2WBIXj1Ia
 j1olxGyTjUtsqaPHG5lJeE21MabBeKgSuZb/8oTul/i5O31W6UFwl/HxTXucklF86l88SJFa33pNs
 hzYqTrp7ldvQzGHBQGHvH4aPoP2gQpFuyg8j3bfP/rYTBVg48eQxoAWKqMaoa0Vo495harpNrz2Wg
 HAaoRUoz81aWdcjjQv4I9OFSd+ArHukHsTtyOx+FqGNzGHIuaIHVmY4IDFqNI+rZ5fRwvSoL/9HhW
 3xbtQssB8hvgNfvlDaOBTIQOH9OPhx+0r+CsA//LAUkZ1vcdrOjOebMj/zmIqY2Es4rwQSbKoIZNb
 SiAgpYG3JgO2oRGjSgRZ9PM5Hkq6cqqvvVMON4RW8=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pJeqw-0006Dl-DG; Sun, 22 Jan 2023 18:14:06 +0000
Message-ID: <fd064bb8-8bea-d5fb-baae-65f4c916baa3@ilande.co.uk>
Date: Sun, 22 Jan 2023 18:14:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1674001241.git.balaton@eik.bme.hu>
 <67b2d4700879c3b4cd574f1faa1a0d1950b3d0ee.1674001242.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <67b2d4700879c3b4cd574f1faa1a0d1950b3d0ee.1674001242.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/4] hw/misc/macio: Avoid some QOM casts
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 18/01/2023 00:32, BALATON Zoltan wrote:

> At several places we already have the object pointer with the right
> type so we don't need to cast it back and forth. Avoiding these casts
> improves readability.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 08dbdd7fc0..0dfe372965 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -220,11 +220,11 @@ static void macio_oldworld_init(Object *obj)
>       DeviceState *dev;
>       int i;
>   
> -    object_initialize_child(OBJECT(s), "pic", &os->pic, TYPE_HEATHROW);
> +    object_initialize_child(obj, "pic", &os->pic, TYPE_HEATHROW);
>   
> -    object_initialize_child(OBJECT(s), "cuda", &s->cuda, TYPE_CUDA);
> +    object_initialize_child(obj, "cuda", &s->cuda, TYPE_CUDA);
>   
> -    object_initialize_child(OBJECT(s), "nvram", &os->nvram, TYPE_MACIO_NVRAM);
> +    object_initialize_child(obj, "nvram", &os->nvram, TYPE_MACIO_NVRAM);
>       dev = DEVICE(&os->nvram);
>       qdev_prop_set_uint32(dev, "size", MACIO_NVRAM_SIZE);
>       qdev_prop_set_uint32(dev, "it_shift", 4);
> @@ -372,9 +372,9 @@ static void macio_newworld_init(Object *obj)
>       NewWorldMacIOState *ns = NEWWORLD_MACIO(obj);
>       int i;
>   
> -    object_initialize_child(OBJECT(s), "pic", &ns->pic, TYPE_OPENPIC);
> +    object_initialize_child(obj, "pic", &ns->pic, TYPE_OPENPIC);
>   
> -    object_initialize_child(OBJECT(s), "gpio", &ns->gpio, TYPE_MACIO_GPIO);
> +    object_initialize_child(obj, "gpio", &ns->gpio, TYPE_MACIO_GPIO);
>   
>       for (i = 0; i < 2; i++) {
>           macio_init_ide(s, &ns->ide[i], i);
> @@ -390,9 +390,9 @@ static void macio_instance_init(Object *obj)
>       qbus_init(&s->macio_bus, sizeof(s->macio_bus), TYPE_MACIO_BUS,
>                 DEVICE(obj), "macio.0");
>   
> -    object_initialize_child(OBJECT(s), "dbdma", &s->dbdma, TYPE_MAC_DBDMA);
> +    object_initialize_child(obj, "dbdma", &s->dbdma, TYPE_MAC_DBDMA);
>   
> -    object_initialize_child(OBJECT(s), "escc", &s->escc, TYPE_ESCC);
> +    object_initialize_child(obj, "escc", &s->escc, TYPE_ESCC);
>   }
>   
>   static const VMStateDescription vmstate_macio_oldworld = {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

