Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D07F488852
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 08:59:06 +0100 (CET)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6T6X-00078k-8f
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 02:59:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n6T4n-0006N2-Pm
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 02:57:18 -0500
Received: from mailout12.t-online.de ([194.25.134.22]:42736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n6T4l-0003eW-1w
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 02:57:17 -0500
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout12.t-online.de (Postfix) with SMTP id 71C90690D;
 Sun,  9 Jan 2022 08:56:57 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd70.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n6T4N-1qnMrx0; Sun, 9 Jan 2022 08:56:52 +0100
Message-ID: <69666421-0441-7c50-057d-d0616a574593@t-online.de>
Date: Sun, 9 Jan 2022 08:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] audio: allow spice buffer_length to be adjusted
To: Geoffrey McRae <geoff@hostfission.com>
References: <20220109033332.402609-1-geoff@hostfission.com>
Content-Language: en-US
In-Reply-To: <20220109033332.402609-1-geoff@hostfission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641715012-00004E7B-3D87FBC3/0/0 CLEAN NORMAL
X-TOI-MSGID: 27e437d2-df8e-4f1f-9ea1-483aa51795e4
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

> Spice clients that are running directly on the host system have
> pratcially unlimited bandwidth so to reduce latency allow the user to
> configure the buffer_length to a lower value if desired.
>
> While virt-viewer can not take advantage of this, the PureSpice [1]
> library used by Looking Glass [2] is able to produce and consume audio
> at these rates, combined with the merge request for spice-server [3]
> this allows for latencies close to realtime.
>
> [1]https://github.com/gnif/PureSpice
> [2]https://github.com/gnif/LookingGlass
> [3]https://gitlab.freedesktop.org/spice/spice/-/merge_requests/199
>
> Signed-off-by: Geoffrey McRae<geoff@hostfission.com>
> ---
>   audio/spiceaudio.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/audio/spiceaudio.c b/audio/spiceaudio.c
> index a8d370fe6f..0c44bbe836 100644
> --- a/audio/spiceaudio.c
> +++ b/audio/spiceaudio.c
> @@ -76,7 +76,7 @@ static void *spice_audio_init(Audiodev *dev)
>       if (!using_spice) {
>           return NULL;
>       }
> -    return &spice_audio_init;
> +    return dev;
>   }
>   
>   static void spice_audio_fini (void *opaque)
> @@ -90,6 +90,8 @@ static int line_out_init(HWVoiceOut *hw, struct audsettings *as,
>                            void *drv_opaque)
>   {
>       SpiceVoiceOut *out = container_of (hw, SpiceVoiceOut, hw);
> +    Audiodev      *dev = (Audiodev *)drv_opaque;
> +
>       struct audsettings settings;
>   
>   #if SPICE_INTERFACE_PLAYBACK_MAJOR > 1 || SPICE_INTERFACE_PLAYBACK_MINOR >= 3
> @@ -102,7 +104,12 @@ static int line_out_init(HWVoiceOut *hw, struct audsettings *as,
>       settings.endianness = AUDIO_HOST_ENDIANNESS;
>   
>       audio_pcm_init_info (&hw->info, &settings);
> -    hw->samples = LINE_OUT_SAMPLES;
> +    if (dev->u.none.out->has_buffer_length) {
> +        hw->samples = audio_buffer_samples(dev->u.none.out, &settings, 10000);

hw->samples counts in frames. The buffer is twice as large as expected.

+        hw->samples = audio_buffer_frames(dev->u.none.out, &settings, 
10000);

I'm aware the default size of 10000us will not be used, but it's a bad 
example because with a default timer-period of 10000us the buffer has to 
be a few percent larger than timer-period. Otherwise the emulated audio 
device will never catch up if a AUD_write() has been delayed.

> +    } else {
> +        hw->samples = LINE_OUT_SAMPLES;
> +    }
> +
>       out->active = 0;
>   
>       out->sin.base.sif = &playback_sif.base;
> @@ -199,6 +206,7 @@ static void line_out_volume(HWVoiceOut *hw, Volume *vol)
>   static int line_in_init(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
>   {
>       SpiceVoiceIn *in = container_of (hw, SpiceVoiceIn, hw);
> +    Audiodev     *dev = (Audiodev *)drv_opaque;
>       struct audsettings settings;
>   
>   #if SPICE_INTERFACE_RECORD_MAJOR > 2 || SPICE_INTERFACE_RECORD_MINOR >= 3
> @@ -211,7 +219,12 @@ static int line_in_init(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
>       settings.endianness = AUDIO_HOST_ENDIANNESS;
>   
>       audio_pcm_init_info (&hw->info, &settings);
> -    hw->samples = LINE_IN_SAMPLES;
> +    if (dev->u.none.out->has_buffer_length) {
> +        hw->samples = audio_buffer_samples(dev->u.none.in, &settings, 10000);

-        hw->samples = audio_buffer_samples(dev->u.none.in, &settings, 
10000);
+        hw->samples = audio_buffer_frames(dev->u.none.in, &settings, 
10000);

> +    } else {
> +        hw->samples = LINE_IN_SAMPLES;
> +    }
> +
>       in->active = 0;
>   
>       in->sin.base.sif = &record_sif.base;

Btw. have you seen my "[PATCH 00/15] reduce audio playback latency" 
patch series at 
https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg00780.html? 
I haven't tested, but I think it's possible to add a buffer_get_free 
function to audio/spiceaudio.c. That would eliminate the need to 
fine-tune the audio buffer length.

With best regards,
Volker

