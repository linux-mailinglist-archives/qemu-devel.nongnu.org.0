Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557216D58D1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 08:38:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjaHT-00016I-Pg; Tue, 04 Apr 2023 02:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pjaHQ-000169-Od
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 02:36:33 -0400
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pjaHN-0008MD-Iy
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 02:36:32 -0400
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout08.t-online.de (Postfix) with SMTP id D2F728062;
 Tue,  4 Apr 2023 08:36:25 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pjaHI-2rP1FJ0; Tue, 4 Apr 2023 08:36:24 +0200
Message-ID: <3b962e4c-02fd-fc4d-b416-75436ac4bad0@t-online.de>
Date: Tue, 4 Apr 2023 08:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, kraxel@redhat.com,
 armbru@redhat.com, qemu_oss@crudebyte.com, pbonzini@redhat.com,
 wtaymans@redhat.com
References: <20230315164633.60924-1-dbassey@redhat.com>
 <325b0fd9-d435-e8c6-25cc-124e7ad68f8c@t-online.de>
 <CACzuRywrL7E4bj_85HyJxqkWXAh_--z-BQ4FURPS8ufPu=fAhw@mail.gmail.com>
 <9a02901b-77d9-5a79-69dd-7a45a9241d7e@t-online.de>
 <CACzuRyyFOXaUpJ+OVKU1yTjqPH=qtFDisDNjp2ukg6Sy2kchQw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <CACzuRyyFOXaUpJ+OVKU1yTjqPH=qtFDisDNjp2ukg6Sy2kchQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1680590184-3C8ABC0E-4CD6D271/0/0 CLEAN NORMAL
X-TOI-MSGID: 371245fe-ae37-4e8e-846f-8a4dff321597
Received-SPF: none client-ip=194.25.134.20; envelope-from=vr_qemu@t-online.de;
 helo=mailout08.t-online.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Dorinda,

> Hi Volker,
>
>     Filling a buffer with zeros to produce silence still wrong for
>     unsigned
>     samples. For example, a 0 in SPA_AUDIO_FORMAT_U8 format maps to
>     -1.0 in
>     SPA_AUDIO_FORMAT_F32.
>
>     This is a bug. On a buffer underrun, the buffer filled with
>     silence is
>     dropped.
>
> What are your suggestions to improve this?
>

The code in patch v7 handled buffer underruns in playback_on_process() 
correctly. I suggest to use that part of the code again. It was just 
wrong to fill the buffer with zeros for unsigned samples. Christian 
suggested to use the audio_pcm_info_clear_buf() function instead of 
memset(p, 0, n_bytes). If you don't want to use 
audio_pcm_info_clear_buf() you could use the code there as a template.

There is no guarantee that guests can produce audio samples fast enough. 
Buffer underruns should therefore be handled properly.

>     Why don't you need a lock here? Is pw_stream_set_active() thread safe?
>
> I will put a lock there, Thanks.
>
>     You only have the three volume levels 2.0, 1.0 and 0.0 while
>     vol[i] has
>     256 levels.
>
> Ack.
>
>     It's an optimization. Evaluating req =
>     (uint64_t)v->g->dev->timer_period
>     * v->info.rate * 1 / 2 / 1000000 * v->frame_size once in
>     qpw_init_out()
>     vs. a lot of needless evaluations every few milliseconds in the
>     callback.
>
> Ack
>
>      <http://out.name> options. Please
>
> Can you please clarify WYM here?
>

I didn't write that. The link was already in your email.

With best regards,
Volker

> Thanks,
> Dorinda
>
> On Mon, Apr 3, 2023 at 8:51 AM Volker Rümelin <vr_qemu@t-online.de> wrote:
>
>     Am 28.03.23 um 13:56 schrieb Dorinda Bassey:
>
>     Hi Dorinda,
>
>     > Hi Volker,
>     >
>     > Thanks for the feedback.
>     >
>     >     This term is constant for the lifetime of the playback
>     stream. It
>     >     could
>     >     be precalculated in qpw_init_out().
>     >
>     > It's still constant even when precalculated in qpw_init_out().
>
>     It's an optimization. Evaluating req =
>     (uint64_t)v->g->dev->timer_period
>     * v->info.rate * 1 / 2 / 1000000 * v->frame_size once in
>     qpw_init_out()
>     vs. a lot of needless evaluations every few milliseconds in the
>     callback.
>
>     With best regards,
>     Volker
>
>     >
>     >     The if (!v->enabled) block isn't needed. When the guest
>     stops the
>     >     playback stream, it won't write new samples. After the pipewire
>     >     ringbuffer is drained, avail is always 0. It's better to
>     drain the
>     >     ringbuffer, otherwise the first thing you will hear after
>     playback
>     >     starts again will be stale audio samples.
>     >
>     >     You removed the code to play silence on a buffer underrun. I
>     >     suggest to
>     >     add it again. Use a trace point with the "simple" trace
>     backend to
>     >     see
>     >     how often pipewire now calls the callback in short
>     succession for a
>     >     disabled stream before giving up. Please read again Marc-André's
>     >     comments for the v7 version of the
>     >     pipewire backend. When the guest enables/disables an audio
>     stream,
>     >     pipewire should know this. It's unnecessary that pipewire
>     calls the
>     >     callback code for disabled streams. Don't forget to connect the
>     >     stream
>     >     with the flag PW_STREAM_FLAG_INACTIVE. Every QEMU audio device
>     >     enables
>     >     the stream before playback/recording starts. The pcm_ops
>     functions
>     >     volume_out and volume_in are missing. Probably
>     >     SPA_PROP_channelVolumes can be used to adjust the stream
>     volumes.
>     >     Without these functions the guest can adjust the stream
>     volume and
>     >     the
>     >     host has an independent way to adjust the stream volume. This is
>     >     sometimes irritating.
>     >
>     >     The pipewire backend code doesn't use the in|out.name
>     <http://out.name>
>     >     <http://out.name> options. Please
>     >     either remove the name options or add code to connect to the
>     >     specified
>     >     source/sink. I would prefer the latter. PW_KEY_TARGET_OBJECT
>     looks
>     >     promising.
>     >
>     > Ack.
>     >
>     > Thanks,
>     > Dorinda.
>     >
>     >
>     >
>     > On Mon, Mar 20, 2023 at 7:31 AM Volker Rümelin
>     <vr_qemu@t-online.de>
>     > wrote:
>     >
>     >
>     >     > diff --git a/audio/trace-events b/audio/trace-events
>     >     > index e1ab643add..e0acf9ac56 100644
>     >     > --- a/audio/trace-events
>     >     > +++ b/audio/trace-events
>     >     > @@ -18,6 +18,13 @@ dbus_audio_register(const char *s,
>     const char
>     >     *dir) "sender = %s, dir = %s"
>     >     >   dbus_audio_put_buffer_out(size_t len) "len = %zu"
>     >     >   dbus_audio_read(size_t len) "len = %zu"
>     >     >
>     >     > +# pwaudio.c
>     >     > +pw_state_changed(const char *s) "stream state: %s"
>     >     > +pw_node(int nodeid) "node id: %d"
>     >     > +pw_read(int32_t avail, uint32_t index, size_t len) "avail=%u
>     >     index=%u len=%zu"
>     >     > +pw_write(int32_t filled, int32_t avail, uint32_t index,
>     size_t
>     >     len) "filled=%u avail=%u index=%u len=%zu"
>     >     > +pw_audio_init(void) "Initialize Pipewire context"
>     >     > +
>     >
>     >     Hi Dorinda,
>     >
>     >     the format specifiers and parameter types don't always match.
>     >
>     >     With  best regards,
>     >     Volker
>     >
>     >     >   # audio.c
>     >     >   audio_timer_start(int interval) "interval %d ms"
>     >     >   audio_timer_stop(void) ""
>     >     >
>     >
>


