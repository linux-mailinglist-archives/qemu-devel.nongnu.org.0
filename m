Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A87A6B5DC5
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 17:21:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb1wH-0000px-Ps; Sat, 11 Mar 2023 11:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pb1wF-0000pB-8g
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 11:19:19 -0500
Received: from mailout11.t-online.de ([194.25.134.85])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pb1wC-000123-PZ
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 11:19:18 -0500
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout11.t-online.de (Postfix) with SMTP id 4514710FF1;
 Sat, 11 Mar 2023 17:19:11 +0100 (CET)
Received: from [192.168.211.200] ([79.208.22.72]) by fwd73.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pb1w6-1DRArh0; Sat, 11 Mar 2023 17:19:10 +0100
Message-ID: <5179fdbb-54f2-a24b-d9e0-fea89c5528fd@t-online.de>
Date: Sat, 11 Mar 2023 17:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] DO-NOT-MERGE: pipewire sample code
To: Dorinda Bassey <dbassey@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wtaymans@redhat.com,
 qemu-devel@nongnu.org
References: <a3717185-a930-e8e7-80cc-edb8d9e4d01d@t-online.de>
 <20230311120826.5584-1-vr_qemu@t-online.de>
Content-Language: en-US
In-Reply-To: <20230311120826.5584-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1678551550-B6BA4DF7-9C4D387C/0/0 CLEAN NORMAL
X-TOI-MSGID: 97f82146-1887-44c6-875c-38ccc2e1341b
Received-SPF: none client-ip=194.25.134.85; envelope-from=vr_qemu@t-online.de;
 helo=mailout11.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

> Based-on:<20230306171020.381116-1-dbassey@redhat.com>
> ([PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU)
>
> This is sample code for the review of the pipewire backed. The
> code actually works.
>
> An email with explanations for the changes will follow.
>
> Signed-off-by: Volker Rümelin<vr_qemu@t-online.de>
> ---
>   audio/pwaudio.c | 67 +++++++++++++++++++++++++++++++++----------------
>   qapi/audio.json | 10 +++-----
>   2 files changed, 49 insertions(+), 28 deletions(-)
>
> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index d357761152..8e2a38938f 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -23,7 +23,6 @@
>   #define AUDIO_CAP "pipewire"
>   #define RINGBUFFER_SIZE    (1u << 22)
>   #define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> -#define BUFFER_SAMPLES    512
>   
>   #include "audio_int.h"
>   
> @@ -48,6 +47,7 @@ typedef struct PWVoice {
>       struct pw_stream *stream;
>       struct spa_hook stream_listener;
>       struct spa_audio_info_raw info;
> +    uint32_t highwater_mark;
>       uint32_t frame_size;
>       struct spa_ringbuffer ring;
>       uint8_t buffer[RINGBUFFER_SIZE];
> @@ -82,7 +82,7 @@ playback_on_process(void *data)
>       void *p;
>       struct pw_buffer *b;
>       struct spa_buffer *buf;
> -    uint32_t n_frames, req, index, n_bytes;
> +    uint32_t req, index, n_bytes;
>       int32_t avail;
>   
>       if (!v->stream) {
> @@ -105,8 +105,7 @@ playback_on_process(void *data)
>       if (req == 0) {
>           req = 4096 * v->frame_size;
>       }

I don't understand how the req == 0 case can work at all. The downstream 
audio device is the thinnest point in the playback stream. We can't 
write more audio frames than the audio device will consume.

> -    n_frames = SPA_MIN(req, buf->datas[0].maxsize);
> -    n_bytes = n_frames * v->frame_size;
> +    n_bytes = SPA_MIN(req, buf->datas[0].maxsize);

See Marc-André's review.

>   
>       /* get no of available bytes to read data from buffer */
>   
> @@ -270,6 +269,30 @@ done_unlock:
>       return l;
>   }
>   
> +static size_t qpw_buffer_get_free(HWVoiceOut *hw)
> +{
> +    PWVoiceOut *pw = (PWVoiceOut *)hw;
> +    PWVoice *v = &pw->v;
> +    pwaudio *c = v->g;
> +    const char *error = NULL;
> +    int32_t filled, avail;
> +    uint32_t index;
> +
> +    pw_thread_loop_lock(c->thread_loop);
> +    if (pw_stream_get_state(v->stream, &error) != PW_STREAM_STATE_STREAMING) {
> +        /* wait for stream to become ready */
> +        avail = 0;
> +        goto done_unlock;
> +    }
> +
> +    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
> +    avail = v->highwater_mark - filled;
> +
> +done_unlock:
> +    pw_thread_loop_unlock(c->thread_loop);
> +    return avail;
> +}
> +

A pcm_ops buffer_get_free function is necessary. Otherwise the gus and 
via-ac97 audio devices will not work properly for the -audiodev 
pipewire,id=audio0,out.mixing-engine=off case. They need to know in 
advance how many bytes they can write.

Also, without the buffer_get_free function, the generic audio buffer 
will increase the playback latency.

>   static size_t
>   qpw_write(HWVoiceOut *hw, void *data, size_t len)
>   {
> @@ -277,20 +300,18 @@ qpw_write(HWVoiceOut *hw, void *data, size_t len)
>       PWVoice *v = &pw->v;
>       pwaudio *c = v->g;
>       const char *error = NULL;
> -    const int periods = 3;
> -    size_t l;
>       int32_t filled, avail;
>       uint32_t index;
>   
>       pw_thread_loop_lock(c->thread_loop);
>       if (pw_stream_get_state(v->stream, &error) != PW_STREAM_STATE_STREAMING) {
>           /* wait for stream to become ready */
> -        l = 0;
> +        len = 0;
>           goto done_unlock;
>       }
> -    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
>   
> -    avail = BUFFER_SAMPLES * v->frame_size * periods - filled;
> +    filled = spa_ringbuffer_get_write_index(&v->ring, &index);
> +    avail = v->highwater_mark - filled;
>   
>       trace_pw_write(filled, avail, index, len);
>   
> @@ -312,11 +333,10 @@ qpw_write(HWVoiceOut *hw, void *data, size_t len)
>                                   index & RINGBUFFER_MASK, data, len);
>       index += len;
>       spa_ringbuffer_write_update(&v->ring, index);
> -    l = len;
>   
>   done_unlock:
>       pw_thread_loop_unlock(c->thread_loop);
> -    return l;
> +    return len;
>   }
>   
>   static int
> @@ -420,8 +440,13 @@ create_stream(pwaudio *c, PWVoice *v, const char *name)
>       const struct spa_pod *params[2];
>       uint8_t buffer[1024];
>       struct spa_pod_builder b;
> +    struct pw_properties *props;
>   
> -    v->stream = pw_stream_new(c->core, name, NULL);
> +    props = pw_properties_new(NULL, NULL);
> +    pw_properties_setf(props, PW_KEY_NODE_LATENCY, "%" PRIu64 "/%u",
> +                       (uint64_t)v->g->dev->timer_period * v->info.rate
> +                       * 3 / 4 / 1000000, v->info.rate);
> +    v->stream = pw_stream_new(c->core, name, props);

The PW_KEY_NODE_LATENCY property is a hint for Pipewire that we need 
updates faster than timer_period. I selected 75% of timer-period. Then 
there's a good chance the audio frontends can write or read new audio 
packets every timer-period. It doesn't matter that Pipewire calls the 
callbacks faster in most cases.

If it turns out that Pipewire often can't even approximately fulfill 
this hint, we will additionally need a jitter buffer implementation to 
split the larger Pipewire audio packets into timer-period sized packets.

>   
>       if (v->stream == NULL) {
>           goto error;
> @@ -563,7 +588,11 @@ qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
>       audio_pcm_init_info(&hw->info, &obt_as);
>   
>       /* report the buffer size to qemu */
> -    hw->samples = BUFFER_SAMPLES;
> +    hw->samples = audio_buffer_frames(
> +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as, 46440);
> +    v->highwater_mark = MIN(RINGBUFFER_SIZE,
> +                            (ppdo->has_latency ? ppdo->latency : 46440)
> +                            * (uint64_t)v->info.rate / 1000000 * v->frame_size);
>   

The reported buffer size should be much larger than BUFFER_SAMPLES. This 
gives the audio frontends a chance to catch up if they missed 
timer-periods or if they have to fill the pipewire backend buffer 
quickly after playback starts. The exact size is not critical, but to be 
command line compatible with the pulseaudio backend, I suggest to use 
46ms. A large hw->samples value doesn't increase the playback latency.

v->highwater_mark is the effective pipewire backend buffer size. At a 
audio frame rate of 44100 frames/s, the code without this patch uses a 
buffer size of BUFFER_SAMPLES * periods / 44100 frames/s = 512 frames * 
3 / 44100 frames/s = 35ms. On my computer the buffer size has to be 30ms 
at minimum. I suggest to add a good margin and use a default of 46ms. 
This buffer is a larger contributor to the playback latency.

>       pw_thread_loop_unlock(c->thread_loop);
>       return 0;
> @@ -606,7 +635,8 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
>       audio_pcm_init_info(&hw->info, &obt_as);
>   
>       /* report the buffer size to qemu */
> -    hw->samples = BUFFER_SAMPLES;
> +    hw->samples = audio_buffer_frames(
> +        qapi_AudiodevPipewirePerDirectionOptions_base(ppdo), &obt_as, 46440);
>   

See qpw_init_out().

>       pw_thread_loop_unlock(c->thread_loop);
>       return 0;
> @@ -695,15 +725,8 @@ qpw_audio_init(Audiodev *dev)
>       pw = g_new0(pwaudio, 1);
>       pw_init(NULL, NULL);
>   
> -    AudiodevPipewireOptions *popts;
>       trace_pw_audio_init("Initialize Pipewire context\n");
>       assert(dev->driver == AUDIODEV_DRIVER_PIPEWIRE);
> -    popts = &dev->u.pipewire;
> -
> -    if (!popts->has_latency) {
> -        popts->has_latency = true;
> -        popts->latency = 15000;
> -    }
>   
>       pw->dev = dev;
>       pw->thread_loop = pw_thread_loop_new("Pipewire thread loop", NULL);
> @@ -781,7 +804,7 @@ static struct audio_pcm_ops qpw_pcm_ops = {
>       .init_out = qpw_init_out,
>       .fini_out = qpw_fini_out,
>       .write = qpw_write,
> -    .buffer_get_free = audio_generic_buffer_get_free,
> +    .buffer_get_free = qpw_buffer_get_free,
>       .run_buffer_out = audio_generic_run_buffer_out,
>       .enable_out = qpw_enable_out,
>   
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 9a0d7d9ece..d49a8a670b 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -337,6 +337,7 @@
>   #               create multiple Pipewire devices or run multiple qemu
>   #               instances (default: audiodev's id, since 7.1)
>   #
> +# @latency: Pipewire backend buffer size in microseconds (default 46440)
>   #
>   # Since: 8.0
>   ##
> @@ -344,7 +345,8 @@
>     'base': 'AudiodevPerDirectionOptions',
>     'data': {
>       '*name': 'str',
> -    '*stream-name': 'str' } }
> +    '*stream-name': 'str',
> +    '*latency': 'uint32' } }
>   

I suggest to use the same option names as the pulseaudio backend. 
out.latency is the effective Pipewire buffer size.

With best regards,
Volker

>   ##
>   # @AudiodevPipewireOptions:
> @@ -355,16 +357,12 @@
>   #
>   # @out: options of the playback stream
>   #
> -# @latency: add latency to playback in microseconds
> -#           (default 15000)
> -#
>   # Since: 8.0
>   ##
>   { 'struct': 'AudiodevPipewireOptions',
>     'data': {
>       '*in':     'AudiodevPipewirePerDirectionOptions',
> -    '*out':    'AudiodevPipewirePerDirectionOptions',
> -    '*latency': 'uint32' } }
> +    '*out':    'AudiodevPipewirePerDirectionOptions' } }
>   
>   ##
>   # @AudiodevSdlPerDirectionOptions:


