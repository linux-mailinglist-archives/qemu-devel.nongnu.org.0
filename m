Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54017AFED
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 21:48:09 +0100 (CET)
Received: from localhost ([::1]:56056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9xPb-0007aE-RR
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 15:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1j9xOW-0006mH-TC
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 15:47:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1j9xOV-0000kU-8L
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 15:47:00 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22888
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1j9xOU-0000iy-Uf
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 15:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583441218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FjfrmKKHOo3R+HpDVWc7rakk7Fd0fB3Tr8N2RxlD1tQ=;
 b=jWrzNahJ5FFLTsCeYUYPPLemPjXBqcciiFkmjXJdxLP3DLhqRcm2sJcnxzYX6Ar6sdIzSx
 aQgMu7STuZiepjcZ7qI/rwkz8ureNyPMhce0QA40DuOAZHI4a6Bj3sqL4XFK3wpKnaZnuu
 sy1wsTKME1d50/RoK0daMISkIYzOI2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-tdYhLZFNNLOe-DqcP_Gw3Q-1; Thu, 05 Mar 2020 15:46:54 -0500
X-MC-Unique: tdYhLZFNNLOe-DqcP_Gw3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 149C418C8C02;
 Thu,  5 Mar 2020 20:46:53 +0000 (UTC)
Received: from [10.3.117.177] (ovpn-117-177.phx2.redhat.com [10.3.117.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F07795D9C9;
 Thu,  5 Mar 2020 20:46:49 +0000 (UTC)
Subject: Re: [PATCH] audio: Add sndio backend
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <20200304145003.GB15649@humpty.home.comstyle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bfddf01e-ef79-5eb6-eec1-ee81a175882f@redhat.com>
Date: Thu, 5 Mar 2020 14:46:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304145003.GB15649@humpty.home.comstyle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/20 8:50 AM, Brad Smith wrote:
> Add a sndio backend.
> 
> sndio is the native API used by OpenBSD, although it has been ported to
> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
> 
> The C code is from Alexandre Ratchov <alex@caoua.org> and the rest of
> the bits are from me.
> 
> 
> Signed-off-by: Alexandre Ratchov <alex@caoua.org>
> Signed-off-by: Brad Smith <brad@comstyle.com>
> 
> diff --git a/audio/Makefile.objs b/audio/Makefile.objs

Your patch lacks the usual --- separator and diffstat that 'git 
format-patch' (and therefore 'git send-email') uses.  This makes it 
harder to see at a glance the approximate impact of your patch, and 
whether it touches a file I'm interested in.

> +++ b/qapi/audio.json
> @@ -248,6 +248,28 @@
>       '*out':    'AudiodevPaPerDirectionOptions',
>       '*server': 'str' } }
>   
> +##
> +# @AudiodevSndioOptions:
> +#
> +# Options of the sndio audio backend.
> +#
> +# @in: options of the capture stream
> +#
> +# @out: options of the playback stream
> +#
> +# @dev: the name of the sndio device to use (default 'default')
> +#
> +# @latency: play buffer size (in microseconds)
> +#
> +# Since: 4.0

You've missed 4.0 by a long shot; the next release is 5.0.

> +##
> +{ 'struct': 'AudiodevSndioOptions',
> +  'data': {
> +    '*in':        'AudiodevPerDirectionOptions',
> +    '*out':       'AudiodevPerDirectionOptions',
> +    '*dev':       'str',
> +    '*latency':   'uint32'} }
> +
>   ##
>   # @AudiodevWavOptions:
>   #
> @@ -287,7 +309,7 @@
>   ##
>   { 'enum': 'AudiodevDriver',
>     'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'oss', 'pa', 'sdl',
> -            'spice', 'wav' ] }
> +            'sndio', 'spice', 'wav' ] }

It's also customary to document enum options, something like:

# @sndio (since 5.0)

Furthermore, since:


> +++ b/qemu-options.hx
> @@ -566,6 +566,9 @@ DEF("audiodev", HAS_ARG, QEMU_OPTION_audiodev,
>   #ifdef CONFIG_AUDIO_SDL
>       "-audiodev sdl,id=id[,prop[=value][,...]]\n"
>   #endif
> +#ifdef CONFIG_AUDIO_SNDIO
> +    "-audiodev sndio,id=id[,prop[=value][,...]]\n"
> +#endif

the option is only useful based on configure-time decisions, it seems 
like the new enum element should be:

{ 'name': 'sndio', 'if': 'defined(CONFIG_AUDIO_SNDIO)' }

to make it introspectible whether support is compiled in to a given 
binary.  True, there are existing enum members that should do likewise, 
so maybe it's worth a cleanup patch first.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


