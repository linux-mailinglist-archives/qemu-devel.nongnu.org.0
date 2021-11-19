Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5834577B6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 21:26:18 +0100 (CET)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moASf-0000z7-9f
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 15:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1moAQP-0007SO-9a
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:23:58 -0500
Received: from mailout01.t-online.de ([194.25.134.80]:35190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1moAQM-0005Vo-SI
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:23:56 -0500
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout01.t-online.de (Postfix) with SMTP id 3571077A7;
 Fri, 19 Nov 2021 21:23:44 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd76.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1moAQ6-076nOj0; Fri, 19 Nov 2021 21:23:38 +0100
Message-ID: <f2e9128d-e0dd-6741-7f28-bcfa3171b712@t-online.de>
Date: Fri, 19 Nov 2021 21:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] audio: Add sndio backend
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
Content-Language: en-US
In-Reply-To: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1637353418-0000144F-D154CA3C/0/0 CLEAN NORMAL
X-TOI-MSGID: 7107fb63-654d-4ebd-b7a0-dc12de960197
Received-SPF: none client-ip=194.25.134.80; envelope-from=vr_qemu@t-online.de;
 helo=mailout01.t-online.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Brad,

just a few white space and coding style issues.

> +/*
> + * stop polling descriptors
> + */
> +static void sndio_poll_clear(SndioVoice *self)
> +{
> +    struct pollfd *pfd;
> +    int i;
> +
> +    for (i = 0; i < self->nfds; i++) {
> +        pfd = &self->pfds[i];
> +        qemu_set_fd_handler (pfd->fd, NULL, NULL, NULL);

No space between function name and opening brace.

> +/*
> + * Set handlers for all descriptors libsndio needs to
> + * poll
> + */
> +static void sndio_poll_wait(SndioVoice *self)
> +{
> +    struct pollfd *pfd;
> +    int events, i;
> +
> +    events = 0;
> +    if (self->mode == SIO_PLAY) {
> +        if (self->sndio_pos < self->qemu_pos) {
> +            events |= POLLOUT;
> +        }
> +    } else {
> +        if (self->sndio_pos < self->buf_size) {
> +            events |= POLLIN;
> +        }
> +    }
> +
> +    /*
> +     * fill the given array of descriptors with the events sndio
> +     * wants, they are different from our 'event' variable because
> +     * sndio may use descriptors internally.
> +     */
> +    self->nfds = sio_pollfd(self->hdl, self->pfds, events);
> +
> +    for (i = 0; i < self->nfds; i++) {
> +        pfd = &self->pfds[i];
> +        if (pfd->fd < 0) {
> +                continue;

Indent with 4 spaces.

> +        }
> +        qemu_set_fd_handler(pfd->fd,
> +                (pfd->events & POLLIN) ? sndio_poll_in : NULL,
> +                (pfd->events & POLLOUT) ? sndio_poll_out : NULL,
> +                &self->pindexes[i]);

Same here.

> +static int sndio_init(SndioVoice *self,
> +                      struct audsettings *as, int mode, Audiodev *dev)
> +{
> +    AudiodevSndioOptions *opts = &dev->u.sndio;
> +    unsigned long long latency;
> +    const char *dev_name;
> +    struct sio_par req;
> +    unsigned int nch;
> +    int i, nfds;
> +
> +    dev_name = opts->has_dev ? opts->dev : SIO_DEVANY;
> +    latency = opts->has_latency ? opts->latency : SNDIO_LATENCY_US;
> +
> +    /* open the device in non-blocking mode */
> +    self->hdl = sio_open(dev_name, mode, 1);
> +    if (self->hdl == NULL) {
> +        dolog("failed to open device\n");
> +        return -1;
> +    }
> +
> +    self->mode = mode;
> +
> +    sio_initpar(&req);
> +
> +    switch (as->fmt) {
> +    case AUDIO_FORMAT_S8:
> +        req.bits = 8;
> +        req.sig = 1;
> +        break;
> +    case AUDIO_FORMAT_U8:
> +        req.bits = 8;
> +        req.sig = 0;
> +        break;
> +    case AUDIO_FORMAT_S16:
> +        req.bits = 16;
> +        req.sig = 1;
> +        break;
> +    case AUDIO_FORMAT_U16:
> +        req.bits = 16;
> +        req.sig = 0;
> +        break;
> +    case AUDIO_FORMAT_S32:
> +        req.bits = 32;
> +        req.sig = 1;
> +        break;
> +    case AUDIO_FORMAT_U32:
> +        req.bits = 32;
> +        req.sig = 0;
> +    default:
> +        dolog("unknown audio sample format\n");
> +        return -1;
> +    }
> +
> +    if (req.bits > 8) {
> +        req.le = as->endianness ? 0 : 1;
> +    }
> +
> +    req.rate = as->freq;
> +    if (mode == SIO_PLAY) {
> +            req.pchan = as->nchannels;

Indent with 4 spaces.

> +    } else {
> +            req.rchan = as->nchannels;

Here too.

> +static void sndio_enable_out(HWVoiceOut *hw, bool enable)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    return sndio_enable(self, enable);
> +}

Unnecessary return statement.

> +
> +static void sndio_enable_in(HWVoiceIn *hw, bool enable)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    return sndio_enable(self, enable);
> +}

The same here

> +static void sndio_fini_out(HWVoiceOut *hw)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    return sndio_fini(self);
> +}

and here

> +
> +static void sndio_fini_in(HWVoiceIn *hw)
> +{
> +    SndioVoice *self = (SndioVoice *) hw;
> +
> +    return sndio_fini(self);
> +}

and here.

With best regards,
Volker

