Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1748C458F55
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:24:57 +0100 (CET)
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9JX-0006kS-NU
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:24:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mp9GL-0004TK-7R
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:21:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mp9GH-0006o4-Ue
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:21:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637587291;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTynbvJGmeQHBcTMjDZTp2AmMqGjN1XefdZfn3aQevU=;
 b=M44g04kuxzCt6E3ctv0j+4m6I/V1eanUaf95aMiGCnYvqlwTVoa3dAVb1pKITlvZe4ka5d
 iORVBTInikPorEYaIFxpBTXeoP4m4ZVlg3+ngR/h5E+K/B5P7LOq3Xb52cr1JrxTirA/tv
 kOB/faFHxgP72nQV3uIe/16zWdWKIwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-oJgZ6u2fMF6qTNSQppIxTg-1; Mon, 22 Nov 2021 08:21:26 -0500
X-MC-Unique: oJgZ6u2fMF6qTNSQppIxTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63601B18BC5
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 13:21:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B5A19D9F;
 Mon, 22 Nov 2021 13:21:24 +0000 (UTC)
Date: Mon, 22 Nov 2021 13:21:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH-for-6.2 v3] qdev-monitor: Only allow full --global
 <driver>.<property>=<val> option
Message-ID: <YZuZUVAho51eoVXA@redhat.com>
References: <20211119182644.480115-1-philmd@redhat.com>
 <87czmv1fof.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87czmv1fof.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 20, 2021 at 07:53:20AM +0100, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
> > When not all fields of the --global option are provided,
> > QEMU might crash:
> >
> >   $ qemu-system-x86_64 -global driver=isa-fdc
> >   qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
> >   string_input_visitor_new: Assertion `str' failed.
> >   Aborted (core dumped)
> >
> > Fix by only allowing --global with all 3 fields:
> >
> >   $ qemu-system-x86_64 -global driver=isa-fdc
> >   Invalid 'global' option format. It must be provided as:
> >     --global <driver>.<property>=<value>
> >
> > Reported-by: Thomas Huth <thuth@redhat.com>
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> > v3: Change qemu_global_option (Markus)
> >
> > Supersedes: <20211119122911.365036-1-philmd@redhat.com>
> > ---
> >  softmmu/qdev-monitor.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> > index 01f3834db57..558272b147c 100644
> > --- a/softmmu/qdev-monitor.c
> > +++ b/softmmu/qdev-monitor.c
> > @@ -1029,13 +1029,10 @@ int qemu_global_option(const char *str)
> >          qemu_opt_set(opts, "value", str + offset + 1, &error_abort);
> >          return 0;
> >      }
> > +    printf("Invalid 'global' option format. It must be provided as:\n");
> > +    printf("  --global <driver>.<property>=<value>\n");
> >  
> > -    opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
> > -    if (!opts) {
> > -        return -1;
> > -    }
> > -
> > -    return 0;
> > +    return -1;
> >  }
> >  
> >  bool qmp_command_available(const QmpCommand *cmd, Error **errp)
> 
> This drops a documented part of the external interface:
> 
>     $ qemu-system-x86_64 -help | grep -C 1 global
>                     i.e. -set drive.$id.file=/path/to/image
>     -global driver.property=value
> --> -global driver=driver,property=property,value=value
>                     set a global default for a driver property

This doc makes it look like the two syntaxes are functionally
equivalent, but it seems that's not quite the case.

libvirt uses the driver.propert=value syntax for everything
except one case

  -global driver=cfi.pflash01,property=secure,value=on

for that one if we try to use

  -global cfi.pflash01.secure=on

it complains

  qemu-system-x86_64: warning: global cfi.pflash01.secure has invalid class name

what's going on here ?

>     -boot [order=drives][,once=drives][,menu=on|off]
> 
> It goes back to commit 3751d7c43f "vl: allow full-blown QemuOpts syntax
> for -global", v2.4.0.
> 
> The appropriate fix is to check @opts for presence of all three
> parameters.
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


