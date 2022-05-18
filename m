Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6352BDAD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 17:12:38 +0200 (CEST)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrLLp-00044r-Qy
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 11:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrLIM-0001Fe-L4
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nrLIK-00020M-01
 for qemu-devel@nongnu.org; Wed, 18 May 2022 11:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652886538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IArfoo/TJ3aLB8/+EtqZwuAL5cOPA/K+AkkBAZ8M+TE=;
 b=h7O4wue1lm79sVAU1sfGjXEaN2c/LUrIQ3beddXI3ebQVC7NGfOi2IlZzg8pccaUWeahZE
 mvn7VzsvbEdPivLOT2/w7TzEtq1aaxxVm8YyYw0AenlgbeGlo3+9s5vb3Jp/aZAJ71x/xD
 PjmMxp7IUD5s7jJOLfkuEypfJHz/IsQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-vXRi_B9nMTWVcKkLnCiUMg-1; Wed, 18 May 2022 11:08:57 -0400
X-MC-Unique: vXRi_B9nMTWVcKkLnCiUMg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15D1418E6C40
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 15:08:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFC20492C3B;
 Wed, 18 May 2022 15:08:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CDABE21E690D; Wed, 18 May 2022 17:08:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Gerd Hoffmann <kraxel@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 libvir-list@redhat.com,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v2 2/3] ui: Switch "-display sdl" to use the QAPI parser
References: <20220518134446.211632-1-thuth@redhat.com>
 <20220518134446.211632-3-thuth@redhat.com>
Date: Wed, 18 May 2022 17:08:55 +0200
In-Reply-To: <20220518134446.211632-3-thuth@redhat.com> (Thomas Huth's message
 of "Wed, 18 May 2022 15:44:45 +0200")
Message-ID: <87pmkakhdk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> The "-display sdl" option still uses a hand-crafted parser for its
> parameters since we didn't want to drag an interface we considered
> somewhat flawed into the QAPI schema. Since the flaws are gone now,
> it's time to QAPIfy.
>
> This introduces the new "DisplaySDL" QAPI struct that is used to hold
> the parameters that are unique to the SDL display. The only specific
> parameter is currently "grab-mod" that is used to specify the required
> modifier keys to escape from the mouse grabbing mode.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qapi/ui.json            | 27 +++++++++++++++-
>  include/sysemu/sysemu.h |  2 --
>  softmmu/globals.c       |  2 --
>  softmmu/vl.c            | 70 +----------------------------------------
>  ui/sdl2.c               | 10 ++++++
>  5 files changed, 37 insertions(+), 74 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 11a827d10f..a244e26e0f 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1295,6 +1295,30 @@
>        '*swap-opt-cmd': 'bool'
>    } }
>  
> +##
> +# @GrabMod:
> +#
> +# Set of modifier keys that need to be hold for shortcut key actions.
> +#
> +# Since: 7.1
> +##
> +{ 'enum'  : 'GrabMod',
> +  'data'  : [ 'lctrl-lalt', 'lshift-lctrl-lalt', 'rctrl' ] }

This is fine now.  If we ever generalize to "arbitrary set of modifier
keys", it'll become somewhat awkward.  No objection from me.

> +
> +##
> +# @DisplaySDL:
> +#
> +# SDL2 display options.
> +#
> +# @grab-mod:  String with modifier keys that should be pressed together with

s/String with modifier keys/Modifier keys/

> +#             the "G" key to release the mouse grab. Only "lshift-lctrl-lalt"
> +#             and "rctrl" are currently supported.

Why do we define lctrl-lalt if it's not supported?

> +#
> +# Since: 7.1
> +##
> +{ 'struct'  : 'DisplaySDL',
> +  'data'    : { '*grab-mod'   : 'GrabMod' } }
> +
>  ##
>  # @DisplayType:
>  #
> @@ -1374,7 +1398,8 @@
>        'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>        'egl-headless': { 'type': 'DisplayEGLHeadless',
>                          'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
> -      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' }
> +      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' },
> +      'sdl': { 'type': 'DisplaySDL', 'if': 'CONFIG_SDL' }
>    }
>  }

[...]


