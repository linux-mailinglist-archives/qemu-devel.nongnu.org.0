Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE53AFD78
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:58:47 +0200 (CEST)
Received: from localhost ([::1]:46204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaMw-0002nu-Pq
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvaM4-00022Z-Ne
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:57:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvaM2-0000HG-UK
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:57:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d11so19907896wrm.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NkELXyAGifupi9fNk7RCmMbaEUbNhZCX3ykXprQTGDI=;
 b=fkMQYQFeMMAyms6g9+lohoB7yCC7aeB+GJZsaJuGd993LYEQpmVDaHcpTkh9QWQNbC
 mIyre6AWXbMzTtaVJ97nxJqxhV/czi+YyKGSx6e5PgPqXr9yf7C7b/3VWiIzBhBCAVjy
 2iFIFPxoOCDwprIrc1AoIQOieY0fv9eG/DaXYxNmuPp9Pz92sy7kxSmxuMcHz2y+aw0T
 2d2S2wBOR6GM5KBrGA48IYIdkZdZh/BVjLWgbowJZlUu0bcJ+UxaeoMsPZWsdkuCRPIA
 LbwtkxMbF1bMZp8zTJHLHUw26qLar6Mtk4aEd4fIe9tmvjOwZLMzpSsDtR7VhjQaGJwT
 +8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NkELXyAGifupi9fNk7RCmMbaEUbNhZCX3ykXprQTGDI=;
 b=gg0qwUHk2uqeRJDSQdkymLrPN3JvZF6qbUpxgcxQ1Fzbn/cDMSB2oFs6KyBFuinuWV
 3OXio5vOR+6F1+018REWg9xnG95kV5AHTkLGxTldxAkaZN6FziAq1YLzHZLf5mNSOn1N
 Qm/9JUxRt6ZaPt+sBemRXYN9XOm/yCEUcAHgJdBsnFPywDREF4Gus3tRdbTw0BfChLWe
 ZMXp02SjUW82IcxPwbLBDE2PW/XOazt9VoXq8J8mJZOyQ9jZrrf/GDzyUV5OoVbTyEfg
 J1ND/k1daKsurzYqH29xibjY+7kWzKIyQYj+YHtVvvo7k8tfBLIIKQemDbysDBX1lH94
 Vpeg==
X-Gm-Message-State: AOAM532NzXtZOM5ymNb0S5xdy/zqmbS2aBs4are5Axo1SxzHRhWrhNvV
 MYNQygiiaSfez7QMaP3vtBU=
X-Google-Smtp-Source: ABdhPJxFXQjBwz0MluRk9sVPhqCQPkwrKPR1Sw97S/t0zYxifNqjEn+txSNoZvPn/yLEE1/OsPj1Og==
X-Received: by 2002:a5d:48c6:: with SMTP id p6mr2822024wrs.45.1624345069393;
 Mon, 21 Jun 2021 23:57:49 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h6sm1396612wmc.40.2021.06.21.23.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 23:57:48 -0700 (PDT)
Subject: Re: [PATCH] coreaudio: Lock only the buffer
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20210622015043.41997-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <21dacd6b-36aa-eef6-8c0a-ed42be9a0c2c@amsat.org>
Date: Tue, 22 Jun 2021 08:57:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622015043.41997-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 3:50 AM, Akihiko Odaki wrote:
> On macOS 11.3.1, Core Audio calls AudioDeviceIOProc after calling an
> internal function named HALB_Mutex::Lock(), which locks a mutex in
> HALB_IOThread::Entry(void*). HALB_Mutex::Lock() is also called in
> AudioObjectGetPropertyData, which is called by coreaudio driver.
> Therefore, a deadlock will occur if coreaudio driver calls
> AudioObjectGetPropertyData while holding a lock for a mutex and tries
> to lock the same mutex in AudioDeviceIOProc.
> 
> audioDeviceIOProc, which implements AudioDeviceIOProc in coreaudio
> driver, requires an exclusive access for the device configuration and
> the buffer. Fortunately, a mutex is necessary only for the buffer in
> audioDeviceIOProc because a change for the device configuration occurs
> only before setting up AudioDeviceIOProc or after stopping the playback
> with AudioDeviceStop.
> 
> With this change, the mutex owned by the driver will only be used for
> the buffer, and the device configuration change will be protected with
> the implicit iothread mutex.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>  audio/coreaudio.c | 59 +++++++++++------------------------------------
>  1 file changed, 13 insertions(+), 46 deletions(-)
> 
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index 578ec9b8b2e..c8d9f01d275 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -26,6 +26,7 @@
>  #include <CoreAudio/CoreAudio.h>
>  #include <pthread.h>            /* pthread_X */
>  
> +#include "qemu/main-loop.h"
>  #include "qemu/module.h"
>  #include "audio.h"
>  

Suggestions to complete your patch, document init_out_device()
and update_device_playback_state() are called with iothread
lock taken:

@@ -456,6 +456,7 @@ static OSStatus init_out_device(coreaudioVoiceOut *core)
     return 0;
 }

+/* Called with iothread lock taken. */
 static void fini_out_device(coreaudioVoiceOut *core)
 {
     OSStatus status;
@@ -486,6 +487,7 @@ static void fini_out_device(coreaudioVoiceOut *core)
     core->outputDeviceID = kAudioDeviceUnknown;
 }

+/* Called with iothread lock taken. */
 static void update_device_playback_state(coreaudioVoiceOut *core)
 {
     OSStatus status;

> @@ -551,9 +552,7 @@ static OSStatus handle_voice_change(
>      OSStatus status;
>      coreaudioVoiceOut *core = in_client_data;
>  
> -    if (coreaudio_lock(core, __func__)) {
> -        abort();
> -    }
> +    qemu_mutex_lock_iothread();
>  
>      if (core->outputDeviceID) {
>          fini_out_device(core);
> @@ -564,7 +563,7 @@ static OSStatus handle_voice_change(
>          update_device_playback_state(core);
>      }
>  
> -    coreaudio_unlock (core, __func__);
> +    qemu_mutex_unlock_iothread();
>      return status;
>  }
>  
> @@ -582,11 +581,7 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
>      err = pthread_mutex_init(&core->mutex, NULL);
>      if (err) {
>          dolog("Could not create mutex\nReason: %s\n", strerror (err));
> -        goto mutex_error;
> -    }
> -
> -    if (coreaudio_lock(core, __func__)) {
> -        goto lock_error;
> +        return -1;
>      }
>  
>      obt_as = *as;
> @@ -606,37 +601,21 @@ static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
>      if (status != kAudioHardwareNoError) {
>          coreaudio_playback_logerr (status,
>                                     "Could not listen to voice property change\n");
> -        goto listener_error;
> +        return -1;
>      }
>  
>      if (init_out_device(core)) {
> -        goto device_error;
> +        status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
> +                                                   &voice_addr,
> +                                                   handle_voice_change,
> +                                                   core);
> +        if (status != kAudioHardwareNoError) {
> +            coreaudio_playback_logerr(status,
> +                                      "Could not remove voice property change listener\n");
> +        }
>      }
>  
> -    coreaudio_unlock(core, __func__);
>      return 0;
> -
> -device_error:
> -    status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
> -                                               &voice_addr,
> -                                               handle_voice_change,
> -                                               core);
> -    if (status != kAudioHardwareNoError) {
> -        coreaudio_playback_logerr(status,
> -                                  "Could not remove voice property change listener\n");
> -    }
> -
> -listener_error:
> -    coreaudio_unlock(core, __func__);
> -
> -lock_error:
> -    err = pthread_mutex_destroy(&core->mutex);
> -    if (err) {
> -        dolog("Could not destroy mutex\nReason: %s\n", strerror (err));
> -    }
> -
> -mutex_error:
> -    return -1;
>  }
>  
>  static void coreaudio_fini_out (HWVoiceOut *hw)
> @@ -645,10 +624,6 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
>      int err;
>      coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
>  
> -    if (coreaudio_lock(core, __func__)) {
> -        abort();
> -    }
> -
>      status = AudioObjectRemovePropertyListener(kAudioObjectSystemObject,
>                                                 &voice_addr,
>                                                 handle_voice_change,
> @@ -659,8 +634,6 @@ static void coreaudio_fini_out (HWVoiceOut *hw)
>  
>      fini_out_device(core);
>  
> -    coreaudio_unlock(core, __func__);
> -
>      /* destroy mutex */
>      err = pthread_mutex_destroy(&core->mutex);
>      if (err) {
> @@ -672,14 +645,8 @@ static void coreaudio_enable_out(HWVoiceOut *hw, bool enable)
>  {
>      coreaudioVoiceOut *core = (coreaudioVoiceOut *) hw;
>  
> -    if (coreaudio_lock(core, __func__)) {
> -        abort();
> -    }
> -
>      core->enabled = enable;
>      update_device_playback_state(core);
> -
> -    coreaudio_unlock(core, __func__);
>  }
>  
>  static void *coreaudio_audio_init(Audiodev *dev)
> 


