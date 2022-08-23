Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A07A59EB99
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:56:14 +0200 (CEST)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQZ4P-0001aW-M1
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oQYsL-0003uP-4g
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:43:45 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:37970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oQYsI-0006Bl-WF
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:43:44 -0400
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout07.t-online.de (Postfix) with SMTP id BAB9874C;
 Tue, 23 Aug 2022 20:43:37 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.233.154]) by fwd80.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oQYs9-1n4vsv0; Tue, 23 Aug 2022 20:43:33 +0200
Message-ID: <3b739f0d-69aa-5588-b603-8145406902cf@t-online.de>
Date: Tue, 23 Aug 2022 20:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] audio: exit(1) if audio backend failed to be found or
 initialized
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220822131021.975656-1-marcandre.lureau@redhat.com>
Content-Language: en-US
In-Reply-To: <20220822131021.975656-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1661280213-0144C2AD-C27947C6/0/0 CLEAN NORMAL
X-TOI-MSGID: 8af3152b-467f-4e33-a1fe-619edcef81fb
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Marc-André Lureau<marcandre.lureau@redhat.com>
>
> If you specify a known backend but it isn't compiled in, or failed to
> initialize, you get a simple warning and the "none" backend as a
> fallback, and QEMU runs happily:
>
> $ qemu-system-x86_64 -audiodev id=audio,driver=dsound
> audio: Unknown audio driver `dsound'
> audio: warning: Using timer based audio emulation
> ...
>
> Instead, QEMU should fail to start:
> $ qemu-system-x86_64 -audiodev id=audio,driver=dsound
> audio: Unknown audio driver `dsound'
> $
>
> Resolves:
> https://bugzilla.redhat.com/show_bug.cgi?id=1983493
>
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   audio/audio.h |  2 +-
>   audio/audio.c | 14 +++++++++++---
>   softmmu/vl.c  |  4 +++-
>   3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/audio/audio.h b/audio/audio.h
> index b5e17cd218..27e67079a0 100644
> --- a/audio/audio.h
> +++ b/audio/audio.h
> @@ -170,7 +170,7 @@ void audio_sample_from_uint64(void *samples, int pos,
>   
>   void audio_define(Audiodev *audio);
>   void audio_parse_option(const char *opt);
> -void audio_init_audiodevs(void);
> +bool audio_init_audiodevs(void);
>   void audio_legacy_help(void);
>   
>   AudioState *audio_state_by_name(const char *name);
> diff --git a/audio/audio.c b/audio/audio.c
> index a02f3ce5c6..76b8735b44 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1743,7 +1743,6 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
>           atexit(audio_cleanup);
>           atexit_registered = true;
>       }
> -    QTAILQ_INSERT_TAIL(&audio_states, s, list);
>   
>       s->ts = timer_new_ns(QEMU_CLOCK_VIRTUAL, audio_timer, s);
>   
> @@ -1769,6 +1768,10 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
>           } else {
>               dolog ("Unknown audio driver `%s'\n", drvname);
>           }
> +        if (!done) {
> +            free_audio_state(s);
> +            return NULL;

Hi Marc-André,

I don't understand why you move the QTAILQ_INSERT_TAIL(&audio_states, s, 
list) macro down. Without this you don't need the additional 
free_audio_state() call. audio_cleanup() takes care to free the audio state.

The rest looks good. You can add my

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

even if you insist on keeping the patch as it is.

With best regards,
Volker

> +        }
>       } else {
>           for (i = 0; audio_prio_list[i]; i++) {
>               AudiodevListEntry *e = audiodev_find(&head, audio_prio_list[i]);
> @@ -1806,6 +1809,7 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
>                  "(Audio can continue looping even after stopping the VM)\n");
>       }
>   
> +    QTAILQ_INSERT_TAIL(&audio_states, s, list);
>       QLIST_INIT (&s->card_head);
>       vmstate_register (NULL, 0, &vmstate_audio, s);
>       return s;
> @@ -2119,13 +2123,17 @@ void audio_define(Audiodev *dev)
>       QSIMPLEQ_INSERT_TAIL(&audiodevs, e, next);
>   }
>   
> -void audio_init_audiodevs(void)
> +bool audio_init_audiodevs(void)
>   {
>       AudiodevListEntry *e;
>   
>       QSIMPLEQ_FOREACH(e, &audiodevs, next) {
> -        audio_init(e->dev, NULL);
> +        if (!audio_init(e->dev, NULL)) {
> +            return false;
> +        }
>       }
> +
> +    return true;
>   }
>   
>   audsettings audiodev_to_audsettings(AudiodevPerDirectionOptions *pdo)
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 706bd7cff7..dea4005e47 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1885,7 +1885,9 @@ static void qemu_create_early_backends(void)
>        * setting machine properties, so they can be referred to.
>        */
>       configure_blockdev(&bdo_queue, machine_class, snapshot);
> -    audio_init_audiodevs();
> +    if (!audio_init_audiodevs()) {
> +        exit(1);
> +    }
>   }
>   
>   


