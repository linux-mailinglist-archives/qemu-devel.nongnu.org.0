Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847786F9930
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 17:08:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvfyu-0006hP-It; Sun, 07 May 2023 11:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvfyr-0006gy-PP
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:07:21 -0400
Received: from mailout04.t-online.de ([194.25.134.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvfyp-00007b-4w
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:07:21 -0400
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout04.t-online.de (Postfix) with SMTP id 0EDC6CC05;
 Sun,  7 May 2023 17:07:15 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.27.89]) by fwd82.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pvfyi-2KNE250; Sun, 7 May 2023 17:07:12 +0200
Message-ID: <27e9b4c9-d528-9df1-63ae-79c2a33cd865@t-online.de>
Date: Sun, 7 May 2023 17:07:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 08/12] audio/pw: factorize some common code
Content-Language: de-DE
To: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Cc: dbassey@redhat.com, qemu-devel@nongnu.org
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-9-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230506163735.3481387-9-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1683472032-7B06AC36-48A4507A/0/0 CLEAN NORMAL
X-TOI-MSGID: 3b8135ae-a8b6-4d79-88af-722dc7549678
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
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
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/pwaudio.c | 85 ++++++++++++++++++++-----------------------------
>   1 file changed, 34 insertions(+), 51 deletions(-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index d0bc4680a6..67df53948c 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -66,6 +66,9 @@ typedef struct PWVoiceIn {
>       PWVoice v;
>   } PWVoiceIn;
>   
> +#define PW_VOICE_IN(v) ((PWVoiceIn*)v)
> +#define PW_VOICE_OUT(v) ((PWVoiceOut*)v)
> +
>   static void
>   stream_destroy(void *data)
>   {
> @@ -630,62 +633,55 @@ qpw_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
>   }
>   
>   static void
> -qpw_fini_out(HWVoiceOut *hw)
> +qpw_voice_fini(PWVoice *v)
>   {
> -    PWVoiceOut *pw = (PWVoiceOut *) hw;
> -    PWVoice *v = &pw->v;
> +    pwaudio *c = v->g;
>   
> -    if (v->stream) {
> -        pwaudio *c = v->g;
> -        pw_thread_loop_lock(c->thread_loop);
> -        pw_stream_destroy(v->stream);
> -        v->stream = NULL;
> -        pw_thread_loop_unlock(c->thread_loop);
> +    if (!v->stream) {
> +        return;
>       }
> +    pw_thread_loop_lock(c->thread_loop);
> +    pw_stream_destroy(v->stream);
> +    v->stream = NULL;
> +    pw_thread_loop_unlock(c->thread_loop);
>   }
>   
>   static void
> -qpw_fini_in(HWVoiceIn *hw)
> +qpw_fini_out(HWVoiceOut *hw)
>   {
> -    PWVoiceIn *pw = (PWVoiceIn *) hw;
> -    PWVoice *v = &pw->v;
> +    qpw_voice_fini(&PW_VOICE_OUT(hw)->v);
> +}
>   
> -    if (v->stream) {
> -        pwaudio *c = v->g;
> -        pw_thread_loop_lock(c->thread_loop);
> -        pw_stream_destroy(v->stream);
> -        v->stream = NULL;
> -        pw_thread_loop_unlock(c->thread_loop);
> -    }
> +static void
> +qpw_fini_in(HWVoiceIn *hw)
> +{
> +    qpw_voice_fini(&PW_VOICE_IN(hw)->v);
>   }
>   
>   static void
> -qpw_enable_out(HWVoiceOut *hw, bool enable)
> +qpw_voice_set_enabled(PWVoice *v, bool enable)
>   {
> -    PWVoiceOut *po = (PWVoiceOut *) hw;
> -    PWVoice *v = &po->v;
>       pwaudio *c = v->g;
>       pw_thread_loop_lock(c->thread_loop);
>       pw_stream_set_active(v->stream, enable);
>       pw_thread_loop_unlock(c->thread_loop);
>   }
>   
> +static void
> +qpw_enable_out(HWVoiceOut *hw, bool enable)
> +{
> +    qpw_voice_set_enabled(&PW_VOICE_OUT(hw)->v, enable);
> +}
> +
>   static void
>   qpw_enable_in(HWVoiceIn *hw, bool enable)
>   {
> -    PWVoiceIn *pi = (PWVoiceIn *) hw;
> -    PWVoice *v = &pi->v;
> -    pwaudio *c = v->g;
> -    pw_thread_loop_lock(c->thread_loop);
> -    pw_stream_set_active(v->stream, enable);
> -    pw_thread_loop_unlock(c->thread_loop);
> +    qpw_voice_set_enabled(&PW_VOICE_IN(hw)->v, enable);
>   }
>   
>   static void
> -qpw_volume_out(HWVoiceOut *hw, Volume *vol)
> +qpw_voice_set_volume(PWVoice *v, Volume *vol)
>   {
> -    PWVoiceOut *pw = (PWVoiceOut *) hw;
> -    PWVoice *v = &pw->v;
>       pwaudio *c = v->g;
>       int i, ret;
>   
> @@ -707,28 +703,15 @@ qpw_volume_out(HWVoiceOut *hw, Volume *vol)
>   }
>   
>   static void
> -qpw_volume_in(HWVoiceIn *hw, Volume *vol)
> +qpw_volume_out(HWVoiceOut *hw, Volume *vol)
>   {
> -    PWVoiceIn *pw = (PWVoiceIn *) hw;
> -    PWVoice *v = &pw->v;
> -    pwaudio *c = v->g;
> -    int i, ret;
> -
> -    pw_thread_loop_lock(c->thread_loop);
> -    v->volume.channels = vol->channels;
> -
> -    for (i = 0; i < vol->channels; ++i) {
> -        v->volume.values[i] = (float)vol->vol[i] / 255;
> -    }
> -
> -    ret = pw_stream_set_control(v->stream,
> -        SPA_PROP_channelVolumes, v->volume.channels, v->volume.values, 0);
> -    trace_pw_vol(ret == 0 ? "success" : "failed");
> +    qpw_voice_set_volume(&PW_VOICE_OUT(hw)->v, vol);
> +}
>   
> -    v->muted = vol->mute;
> -    float val = v->muted ? 1.f : 0.f;
> -    ret = pw_stream_set_control(v->stream, SPA_PROP_mute, 1, &val, 0);
> -    pw_thread_loop_unlock(c->thread_loop);
> +static void
> +qpw_volume_in(HWVoiceIn *hw, Volume *vol)
> +{
> +    qpw_voice_set_volume(&PW_VOICE_IN(hw)->v, vol);
>   }
>   
>   static int wait_resync(pwaudio *pw)


