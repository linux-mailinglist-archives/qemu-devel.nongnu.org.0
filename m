Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F8F677A93
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 13:10:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJve7-0003bB-5B; Mon, 23 Jan 2023 07:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pJve3-0003aM-Qp
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pJve1-0002wi-RW
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 07:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674475788;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ehv5iRgx9pCp4byhvcw9eKynLRs6WTJmNsmcoJYo/Tc=;
 b=AOU7s1CSUk2kY+6JTLkelna5VIPU4Re4nDMRPPAJdQECY4XjeNOT71oXIgEeoZSoIbVerr
 CkQNfOcFfxWnpDWJPsfWmHpSpVWTJ0Lf42xeHDxR/NNqlnVl5ua0Qx7Ptsc7ke/wCRNZIu
 wvS0yXPlkNCTEdRvLxWL+cFMkombPS8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-c_iQfYHnOVeHZ4cSe4FI0Q-1; Mon, 23 Jan 2023 07:09:45 -0500
X-MC-Unique: c_iQfYHnOVeHZ4cSe4FI0Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 879101C426A3;
 Mon, 23 Jan 2023 12:09:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 225361121330;
 Mon, 23 Jan 2023 12:09:44 +0000 (UTC)
Date: Mon, 23 Jan 2023 12:09:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 1/2] qapi, audio: add query-audiodev command
Message-ID: <Y855BSwizi0n+w7r@redhat.com>
References: <20230123083957.20349-1-thuth@redhat.com>
 <20230123083957.20349-2-thuth@redhat.com>
 <47d18f28-73b1-af59-ab65-2366ed3da55a@linaro.org>
 <Y85rVoXhR5skLVOz@redhat.com>
 <c94b801d-3c19-24c7-505a-7ab0d98faa67@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c94b801d-3c19-24c7-505a-7ab0d98faa67@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Mon, Jan 23, 2023 at 01:05:45PM +0100, Philippe Mathieu-Daudé wrote:
> On 23/1/23 12:11, Daniel P. Berrangé wrote:
> > On Mon, Jan 23, 2023 at 10:20:29AM +0100, Philippe Mathieu-Daudé wrote:
> > > On 23/1/23 09:39, Thomas Huth wrote:
> > > > From: Daniel P. Berrangé <berrange@redhat.com>
> > > > 
> > > > Way back in QEMU 4.0, the -audiodev command line option was introduced
> > > > for configuring audio backends. This CLI option does not use QemuOpts
> > > > so it is not visible for introspection in 'query-command-line-options',
> > > > instead using the QAPI Audiodev type.  Unfortunately there is also no
> > > > QMP command that uses the Audiodev type, so it is not introspectable
> > > > with 'query-qmp-schema' either.
> > > > 
> > > > This introduces a 'query-audiodev' command that simply reflects back
> > > > the list of configured -audiodev command line options. This alone is
> > > > maybe not very useful by itself, but it makes Audiodev introspectable
> > > > via 'query-qmp-schema', so that libvirt (and other upper layer tools)
> > > > can discover the available audiodevs.
> > > > 
> > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > [thuth: Update for upcoming QEMU v8.0, and use QAPI_LIST_PREPEND]
> > > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > > ---
> > > >    qapi/audio.json | 13 +++++++++++++
> > > >    audio/audio.c   | 12 ++++++++++++
> > > >    2 files changed, 25 insertions(+)
> > > > 
> > > > diff --git a/qapi/audio.json b/qapi/audio.json
> > > > index 1e0a24bdfc..c7aafa2763 100644
> > > > --- a/qapi/audio.json
> > > > +++ b/qapi/audio.json
> > > > @@ -443,3 +443,16 @@
> > > >        'sndio':     'AudiodevSndioOptions',
> > > >        'spice':     'AudiodevGenericOptions',
> > > >        'wav':       'AudiodevWavOptions' } }
> > > > +
> > > > +##
> > > > +# @query-audiodevs:
> > > > +#
> > > > +# Returns information about audiodev configuration
> > > 
> > > Maybe clearer as 'audio backends'?
> > > 
> > > So similarly, wouldn't be clearer to name this command
> > > 'query-audio-backends'? Otherwise we need to go read QEMU
> > > source to understand what is 'audiodevs'.
> > 
> > The command line parameter is called '-audiodev' and this
> > query-audiodevs command reports the same data, so that
> > looks easy enough to understand IMHO.
> > 
> > > > +#
> > > > +# Returns: array of @Audiodev
> > > > +#
> > > > +# Since: 8.0
> > > > +#
> > > > +##
> > > > +{ 'command': 'query-audiodevs',
> > > > +  'returns': ['Audiodev'] }
> > > > diff --git a/audio/audio.c b/audio/audio.c
> > > > index d849a94a81..6f270c07b7 100644
> > > > --- a/audio/audio.c
> > > > +++ b/audio/audio.c
> > > > @@ -28,8 +28,10 @@
> > > >    #include "monitor/monitor.h"
> > > >    #include "qemu/timer.h"
> > > >    #include "qapi/error.h"
> > > > +#include "qapi/clone-visitor.h"
> > > >    #include "qapi/qobject-input-visitor.h"
> > > >    #include "qapi/qapi-visit-audio.h"
> > > > +#include "qapi/qapi-commands-audio.h"
> > > >    #include "qemu/cutils.h"
> > > >    #include "qemu/module.h"
> > > >    #include "qemu/help_option.h"
> > > > @@ -2311,3 +2313,13 @@ size_t audio_rate_get_bytes(RateCtl *rate, struct audio_pcm_info *info,
> > > >        return bytes;
> > > >    }
> > > > +
> > > > +AudiodevList *qmp_query_audiodevs(Error **errp)
> > > > +{
> > > > +    AudiodevList *ret = NULL;
> > > > +    AudiodevListEntry *e;
> > > > +    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
> > > 
> > > I am a bit confused here, isn't &audiodevs containing what the user provided
> > > from CLI? How is that useful to libvirt? Maybe the corner case
> > > of a user hand-modifying the QEMU launch arguments from a XML config?
> > > 
> > > Wouldn't a list of linked in AudiodevDriver be more useful to libvirt
> > > so it could pick the best available backend to start a VM?
> > 
> > On the libvirt side we're never going to need to actually call the
> > query-audiodevs commands. The mere existance of the command, means
> > that the QMP schema now exposes information about what audio backends
> > have been compiled into the binary. This is the same trick we've used
> > for other aspects of QMP. IOW we don't need a separate command just
> > for the purpose of listing AudiodevDrivers.
> 
> I understand having "what audio backends have been compiled into the
> binary" is useful, but I am missing how you get that from &audiodevs.
> 
> AFAICT &audiodevs is for the CLI parsed backends, not all the backends
> linked within a binary. I probably need sugar / coffee and will revisit
> after lunch.

It ties into the 'query-qmp-schema' command, along with patch #2 in
this series.

The query-audiodevs command will cause the 'AudiodevDriver' enum to
be reported in the 'query-qmp-schema' response. Patch #2, makes all
the AudiodevDriver enum entries conditional on CONFIG_XXXX.

IOW now query-qmp-schema data will tell you what AudiodevDriver
backends are compiled into the binary you're talking to.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


