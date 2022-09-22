Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA75E5A56
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 06:54:42 +0200 (CEST)
Received: from localhost ([::1]:58442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obEES-0001F4-UJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 00:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obECI-0008Fz-IT
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 00:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obEC9-0006Oa-Gr
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 00:52:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663822336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2do9m8w5Q/kO8P8tLSzDzw23K9sc3IetZDOpNmfGnbs=;
 b=Q9Oo8QDdeN6ccS6CMoPCgEjLRUtiAmBeaDGNNGHEmHHPihQSaE+U/j/wW+1WLXPQKbF/nP
 iKeWWcS+oYlZ49NX5bdbkNLUObqJNe1Zept+MzmXdndRuZ4jCr76qZJNSDUGwI5S+2FJ/X
 EyT3E/4TYS4GtUdv+OqDTZUeeP7WRBk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-dAwIrOuZOvuEIsYDxbeXSw-1; Thu, 22 Sep 2022 00:52:13 -0400
X-MC-Unique: dAwIrOuZOvuEIsYDxbeXSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFDDE811E67;
 Thu, 22 Sep 2022 04:52:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FF3FC15BA4;
 Thu, 22 Sep 2022 04:52:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0873821E6900; Thu, 22 Sep 2022 06:52:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: Markus Armbruster <armbru@redhat.com>,  "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,  "Kim, Dongwon" <dongwon.kim@intel.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Daniel =?utf-8?Q?P=2EBerrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  =?utf-8?Q?Ma?=
 =?utf-8?Q?rc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  "Thomas Huth" <thuth@redhat.com>
Subject: Re: [PATCH v1 3/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to GFX VCs
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
 <20220917000731.465003-4-vivek.kasireddy@intel.com>
 <877d1wby65.fsf@pond.sub.org>
 <IA0PR11MB7185C537C33111FCBD2C6F71F84F9@IA0PR11MB7185.namprd11.prod.outlook.com>
Date: Thu, 22 Sep 2022 06:52:11 +0200
In-Reply-To: <IA0PR11MB7185C537C33111FCBD2C6F71F84F9@IA0PR11MB7185.namprd11.prod.outlook.com>
 (Vivek Kasireddy's message of "Wed, 21 Sep 2022 22:21:33 +0000")
Message-ID: <875yhg6mf8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

"Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:

> Hi Markus,
>
> Thank you for the review.
>
>> Vivek Kasireddy <vivek.kasireddy@intel.com> writes:
>>=20
>> > The new parameter named "connector" can be used to assign physical
>> > monitors/connectors to individual GFX VCs such that when the monitor
>> > is connected or hotplugged, the associated GTK window would be
>> > fullscreened on it. If the monitor is disconnected or unplugged,
>> > the associated GTK window would be destroyed and a relevant
>> > disconnect event would be sent to the Guest.
>> >
>> > Usage: -device virtio-gpu-pci,max_outputs=3D2,blob=3Dtrue,xres=3D1920,=
yres=3D1080...
>> >        -display gtk,gl=3Don,connector.0=3DeDP-1,connector.1=3DDP-1.....
>> >
>> > Cc: Dongwon Kim <dongwon.kim@intel.com>
>> > Cc: Gerd Hoffmann <kraxel@redhat.com>
>> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > Cc: Markus Armbruster <armbru@redhat.com>
>> > Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> > Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > Cc: Thomas Huth <thuth@redhat.com>
>> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> > ---
>> >  qapi/ui.json    |   9 ++-
>> >  qemu-options.hx |   1 +
>> >  ui/gtk.c        | 168 ++++++++++++++++++++++++++++++++++++++++++++++++
>> >  3 files changed, 177 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/qapi/ui.json b/qapi/ui.json
>> > index 286c5731d1..86787a4c95 100644
>> > --- a/qapi/ui.json
>> > +++ b/qapi/ui.json
>> > @@ -1199,13 +1199,20 @@
>> >  #               interfaces (e.g. VGA and virtual console character de=
vices)
>> >  #               by default.
>> >  #               Since 7.1
>> > +# @connector:   List of physical monitor/connector names where the GT=
K windows
>> > +#               containing the respective graphics virtual consoles (=
VCs) are
>> > +#               to be placed. If a mapping exists for a VC, it will be
>> > +#               fullscreened on that specific monitor or else it woul=
d not be
>> > +#               displayed anywhere and would appear disconnected to t=
he guest.
>>=20
>> Let's see whether I understand this...  We have VCs numbered 0, 1, ...
>> VC #i is mapped to the i-th element of @connector, counting from zero.
>> Correct?
>
> [Kasireddy, Vivek] Yes, correct.
>
>> Ignorant question: what's a "physical monitor/connector name"?
>
> [Kasireddy, Vivek] IIUC, while the HDMI/DP protocols refer to a receiver =
(RX)
> as a "sink", the DRM Graphics subsystem in the kernel uses the term "conn=
ector"
> and the GTK library prefers the term "monitor".

Awesome.

>                                                 All of these terms can be
> used interchangeably but I chose the term connector for the new parameter
> after debating between connector, monitor, output, etc.=20

Okay.

> The connector name (e.g. DP-1, HDMI-A-2, etc) uniquely identifies a conne=
ctor
> or a monitor on any given system:
> https://elixir.bootlin.com/linux/v6.0-rc6/source/include/drm/drm_connecto=
r.h#L1328
> If you are on Intel hardware, you can find more info related to connector=
s by doing:
> cat /sys/kernel/debug/dri/0/i915_display_info

Thanks!

>> Would you mind breaking the lines a bit earlier, between column 70 and
>> 75?
>
> [Kasireddy, Vivek] Np, will do that.
>
>>=20
>> > +#               Since 7.2
>> >  #
>> >  # Since: 2.12
>> >  ##
>> >  { 'struct'  : 'DisplayGTK',
>> >    'data'    : { '*grab-on-hover' : 'bool',
>> >                  '*zoom-to-fit'   : 'bool',
>> > -                '*show-tabs'     : 'bool'  } }
>> > +                '*show-tabs'     : 'bool',
>> > +                '*connector'     : ['str']  } }
>> >
>> >  ##
>> >  # @DisplayEGLHeadless:

Elsewhere in ui.json, names of list-valued members use plural: channels,
clients, keys, addresses.  Let's name this one connectors for
consistency.

With that, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>

>> > diff --git a/qemu-options.hx b/qemu-options.hx
>> > index 31c04f7eea..576b65ef9f 100644
>> > --- a/qemu-options.hx
>> > +++ b/qemu-options.hx
>> > @@ -1945,6 +1945,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>> >  #if defined(CONFIG_GTK)
>> >      "-display gtk[,full-screen=3Don|off][,gl=3Don|off][,grab-on-hover=
=3Don|off]\n"
>> >      "            [,show-tabs=3Don|off][,show-cursor=3Don|off][,window=
-close=3Don|off]\n"
>> > +    "            [,connector.<id of VC>=3D<connector name>]\n"
>>=20
>> Is "<id of VC>" a VC number?
>
> [Kasireddy, Vivek] Yes.

An "id" is commonly a name.  Suggest connector.<index>.


>> >  #endif
>> >  #if defined(CONFIG_VNC)
>> >      "-display vnc=3D<display>[,<optargs>]\n"

A bit of documentation is missing:

              ``show-cursor=3Don|off`` :  Force showing the mouse cursor

              ``window-close=3Don|off`` : Allow to quit qemu with window cl=
ose button
     +        ``connector.<index>`` : <explanation>

          ``curses[,charset=3D<encoding>]``

>>=20
>> Remainder of my review is on style only.  Style suggestions are not
>> demands :)
>
> [Kasireddy, Vivek] No problem; most of your suggestions are sensible
> and I'll include them all in v2.=20

Thanks!


