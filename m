Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCEA4BF6B1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 11:54:15 +0100 (CET)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMSo9-0007ff-RC
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 05:54:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMSlD-0006Uc-AS; Tue, 22 Feb 2022 05:51:11 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:56341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMSlB-0001mQ-8s; Tue, 22 Feb 2022 05:51:11 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MVdUQ-1nljQ53qi4-00RWKY; Tue, 22 Feb 2022 11:51:06 +0100
Message-ID: <8bd75e7b-f7e2-7177-949e-097cdf0c77a3@vivier.eu>
Date: Tue, 22 Feb 2022 11:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hid: Implement support for side and extra buttons
Content-Language: fr
To: Noah Bergbauer <noah@statshelix.com>, qemu-devel@nongnu.org
References: <20211126140437.79745-1-noah@statshelix.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211126140437.79745-1-noah@statshelix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PdtOyLYPlxHH5bGkkJZCkVPFYj9pM/I43/zjOrLagPPhaNyJ9Ns
 BrMVjtyxQcO9Zzy4aHM8D0dZiWe24qVDK71K3XSkbGSGN72AR79DU16ur2dMqOOo++pK47O
 x6YB8QszpGtiKIdiAYX2AyZPeY7zsa1KIMwTYv8hRFPz7YiTlbYJW2p1BEnZngIaNirkfHK
 1DQ/4iitmW8DBEOWYzKfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mx1XoDbINpA=:o/8WotANv9zYE37kqRgjVv
 hONjqiMTzkLqTxEJfFn1X5yGPeYhGEh2iyFXPRGpaq4vMPtEvqnDFxEWHaBcGiC6zDlld2AIe
 x/PkMoGf7BlcUrOJmZ0fVDU7vabR7ntJkUlqMMedNmzP37PxPBXw0G6dHfgqBqjRWXDmbFln7
 KrSHa8dFwWXASGimaZ1+2Htja9hG3BtLLeJYxwVqxr1hMEQ86ax2N7whnehPtji8uprlce3AE
 YXAbpCyOsW517yHSJNKBXzVR7pZf0Xpv9r2cbgKY7QnTO00bbCQ12wKuFOOYb3o9Ba6hFWymu
 K9hOu20lSTmjFIFezopQF0otAY7XhcfF87S9kBbm54fbQnitQHwm+lCQCglrJBjuI2TcECF5Z
 N0DfASeeMAwNQDpUHOw0BulxHI/7YeSZBmTcuZJYxrZJ+UfQYdQxlj9QtdRqUtySVvZyNgApb
 a+NbIYE+L7Xf/WWsmZUO14QSPfG9fbzpOcYnKmA6WuJlK02e6fqJ1PppunsnCaDmb3FxLkv+J
 hkru9Kuox6p1GJ0HME7XRZvNLt3sN5mT+CQUTuceuZgtYTQ2s9XMtxXsjtmoMg2Hij8lasc/A
 suFoqqsLPktqL+Amq7S8Oo4FMf1RG0iVMqO/UZ0E7sG1mBy/IlLJVN8b0f0n1qbgclKfqm2ae
 71pahzR64nFf294mW4aH0voKUglGG23ndJItHMvu6L264Z72teQi4NJbqEc46keOcYs8=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/11/2021 à 15:04, Noah Bergbauer a écrit :
> Simply set the respective bits and update the descriptor accordingly.
> 
> Signed-off-by: Noah Bergbauer <noah@statshelix.com>
> ---
>   hw/input/hid.c   | 2 ++
>   hw/usb/dev-hid.c | 6 +++---
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/input/hid.c b/hw/input/hid.c
> index 8aab0521f4..e7ecebdf8f 100644
> --- a/hw/input/hid.c
> +++ b/hw/input/hid.c
> @@ -114,6 +114,8 @@ static void hid_pointer_event(DeviceState *dev, QemuConsole *src,
>           [INPUT_BUTTON_LEFT]   = 0x01,
>           [INPUT_BUTTON_RIGHT]  = 0x02,
>           [INPUT_BUTTON_MIDDLE] = 0x04,
> +        [INPUT_BUTTON_SIDE] = 0x08,
> +        [INPUT_BUTTON_EXTRA] = 0x10,
>       };
>       HIDState *hs = (HIDState *)dev;
>       HIDPointerEvent *e;
> diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
> index 1c7ae97c30..bdd6d1ffaf 100644
> --- a/hw/usb/dev-hid.c
> +++ b/hw/usb/dev-hid.c
> @@ -461,14 +461,14 @@ static const uint8_t qemu_mouse_hid_report_descriptor[] = {
>       0xa1, 0x00,		/*   Collection (Physical) */
>       0x05, 0x09,		/*     Usage Page (Button) */
>       0x19, 0x01,		/*     Usage Minimum (1) */
> -    0x29, 0x03,		/*     Usage Maximum (3) */
> +    0x29, 0x05,		/*     Usage Maximum (5) */
>       0x15, 0x00,		/*     Logical Minimum (0) */
>       0x25, 0x01,		/*     Logical Maximum (1) */
> -    0x95, 0x03,		/*     Report Count (3) */
> +    0x95, 0x05,		/*     Report Count (5) */
>       0x75, 0x01,		/*     Report Size (1) */
>       0x81, 0x02,		/*     Input (Data, Variable, Absolute) */
>       0x95, 0x01,		/*     Report Count (1) */
> -    0x75, 0x05,		/*     Report Size (5) */
> +    0x75, 0x03,		/*     Report Size (3) */
>       0x81, 0x01,		/*     Input (Constant) */
>       0x05, 0x01,		/*     Usage Page (Generic Desktop) */
>       0x09, 0x30,		/*     Usage (X) */

Applied to my trivial-patches branch.

Thanks,
Laurent


