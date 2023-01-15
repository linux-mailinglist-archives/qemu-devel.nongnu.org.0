Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F566B15E
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 15:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH3bs-0008HZ-PP; Sun, 15 Jan 2023 09:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pH3bq-0008H2-8c
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 09:03:42 -0500
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pH3bk-0006M2-Eb
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 09:03:38 -0500
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout08.t-online.de (Postfix) with SMTP id 13BCC64F6;
 Sun, 15 Jan 2023 15:03:34 +0100 (CET)
Received: from [192.168.211.200] ([79.208.25.151]) by fwd82.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pH3bd-0418JF0; Sun, 15 Jan 2023 15:03:30 +0100
Message-ID: <26c2ac70-7c88-f486-adc8-1836efd4bc63@t-online.de>
Date: Sun, 15 Jan 2023 15:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/9] audio: remove special audio_calloc function
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, libvir-list@redhat.com,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230113162200.3010804-1-berrange@redhat.com>
 <20230113162200.3010804-3-berrange@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230113162200.3010804-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-MSGID: ed799c58-bac6-4eff-bb47-32cfaca08ed2
Received-SPF: none client-ip=194.25.134.20; envelope-from=vr_qemu@t-online.de;
 helo=mailout08.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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

Am 13.01.23 um 17:21 schrieb Daniel P. Berrangé:
> The audio_calloc function does various checks on the size and
> nmembers parameters to detect various error conditions. There
> are only 5 callers
>
>   * alsa_poll_helper: the pollfd count is small and bounded,
>   * audio_pcm_create_voice_pair_: allocating a single fixed
>     size struct
>   * audio_pcm_sw_alloc_resources_: samples could be negative
>     zero, or overflow, so needs a check
>   * audio_pcm_hw_add_new_: voice size could be zero for
>     backends that don't support audio input
>   * st_rate_start: allocating a single fixed size struct
>
> IOW, only two of the callers need special error checks and
> it is clearer if their respective checks are inlined. Thus
> audio_calloc can be eliminated.

Hi Daniel,

my patch series at 
https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg02895.html 
also removes audio_calloc(). There will be merge conflicts.

With best regards,
Volker

>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   audio/alsaaudio.c            |  6 +-----
>   audio/audio.c                | 20 --------------------
>   audio/audio_int.h            |  1 -
>   audio/audio_template.h       | 28 ++++++++++++++--------------
>   audio/mixeng.c               |  7 +------
>   tests/qtest/fuzz-sb16-test.c |  6 ++++--
>   6 files changed, 20 insertions(+), 48 deletions(-)
>
> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
> index 714bfb6453..5f50dfa0bf 100644
> --- a/audio/alsaaudio.c
> +++ b/audio/alsaaudio.c
> @@ -222,11 +222,7 @@ static int alsa_poll_helper (snd_pcm_t *handle, struct pollhlp *hlp, int mask)
>           return -1;
>       }
>   
> -    pfds = audio_calloc ("alsa_poll_helper", count, sizeof (*pfds));
> -    if (!pfds) {
> -        dolog ("Could not initialize poll mode\n");
> -        return -1;
> -    }
> +    pfds = g_new0(struct pollfd, count);
>   
>       err = snd_pcm_poll_descriptors (handle, pfds, count);
>       if (err < 0) {
> diff --git a/audio/audio.c b/audio/audio.c
> index 7b4b957945..f397072a1f 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -146,26 +146,6 @@ static inline int audio_bits_to_index (int bits)
>       }
>   }
>   
> -void *audio_calloc (const char *funcname, int nmemb, size_t size)
> -{
> -    int cond;
> -    size_t len;
> -
> -    len = nmemb * size;
> -    cond = !nmemb || !size;
> -    cond |= nmemb < 0;
> -    cond |= len < size;
> -
> -    if (audio_bug ("audio_calloc", cond)) {
> -        AUD_log (NULL, "%s passed invalid arguments to audio_calloc\n",
> -                 funcname);
> -        AUD_log (NULL, "nmemb=%d size=%zu (len=%zu)\n", nmemb, size, len);
> -        return NULL;
> -    }
> -
> -    return g_malloc0 (len);
> -}
> -
>   void AUD_vlog (const char *cap, const char *fmt, va_list ap)
>   {
>       if (cap) {
> diff --git a/audio/audio_int.h b/audio/audio_int.h
> index e87ce014a0..b0cc2cd390 100644
> --- a/audio/audio_int.h
> +++ b/audio/audio_int.h
> @@ -251,7 +251,6 @@ void audio_pcm_init_info (struct audio_pcm_info *info, struct audsettings *as);
>   void audio_pcm_info_clear_buf (struct audio_pcm_info *info, void *buf, int len);
>   
>   int audio_bug (const char *funcname, int cond);
> -void *audio_calloc (const char *funcname, int nmemb, size_t size);
>   
>   void audio_run(AudioState *s, const char *msg);
>   
> diff --git a/audio/audio_template.h b/audio/audio_template.h
> index 720a32e57e..564cbb1f01 100644
> --- a/audio/audio_template.h
> +++ b/audio/audio_template.h
> @@ -116,13 +116,20 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
>       samples = (int64_t)sw->HWBUF->size * sw->ratio >> 32;
>   #endif
>   
> -    sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
> -    if (!sw->buf) {
> -        dolog ("Could not allocate buffer for `%s' (%d samples)\n",
> +    if (audio_bug(__func__, samples <= 0)) {
> +        dolog ("Could not allocate buffer for '%s', samples %d <= 0\n",
>                  SW_NAME (sw), samples);
>           return -1;
>       }
>   
> +    if (audio_bug(__func__, (SIZE_MAX / sizeof(struct st_sample) < samples))) {
> +        dolog ("Could not allocate buffer for '%s', samples %d overflows\n",
> +               SW_NAME (sw), samples);
> +        return -1;
> +    }
> +
> +    sw->buf = g_new0(struct st_sample, samples);
> +
>   #ifdef DAC
>       sw->rate = st_rate_start (sw->info.freq, sw->hw->info.freq);
>   #else
> @@ -264,13 +271,12 @@ static HW *glue(audio_pcm_hw_add_new_, TYPE)(AudioState *s,
>           return NULL;
>       }
>   
> -    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
> -    if (!hw) {
> -        dolog ("Can not allocate voice `%s' size %d\n",
> -               drv->name, glue (drv->voice_size_, TYPE));
> +    if (audio_bug(__func__, glue(drv->voice_size_, TYPE) == 0)) {
> +        dolog ("Voice size is zero");
>           return NULL;
>       }
>   
> +    hw = g_malloc0(glue(drv->voice_size_, TYPE));
>       hw->s = s;
>       hw->pcm_ops = drv->pcm_ops;
>   
> @@ -398,12 +404,7 @@ static SW *glue(audio_pcm_create_voice_pair_, TYPE)(
>           hw_as = *as;
>       }
>   
> -    sw = audio_calloc(__func__, 1, sizeof(*sw));
> -    if (!sw) {
> -        dolog ("Could not allocate soft voice `%s' (%zu bytes)\n",
> -               sw_name ? sw_name : "unknown", sizeof (*sw));
> -        goto err1;
> -    }
> +    sw = g_new0(SW, 1);
>       sw->s = s;
>   
>       hw = glue(audio_pcm_hw_add_, TYPE)(s, &hw_as);
> @@ -424,7 +425,6 @@ err3:
>       glue (audio_pcm_hw_gc_, TYPE) (&hw);
>   err2:
>       g_free (sw);
> -err1:
>       return NULL;
>   }
>   
> diff --git a/audio/mixeng.c b/audio/mixeng.c
> index 100a306d6f..fe454e0725 100644
> --- a/audio/mixeng.c
> +++ b/audio/mixeng.c
> @@ -414,12 +414,7 @@ struct rate {
>    */
>   void *st_rate_start (int inrate, int outrate)
>   {
> -    struct rate *rate = audio_calloc(__func__, 1, sizeof(*rate));
> -
> -    if (!rate) {
> -        dolog ("Could not allocate resampler (%zu bytes)\n", sizeof (*rate));
> -        return NULL;
> -    }
> +    struct rate *rate = g_new0(struct rate, 1);
>   
>       rate->opos = 0;
>   
> diff --git a/tests/qtest/fuzz-sb16-test.c b/tests/qtest/fuzz-sb16-test.c
> index fc445b1871..a28b93be3a 100644
> --- a/tests/qtest/fuzz-sb16-test.c
> +++ b/tests/qtest/fuzz-sb16-test.c
> @@ -10,7 +10,8 @@
>   #include "libqtest.h"
>   
>   /*
> - * This used to trigger the assert in audio_calloc
> + * This used to trigger the audio_bug calls in
> + * audio_pcm_sw_alloc_resources
>    * https://bugs.launchpad.net/qemu/+bug/1910603
>    */
>   static void test_fuzz_sb16_0x1c(void)
> @@ -38,7 +39,8 @@ static void test_fuzz_sb16_0x91(void)
>   }
>   
>   /*
> - * This used to trigger the assert in audio_calloc
> + * This used to trigger the audio_bug calls in
> + * audio_pcm_sw_alloc_resources
>    * through command 0xd4
>    */
>   static void test_fuzz_sb16_0xd4(void)


