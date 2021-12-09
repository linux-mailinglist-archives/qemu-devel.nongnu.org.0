Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE69946F3A5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 20:09:44 +0100 (CET)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvOnW-0002ME-ES
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 14:09:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mvOmT-0001gQ-JD
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 14:08:37 -0500
Received: from mailout07.t-online.de ([194.25.134.83]:55288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mvOmR-0000c5-3M
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 14:08:37 -0500
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout07.t-online.de (Postfix) with SMTP id 2308387ED;
 Thu,  9 Dec 2021 20:08:18 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mvOm9-3Suou90; Thu, 9 Dec 2021 20:08:17 +0100
Message-ID: <67a6ea63-198d-008c-3c0b-c3f9fccca2b0@t-online.de>
Date: Thu, 9 Dec 2021 20:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] audio: Add sndio backend
To: Brad Smith <brad@comstyle.com>
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
Content-Language: en-US
In-Reply-To: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1639076897-00001473-014F8839/0/0 CLEAN NORMAL
X-TOI-MSGID: 75112b4d-a2ad-4b9e-b534-1e911f82bf1d
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Brad,

I tested the sndio backend on my Linux system and I found a bug in the 
sndio backend. The problem is that the function audio_run() can call the 
function sndio_enable_out() to disable audio playback.

In the sndio_poll_event() function, audio_run() is called, which removes 
the poll handlers when the playback stream is stopped by calling 
sndio_enable_out(). Next, sndio_poll_wait() is called in 
sndio_poll_event(), which can reinstall the poll handlers of the stopped 
stream again. After a subsequent call to sndio_fini_out(), the pindex 
pointer of the still installed poll handlers points to a memory area 
that has already been freed. This can lead to a segmentation fault or a 
QEMU lockup because of a blocking read.

I suggest to use a flag to prevent that sndio_poll_event() reinstalls 
the poll handlers.

> +typedef struct SndioVoice {
> +    union {
> +        HWVoiceOut out;
> +        HWVoiceIn in;
> +    } hw;
> +    struct sio_par par;
> +    struct sio_hdl *hdl;
> +    struct pollfd *pfds;
> +    struct pollindex {
> +        struct SndioVoice *self;
> +        int index;
> +    } *pindexes;
> +    unsigned char *buf;
> +    size_t buf_size;
> +    size_t sndio_pos;
> +    size_t qemu_pos;
> +    unsigned int mode;
> +    unsigned int nfds;

+    bool enabled;

> +} SndioVoice;

> +/*
> + * call-back called when one of the descriptors
> + * became readable or writable
> + */
> +static void sndio_poll_event(SndioVoice *self, int index, int event)
> +{
> +    int revents;
> +
> +    /*
> +     * ensure we're not called twice this cycle
> +     */
> +    sndio_poll_clear(self);
> +
> +    /*
> +     * make self->pfds[] look as we're returning from poll syscal,
> +     * this is how sio_revents expects events to be.
> +     */
> +    self->pfds[index].revents = event;
> +
> +    /*
> +     * tell sndio to handle events and return whether we can read or
> +     * write without blocking.
> +     */
> +    revents = sio_revents(self->hdl, self->pfds);
> +    if (self->mode == SIO_PLAY) {
> +        if (revents & POLLOUT) {
> +            sndio_write(self);
> +        }
> +
> +        if (self->qemu_pos < self->buf_size) {
> +            audio_run(self->hw.out.s, "sndio_out");
> +        }
> +    } else {
> +        if (revents & POLLIN) {
> +            sndio_read(self);
> +        }
> +
> +        if (self->qemu_pos < self->sndio_pos) {
> +            audio_run(self->hw.in.s, "sndio_in");
> +        }
> +    }
> +
> +    sndio_poll_wait(self);

-    sndio_poll_wait(self);
+    if (self->enabled) {
+        sndio_poll_wait(self);
+    }

> +}

> +/*
> + * return a buffer where data to play can be stored
> + */
> +static size_t sndio_put_buffer_out(HWVoiceOut *hw, void *buf, size_t size)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    self->qemu_pos += size;
> +    sndio_poll_wait(self);
> +    return size;
> +}

> +/*
> + * discard the given amount of recorded data
> + */
> +static void sndio_put_buffer_in(HWVoiceIn *hw, void *buf, size_t size)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    self->qemu_pos += size;
> +    if (self->qemu_pos == self->buf_size) {
> +        self->qemu_pos = 0;
> +        self->sndio_pos = 0;
> +    }
> +    sndio_poll_wait(self);
> +}

It's not necessary to guard sndio_poll_wait() in sndio_put_buffer_out() 
and sndio_put_buffer_in() because audio_run() will never call those 
functions for a disabled stream.

> +static void sndio_enable(SndioVoice *self, bool enable)
> +{
> +    if (enable) {
> +        sio_start(self->hdl);

+        self->enabled = true;

> +        sndio_poll_wait(self);
> +    } else {

+        self->enabled = false;

> +        sndio_poll_clear(self);
> +        sio_stop(self->hdl);
> +    }
> +}

With best regards,
Volker

