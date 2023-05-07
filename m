Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 487E96F9938
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 17:13:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvg4g-00006W-Oe; Sun, 07 May 2023 11:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvg4e-00006N-UB
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:13:20 -0400
Received: from mailout03.t-online.de ([194.25.134.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvg4c-0001WY-BE
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:13:20 -0400
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout03.t-online.de (Postfix) with SMTP id 4ED7D3922C;
 Sun,  7 May 2023 17:13:16 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.27.89]) by fwd86.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pvg4Y-3I3O890; Sun, 7 May 2023 17:13:14 +0200
Message-ID: <21ed3d2b-5cca-cf3e-4db0-18f6a441a47e@t-online.de>
Date: Sun, 7 May 2023 17:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 12/12] audio/pw: improve channel position code
Content-Language: de-DE
To: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Cc: dbassey@redhat.com, qemu-devel@nongnu.org
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-13-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230506163735.3481387-13-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1683472394-AFFFCC11-2483B08A/0/0 CLEAN NORMAL
X-TOI-MSGID: 9fa4122c-0c39-4d1a-8cd8-0e8b3dc4e997
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> Follow PulseAudio backend comment and code, and only implement the
> channels QEMU actually supports at this point, and add the same comment
> about limits and future mappings. Simplify a bit the code.
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/pwaudio.c | 75 +++++++++++++++++--------------------------------
>   1 file changed, 26 insertions(+), 49 deletions(-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index f74d506ec6..062610a704 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -417,8 +417,8 @@ pw_to_audfmt(enum spa_audio_format fmt, int *endianness,
>   }
>   
>   static int
> -create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
> -              const char *name, enum spa_direction dir)
> +qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
> +               const char *name, enum spa_direction dir)
>   {
>       int res;
>       uint32_t n_params;
> @@ -482,62 +482,37 @@ create_stream(pwaudio *c, PWVoice *v, const char *stream_name,
>       return 0;
>   }
>   
> -static int
> -qpw_stream_new(pwaudio *c, PWVoice *v, const char *stream_name,
> -               const char *name, enum spa_direction dir)
> +static void
> +qpw_set_position(uint32_t channels, uint32_t position[SPA_AUDIO_MAX_CHANNELS])
>   {
> -    switch (v->info.channels) {
> +    memcpy(position, (uint32_t[SPA_AUDIO_MAX_CHANNELS]) { SPA_AUDIO_CHANNEL_UNKNOWN, },
> +           sizeof(uint32_t) * SPA_AUDIO_MAX_CHANNELS);
> +    /*
> +     * TODO: This currently expects the only frontend supporting more than 2
> +     * channels is the usb-audio.  We will need some means to set channel
> +     * order when a new frontend gains multi-channel support.
> +     */
> +    switch (channels) {
>       case 8:
> -        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> -        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> -        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> -        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> -        v->info.position[4] = SPA_AUDIO_CHANNEL_RL;
> -        v->info.position[5] = SPA_AUDIO_CHANNEL_RR;
> -        v->info.position[6] = SPA_AUDIO_CHANNEL_SL;
> -        v->info.position[7] = SPA_AUDIO_CHANNEL_SR;
> -        break;
> +        position[6] = SPA_AUDIO_CHANNEL_SL;
> +        position[7] = SPA_AUDIO_CHANNEL_SR;
> +        /* fallthrough */
>       case 6:
> -        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> -        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> -        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> -        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> -        v->info.position[4] = SPA_AUDIO_CHANNEL_RL;
> -        v->info.position[5] = SPA_AUDIO_CHANNEL_RR;
> -        break;
> -    case 5:
> -        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> -        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> -        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> -        v->info.position[3] = SPA_AUDIO_CHANNEL_LFE;
> -        v->info.position[4] = SPA_AUDIO_CHANNEL_RC;
> -        break;
> -    case 4:
> -        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> -        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> -        v->info.position[2] = SPA_AUDIO_CHANNEL_FC;
> -        v->info.position[3] = SPA_AUDIO_CHANNEL_RC;
> -        break;
> -    case 3:
> -        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> -        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> -        v->info.position[2] = SPA_AUDIO_CHANNEL_LFE;
> -        break;
> +        position[2] = SPA_AUDIO_CHANNEL_FC;
> +        position[3] = SPA_AUDIO_CHANNEL_LFE;
> +        position[4] = SPA_AUDIO_CHANNEL_RL;
> +        position[5] = SPA_AUDIO_CHANNEL_RR;
> +        /* fallthrough */
>       case 2:
> -        v->info.position[0] = SPA_AUDIO_CHANNEL_FL;
> -        v->info.position[1] = SPA_AUDIO_CHANNEL_FR;
> +        position[0] = SPA_AUDIO_CHANNEL_FL;
> +        position[1] = SPA_AUDIO_CHANNEL_FR;
>           break;
>       case 1:
> -        v->info.position[0] = SPA_AUDIO_CHANNEL_MONO;
> +        position[0] = SPA_AUDIO_CHANNEL_MONO;
>           break;
>       default:
> -        for (size_t i = 0; i < v->info.channels; i++) {
> -            v->info.position[i] = SPA_AUDIO_CHANNEL_UNKNOWN;
> -        }
> -        break;
> +        dolog("Internal error: unsupported channel count %d\n", channels);
>       }
> -
> -    return create_stream(c, v, stream_name, name, dir);
>   }
>   
>   static int
> @@ -555,6 +530,7 @@ qpw_init_out(HWVoiceOut *hw, struct audsettings *as, void *drv_opaque)
>   
>       v->info.format = audfmt_to_pw(as->fmt, as->endianness);
>       v->info.channels = as->nchannels;
> +    qpw_set_position(as->nchannels, v->info.position);
>       v->info.rate = as->freq;
>   
>       obt_as.fmt =
> @@ -601,6 +577,7 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
>   
>       v->info.format = audfmt_to_pw(as->fmt, as->endianness);
>       v->info.channels = as->nchannels;
> +    qpw_set_position(as->nchannels, v->info.position);
>       v->info.rate = as->freq;
>   
>       obt_as.fmt =


