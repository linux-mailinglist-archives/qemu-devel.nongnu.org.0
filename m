Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE164A54F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4m3Y-0004g8-Dy; Mon, 12 Dec 2022 11:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4m3W-0004eW-3y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:53:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4m3T-0000w0-LU
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670864006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0yo4Q9fHjCRAJDCcjuHb4c2JIlj2S9fGnzTdF4ccNU=;
 b=ii2yEBjlgNVs3Lawy1xxURr1zop/3zkB6IfhyjLK2cTtmjD7ZKli9+QrA9nS6WZ/juqDI4
 MfYxSvtTmkR9wOT+Fbd/wh3rvtYLS8Dm+rnrbTbt7nrdGy13Z/E8233PrwXT+rBjDgWb06
 KSghUrUe4Ws3SY+Gl3TuLztvV5yd41M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-389-uo7qi0DVP4-8_ISkZoRMqw-1; Mon, 12 Dec 2022 11:53:24 -0500
X-MC-Unique: uo7qi0DVP4-8_ISkZoRMqw-1
Received: by mail-wm1-f69.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so2192205wme.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/0yo4Q9fHjCRAJDCcjuHb4c2JIlj2S9fGnzTdF4ccNU=;
 b=tYF9mOdeTRvLybDjdAT2ycwehPPLvz1sFoMC7FVIlJUD/07aC8EC6+jdTfHxu0yeZN
 TvPZYK0oQ++sxV528UzWk35m8qyb9fsUl/UPrs5ReQBVjp+kjrlxDPyPrkMzU5MGdvHf
 pLjP9uGeskk9joRELzoyUav1qAByA6NNxsn4O6amDxHCFXd/PXJhVh8HGBEaNOgLpo88
 /vnO2ZLNNLOShkqoEj1UbUZhLS7qoMpLtGOK5lpY5oyVUs/QKbg0F3n279coJ6FViLjc
 JQXWkRu9Jn9+ose4Rt4KcZDMAS3798zCZEvDiY9vyS3wjicE5z2PV43hrFrUeKEi5zy8
 5xyg==
X-Gm-Message-State: ANoB5plaR5g/lGwMDRieHb3OPRjQsKRVpZCUncj/XEZ1u4IxBBDAA+n3
 AHNtzuWzAn2Aotl8SthrTVIDfBvpDnCbHcH40V0jt8T3Jf6aNoPFS0NpJqnz69iW2Yw0BcwyfZy
 2zf+xM1Nwglv+rYg=
X-Received: by 2002:a05:600c:5106:b0:3d1:ebdf:d591 with SMTP id
 o6-20020a05600c510600b003d1ebdfd591mr13276124wms.15.1670864003855; 
 Mon, 12 Dec 2022 08:53:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6KL5rR62NFi9xx0M6zP4YknFqxndlkTC1FxYKmJbby61MZ77fQaKWvaIClIl3PAbdliDFi1A==
X-Received: by 2002:a05:600c:5106:b0:3d1:ebdf:d591 with SMTP id
 o6-20020a05600c510600b003d1ebdfd591mr13276118wms.15.1670864003585; 
 Mon, 12 Dec 2022 08:53:23 -0800 (PST)
Received: from [192.168.8.104] (tmo-066-56.customers.d1-online.com.
 [80.187.66.56]) by smtp.gmail.com with ESMTPSA id
 f9-20020a1c6a09000000b003cf57329221sm9724064wmc.14.2022.12.12.08.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 08:53:22 -0800 (PST)
Message-ID: <62940e7f-60dc-86d7-6007-da0e89dfc6ff@redhat.com>
Date: Mon, 12 Dec 2022 17:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/3] qapi, audio: respect build time conditions in audio
 schema
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster
 <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20210302175524.1290840-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 02/03/2021 18.55, Daniel P. Berrangé wrote:
> Currently the -audiodev accepts any audiodev type regardless of what is
> built in to QEMU. An error only occurs later at runtime when a sound
> device tries to use the audio backend.
> 
> With this change QEMU will immediately reject -audiodev args that are
> not compiled into the binary. The QMP schema will also be introspectable
> to identify what is compiled in.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   audio/audio.c          | 16 +++++++++++++++
>   audio/audio_legacy.c   | 41 ++++++++++++++++++++++++++++++++++++++-
>   audio/audio_template.h | 16 +++++++++++++++
>   qapi/audio.json        | 44 ++++++++++++++++++++++++++++++++----------
>   4 files changed, 106 insertions(+), 11 deletions(-)

  Hi Daniel!

Would you have time to respin this patch for QEMU 8.0 ?

  Thomas


> diff --git a/audio/audio.c b/audio/audio.c
> index 40a4bbd7ce..53434fc674 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1989,14 +1989,30 @@ void audio_create_pdos(Audiodev *dev)
>           break
>   
>           CASE(NONE, none, );
> +#ifdef CONFIG_AUDIO_ALSA
>           CASE(ALSA, alsa, Alsa);
> +#endif
> +#ifdef CONFIG_AUDIO_COREAUDIO
>           CASE(COREAUDIO, coreaudio, Coreaudio);
> +#endif
> +#ifdef CONFIG_AUDIO_DSOUND
>           CASE(DSOUND, dsound, );
> +#endif
> +#ifdef CONFIG_AUDIO_JACK
>           CASE(JACK, jack, Jack);
> +#endif
> +#ifdef CONFIG_AUDIO_OSS
>           CASE(OSS, oss, Oss);
> +#endif
> +#ifdef CONFIG_AUDIO_PA
>           CASE(PA, pa, Pa);
> +#endif
> +#ifdef CONFIG_AUDIO_SDL
>           CASE(SDL, sdl, Sdl);
> +#endif
> +#ifdef CONFIG_SPICE
>           CASE(SPICE, spice, );
> +#endif
>           CASE(WAV, wav, );
>   
>       case AUDIODEV_DRIVER__MAX:
> diff --git a/audio/audio_legacy.c b/audio/audio_legacy.c
> index 0fe827b057..bb2268f2b2 100644
> --- a/audio/audio_legacy.c
> +++ b/audio/audio_legacy.c
> @@ -93,6 +93,7 @@ static void get_fmt(const char *env, AudioFormat *dst, bool *has_dst)
>   }
>   
>   
> +#if defined(CONFIG_AUDIO_ALSA) || defined(CONFIG_AUDIO_DSOUND)
>   static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
>   {
>       const char *val = getenv(env);
> @@ -101,15 +102,20 @@ static void get_millis_to_usecs(const char *env, uint32_t *dst, bool *has_dst)
>           *has_dst = true;
>       }
>   }
> +#endif
>   
> +#if defined(CONFIG_AUDIO_ALSA) || defined(CONFIG_AUDIO_COREAUDIO) || \
> +    defined(CONFIG_AUDIO_PA) || defined(CONFIG_AUDIO_SDL) || \
> +    defined(CONFIG_AUDIO_DSOUND) || defined(CONFIG_AUDIO_OSS)
>   static uint32_t frames_to_usecs(uint32_t frames,
>                                   AudiodevPerDirectionOptions *pdo)
>   {
>       uint32_t freq = pdo->has_frequency ? pdo->frequency : 44100;
>       return (frames * 1000000 + freq / 2) / freq;
>   }
> +#endif
>   
> -
> +#ifdef CONFIG_AUDIO_COREAUDIO
>   static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>                                   AudiodevPerDirectionOptions *pdo)
>   {
> @@ -119,14 +125,19 @@ static void get_frames_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>           *has_dst = true;
>       }
>   }
> +#endif
>   
> +#if defined(CONFIG_AUDIO_PA) || defined(CONFIG_AUDIO_SDL) || \
> +    defined(CONFIG_AUDIO_DSOUND) || defined(CONFIG_AUDIO_OSS)
>   static uint32_t samples_to_usecs(uint32_t samples,
>                                    AudiodevPerDirectionOptions *pdo)
>   {
>       uint32_t channels = pdo->has_channels ? pdo->channels : 2;
>       return frames_to_usecs(samples / channels, pdo);
>   }
> +#endif
>   
> +#if defined(CONFIG_AUDIO_PA) || defined(CONFIG_AUDIO_SDL)
>   static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>                                    AudiodevPerDirectionOptions *pdo)
>   {
> @@ -136,7 +147,9 @@ static void get_samples_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>           *has_dst = true;
>       }
>   }
> +#endif
>   
> +#if defined(CONFIG_AUDIO_DSOUND) || defined(CONFIG_AUDIO_OSS)
>   static uint32_t bytes_to_usecs(uint32_t bytes, AudiodevPerDirectionOptions *pdo)
>   {
>       AudioFormat fmt = pdo->has_format ? pdo->format : AUDIO_FORMAT_S16;
> @@ -153,8 +166,11 @@ static void get_bytes_to_usecs(const char *env, uint32_t *dst, bool *has_dst,
>           *has_dst = true;
>       }
>   }
> +#endif
>   
>   /* backend specific functions */
> +
> +#ifdef CONFIG_AUDIO_ALSA
>   /* ALSA */
>   static void handle_alsa_per_direction(
>       AudiodevAlsaPerDirectionOptions *apdo, const char *prefix)
> @@ -200,7 +216,9 @@ static void handle_alsa(Audiodev *dev)
>       get_millis_to_usecs("QEMU_ALSA_THRESHOLD",
>                           &aopt->threshold, &aopt->has_threshold);
>   }
> +#endif
>   
> +#ifdef CONFIG_AUDIO_COREAUDIO
>   /* coreaudio */
>   static void handle_coreaudio(Audiodev *dev)
>   {
> @@ -213,7 +231,9 @@ static void handle_coreaudio(Audiodev *dev)
>               &dev->u.coreaudio.out->buffer_count,
>               &dev->u.coreaudio.out->has_buffer_count);
>   }
> +#endif
>   
> +#ifdef CONFIG_AUDIO_DSOUND
>   /* dsound */
>   static void handle_dsound(Audiodev *dev)
>   {
> @@ -228,7 +248,9 @@ static void handle_dsound(Audiodev *dev)
>                          &dev->u.dsound.in->has_buffer_length,
>                          dev->u.dsound.in);
>   }
> +#endif
>   
> +#ifdef CONFIG_AUDIO_OSS
>   /* OSS */
>   static void handle_oss_per_direction(
>       AudiodevOssPerDirectionOptions *opdo, const char *try_poll_env,
> @@ -256,7 +278,9 @@ static void handle_oss(Audiodev *dev)
>       get_bool("QEMU_OSS_EXCLUSIVE", &oopt->exclusive, &oopt->has_exclusive);
>       get_int("QEMU_OSS_POLICY", &oopt->dsp_policy, &oopt->has_dsp_policy);
>   }
> +#endif
>   
> +#ifdef CONFIG_AUDIO_PA
>   /* pulseaudio */
>   static void handle_pa_per_direction(
>       AudiodevPaPerDirectionOptions *ppdo, const char *env)
> @@ -280,7 +304,9 @@ static void handle_pa(Audiodev *dev)
>   
>       get_str("QEMU_PA_SERVER", &dev->u.pa.server, &dev->u.pa.has_server);
>   }
> +#endif
>   
> +#ifdef CONFIG_AUDIO_SDL
>   /* SDL */
>   static void handle_sdl(Audiodev *dev)
>   {
> @@ -289,6 +315,7 @@ static void handle_sdl(Audiodev *dev)
>           &dev->u.sdl.out->has_buffer_length,
>           qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.out));
>   }
> +#endif
>   
>   /* wav */
>   static void handle_wav(Audiodev *dev)
> @@ -348,29 +375,41 @@ static AudiodevListEntry *legacy_opt(const char *drvname)
>       }
>   
>       switch (e->dev->driver) {
> +#ifdef CONFIG_AUDIO_ALSA
>       case AUDIODEV_DRIVER_ALSA:
>           handle_alsa(e->dev);
>           break;
> +#endif
>   
> +#ifdef CONFIG_AUDIO_COREAUDIO
>       case AUDIODEV_DRIVER_COREAUDIO:
>           handle_coreaudio(e->dev);
>           break;
> +#endif
>   
> +#ifdef CONFIG_AUDIO_DSOUND
>       case AUDIODEV_DRIVER_DSOUND:
>           handle_dsound(e->dev);
>           break;
> +#endif
>   
> +#ifdef CONFIG_AUDIO_OSS
>       case AUDIODEV_DRIVER_OSS:
>           handle_oss(e->dev);
>           break;
> +#endif
>   
> +#ifdef CONFIG_AUDIO_PA
>       case AUDIODEV_DRIVER_PA:
>           handle_pa(e->dev);
>           break;
> +#endif
>   
> +#ifdef CONFIG_AUDIO_SDL
>       case AUDIODEV_DRIVER_SDL:
>           handle_sdl(e->dev);
>           break;
> +#endif
>   
>       case AUDIODEV_DRIVER_WAV:
>           handle_wav(e->dev);
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index c6714946aa..0847b643be 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -322,23 +322,39 @@ AudiodevPerDirectionOptions *glue(audio_get_pdo_, TYPE)(Audiodev *dev)
>       switch (dev->driver) {
>       case AUDIODEV_DRIVER_NONE:
>           return dev->u.none.TYPE;
> +#ifdef CONFIG_AUDIO_ALSA
>       case AUDIODEV_DRIVER_ALSA:
>           return qapi_AudiodevAlsaPerDirectionOptions_base(dev->u.alsa.TYPE);
> +#endif
> +#ifdef CONFIG_AUDIO_COREAUDIO
>       case AUDIODEV_DRIVER_COREAUDIO:
>           return qapi_AudiodevCoreaudioPerDirectionOptions_base(
>               dev->u.coreaudio.TYPE);
> +#endif
> +#ifdef CONFIG_AUDIO_DSOUND
>       case AUDIODEV_DRIVER_DSOUND:
>           return dev->u.dsound.TYPE;
> +#endif
> +#ifdef CONFIG_AUDIO_JACK
>       case AUDIODEV_DRIVER_JACK:
>           return qapi_AudiodevJackPerDirectionOptions_base(dev->u.jack.TYPE);
> +#endif
> +#ifdef CONFIG_AUDIO_OSS
>       case AUDIODEV_DRIVER_OSS:
>           return qapi_AudiodevOssPerDirectionOptions_base(dev->u.oss.TYPE);
> +#endif
> +#ifdef CONFIG_AUDIO_PA
>       case AUDIODEV_DRIVER_PA:
>           return qapi_AudiodevPaPerDirectionOptions_base(dev->u.pa.TYPE);
> +#endif
> +#ifdef CONFIG_AUDIO_SDL
>       case AUDIODEV_DRIVER_SDL:
>           return qapi_AudiodevSdlPerDirectionOptions_base(dev->u.sdl.TYPE);
> +#endif
> +#ifdef CONFIG_SPICE
>       case AUDIODEV_DRIVER_SPICE:
>           return dev->u.spice.TYPE;
> +#endif
>       case AUDIODEV_DRIVER_WAV:
>           return dev->u.wav.TYPE;
>   
> diff --git a/qapi/audio.json b/qapi/audio.json
> index d7b91230d7..9af1b8140c 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -386,8 +386,24 @@
>   # Since: 4.0
>   ##
>   { 'enum': 'AudiodevDriver',
> -  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
> -            'sdl', 'spice', 'wav' ] }
> +  'data': [ 'none',
> +            { 'name': 'alsa',
> +              'if': 'defined(CONFIG_AUDIO_ALSA)' },
> +            { 'name': 'coreaudio',
> +              'if': 'defined(CONFIG_AUDIO_COREAUDIO)' },
> +            { 'name': 'dsound',
> +              'if': 'defined(CONFIG_AUDIO_DSOUND)' },
> +            { 'name': 'jack',
> +              'if': 'defined(CONFIG_AUDIO_JACK)' },
> +            { 'name': 'oss',
> +              'if': 'defined(CONFIG_AUDIO_OSS)' },
> +            { 'name': 'pa',
> +              'if': 'defined(CONFIG_AUDIO_PA)' },
> +            { 'name': 'sdl',
> +              'if': 'defined(CONFIG_AUDIO_SDL)' },
> +            { 'name': 'spice',
> +              'if': 'defined(CONFIG_SPICE)' },
> +            'wav' ] }
>   
>   ##
>   # @Audiodev:
> @@ -410,14 +426,22 @@
>     'discriminator': 'driver',
>     'data': {
>       'none':      'AudiodevGenericOptions',
> -    'alsa':      'AudiodevAlsaOptions',
> -    'coreaudio': 'AudiodevCoreaudioOptions',
> -    'dsound':    'AudiodevDsoundOptions',
> -    'jack':      'AudiodevJackOptions',
> -    'oss':       'AudiodevOssOptions',
> -    'pa':        'AudiodevPaOptions',
> -    'sdl':       'AudiodevSdlOptions',
> -    'spice':     'AudiodevGenericOptions',
> +    'alsa':      { 'type': 'AudiodevAlsaOptions',
> +                   'if': 'defined(CONFIG_AUDIO_ALSA)' },
> +    'coreaudio': { 'type': 'AudiodevCoreaudioOptions',
> +                   'if': 'defined(CONFIG_AUDIO_COREAUDIO)' },
> +    'dsound':    { 'type': 'AudiodevDsoundOptions',
> +                   'if': 'defined(CONFIG_AUDIO_DSOUND)' },
> +    'jack':      { 'type': 'AudiodevJackOptions',
> +                   'if': 'defined(CONFIG_AUDIO_JACK)' },
> +    'oss':       { 'type': 'AudiodevOssOptions',
> +                   'if': 'defined(CONFIG_AUDIO_OSS)' },
> +    'pa':        { 'type': 'AudiodevPaOptions',
> +                   'if': 'defined(CONFIG_AUDIO_PA)' },
> +    'sdl':       { 'type': 'AudiodevSdlOptions',
> +                   'if': 'defined(CONFIG_AUDIO_SDL)' },
> +    'spice':     { 'type': 'AudiodevGenericOptions',
> +                   'if': 'defined(CONFIG_SPICE)' },
>       'wav':       'AudiodevWavOptions' } }
>   
>   ##


