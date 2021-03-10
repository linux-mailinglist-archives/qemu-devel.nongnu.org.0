Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EBF333805
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:59:12 +0100 (CET)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJugR-0001zk-5g
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuer-00018P-TZ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:57:34 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:53755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJuep-0004Vp-DK
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:57:33 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mth79-1lbAE42xnL-00vBY7; Wed, 10 Mar 2021 09:57:27 +0100
Subject: Re: [PATCH 3/7] mac_via: allow long accesses to VIA registers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <645aefa1-6a0e-4379-3043-2521b2ba273f@vivier.eu>
Date: Wed, 10 Mar 2021 09:57:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310080908.11861-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0udugK5CTNncWgHHfGJNF4T+rc/Geipq7weSkt4wYLBw8DVtyhJ
 DoNeJK0DkOMzRZ47i17nc/7rdeJqr6OgxnrPsmvp9fsCmmc074uu/GE/NBmQH92M96DFl7P
 hsAWkcA0xWgFOde5ozwBD4tZgg6eZMgI9zC9MTgoOCv++PONjH4Y6glO1xfJq9XPozsVdgW
 WutBpSXdeCwqHdxoy+wMQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hZ5V9tbcQb4=:VgkOxdiF4hxPWe9To/VFSO
 vKUkJgZULrwCSSH+6rbKzwTvLG5gfKVr78lE9zpw6q1F6udfK2TwYprVNctwzZw7LOKAcSdhe
 LHtqkgu1dsqlGW+w+sgHQCtZjfBTAyQUpGocix1Sc8luLJD6rTunkxYo2e02C4yB7sox+AA7I
 gKO7MddxQtleGWZI/Y/LrJb6W4yP52KQH7FQrlFA6hq8whPJLsJGf8X43tIgV2aBwUluGu5Om
 3VZkY9VNU3Nqg9O40VJf4zpk11GAV/R7yT3qnzAsm2Jva77kChIH/99bFXgXYy7XH0XopZEa4
 0W54ng5l/fsnyCkusVLbHpFoHL4BCwVrC8T92ZFWAFIXRKUIyh/7xKZja8oE7Xx1vQPOtD3cN
 4CLxv0tn4x+d8xnPSid1JcZS5qYAAS3ZX0HEWdjMdEjOJy1WPnh0iKuZ/NAwDdCsI/NAfMK8+
 vPzcWv125A==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 10/03/2021 à 09:09, Mark Cave-Ayland a écrit :
> The MacOS SCSI driver uses a long access to read the VIA registers rather than
> just a single byte during the message out phase.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
> index 0f6586e102..f38d6e2f6e 100644
> --- a/hw/misc/mac_via.c
> +++ b/hw/misc/mac_via.c
> @@ -966,7 +966,7 @@ static const MemoryRegionOps mos6522_q800_via1_ops = {
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -        .max_access_size = 1,
> +        .max_access_size = 4,
>      },
>  };
>  
> @@ -995,7 +995,7 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
>      .endianness = DEVICE_BIG_ENDIAN,
>      .valid = {
>          .min_access_size = 1,
> -        .max_access_size = 1,
> +        .max_access_size = 4,
>      },
>  };
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

