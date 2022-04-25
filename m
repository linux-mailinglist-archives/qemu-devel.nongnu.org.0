Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5877D50E320
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:29:37 +0200 (CEST)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nizia-0008B8-Eu
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizWt-0004KD-Iy
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:17:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nizWq-0003KJ-NY
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650896248;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=h1jN7tQTX66MqOuSbtIARZz8ISAj/7nFeyFOR/hkA1Q=;
 b=grAYIUIhNL4YCx7LYwl5FDgp8+LjvUZsurvKopPg6WtHEUsogcGfYLeK5hPVjlYKEMj5ln
 non8dLohK85GAY8TQp3ZIut8/JSwrKZ9zrYAEn9Z0ccaVjbSDMZmFg51jwA2ZPGpO5Lwvz
 HXTTB1K60iPEgF3Vx0jXT1yHTEVUdSA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-j5IorJ0jP9enJvmCEmLn2Q-1; Mon, 25 Apr 2022 10:17:25 -0400
X-MC-Unique: j5IorJ0jP9enJvmCEmLn2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDDF485A5BC;
 Mon, 25 Apr 2022 14:17:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7741121315;
 Mon, 25 Apr 2022 14:16:29 +0000 (UTC)
Date: Mon, 25 Apr 2022 15:16:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>
Subject: Re: [PATCH 15/18] audio: Be more strict during audio backend
 initialisation
Message-ID: <YmatOzD3H4FO4FGZ@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
 <e9c251a6b45d01d4b1d59ce4c6295172f354b301.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9c251a6b45d01d4b1d59ce4c6295172f354b301.1650874791.git.mkletzan@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 25, 2022 at 10:21:58AM +0200, Martin Kletzander wrote:
> Now that audiodev= is required and audio_init() will not be called
> without and AudioDev we can remove the fallback functionality and error
> out in case audio drivers fail initialisation or when the driver does
> not exist.
> 
> Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ---
>  audio/audio.c                   | 146 ++++++--------------------------
>  docs/about/deprecated.rst       |   8 --
>  docs/about/removed-features.rst |   8 ++
>  3 files changed, 34 insertions(+), 128 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 97eb645764c1..c944cf817cf9 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -87,6 +87,8 @@ audio_driver *audio_driver_lookup(const char *name)
>          }
>      }
>  
> +    error_setg(&error_fatal, "Unknown audio driver `%s'", name);
> +    /* Avoid compiler complaining that we do not return in non-void function */
>      return NULL;
>  }

I'd be inclined to plumb in 'Error **errp' here and in the next two
callers up, and pass &error_fatal from softmmu/vl.c

>  
> @@ -104,8 +106,6 @@ const struct mixeng_volume nominal_volume = {
>  #endif
>  };
>  
> -static bool legacy_config = true;
> -
>  int audio_bug (const char *funcname, int cond)
>  {
>      if (cond) {
> @@ -1532,31 +1532,27 @@ size_t audio_generic_read(HWVoiceIn *hw, void *buf, size_t size)
>      return total;
>  }
>  
> -static int audio_driver_init(AudioState *s, struct audio_driver *drv,
> -                             bool msg, Audiodev *dev)
> +static void audio_driver_init(AudioState *s, struct audio_driver *drv,
> +                              Audiodev *dev)
>  {
>      s->drv_opaque = drv->init(dev);
>  
> -    if (s->drv_opaque) {
> -        if (!drv->pcm_ops->get_buffer_in) {
> -            drv->pcm_ops->get_buffer_in = audio_generic_get_buffer_in;
> -            drv->pcm_ops->put_buffer_in = audio_generic_put_buffer_in;
> -        }
> -        if (!drv->pcm_ops->get_buffer_out) {
> -            drv->pcm_ops->get_buffer_out = audio_generic_get_buffer_out;
> -            drv->pcm_ops->put_buffer_out = audio_generic_put_buffer_out;
> -        }
> +    if (!s->drv_opaque) {
> +        error_setg(&error_fatal, "Could not init `%s' audio driver", drv->name);
> +    }
>  
> -        audio_init_nb_voices_out(s, drv);
> -        audio_init_nb_voices_in(s, drv);
> -        s->drv = drv;
> -        return 0;
> -    } else {
> -        if (msg) {
> -            dolog("Could not init `%s' audio driver\n", drv->name);
> -        }
> -        return -1;
> +    if (!drv->pcm_ops->get_buffer_in) {
> +        drv->pcm_ops->get_buffer_in = audio_generic_get_buffer_in;
> +        drv->pcm_ops->put_buffer_in = audio_generic_put_buffer_in;
>      }
> +    if (!drv->pcm_ops->get_buffer_out) {
> +        drv->pcm_ops->get_buffer_out = audio_generic_get_buffer_out;
> +        drv->pcm_ops->put_buffer_out = audio_generic_put_buffer_out;
> +    }
> +
> +    audio_init_nb_voices_out(s, drv);
> +    audio_init_nb_voices_in(s, drv);
> +    s->drv = drv;
>  }
>  
>  static void audio_vm_change_state_handler (void *opaque, bool running,
> @@ -1661,79 +1657,19 @@ static const VMStateDescription vmstate_audio = {
>  
>  static void audio_validate_opts(Audiodev *dev, Error **errp);
>  
> -static AudiodevListEntry *audiodev_find(
> -    AudiodevListHead *head, const char *drvname)
> -{
> -    AudiodevListEntry *e;
> -    QSIMPLEQ_FOREACH(e, head, next) {
> -        if (strcmp(AudiodevDriver_str(e->dev->driver), drvname) == 0) {
> -            return e;
> -        }
> -    }
> -
> -    return NULL;
> -}
> -
> -/*
> - * if we have dev, this function was called because of an -audiodev argument =>
> - *   initialize a new state with it
> - * if dev == NULL => legacy implicit initialization, return the already created
> - *   state or create a new one
> - */
> -static AudioState *audio_init(Audiodev *dev, const char *name)
> +static AudioState *audio_init(Audiodev *dev)
>  {
>      static bool atexit_registered;
> -    size_t i;
> -    int done = 0;
>      const char *drvname = NULL;
>      VMChangeStateEntry *e;
>      AudioState *s;
> -    struct audio_driver *driver;
> -    /* silence gcc warning about uninitialized variable */
> -    AudiodevListHead head = QSIMPLEQ_HEAD_INITIALIZER(head);
> -
> -    if (using_spice) {
> -        /*
> -         * When using spice allow the spice audio driver being picked
> -         * as default.
> -         *
> -         * Temporary hack.  Using audio devices without explicit
> -         * audiodev= property is already deprecated.  Same goes for
> -         * the -soundhw switch.  Once this support gets finally
> -         * removed we can also drop the concept of a default audio
> -         * backend and this can go away.
> -         */
> -        driver = audio_driver_lookup("spice");
> -        if (driver) {
> -            driver->can_be_default = 1;
> -        }
> -    }
>  
> -    if (dev) {
> -        /* -audiodev option */
> -        legacy_config = false;
> -        drvname = AudiodevDriver_str(dev->driver);
> -    } else if (!QTAILQ_EMPTY(&audio_states)) {
> -        if (!legacy_config) {
> -            dolog("Device %s: audiodev default parameter is deprecated, please "
> -                  "specify audiodev=%s\n", name,
> -                  QTAILQ_FIRST(&audio_states)->dev->id);
> -        }
> -        return QTAILQ_FIRST(&audio_states);
> -    } else {
> -        /* legacy implicit initialization */
> -        head = audio_handle_legacy_opts();
> -        /*
> -         * In case of legacy initialization, all Audiodevs in the list will have
> -         * the same configuration (except the driver), so it doesn't matter which
> -         * one we chose.  We need an Audiodev to set up AudioState before we can
> -         * init a driver.  Also note that dev at this point is still in the
> -         * list.
> -         */
> -        dev = QSIMPLEQ_FIRST(&head)->dev;
> -        audio_validate_opts(dev, &error_abort);
> +    if (!dev) {
> +        error_setg(&error_abort, "Mandatory audiodev parameter required");
>      }
>  
> +    drvname = AudiodevDriver_str(dev->driver);
> +
>      s = g_new0(AudioState, 1);
>      s->dev = dev;
>  
> @@ -1763,37 +1699,7 @@ static AudioState *audio_init(Audiodev *dev, const char *name)
>          s->nb_hw_voices_in = 0;
>      }
>  
> -    if (drvname) {
> -        driver = audio_driver_lookup(drvname);
> -        if (driver) {
> -            done = !audio_driver_init(s, driver, true, dev);
> -        } else {
> -            dolog ("Unknown audio driver `%s'\n", drvname);
> -        }
> -    } else {
> -        for (i = 0; audio_prio_list[i]; i++) {
> -            AudiodevListEntry *e = audiodev_find(&head, audio_prio_list[i]);
> -            driver = audio_driver_lookup(audio_prio_list[i]);
> -
> -            if (e && driver) {
> -                s->dev = dev = e->dev;
> -                audio_validate_opts(dev, &error_abort);
> -                done = !audio_driver_init(s, driver, false, dev);
> -                if (done) {
> -                    e->dev = NULL;
> -                    break;
> -                }
> -            }
> -        }
> -    }
> -    audio_free_audiodev_list(&head);
> -
> -    if (!done) {
> -        driver = audio_driver_lookup("none");
> -        done = !audio_driver_init(s, driver, false, dev);
> -        assert(done);
> -        dolog("warning: Using timer based audio emulation\n");
> -    }
> +    audio_driver_init(s, audio_driver_lookup(drvname), dev);
>  
>      if (dev->timer_period <= 0) {
>          s->period_ticks = 1;
> @@ -2120,7 +2026,7 @@ void audio_init_audiodevs(void)
>      AudiodevListEntry *e;
>  
>      QSIMPLEQ_FOREACH(e, &audiodevs, next) {
> -        audio_init(e->dev, NULL);
> +        audio_init(e->dev);
>      }
>  }
>  
> @@ -2133,7 +2039,7 @@ static void audio_init_dummy(const char *id)
>      dev->id = g_strdup(id);
>  
>      audio_validate_opts(dev, &error_abort);
> -    audio_init(dev, NULL);
> +    audio_init(dev);
>  
>      e->dev = dev;
>      QSIMPLEQ_INSERT_TAIL(&audiodevs, e, next);
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 7ba71ebd3435..b2255319e347 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -31,14 +31,6 @@ backend settings instead of environment variables.  To ease migration to
>  the new format, the ``-audiodev-help`` option can be used to convert
>  the current values of the environment variables to ``-audiodev`` options.
>  
> -Creating sound card devices and vnc without ``audiodev=`` property (since 4.2)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -When not using the deprecated legacy audio config, each sound card
> -should specify an ``audiodev=`` property.  Additionally, when using
> -vnc, you should specify an ``audiodev=`` property if you plan to
> -transmit audio through the VNC protocol.
> -
>  ``-chardev`` backend aliases ``tty`` and ``parport`` (since 6.0)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 086ba3edb042..f9eea4dda327 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -346,6 +346,14 @@ needs two devices (``-device intel-hda -device hda-duplex``) and
>  pcspk-audiodev=<name>``.  And ``AC97`` and ``ES1370`` now have to be
>  specified in uppercase.
>  
> +Creating sound card devices and vnc without ``audiodev=`` property (removed in 7.1)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +When not using the deprecated legacy audio config, each sound card
> +should specify an ``audiodev=`` property.  Additionally, when using
> +vnc, you should specify an ``audiodev=`` property if you plan to
> +transmit audio through the VNC protocol.
> +
>  
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> -- 
> 2.35.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


