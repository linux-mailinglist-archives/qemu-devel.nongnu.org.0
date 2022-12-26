Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8A66564AE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 19:51:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9sYH-0002Uf-G8; Mon, 26 Dec 2022 13:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1p9sYF-0002UV-Sn
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 13:50:19 -0500
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1p9sYD-0005Tc-L4
 for qemu-devel@nongnu.org; Mon, 26 Dec 2022 13:50:19 -0500
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
 by mailout06.t-online.de (Postfix) with SMTP id 731466602;
 Mon, 26 Dec 2022 19:50:14 +0100 (CET)
Received: from [192.168.211.200] ([79.208.21.92]) by fwd74.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1p9sY8-4UMiZd0; Mon, 26 Dec 2022 19:50:12 +0100
Message-ID: <4cef8c93-00ee-d1ad-77f5-7a328795e58c@t-online.de>
Date: Mon, 26 Dec 2022 19:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] hw/audio/c97: fix abort in audio_calloc()
To: Qiang Liu <cyruscyliu@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20221225121357.498040-1-cyruscyliu@gmail.com>
Content-Language: en-US
In-Reply-To: <20221225121357.498040-1-cyruscyliu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1672080612-CACB7B6F-7670EEAB/0/0 CLEAN NORMAL
X-TOI-MSGID: e2cc2cbb-a8ae-4ea4-9f0c-2524e62669ec
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Am 25.12.22 um 13:13 schrieb Qiang Liu:

Hi Qiang,

I didn't receive your email probably because the reverse DNS entry of 
your mail server isn't setup correctly.
This is from the mail header of the qemu-devel mailing list server.
X-Host-Lookup-Failed: Reverse DNS lookup failed for 220.184.252.86 (failed)

Did you see my patches at 
https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg02895.html ?
Patches 01/11 and 02/11 prevent the disturbing error message from 
audio_calloc and later patches remove the audio_calloc function.

I think the subject of your patch isn't correct. Your patch doesn't fix 
an abort in audio_calloc. In 
https://gitlab.com/qemu-project/qemu/-/issues/1393 you correctly notice 
this was already fixed.

> Section 5.10.2 of the AC97 specification (https://hands.com/~lkcl/ac97_r23.pdf)
> shows the feasibility to support for rates other than 48kHZ. Specifically,
> AC97_PCM_Front_DAC_Rate (reg 2Ch) should be from 8kHZ to 48kHZ.

I think you misread section 5.10.2 of the AC97 Revision 2.3 
specification. Section 5.10 is about S/PDIF concurrency. It doesn't say 
anything about the lowest sample rate limit without concurrent S/PDIF 
transmission. The emulated SigmaTel STAC9700 codec doesn't even have a 
S/PDIF output. But I have an example for sample rates lower than 8kHz. 
The Texas Instruments LM4546B is an AC97 codec which supports sample 
rates from 4kHz - 48kHz.

The STAC9700 is a 48kHz fixed rate codec. You won't find anything about 
the highest or lowest sample rate in its data sheet. Someone added the 
VRA and VRM modes in QEMU and the guest drivers don't seem to mind.

I would like to keep the ability to select a 1Hz sample rate, as there 
is no reason to artificially limit the lowest supported sample rate. See 
https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg03987.html

I would support a patch to limit the VRA and VRM modes to the highest 
supported rate of 48kHz. This is a technical limit for single data rate.

> Before Volker Rümelin fixed it in 12f4abf6a245 and 0cbc8bd4694f, an adversary
> could leverage this to crash QEMU.
>
> Fixes: e5c9a13e2670 ("PCI AC97 emulation by malc.")
> Reported-by: Volker Rümelin<vr_qemu@t-online.de>
> Reported-by: Qiang Liu<cyruscyliu@gmail.com>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1393
> Signed-off-by: Qiang Liu<cyruscyliu@gmail.com>
> ---
>   hw/audio/ac97.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> index be2dd701a4..826411e462 100644
> --- a/hw/audio/ac97.c
> +++ b/hw/audio/ac97.c
> @@ -625,9 +625,14 @@ static void nam_writew(void *opaque, uint32_t addr, uint32_t val)
>           break;
>       case AC97_PCM_Front_DAC_Rate:
>           if (mixer_load(s, AC97_Extended_Audio_Ctrl_Stat) & EACS_VRA) {
> -            mixer_store(s, addr, val);
> -            dolog("Set front DAC rate to %d\n", val);
> -            open_voice(s, PO_INDEX, val);
> +            if (val >= 8000 && val <= 48000) {
> +                mixer_store(s, addr, val);
> +                dolog("Set front DAC rate to %d\n", val);
> +                open_voice(s, PO_INDEX, val);
> +            } else {
> +                dolog("Attempt to set front DAC rate to %d, but valid is"
> +                      "8-48kHZ\n", val);

This is not correct. If you limit the sample rate, you should echo back 
the closest supported sample rate. See AC'97 2.3 Section 5.8.3. It's not 
a guest error if the guest writes an unsupported sample rate to the 
Audio Sample Rate Control Registers, which means it's also not necessary 
to log this.

With best regards,
Volker

> +            }
>           } else {
>               dolog("Attempt to set front DAC rate to %d, but VRA is not set\n",
>                     val);


