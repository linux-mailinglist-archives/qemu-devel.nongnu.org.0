Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D789B2F7DFB
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:19:25 +0100 (CET)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pwi-0005gY-SD
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l0PS0-0001Vd-KI
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l0PRw-0005UK-5j
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610718455;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwgA1JXPeTsBqfx/8imvHw5g4HMm00meZlV7DiCROa4=;
 b=eCTMqiQCWVwPRFLMm72CRcgTJ4h7C7yQNf30IvcIFcWSppu4noavBsz3vAp2Vp58jwdkLI
 Fk4gqC4GfBS8+gQytBxMKm6KSyL/TC9NmZhy3n/9pbdiYkC+x76cgaGvVAz6FcsKiIHRIm
 3omz3lmLfEK1EU0Qp7+Fx/A8OTy0ZxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-UbMu2L0HMiqh9DiVaa_A4Q-1; Fri, 15 Jan 2021 08:47:29 -0500
X-MC-Unique: UbMu2L0HMiqh9DiVaa_A4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B6B8030A1;
 Fri, 15 Jan 2021 13:47:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-76.ams2.redhat.com [10.36.115.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F75060BF3;
 Fri, 15 Jan 2021 13:47:19 +0000 (UTC)
Date: Fri, 15 Jan 2021 13:47:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 2/2] vnc: add qmp to support reload vnc tls certificates
Message-ID: <20210115134710.GH1692978@redhat.com>
References: <20210107143032.752-1-changzihao1@huawei.com>
 <20210107143032.752-3-changzihao1@huawei.com>
 <87turil3s2.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87turil3s2.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: oscar.zhangbo@huawei.com, Zihao Chang <changzihao1@huawei.com>,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 02:37:33PM +0100, Markus Armbruster wrote:
> Zihao Chang <changzihao1@huawei.com> writes:
> 
> > QEMU loads vnc tls certificates only when vm is started. This patch
> > provides a new qmp to reload vnc tls certificates without restart
> > vnc-server/VM.
> > {"execute": "reload-vnc-cert"}
> >
> > Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> > ---
> >  include/ui/console.h |  1 +
> >  monitor/qmp-cmds.c   |  5 +++++
> >  qapi/ui.json         | 18 ++++++++++++++++++
> >  ui/vnc.c             | 24 ++++++++++++++++++++++++
> >  4 files changed, 48 insertions(+)
> >
> > diff --git a/include/ui/console.h b/include/ui/console.h
> > index 5dd21976a3..60a24a8bb5 100644
> > --- a/include/ui/console.h
> > +++ b/include/ui/console.h
> > @@ -441,6 +441,7 @@ int vnc_display_password(const char *id, const char *password);
> >  int vnc_display_pw_expire(const char *id, time_t expires);
> >  QemuOpts *vnc_parse(const char *str, Error **errp);
> >  int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp);
> > +void vnc_display_reload_cert(const char *id,  Error **errp);
> 
> Make this return bool, please.
> 
> error.h's big comment:
> 
>  * = Rules =
>  *
>  * - Functions that use Error to report errors have an Error **errp
>  *   parameter.  It should be the last parameter, except for functions
>  *   taking variable arguments.
>  *
>  * - You may pass NULL to not receive the error, &error_abort to abort
>  *   on error, &error_fatal to exit(1) on error, or a pointer to a
>  *   variable containing NULL to receive the error.
>  *
>  * - Separation of concerns: the function is responsible for detecting
>  *   errors and failing cleanly; handling the error is its caller's
>  *   job.  Since the value of @errp is about handling the error, the
>  *   function should not examine it.
>  *
>  * - The function may pass @errp to functions it calls to pass on
>  *   their errors to its caller.  If it dereferences @errp to check
>  *   for errors, it must use ERRP_GUARD().
>  *
>  * - On success, the function should not touch *errp.  On failure, it
>  *   should set a new error, e.g. with error_setg(errp, ...), or
>  *   propagate an existing one, e.g. with error_propagate(errp, ...).
>  *
>  * - Whenever practical, also return a value that indicates success /
>  *   failure.  This can make the error checking more concise, and can
>  *   avoid useless error object creation and destruction.  Note that
>  *   we still have many functions returning void.  We recommend
>  *   • bool-valued functions return true on success / false on failure,
>  *   • pointer-valued functions return non-null / null pointer, and
>  *   • integer-valued functions return non-negative / negative.
> 
> >  
> >  /* input.c */
> >  int index_from_key(const char *key, size_t key_length);
> > diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> > index 34f7e75b7b..84f2b74ea8 100644
> > --- a/monitor/qmp-cmds.c
> > +++ b/monitor/qmp-cmds.c
> > @@ -287,6 +287,11 @@ static void qmp_change_vnc(const char *target, bool has_arg, const char *arg,
> >          qmp_change_vnc_listen(target, errp);
> >      }
> >  }
> > +
> > +void qmp_reload_vnc_cert(Error **errp)
> > +{
> > +    vnc_display_reload_cert(NULL, errp);
> > +}
> >  #endif /* !CONFIG_VNC */
> >  
> >  void qmp_change(const char *device, const char *target,
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index d08d72b439..855b1ac007 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -1179,3 +1179,21 @@
> >  ##
> >  { 'command': 'query-display-options',
> >    'returns': 'DisplayOptions' }
> > +
> > +##
> > +# @reload-vnc-cert:
> > +#
> > +# Reload certificates for vnc.
> > +#
> > +# Returns: nothing
> > +#
> > +# Since: 5.2
> 
> 6.0 now.
> 
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "reload-vnc-cert" }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'reload-vnc-cert',
> > +  'if': 'defined(CONFIG_VNC)' }
> 
> Daniel's objection to another patch that adds a rather specialized QMP
> command may apply: "I'm not a fan of adding adhoc new commands for
> specific properties."
> 
>     From: Daniel P. Berrangé <berrange@redhat.com>
>     Subject: Re: [PATCH] vnc: add qmp to support change authz
>     Message-ID: <20210107161830.GE1029501@redhat.com>

Yeah, though this scenario is a ittle more complicated. Tihs patch is
not actually changing any object properties in the VNC server config.
It is simply telling the VNC server to reload the existing object it
has configured.

My proposed  "display-update" command would not directly map to what
this "reload-vnc-cert" command does, unless we declared the certs are
always reloaded after every display-update command.

Or we could have a more generic  "display-reload" command, which has
fields indicating what aspect to reload. eg a 'tls-certs: bool' field
to indicate reload of TLS certs in the display. This could be useful
if we wanted the ability to reload authz access control lists, though
we did actually wire them up to auto-reload using inotify.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


