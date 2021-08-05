Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855B83E1623
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 15:57:57 +0200 (CEST)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBdsi-0004ag-4c
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 09:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBdrr-0003pG-MO
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBdro-0008AQ-2a
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628171818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hl1BXhA/MvhPwN78XRP3bLPwhl2Cp1LHlktcSWNg7xE=;
 b=avt4WtvvQSiWBGOThBVvxfcTmkRyurZYAdr9LZer5iZbttPfwfwlfwUusoYQ7oz6Fgwthy
 yBw2uv7cYR44OCQXSjF7v8TGejCMkZKAnZhYrYT9BgbsQUy+OQXdCzv0C05FLELyGK64W/
 9NVcKa3L/Hb4Z881vpyX8ubdXqYgMGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-IZkvKoyUN6GfnWFO2XBAbQ-1; Thu, 05 Aug 2021 09:56:57 -0400
X-MC-Unique: IZkvKoyUN6GfnWFO2XBAbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F2F0107DCF6
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:56:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B04BE226FB;
 Thu,  5 Aug 2021 13:56:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2C93311380A0; Thu,  5 Aug 2021 15:56:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v7 08/10] qapi: Use 'if': { 'any': ... } where appropriate
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-9-marcandre.lureau@redhat.com>
Date: Thu, 05 Aug 2021 15:56:41 +0200
In-Reply-To: <20210804083105.97531-9-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Wed, 4 Aug 2021 12:31:03 +0400")
Message-ID: <87lf5g6lly.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/machine-target.json | 20 ++++++++++++++++----
>  qapi/misc-target.json    | 12 +++++++++++-
>  2 files changed, 27 insertions(+), 5 deletions(-)
>
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b7..9b56b81bea 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -213,7 +213,9 @@
>  ##
>  { 'struct': 'CpuModelExpansionInfo',
>    'data': { 'model': 'CpuModelInfo' },
> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET=
_ARM)' }
> +  'if': { 'any': [ 'defined(TARGET_S390X)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_ARM)'] } }
> =20
>  ##
>  # @query-cpu-model-expansion:
> @@ -252,7 +254,9 @@
>    'data': { 'type': 'CpuModelExpansionType',
>              'model': 'CpuModelInfo' },
>    'returns': 'CpuModelExpansionInfo',
> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET=
_ARM)' }
> +  'if': { 'any': [ 'defined(TARGET_S390X)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_ARM)' ] } }
> =20
>  ##
>  # @CpuDefinitionInfo:
> @@ -316,7 +320,11 @@
>              'typename': 'str',
>              '*alias-of' : 'str',
>              'deprecated' : 'bool' },
> -  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I3=
86) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +  'if': { 'any': [ 'defined(TARGET_PPC)',
> +                   'defined(TARGET_ARM)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_S390X)',
> +                   'defined(TARGET_MIPS)' ] } }
> =20
>  ##
>  # @query-cpu-definitions:
> @@ -328,4 +336,8 @@
>  # Since: 1.2
>  ##
>  { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
> -  'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I3=
86) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +  'if': { 'any': [ 'defined(TARGET_PPC)',
> +                   'defined(TARGET_ARM)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_S390X)',
> +                   'defined(TARGET_MIPS)' ] } }
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 5573dcf8f0..9e2ea4a04a 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -23,7 +23,17 @@
>  ##
>  { 'event': 'RTC_CHANGE',
>    'data': { 'offset': 'int' },
> -  'if': 'defined(TARGET_ALPHA) || defined(TARGET_ARM) || defined(TARGET_=
HPPA) || defined(TARGET_I386) || defined(TARGET_MIPS) || defined(TARGET_MIP=
S64) || defined(TARGET_PPC) || defined(TARGET_PPC64) || defined(TARGET_S390=
X) || defined(TARGET_SH4) || defined(TARGET_SPARC)' }
> +  'if': { 'any': [ 'defined(TARGET_ALPHA)',
> +                   'defined(TARGET_ARM)',
> +                   'defined(TARGET_HPPA)',
> +                   'defined(TARGET_I386)',
> +                   'defined(TARGET_MIPS)',
> +                   'defined(TARGET_MIPS64)',
> +                   'defined(TARGET_PPC)',
> +                   'defined(TARGET_PPC64)',
> +                   'defined(TARGET_S390X)',
> +                   'defined(TARGET_SH4)',
> +                   'defined(TARGET_SPARC)' ] } }
> =20
>  ##
>  # @rtc-reset-reinjection:

Missing:

  diff --git a/qapi/ui.json b/qapi/ui.json
  index fd9677d48e..aed2bec4ab 100644
  --- a/qapi/ui.json
  +++ b/qapi/ui.json
  @@ -1136,7 +1136,8 @@
       { 'name': 'gtk', 'if': 'defined(CONFIG_GTK)' },
       { 'name': 'sdl', 'if': 'defined(CONFIG_SDL)' },
       { 'name': 'egl-headless',
  -              'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_GBM)' },
  +              'if': { 'all': [ 'defined(CONFIG_OPENGL)',
  +                               'defined(CONFIG_GBM)' ] } },
       { 'name': 'curses', 'if': 'defined(CONFIG_CURSES)' },
       { 'name': 'cocoa', 'if': 'defined(CONFIG_COCOA)' },
       { 'name': 'spice-app', 'if': 'defined(CONFIG_SPICE)'} ] }
  @@ -1167,7 +1168,8 @@
         'gtk': { 'type': 'DisplayGTK', 'if': 'defined(CONFIG_GTK)' },
         'curses': { 'type': 'DisplayCurses', 'if': 'defined(CONFIG_CURSES)=
' },
         'egl-headless': { 'type': 'DisplayEGLHeadless',
  -                        'if': 'defined(CONFIG_OPENGL) && defined(CONFIG_=
GBM)' }
  +                        'if': { 'all': [ 'defined(CONFIG_OPENGL)',
  +                                         'defined(CONFIG_GBM)' ] } }
     }
   }


You make up for it in PATCH 10.  Can tidy up in my tree.


