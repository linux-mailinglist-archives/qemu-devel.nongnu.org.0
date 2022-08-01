Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7679586700
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 11:43:30 +0200 (CEST)
Received: from localhost ([::1]:48964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIRxR-0008Kg-8v
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 05:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIRuF-0006Ze-MC
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 05:40:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oIRuA-0004Xm-Qk
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 05:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659346803;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5GbjO/2P9upN1eYpz/qPgckZY3AVhXJcJ30hS2c/Ps=;
 b=eCk8X9Q5/wqerf7nPE7uPh/8fkE1z3v+dZ1o5b7k9ufcRflSoT5nd8Kh0zQmyGfzA6tLLz
 hHaBj/21VEYk6wFFDq48jie1UZviKOPwFPyXzmbMsRQKbxZAf6Z14Ssc83X63PNQ3XkwY/
 dyozy0u2Jb1tGOZwa5N+EtC9DQELPMw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-2jOmKfB2MHWEPNlDxn_bOA-1; Mon, 01 Aug 2022 05:40:00 -0400
X-MC-Unique: 2jOmKfB2MHWEPNlDxn_bOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CB10294EDCC;
 Mon,  1 Aug 2022 09:40:00 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F131AC27DB3;
 Mon,  1 Aug 2022 09:39:58 +0000 (UTC)
Date: Mon, 1 Aug 2022 10:39:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v3 2/4] util/qemu-sockets: Enable unix socket support on
 Windows
Message-ID: <YuefbIRSenOsMuVi@redhat.com>
References: <20220730145036.865854-1-bmeng.cn@gmail.com>
 <20220730145036.865854-3-bmeng.cn@gmail.com>
 <CAJ+F1CK7CPiWY8GLO+0VJNLkVj=RERf4gcFw_j6RZgjW7q6XQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CK7CPiWY8GLO+0VJNLkVj=RERf4gcFw_j6RZgjW7q6XQQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 01, 2022 at 11:09:24AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Sat, Jul 30, 2022 at 6:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Support for the unix socket has existed both in BSD and Linux for the
> > longest time, but not on Windows. Since Windows 10 build 17063 [1],
> > the native support for the unix socket has come to Windows. Starting
> > this build, two Win32 processes can use the AF_UNIX address family
> > over Winsock API to communicate with each other.
> >
> > [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > Changes in v3:
> > - drop the run-time check afunix_available()
> >
> > Changes in v2:
> > - move #include <afunix.h> to os-win32.h
> > - define WIN_BUILD_AF_UNIX only when CONFIG_WIN32
> >
> >  meson.build               |  6 ++++++
> >  include/sysemu/os-win32.h |  4 ++++
> >  util/qemu-sockets.c       | 14 +++++++-------
> >  3 files changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 294e9a8f32..3663b925d4 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2327,6 +2327,12 @@ have_afalg = get_option('crypto_afalg') \
> >    '''), error_message: 'AF_ALG requested but could not be
> > detected').allowed()
> >  config_host_data.set('CONFIG_AF_ALG', have_afalg)
> >
> > +if targetos != 'windows'
> > +  config_host_data.set('CONFIG_AF_UNIX', true)
> >
> 
> Imho, we should simply define CONFIG_AFUNIX_H, regardless of the OS.
> 
> 
> > +else
> > +  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
> > +endif
> >
> +
> >  config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
> >    'linux/vm_sockets.h', 'AF_VSOCK',
> >    prefix: '#include <sys/socket.h>',
> > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> > index edc3b38a57..cebf260694 100644
> > --- a/include/sysemu/os-win32.h
> > +++ b/include/sysemu/os-win32.h
> > @@ -30,6 +30,10 @@
> >  #include <windows.h>
> >  #include <ws2tcpip.h>
> >
> > +#ifdef CONFIG_AF_UNIX
> > +# include <afunix.h>
> > +#endif
> >
> 
> we could also provide a fallback, the same I did for glib:
> https://gitlab.gnome.org/GNOME/glib/-/commit/4339192b5391a37ecd55816c713537fb1990cd07
> 
> So all Windows build will have afunix code compiled.

That's much nicer. It lets us get rid of the conditionals around all
the UNIX socket handling code across the codebase, except for the
FD passing checks which have to remain.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


