Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E9F6D3D97
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 08:52:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjE2D-0006X9-9d; Mon, 03 Apr 2023 02:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pjE25-0006Wa-Lv
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:51:15 -0400
Received: from mailout09.t-online.de ([194.25.134.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pjE23-0006H9-4C
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:51:13 -0400
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout09.t-online.de (Postfix) with SMTP id D5A76FB6F;
 Mon,  3 Apr 2023 08:51:06 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pjE1y-0711N30; Mon, 3 Apr 2023 08:51:06 +0200
Message-ID: <9a02901b-77d9-5a79-69dd-7a45a9241d7e@t-online.de>
Date: Mon, 3 Apr 2023 08:51:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Content-Language: en-US
To: Dorinda Bassey <dbassey@redhat.com>
Cc: qemu-devel@nongnu.org, marcandre.lureau@gmail.com, kraxel@redhat.com,
 armbru@redhat.com, qemu_oss@crudebyte.com, pbonzini@redhat.com,
 wtaymans@redhat.com
References: <20230315164633.60924-1-dbassey@redhat.com>
 <325b0fd9-d435-e8c6-25cc-124e7ad68f8c@t-online.de>
 <CACzuRywrL7E4bj_85HyJxqkWXAh_--z-BQ4FURPS8ufPu=fAhw@mail.gmail.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <CACzuRywrL7E4bj_85HyJxqkWXAh_--z-BQ4FURPS8ufPu=fAhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1680504666-DD540C15-CCDA499B/0/0 CLEAN NORMAL
X-TOI-MSGID: 548a1688-00b7-416e-8f2e-380bb7d1458c
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.37, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 28.03.23 um 13:56 schrieb Dorinda Bassey:

Hi Dorinda,

> Hi Volker,
>
> Thanks for the feedback.
>
>     This term is constant for the lifetime of the playback stream. It
>     could
>     be precalculated in qpw_init_out().
>
> It's still constant even when precalculated in qpw_init_out().

It's an optimization. Evaluating req = (uint64_t)v->g->dev->timer_period 
* v->info.rate * 1 / 2 / 1000000 * v->frame_size once in qpw_init_out() 
vs. a lot of needless evaluations every few milliseconds in the callback.

With best regards,
Volker

>
>     The if (!v->enabled) block isn't needed. When the guest stops the
>     playback stream, it won't write new samples. After the pipewire
>     ringbuffer is drained, avail is always 0. It's better to drain the
>     ringbuffer, otherwise the first thing you will hear after playback
>     starts again will be stale audio samples.
>
>     You removed the code to play silence on a buffer underrun. I
>     suggest to
>     add it again. Use a trace point with the "simple" trace backend to
>     see
>     how often pipewire now calls the callback in short succession for a
>     disabled stream before giving up. Please read again Marc-André's
>     comments for the v7 version of the
>     pipewire backend. When the guest enables/disables an audio stream,
>     pipewire should know this. It's unnecessary that pipewire calls the
>     callback code for disabled streams. Don't forget to connect the
>     stream
>     with the flag PW_STREAM_FLAG_INACTIVE. Every QEMU audio device
>     enables
>     the stream before playback/recording starts. The pcm_ops functions
>     volume_out and volume_in are missing. Probably
>     SPA_PROP_channelVolumes can be used to adjust the stream volumes.
>     Without these functions the guest can adjust the stream volume and
>     the
>     host has an independent way to adjust the stream volume. This is
>     sometimes irritating.
>
>     The pipewire backend code doesn't use the in|out.name
>     <http://out.name> options. Please
>     either remove the name options or add code to connect to the
>     specified
>     source/sink. I would prefer the latter. PW_KEY_TARGET_OBJECT looks
>     promising.
>
> Ack.
>
> Thanks,
> Dorinda.
>
>
>
> On Mon, Mar 20, 2023 at 7:31 AM Volker Rümelin <vr_qemu@t-online.de> 
> wrote:
>
>
>     > diff --git a/audio/trace-events b/audio/trace-events
>     > index e1ab643add..e0acf9ac56 100644
>     > --- a/audio/trace-events
>     > +++ b/audio/trace-events
>     > @@ -18,6 +18,13 @@ dbus_audio_register(const char *s, const char
>     *dir) "sender = %s, dir = %s"
>     >   dbus_audio_put_buffer_out(size_t len) "len = %zu"
>     >   dbus_audio_read(size_t len) "len = %zu"
>     >
>     > +# pwaudio.c
>     > +pw_state_changed(const char *s) "stream state: %s"
>     > +pw_node(int nodeid) "node id: %d"
>     > +pw_read(int32_t avail, uint32_t index, size_t len) "avail=%u
>     index=%u len=%zu"
>     > +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t
>     len) "filled=%u avail=%u index=%u len=%zu"
>     > +pw_audio_init(void) "Initialize Pipewire context"
>     > +
>
>     Hi Dorinda,
>
>     the format specifiers and parameter types don't always match.
>
>     With  best regards,
>     Volker
>
>     >   # audio.c
>     >   audio_timer_start(int interval) "interval %d ms"
>     >   audio_timer_stop(void) ""
>     >
>


