Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808742F747E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 09:41:34 +0100 (CET)
Received: from localhost ([::1]:59930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Kfl-0004za-AX
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 03:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0KeU-00040s-EG
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 03:40:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l0KeO-0001hX-Ts
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 03:40:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610700005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKu70xEjkbiLbtNhprUwm/zdGZ3qsOhC2quWCQ8jbVs=;
 b=NkK0LdtLIpJp3Y4b5yWiEF2yU6puG8bbYJbKj3VnwDbwxzv2CWVGvmSUBxoQryXmi4R9gl
 N9PxjmqbRk3R11BXn7Y7vO8hyVq+6rPRjMgeEu7ygawS81yO9xxbQDlgAl2RJg2EajsMNP
 8od6Hr8gKeOl7mHPiCS6ek1ayT+Ftl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-gJLQMkv_M9W2QOE2UDV3vg-1; Fri, 15 Jan 2021 03:40:03 -0500
X-MC-Unique: gJLQMkv_M9W2QOE2UDV3vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B67BA8015A4;
 Fri, 15 Jan 2021 08:40:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 967FF27C22;
 Fri, 15 Jan 2021 08:39:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2A6D311386A7; Fri, 15 Jan 2021 09:39:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 03/23] sdlaudio: add -audiodev sdl, out.buffer-count option
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-3-vr_qemu@t-online.de>
Date: Fri, 15 Jan 2021 09:39:58 +0100
In-Reply-To: <20210110100239.27588-3-vr_qemu@t-online.de> ("Volker
 =?utf-8?Q?R=C3=BCmelin=22's?=
 message of "Sun, 10 Jan 2021 11:02:19 +0100")
Message-ID: <87pn264mqp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Volker R=C3=BCmelin <vr_qemu@t-online.de> writes:

> Currently there is a crackling noise with SDL2 audio playback.
> Commit bcf19777df: "audio/sdlaudio: Allow audio playback with
> SDL2" already mentioned the crackling noise.
>
> Add an out.buffer-count option to give users a chance to select
> sane settings for glitch free audio playback. The idea was taken
> from the coreaudio backend.
>
> The in.buffer-count option will be used with one of the next
> patches.
>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> ---
[...]
> diff --git a/qapi/audio.json b/qapi/audio.json
> index 072ed79def..9cba0df8a4 100644
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -301,6 +301,37 @@
>      '*out':    'AudiodevPaPerDirectionOptions',
>      '*server': 'str' } }
> =20
> +##
> +# @AudiodevSdlPerDirectionOptions:
> +#
> +# Options of the SDL audio backend that are used for both playback and
> +# recording.
> +#
> +# @buffer-count: number of buffers (default 4)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'AudiodevSdlPerDirectionOptions',
> +  'base': 'AudiodevPerDirectionOptions',
> +  'data': {
> +    '*buffer-count': 'uint32' } }
> +
> +##
> +# @AudiodevSdlOptions:
> +#
> +# Options of the SDL audio backend.
> +#
> +# @in: options of the recording stream
> +#
> +# @out: options of the playback stream
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'AudiodevSdlOptions',
> +  'data': {
> +    '*in':  'AudiodevSdlPerDirectionOptions',
> +    '*out': 'AudiodevSdlPerDirectionOptions' } }
> +
>  ##
>  # @AudiodevWavOptions:
>  #
> @@ -385,6 +416,6 @@
>      'jack':      'AudiodevJackOptions',
>      'oss':       'AudiodevOssOptions',
>      'pa':        'AudiodevPaOptions',
> -    'sdl':       'AudiodevGenericOptions',
> +    'sdl':       'AudiodevSdlOptions',
>      'spice':     'AudiodevGenericOptions',
>      'wav':       'AudiodevWavOptions' } }
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 1698a0c751..4e02e9bd76 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -588,6 +588,7 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>  #endif
>  #ifdef CONFIG_AUDIO_SDL
>      "-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]\n"
> +    "                in|out.buffer-count=3D number of buffers\n"
>  #endif
>  #ifdef CONFIG_SPICE
>      "-audiodev spice,id=3Did[,prop[=3Dvalue][,...]]\n"
> @@ -745,7 +746,12 @@ SRST
>  ``-audiodev sdl,id=3Did[,prop[=3Dvalue][,...]]``
>      Creates a backend using SDL. This backend is available on most
>      systems, but you should use your platform's native backend if
> -    possible. This backend has no backend specific properties.
> +    possible.
> +
> +    SDL specific options are:
> +
> +    ``in|out.buffer-count=3Dcount``
> +        Sets the count of the buffers.
> =20
>  ``-audiodev spice,id=3Did[,prop[=3Dvalue][,...]]``
>      Creates a backend that sends audio through SPICE. This backend

These parts:
Acked-by: Markus Armbruster <armbru@redhat.com>


