Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF00B697CF1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:16:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHcI-0002kA-KP; Wed, 15 Feb 2023 08:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pSHcG-0002jg-9N
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:14:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbassey@redhat.com>)
 id 1pSHcD-0002q4-8n
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676466867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ErJSS74HGQViiOGBwFgtYPaWI53nubVkT829jFdH2YI=;
 b=Znu3u4MYz9XipiEk0XWQ6nLNiaNM3qDVGKDR57zx7/PIxKguhj28la8PpQDV/l1nSOp7WE
 tUCYnXeatK0twhQTXHVO06GYfbIfF84ySajT2wFHk/LUZic8Ebovz+OUxYJhsvvd2S7UND
 /PPDYiN8vneaNOaTUBaLp3fe11GZSJ4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-tBWRfO80PvK2yMJw7dAzVA-1; Wed, 15 Feb 2023 08:14:26 -0500
X-MC-Unique: tBWRfO80PvK2yMJw7dAzVA-1
Received: by mail-qk1-f198.google.com with SMTP id
 bp30-20020a05620a459e00b00738e1fe2470so11484477qkb.23
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErJSS74HGQViiOGBwFgtYPaWI53nubVkT829jFdH2YI=;
 b=bbEl0qxFHMavpTAZ22VZ7gofuadv0O9vjqa4oh7xHPRRmVjHTmnykQ+ch1HDHmSVlk
 LvYa5GhhK6FChCfFEApXAdJUW090BTcTZs10WT6rHO1Njyo+lxISPWx1q0O2gb0rjoHj
 37SSLoiIT5L65m5gj1AsLzW6w2Yw64qS2smbOdt2/P4V8jWWAXs1NtzKLHQClWDjnfiW
 oHZwcvqCuwNsm5lOwmwy8AVG/g+G3ov5M4QSC3uu5ydilDBEUzo41QVo6FSoM4FDiBdm
 GWhYT2it7yRVCPpL1UBGRcd1RQp4KsAEwJo7pxt6H3cjBcvw1R3AWQ2dNvwLdmbwA14s
 7ylg==
X-Gm-Message-State: AO0yUKVwnDK89k6fql6NGvd62LMSK5Xi0QvLp2RyCYJx+ba5VOrTg8qg
 enxV+bV0eiCkDlvyB0VFAt6e8CqqbCfp2znFZUmOBlXAQ04uWRU/5BIjqJOsV+nxJ+txVCUO/+C
 w3ZIH39fGEEaWPAgPTcemudusGwzJer4=
X-Received: by 2002:a05:620a:1208:b0:71f:b908:7b81 with SMTP id
 u8-20020a05620a120800b0071fb9087b81mr98928qkj.13.1676466865893; 
 Wed, 15 Feb 2023 05:14:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+p939sksHU+cDJavHz7PDCkwHtT/JRa1BQurLUPvTv8VFGPtDuapofYqPPH65TYJ13NELlybJf2YM4CHehN2w=
X-Received: by 2002:a05:620a:1208:b0:71f:b908:7b81 with SMTP id
 u8-20020a05620a120800b0071fb9087b81mr98925qkj.13.1676466865636; Wed, 15 Feb
 2023 05:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20230215085102.415053-1-dbassey@redhat.com>
 <Y+zBUaNdzqawzHPs@redhat.com>
In-Reply-To: <Y+zBUaNdzqawzHPs@redhat.com>
From: Dorinda Bassey <dbassey@redhat.com>
Date: Wed, 15 Feb 2023 14:14:14 +0100
Message-ID: <CACzuRyy33uGZiwUsUy6=ZSBea7n=J1qvAYSVuiZGR0cxSdq6Xw@mail.gmail.com>
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, armbru@redhat.com, 
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
Content-Type: multipart/alternative; boundary="00000000000001202a05f4bcdc7f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dbassey@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

--00000000000001202a05f4bcdc7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Can you ensure the commit message text is line wrapped at approx
> 72 characters.
>
Noted, Thanks.

Just to confirm, you are claiming both copyright ownership for Red Hat
> *and* personal copyright ownership ?
>
 I just made some enquiry and given that this was developed inside of work
context I would use copyright ownership for Red Hat and author: Dorinda
Bassey

As a style point, QEMU standard is for 4-space indents in
> C code.
>
noted

I appreciate you probably just followed the example of pulseaudio,
> abbreviated
> to 'pa', but I'm not a fan of the existing usage there. So lets be more
> verbose
> and say 'pipewire' so users are clear on what this is.
>
I agree, although pipewire seems to be lengthy but I don't mind using it.

Regards,
Dorinda.



On Wed, Feb 15, 2023 at 12:26 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> On Wed, Feb 15, 2023 at 09:51:02AM +0100, Dorinda Bassey wrote:
> > This commit adds a new audiodev backend to allow QEMU to use Pipewire a=
s
> both an audio sink and source. This backend is available on most systems.
> >
> > Added Pipewire entry points for QEMU Pipewire audio backend
> > Added wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()
> > qpw_write function returns the current state of the stream to pwaudio
> and Writes some data to the server for playback streams using pipewire
> spa_ringbuffer implementation.
> > qpw_read function returns the current state of the stream to pwaudio an=
d
> Reads some data from the server for capture streams using pipewire
> spa_ringbuffer implementation.
> > These functions qpw_write and qpw_read are called during playback and
> capture.
> > Added some functions that convert pw audio formats to QEMU audio format
> and vice versa which would be needed in the pipewire audio sink and sourc=
e
> functions qpw_init_in() & qpw_init_out(). These methods that implement
> playback and recording will create streams for playback and capture that
> will start processing and will result in the on_process callbacks to be
> called.
> > Built a connection to the Pipewire sound system server in the
> qpw_audio_init() method.
>
> Can you ensure the commit message text is line wrapped at approx
> 72 characters.
>
> > diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> > new file mode 100644
> > index 0000000000..89040ac99e
> > --- /dev/null
> > +++ b/audio/pwaudio.c
> > @@ -0,0 +1,816 @@
> > +/*
> > + * QEMU Pipewire audio driver
> > + *
> > + * Copyright (c) 2023, Red Hat Inc, Dorinda Bassey <dbassey@redhat.com=
>
>
> Just to confirm, you are claiming both copyright ownership for Red Hat
> *and* personal copyright ownership ?
>
> I ask because most of the time the employer will have exclusive copyright
> ownership for anything created in the course of employment. A few countri=
es
> have local law, however, that fineses this allowing employees to retain
> copyright, or if you developed stuff outside of work context.
>
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/module.h"
> > +#include "audio.h"
> > +#include <errno.h>
> > +#include <spa/param/audio/format-utils.h>
> > +#include <spa/utils/ringbuffer.h>
> > +#include <spa/utils/result.h>
> > +
> > +#include <pipewire/pipewire.h>
> > +
> > +#define AUDIO_CAP "pipewire"
> > +#define RINGBUFFER_SIZE    (1u << 22)
> > +#define RINGBUFFER_MASK    (RINGBUFFER_SIZE - 1)
> > +#define BUFFER_SAMPLES    128
> > +
> > +#include "audio_int.h"
> > +
> > +enum {
> > +  MODE_SINK,
> > +  MODE_SOURCE
> > +};
>
> As a style point, QEMU standard is for 4-space indents in
> C code.
>
>
> > diff --git a/meson_options.txt b/meson_options.txt
> > index e5f199119e..f42605a8ac 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -21,7 +21,7 @@ option('tls_priority', type : 'string', value :
> 'NORMAL',
> >  option('default_devices', type : 'boolean', value : true,
> >         description: 'Include a default selection of devices in
> emulators')
> >  option('audio_drv_list', type: 'array', value: ['default'],
> > -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack',
> 'oss', 'pa', 'sdl', 'sndio'],
> > +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack',
> 'oss', 'pa', 'pw', 'sdl', 'sndio'],
>
> I appreciate you probably just followed the example of pulseaudio,
> abbreviated
> to 'pa', but I'm not a fan of the existing usage there. So lets be more
> verbose
> and say 'pipewire' so users are clear on what this is.
>
> >         description: 'Set audio driver list')
> >  option('block_drv_rw_whitelist', type : 'string', value : '',
> >         description: 'set block driver read-write whitelist (by default
> affects only QEMU, not tools like qemu-img)')
> > @@ -253,6 +253,8 @@ option('oss', type: 'feature', value: 'auto',
> >         description: 'OSS sound support')
> >  option('pa', type: 'feature', value: 'auto',
> >         description: 'PulseAudio sound support')
> > +option('pw', type: 'feature', value: 'auto',
> > +       description: 'Pipewire sound support')
> >  option('sndio', type: 'feature', value: 'auto',
> >         description: 'sndio sound support')
> >
>
> > diff --git a/qapi/audio.json b/qapi/audio.json
> > index 4e54c00f51..6c17d08ab8 100644
> > --- a/qapi/audio.json
> > +++ b/qapi/audio.json
> > @@ -324,6 +324,48 @@
> >      '*out':    'AudiodevPaPerDirectionOptions',
> >      '*server': 'str' } }
> >
> > +##
> > +# @AudiodevPwPerDirectionOptions:
> > +#
> > +# Options of the Pipewire backend that are used for both playback and
> > +# recording.
> > +#
> > +# @name: name of the sink/source to use
> > +#
> > +# @stream-name: name of the Pipewire stream created by qemu.  Can be
> > +#               used to identify the stream in Pipewire when you
> > +#               create multiple Pipewire devices or run multiple qemu
> > +#               instances (default: audiodev's id, since 7.1)
> > +#
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'AudiodevPwPerDirectionOptions',
> > +  'base': 'AudiodevPerDirectionOptions',
> > +  'data': {
> > +    '*name': 'str',
> > +    '*stream-name': 'str' } }
>
> I tend to think we could afford to say "Pipewire" instead
> of "Pw" in the data types too.
>
> > +
> > +##
> > +# @AudiodevPwOptions:
> > +#
> > +# Options of the Pipewire audio backend.
> > +#
> > +# @in: options of the capture stream
> > +#
> > +# @out: options of the playback stream
> > +#
> > +# @latency: add latency to playback in microseconds
> > +#           (default 44100)
> > +#
> > +# Since: 7.2
> > +##
> > +{ 'struct': 'AudiodevPwOptions',
> > +  'data': {
> > +    '*in':     'AudiodevPwPerDirectionOptions',
> > +    '*out':    'AudiodevPwPerDirectionOptions',
> > +    '*latency': 'uint32' } }
> > +
> >  ##
> >  # @AudiodevSdlPerDirectionOptions:
> >  #
> > @@ -416,6 +458,7 @@
> >              { 'name': 'jack', 'if': 'CONFIG_AUDIO_JACK' },
> >              { 'name': 'oss', 'if': 'CONFIG_AUDIO_OSS' },
> >              { 'name': 'pa', 'if': 'CONFIG_AUDIO_PA' },
> > +            { 'name': 'pw', 'if': 'CONFIG_AUDIO_PW' },
> >              { 'name': 'sdl', 'if': 'CONFIG_AUDIO_SDL' },
> >              { 'name': 'sndio', 'if': 'CONFIG_AUDIO_SNDIO' },
> >              { 'name': 'spice', 'if': 'CONFIG_SPICE' },
> > @@ -456,6 +499,8 @@
> >                     'if': 'CONFIG_AUDIO_OSS' },
> >      'pa':        { 'type': 'AudiodevPaOptions',
> >                     'if': 'CONFIG_AUDIO_PA' },
> > +    'pw':        { 'type': 'AudiodevPwOptions',
> > +                   'if': 'CONFIG_AUDIO_PW' },
> >      'sdl':       { 'type': 'AudiodevSdlOptions',
> >                     'if': 'CONFIG_AUDIO_SDL' },
> >      'sndio':     { 'type': 'AudiodevSndioOptions',
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 88e93c6103..4fc73af804 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -779,6 +779,11 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
> >      "                in|out.name=3D source/sink device name\n"
> >      "                in|out.latency=3D desired latency in microseconds=
\n"
> >  #endif
> > +#ifdef CONFIG_AUDIO_PW
> > +    "-audiodev pw,id=3Did[,prop[=3Dvalue][,...]]\n"
> > +    "                in|out.name=3D source/sink device name\n"
> > +    "                latency=3D desired latency in microseconds\n"
> > +#endif
>
> Again, lets call the driver  'pipewire' rather than just 'pw'
>
> >  #ifdef CONFIG_AUDIO_SDL
> >      "-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]\n"
> >      "                in|out.buffer-count=3D number of buffers\n"
> > @@ -942,6 +947,18 @@ SRST
> >          Desired latency in microseconds. The PulseAudio server will tr=
y
> >          to honor this value but actual latencies may be lower or highe=
r.
> >
> > +``-audiodev pw,id=3Did[,prop[=3Dvalue][,...]]``
> > +    Creates a backend using Pipewire. This backend is available on
> > +    most systems.
> > +
> > +    Pipewire specific options are:
> > +
> > +    ``latency=3Dlatency``
> > +        Add extra latency to playback in microseconds
> > +
> > +    ``in|out.name=3Dsink``
> > +        Use the specified source/sink for recording/playback.
> > +
> >  ``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``
> >      Creates a backend using SDL. This backend is available on most
> >      systems, but you should use your platform's native backend if
>
> I'll leave actual review of the backend functionality to someone
> else who is familiar with the audio subsystem.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--00000000000001202a05f4bcdc7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Can you =
ensure the commit message text is line wrapped at approx<br>
72 characters.<span></span><br></blockquote><div>Noted, Thanks.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>Just to con=
firm, you are claiming both copyright ownership for Red Hat<br>
*and* personal copyright ownership ?<br>
</div></blockquote><div>=C2=A0I just made some enquiry and given that this =
was developed inside of work context I would use copyright ownership for Re=
d Hat and author: Dorinda Bassey</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div>As a style point, QEMU standard is for 4-s=
pace indents in<br>
C code.<span class=3D"gmail-im"><br></span></div></blockquote><div>noted</d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>I =
appreciate you probably just followed the example of pulseaudio, abbreviate=
d<br>
to &#39;pa&#39;, but I&#39;m not a fan of the existing usage there. So lets=
 be more verbose<br>
and say &#39;pipewire&#39; so users are clear on what this is.</div></block=
quote><div>I agree, although pipewire seems to be lengthy but I don&#39;t m=
ind using it.</div><div><br></div><div>Regards,</div><div>Dorinda.<br></div=
><div><br></div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Feb 15, 2023 at 12:26 PM Daniel P. B=
errang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_blank">b=
errange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, Feb 15, 2023 at 09:51:02AM +0100, Dorinda Bassey =
wrote:<br>
&gt; This commit adds a new audiodev backend to allow QEMU to use Pipewire =
as both an audio sink and source. This backend is available on most systems=
.<br>
&gt; <br>
&gt; Added Pipewire entry points for QEMU Pipewire audio backend<br>
&gt; Added wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()<br>
&gt; qpw_write function returns the current state of the stream to pwaudio =
and Writes some data to the server for playback streams using pipewire spa_=
ringbuffer implementation.<br>
&gt; qpw_read function returns the current state of the stream to pwaudio a=
nd Reads some data from the server for capture streams using pipewire spa_r=
ingbuffer implementation.<br>
&gt; These functions qpw_write and qpw_read are called during playback and =
capture.<br>
&gt; Added some functions that convert pw audio formats to QEMU audio forma=
t and vice versa which would be needed in the pipewire audio sink and sourc=
e functions qpw_init_in() &amp; qpw_init_out(). These methods that implemen=
t playback and recording will create streams for playback and capture that =
will start processing and will result in the on_process callbacks to be cal=
led.<br>
&gt; Built a connection to the Pipewire sound system server in the qpw_audi=
o_init() method.<br>
<br>
Can you ensure the commit message text is line wrapped at approx<br>
72 characters.<br>
<br>
&gt; diff --git a/audio/pwaudio.c b/audio/pwaudio.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..89040ac99e<br>
&gt; --- /dev/null<br>
&gt; +++ b/audio/pwaudio.c<br>
&gt; @@ -0,0 +1,816 @@<br>
&gt; +/*<br>
&gt; + * QEMU Pipewire audio driver<br>
&gt; + *<br>
&gt; + * Copyright (c) 2023, Red Hat Inc, Dorinda Bassey &lt;<a href=3D"mai=
lto:dbassey@redhat.com" target=3D"_blank">dbassey@redhat.com</a>&gt;<br>
<br>
Just to confirm, you are claiming both copyright ownership for Red Hat<br>
*and* personal copyright ownership ?<br>
<br>
I ask because most of the time the employer will have exclusive copyright<b=
r>
ownership for anything created in the course of employment. A few countries=
<br>
have local law, however, that fineses this allowing employees to retain<br>
copyright, or if you developed stuff outside of work context.<br>
<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/module.h&quot;<br>
&gt; +#include &quot;audio.h&quot;<br>
&gt; +#include &lt;errno.h&gt;<br>
&gt; +#include &lt;spa/param/audio/format-utils.h&gt;<br>
&gt; +#include &lt;spa/utils/ringbuffer.h&gt;<br>
&gt; +#include &lt;spa/utils/result.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;pipewire/pipewire.h&gt;<br>
&gt; +<br>
&gt; +#define AUDIO_CAP &quot;pipewire&quot;<br>
&gt; +#define RINGBUFFER_SIZE=C2=A0 =C2=A0 (1u &lt;&lt; 22)<br>
&gt; +#define RINGBUFFER_MASK=C2=A0 =C2=A0 (RINGBUFFER_SIZE - 1)<br>
&gt; +#define BUFFER_SAMPLES=C2=A0 =C2=A0 128<br>
&gt; +<br>
&gt; +#include &quot;audio_int.h&quot;<br>
&gt; +<br>
&gt; +enum {<br>
&gt; +=C2=A0 MODE_SINK,<br>
&gt; +=C2=A0 MODE_SOURCE<br>
&gt; +};<br>
<br>
As a style point, QEMU standard is for 4-space indents in<br>
C code.<br>
<br>
<br>
&gt; diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; index e5f199119e..f42605a8ac 100644<br>
&gt; --- a/meson_options.txt<br>
&gt; +++ b/meson_options.txt<br>
&gt; @@ -21,7 +21,7 @@ option(&#39;tls_priority&#39;, type : &#39;string&#3=
9;, value : &#39;NORMAL&#39;,<br>
&gt;=C2=A0 option(&#39;default_devices&#39;, type : &#39;boolean&#39;, valu=
e : true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Include a default s=
election of devices in emulators&#39;)<br>
&gt;=C2=A0 option(&#39;audio_drv_list&#39;, type: &#39;array&#39;, value: [=
&#39;default&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#=
39;, &#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#=
39;pa&#39;, &#39;sdl&#39;, &#39;sndio&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#=
39;, &#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#=
39;pa&#39;, &#39;pw&#39;, &#39;sdl&#39;, &#39;sndio&#39;],<br>
<br>
I appreciate you probably just followed the example of pulseaudio, abbrevia=
ted<br>
to &#39;pa&#39;, but I&#39;m not a fan of the existing usage there. So lets=
 be more verbose<br>
and say &#39;pipewire&#39; so users are clear on what this is.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Set audio driver li=
st&#39;)<br>
&gt;=C2=A0 option(&#39;block_drv_rw_whitelist&#39;, type : &#39;string&#39;=
, value : &#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;set block driver re=
ad-write whitelist (by default affects only QEMU, not tools like qemu-img)&=
#39;)<br>
&gt; @@ -253,6 +253,8 @@ option(&#39;oss&#39;, type: &#39;feature&#39;, val=
ue: &#39;auto&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;OSS sound support&#=
39;)<br>
&gt;=C2=A0 option(&#39;pa&#39;, type: &#39;feature&#39;, value: &#39;auto&#=
39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;PulseAudio sound su=
pport&#39;)<br>
&gt; +option(&#39;pw&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Pipewire sound support&#=
39;)<br>
&gt;=C2=A0 option(&#39;sndio&#39;, type: &#39;feature&#39;, value: &#39;aut=
o&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;sndio sound support=
&#39;)<br>
&gt;=C2=A0 <br>
<br>
&gt; diff --git a/qapi/audio.json b/qapi/audio.json<br>
&gt; index 4e54c00f51..6c17d08ab8 100644<br>
&gt; --- a/qapi/audio.json<br>
&gt; +++ b/qapi/audio.json<br>
&gt; @@ -324,6 +324,48 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPaPerDir=
ectionOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;*server&#39;: &#39;str&#39; } }<br>
&gt;=C2=A0 <br>
&gt; +##<br>
&gt; +# @AudiodevPwPerDirectionOptions:<br>
&gt; +#<br>
&gt; +# Options of the Pipewire backend that are used for both playback and=
<br>
&gt; +# recording.<br>
&gt; +#<br>
&gt; +# @name: name of the sink/source to use<br>
&gt; +#<br>
&gt; +# @stream-name: name of the Pipewire stream created by qemu.=C2=A0 Ca=
n be<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used to ident=
ify the stream in Pipewire when you<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create multip=
le Pipewire devices or run multiple qemu<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instances (de=
fault: audiodev&#39;s id, since 7.1)<br>
&gt; +#<br>
&gt; +#<br>
&gt; +# Since: 7.2<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;AudiodevPwPerDirectionOptions&#39;,<br>
&gt; +=C2=A0 &#39;base&#39;: &#39;AudiodevPerDirectionOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*name&#39;: &#39;str&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*stream-name&#39;: &#39;str&#39; } }<br>
<br>
I tend to think we could afford to say &quot;Pipewire&quot; instead<br>
of &quot;Pw&quot; in the data types too. <br>
<br>
&gt; +<br>
&gt; +##<br>
&gt; +# @AudiodevPwOptions:<br>
&gt; +#<br>
&gt; +# Options of the Pipewire audio backend.<br>
&gt; +#<br>
&gt; +# @in: options of the capture stream<br>
&gt; +#<br>
&gt; +# @out: options of the playback stream<br>
&gt; +#<br>
&gt; +# @latency: add latency to playback in microseconds<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(default 44100)<br>
&gt; +#<br>
&gt; +# Since: 7.2<br>
&gt; +##<br>
&gt; +{ &#39;struct&#39;: &#39;AudiodevPwOptions&#39;,<br>
&gt; +=C2=A0 &#39;data&#39;: {<br>
&gt; +=C2=A0 =C2=A0 &#39;*in&#39;:=C2=A0 =C2=A0 =C2=A0&#39;AudiodevPwPerDir=
ectionOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*out&#39;:=C2=A0 =C2=A0 &#39;AudiodevPwPerDirectio=
nOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;*latency&#39;: &#39;uint32&#39; } }<br>
&gt; +<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @AudiodevSdlPerDirectionOptions:<br>
&gt;=C2=A0 #<br>
&gt; @@ -416,6 +458,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;jack&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_JACK&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;oss&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_OSS&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;pa&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_PA&#39; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;pw&#=
39;, &#39;if&#39;: &#39;CONFIG_AUDIO_PW&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;sdl&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_SDL&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;sndio&#39;, &#39;if&#39;: &#39;CONFIG_AUDIO_SNDIO&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39=
;spice&#39;, &#39;if&#39;: &#39;CONFIG_SPICE&#39; },<br>
&gt; @@ -456,6 +499,8 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;if&#39;: &#39;CONFIG_AUDIO_OSS&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;pa&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;ty=
pe&#39;: &#39;AudiodevPaOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;if&#39;: &#39;CONFIG_AUDIO_PA&#39; },<br>
&gt; +=C2=A0 =C2=A0 &#39;pw&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;type&#3=
9;: &#39;AudiodevPwOptions&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
&#39;if&#39;: &#39;CONFIG_AUDIO_PW&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;sdl&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;ty=
pe&#39;: &#39;AudiodevSdlOptions&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;if&#39;: &#39;CONFIG_AUDIO_SDL&#39; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &#39;sndio&#39;:=C2=A0 =C2=A0 =C2=A0{ &#39;type&#3=
9;: &#39;AudiodevSndioOptions&#39;,<br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index 88e93c6103..4fc73af804 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; +++ b/qemu-options.hx<br>
&gt; @@ -779,6 +779,11 @@ DEF(&quot;audiodev&quot;, HAS_ARG, QEMU_OPTION_au=
diodev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 in|<a href=3D"http://out.name" rel=3D"noreferrer" target=3D"_=
blank">out.name</a>=3D source/sink device name\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 in|out.latency=3D desired latency in microseconds\n&quot;<br>
&gt;=C2=A0 #endif<br>
&gt; +#ifdef CONFIG_AUDIO_PW<br>
&gt; +=C2=A0 =C2=A0 &quot;-audiodev pw,id=3Did[,prop[=3Dvalue][,...]]\n&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 in|<a href=3D"http://out.name" rel=3D"noreferrer" target=3D"_blank">=
out.name</a>=3D source/sink device name\n&quot;<br>
&gt; +=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 latency=3D desired latency in microseconds\n&quot;<br>
&gt; +#endif<br>
<br>
Again, lets call the driver=C2=A0 &#39;pipewire&#39; rather than just &#39;=
pw&#39;<br>
<br>
&gt;=C2=A0 #ifdef CONFIG_AUDIO_SDL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]=
\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 in|out.buffer-count=3D number of buffers\n&quot;<br>
&gt; @@ -942,6 +947,18 @@ SRST<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Desired latency in microseconds. The=
 PulseAudio server will try<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 to honor this value but actual laten=
cies may be lower or higher.<br>
&gt;=C2=A0 <br>
&gt; +``-audiodev pw,id=3Did[,prop[=3Dvalue][,...]]``<br>
&gt; +=C2=A0 =C2=A0 Creates a backend using Pipewire. This backend is avail=
able on<br>
&gt; +=C2=A0 =C2=A0 most systems.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Pipewire specific options are:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ``latency=3Dlatency``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Add extra latency to playback in microsec=
onds<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ``in|<a href=3D"http://out.name" rel=3D"noreferrer" tar=
get=3D"_blank">out.name</a>=3Dsink``<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use the specified source/sink for recordi=
ng/playback.<br>
&gt; +<br>
&gt;=C2=A0 ``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Creates a backend using SDL. This backend is avail=
able on most<br>
&gt;=C2=A0 =C2=A0 =C2=A0 systems, but you should use your platform&#39;s na=
tive backend if<br>
<br>
I&#39;ll leave actual review of the backend functionality to someone<br>
else who is familiar with the audio subsystem.<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div>

--00000000000001202a05f4bcdc7f--


