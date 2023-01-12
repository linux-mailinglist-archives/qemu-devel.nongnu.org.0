Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDDA6671EE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwVd-0004y6-3a; Thu, 12 Jan 2023 07:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwVa-0004xW-Vb
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFwVZ-0006PF-6T
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673525796;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxo3DYSAdUpixLGvBI6DeNoWKfWXbjaY1ecCkjSbMfs=;
 b=Sy/fepmJp5rn7zHL94N78jVzvEJwiCTkPZCvE1VuL7sfpKiGhaGELkXWC2YjnK10AaB4D2
 BO/V1VwFvREWiEeymZZScnaUEgyw4Ne10CGIQpbSA5Dumz/z2P6hcpKofV7ZbHC7hydTlC
 iNtZKxE+58K+umWN9kOSb3mGyHlsxY8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-K_tLUA6GO6KO_iPfP63_cg-1; Thu, 12 Jan 2023 07:16:33 -0500
X-MC-Unique: K_tLUA6GO6KO_iPfP63_cg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBADD858F09;
 Thu, 12 Jan 2023 12:16:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4848E2026D68;
 Thu, 12 Jan 2023 12:16:31 +0000 (UTC)
Date: Thu, 12 Jan 2023 12:16:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2] scripts/archive-source: Use GNU tar on Darwin
Message-ID: <Y7/6HerWVVcMCWE/@redhat.com>
References: <20221209113342.61053-1-philmd@linaro.org>
 <9425e026-e19c-d648-d8e3-71563c686464@linaro.org>
 <d8848620-9882-a457-903b-2f600fd09b7c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8848620-9882-a457-903b-2f600fd09b7c@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 12, 2023 at 01:07:08PM +0100, Thomas Huth wrote:
> On 12/01/2023 12.58, Philippe Mathieu-Daudé wrote:
> > ping?
> 
> Who's supposed to take this?
> 
> > On 9/12/22 12:33, Philippe Mathieu-Daudé wrote:
> > > When using the archive-source.sh script on Darwin we get:
> > > 
> > >    tar: Option --concatenate is not supported
> > >    Usage:
> > >      List:    tar -tf <archive-filename>
> > >      Extract: tar -xf <archive-filename>
> > >      Create:  tar -cf <archive-filename> [filenames...]
> > >      Help:    tar --help
> > > 
> > > 'tar' default to the BSD implementation:
> > > 
> > >    $ tar --version
> > >    bsdtar 3.5.3 - libarchive 3.5.3 zlib/1.2.11 liblzma/5.0.5 bz2lib/1.0.8
> > > 
> > > Try to use the GNU implementation if it is available (from homebrew).
> > > 
> > > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > ---
> > > Supersedes: <20221208162051.29509-1-philmd@linaro.org>
> > > ---
> > >   scripts/archive-source.sh | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
> > > index 23e042dacd..e3d0c23fe5 100755
> > > --- a/scripts/archive-source.sh
> > > +++ b/scripts/archive-source.sh
> > > @@ -18,6 +18,7 @@ if test $# -lt 1; then
> > >       error "Usage: $0 <output tarball>"
> > >   fi
> > > +test $(uname -s) = "Darwin" && tar=gtar || tar=tar
> 
> I wonder whether this script works on other *BSDs ... maybe it would be
> better to test "tar --version | grep -q GNU" to make this even work on
> non-Darwin systems where "tar" is not GNU's tar?

Perhaps something like

  tar=$(which gtar >/dev/null 2>&1 && echo gtar || echo tar)
  $tar --version | grep GNU >/dev/null 2>&1 ||  { echo "$tar does not appear to be GNU tar" ; exit 1 }


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


