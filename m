Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F6332E7BC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 13:13:55 +0100 (CET)
Received: from localhost ([::1]:58964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI9L8-0006jz-60
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 07:13:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lI9Jw-0005uy-08
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:12:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lI9Jt-0001xW-TO
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 07:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614946356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPzlS2HTZ3NE1rSuU5kf+8jZsDpvYZ7OrE9KBLUROd4=;
 b=dCXR/g3zaWfzsIcLLEPWBMt1he6R+kCn0gtJXUkvWflcjUF5q9l3XbrjtH/S+bm6W50+/u
 f3MuguuaEZDzP4xMjQBYwcXncR2bgHGnLV/LrbsblZU/3/4krIO8qzqg/2iUnHSpMDzx4d
 KeXvdd1cafoZdt6w/0mQqXBLI8CIZD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-AwkB0N8zPnm4R4DR4pWgVw-1; Fri, 05 Mar 2021 07:12:32 -0500
X-MC-Unique: AwkB0N8zPnm4R4DR4pWgVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 738CDCC621;
 Fri,  5 Mar 2021 12:12:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F015E60244;
 Fri,  5 Mar 2021 12:12:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79A291132C12; Fri,  5 Mar 2021 13:12:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/3] qapi, audio: respect build time conditions in audio
 schema
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-3-berrange@redhat.com>
Date: Fri, 05 Mar 2021 13:12:26 +0100
In-Reply-To: <20210302175524.1290840-3-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Tue, 2 Mar 2021 17:55:23
 +0000")
Message-ID: <87o8fx3il1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Currently the -audiodev accepts any audiodev type regardless of what is
> built in to QEMU. An error only occurs later at runtime when a sound
> device tries to use the audio backend.
>
> With this change QEMU will immediately reject -audiodev args that are
> not compiled into the binary. The QMP schema will also be introspectable
> to identify what is compiled in.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Subject "qapi, audio: respect build time conditions in audio schema"
feels too narrow.  The patch goes beyond the schema, because it has to:
guarding QAPI schema parts with 'if' requires guarding use of C code
generated for it with #if.

An easy way out is perhaps stating just the aim:

    audio: Make introspection reflect build configuration

This assumes the patch does a complete job.  If there's more audio build
configuration to reflect, add a suitable qualifier like "more closely".

Fun: before the patch, the CONFIG_AUDIO_ conditionals are effectively
applied just to output of -help.

[...]
> diff --git a/qapi/audio.json b/qapi/audio.json
> index d7b91230d7..9af1b8140c 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -386,8 +386,24 @@
>  # Since: 4.0
>  ##
>  { 'enum': 'AudiodevDriver',
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
> =20
>  ##
>  # @Audiodev:
> @@ -410,14 +426,22 @@
>    'discriminator': 'driver',
>    'data': {
>      'none':      'AudiodevGenericOptions',
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
>      'wav':       'AudiodevWavOptions' } }
> =20
>  ##

For the QAPI schema part:
Acked-by: Markus Armbruster <armbru@redhat.com>


