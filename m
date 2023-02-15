Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB926697AA8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFvZ-0007UC-8E; Wed, 15 Feb 2023 06:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSFvW-0007T6-Va
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:26:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSFvU-0003BB-W7
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676460376;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=seKcr7K9oJd2FQq1K3D2B9BeGzTcSuJfJYtms+R6pzI=;
 b=B2ZRosJ0lA4sR7fmMVrDoM22j9cFbyn1+KieGz8/87xKktXtFQVjh54IPHmYsQyK9GU8+a
 eLevcXSxWQj2YUxrs/M3V0BTw2BlwSNn9FRDrKMqHNJTmTjxEIR9MoHaHJqgoC/I7gW5ML
 nq9cDmT4DvSy7+RIeOnWTdQE2i+CNk4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77--w05DEprN2uwHSPu3FOjqg-1; Wed, 15 Feb 2023 06:26:14 -0500
X-MC-Unique: -w05DEprN2uwHSPu3FOjqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 502BB800B23;
 Wed, 15 Feb 2023 11:26:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 284ED40C1423;
 Wed, 15 Feb 2023 11:26:11 +0000 (UTC)
Date: Wed, 15 Feb 2023 11:26:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dorinda Bassey <dbassey@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, armbru@redhat.com,
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Message-ID: <Y+zBUaNdzqawzHPs@redhat.com>
References: <20230215085102.415053-1-dbassey@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215085102.415053-1-dbassey@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 15, 2023 at 09:51:02AM +0100, Dorinda Bassey wrote:
> This commit adds a new audiodev backend to allow QEMU to use Pipewire as both an audio sink and source. This backend is available on most systems.
> 
> Added Pipewire entry points for QEMU Pipewire audio backend
> Added wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()
> qpw_write function returns the current state of the stream to pwaudio and Writes some data to the server for playback streams using pipewire spa_ringbuffer implementation.
> qpw_read function returns the current state of the stream to pwaudio and Reads some data from the server for capture streams using pipewire spa_ringbuffer implementation.
> These functions qpw_write and qpw_read are called during playback and capture.
> Added some functions that convert pw audio formats to QEMU audio format and vice versa which would be needed in the pipewire audio sink and source functions qpw_init_in() & qpw_init_out(). These methods that implement playback and recording will create streams for playback and capture that will start processing and will result in the on_process callbacks to be called.
> Built a connection to the Pipewire sound system server in the qpw_audio_init() method.

Can you ensure the commit message text is line wrapped at approx
72 characters.

> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> new file mode 100644
> index 0000000000..89040ac99e
> --- /dev/null
> +++ b/audio/pwaudio.c
> @@ -0,0 +1,816 @@
> +/*
> + * QEMU Pipewire audio driver
> + *
> + * Copyright (c) 2023, Red Hat Inc, Dorinda Bassey <dbassey@redhat.com>

Just to confirm, you are claiming both copyright ownership for Red Hat
*and* personal copyright ownership ?

I ask because most of the time the employer will have exclusive copyright
ownership for anything created in the course of employment. A few countries
have local law, however, that fineses this allowing employees to retain
copyright, or if you developed stuff outside of work context.

> +
> +#include "qemu/osdep.h"
> +#include "qemu/module.h"
> +#include "audio.h"
> +#include <errno.h>
> +#include <spa/param/audio/format-utils.h>
> +#include <spa/utils/ringbuffer.h>
> +#include <spa/utils/result.h>
> +
> +#include <pipewire/pipewire.h>
> +
> +#define AUDIO_CAP "pipewire"
> +#define RINGBUFFER_SIZE    (1u << 22)
> +#define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> +#define BUFFER_SAMPLES    128
> +
> +#include "audio_int.h"
> +
> +enum {
> +  MODE_SINK,
> +  MODE_SOURCE
> +};

As a style point, QEMU standard is for 4-space indents in
C code.


> diff --git a/meson_options.txt b/meson_options.txt
> index e5f199119e..f42605a8ac 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value : 'NORMAL',
>  option('default_devices', type : 'boolean', value : true,
>         description: 'Include a default selection of devices in emulators')
>  option('audio_drv_list', type: 'array', value: ['default'],
> -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl', 'sndio'],
> +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'pw', 'sdl', 'sndio'],

I appreciate you probably just followed the example of pulseaudio, abbreviated
to 'pa', but I'm not a fan of the existing usage there. So lets be more verbose
and say 'pipewire' so users are clear on what this is.

>         description: 'Set audio driver list')
>  option('block_drv_rw_whitelist', type : 'string', value : '',
>         description: 'set block driver read-write whitelist (by default affects only QEMU, not tools like qemu-img)')
> @@ -253,6 +253,8 @@ option('oss', type: 'feature', value: 'auto',
>         description: 'OSS sound support')
>  option('pa', type: 'feature', value: 'auto',
>         description: 'PulseAudio sound support')
> +option('pw', type: 'feature', value: 'auto',
> +       description: 'Pipewire sound support')
>  option('sndio', type: 'feature', value: 'auto',
>         description: 'sndio sound support')
>  

> diff --git a/qapi/audio.json b/qapi/audio.json
> index 4e54c00f51..6c17d08ab8 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -324,6 +324,48 @@
>      '*out':    'AudiodevPaPerDirectionOptions',
>      '*server': 'str' } }
>  
> +##
> +# @AudiodevPwPerDirectionOptions:
> +#
> +# Options of the Pipewire backend that are used for both playback and
> +# recording.
> +#
> +# @name: name of the sink/source to use
> +#
> +# @stream-name: name of the Pipewire stream created by qemu.  Can be
> +#               used to identify the stream in Pipewire when you
> +#               create multiple Pipewire devices or run multiple qemu
> +#               instances (default: audiodev's id, since 7.1)
> +#
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'AudiodevPwPerDirectionOptions',
> +  'base': 'AudiodevPerDirectionOptions',
> +  'data': {
> +    '*name': 'str',
> +    '*stream-name': 'str' } }

I tend to think we could afford to say "Pipewire" instead
of "Pw" in the data types too. 

> +
> +##
> +# @AudiodevPwOptions:
> +#
> +# Options of the Pipewire audio backend.
> +#
> +# @in: options of the capture stream
> +#
> +# @out: options of the playback stream
> +#
> +# @latency: add latency to playback in microseconds
> +#           (default 44100)
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'AudiodevPwOptions',
> +  'data': {
> +    '*in':     'AudiodevPwPerDirectionOptions',
> +    '*out':    'AudiodevPwPerDirectionOptions',
> +    '*latency': 'uint32' } }
> +
>  ##
>  # @AudiodevSdlPerDirectionOptions:
>  #
> @@ -416,6 +458,7 @@
>              { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
>              { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
>              { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
> +            { 'name': 'pw', 'if': 'CONFIG_AUDIO_PW' },
>              { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
>              { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
>              { 'name': 'spice', 'if': 'CONFIG_SPICE' },
> @@ -456,6 +499,8 @@
>                     'if': 'CONFIG_AUDIO_OSS' },
>      'pa':        { 'type': 'AudiodevPaOptions',
>                     'if': 'CONFIG_AUDIO_PA' },
> +    'pw':        { 'type': 'AudiodevPwOptions',
> +                   'if': 'CONFIG_AUDIO_PW' },
>      'sdl':       { 'type': 'AudiodevSdlOptions',
>                     'if': 'CONFIG_AUDIO_SDL' },
>      'sndio':     { 'type': 'AudiodevSndioOptions',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 88e93c6103..4fc73af804 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -779,6 +779,11 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>      "                in|out.name= source/sink device name\n"
>      "                in|out.latency= desired latency in microseconds\n"
>  #endif
> +#ifdef CONFIG_AUDIO_PW
> +    "-audiodev pw,id=id[,prop[=value][,...]]\n"
> +    "                in|out.name= source/sink device name\n"
> +    "                latency= desired latency in microseconds\n"
> +#endif

Again, lets call the driver  'pipewire' rather than just 'pw'

>  #ifdef CONFIG_AUDIO_SDL
>      "-audiodev sdl,id=id[,prop[=value][,...]]\n"
>      "                in|out.buffer-count= number of buffers\n"
> @@ -942,6 +947,18 @@ SRST
>          Desired latency in microseconds. The PulseAudio server will try
>          to honor this value but actual latencies may be lower or higher.
>  
> +``-audiodev pw,id=id[,prop[=value][,...]]``
> +    Creates a backend using Pipewire. This backend is available on
> +    most systems.
> +
> +    Pipewire specific options are:
> +
> +    ``latency=latency``
> +        Add extra latency to playback in microseconds
> +
> +    ``in|out.name=sink``
> +        Use the specified source/sink for recording/playback.
> +
>  ``-audiodev sdl,id=id[,prop[=value][,...]]``
>      Creates a backend using SDL. This backend is available on most
>      systems, but you should use your platform's native backend if

I'll leave actual review of the backend functionality to someone
else who is familiar with the audio subsystem.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


