Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04069E680
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:56:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWr8-0006if-2b; Tue, 21 Feb 2023 12:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUWr5-0006i9-QB
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:55:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUWr3-00066V-Lz
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677002104;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=M6mFH2T2aQukEyErH6/agdfLPi9EAXxS3KlHceNJlYk=;
 b=IkavnJ3MFB32GbvLVF4Iw3N2A3zz7mA9r/2/3oQHRNZHGNguFTT7ud5kSB8dchBb7IgGwX
 O3EmxpCXdGP0B2rsi92Ub1fA5CMzggxfx57rmH6IEzSdvBzcXf0wYg8QHLOf0Ny5iiOcnh
 kVM+0Cq3JQoOdWQ2Hx/M+FSVbCtD4ac=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-XhLrQhoINGC6TLoK3ljKOg-1; Tue, 21 Feb 2023 12:55:03 -0500
X-MC-Unique: XhLrQhoINGC6TLoK3ljKOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0F1F2803608;
 Tue, 21 Feb 2023 17:55:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47CC12166B26;
 Tue, 21 Feb 2023 17:55:00 +0000 (UTC)
Date: Tue, 21 Feb 2023 17:54:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 1/6] configure: Look for auxiliary Python installations
Message-ID: <Y/UFcYRURhYYQwD4@redhat.com>
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-2-jsnow@redhat.com>
 <db3a7e62-2eac-1b9f-1c3e-69e58d614359@redhat.com>
 <CAFn=p-YhFYezskW2Z6G56HXVSGg+S5pcxdmU3CTF7+EpoYvO4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFn=p-YhFYezskW2Z6G56HXVSGg+S5pcxdmU3CTF7+EpoYvO4w@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, Feb 21, 2023 at 12:37:43PM -0500, John Snow wrote:
> On Tue, Feb 21, 2023, 6:03 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > On 2/21/23 02:24, John Snow wrote:
> > > At the moment, we look for just "python3" and "python", which is good
> > > enough almost all of the time. But ... if you are on a platform that
> > > uses an older Python by default and only offers a newer Python as an
> > > option, you'll have to specify --python=/usr/bin/foo every time.
> > >
> > > As a courtesy, we can make a cursory attempt to locate a suitable Python
> > > binary ourselves, looking for the remaining well-known binaries. This
> > > also has the added benefit of making configure "just work" more often
> > > on various BSD distributions that do not have the concept of a
> > > "platform default python".
> > >
> > > This configure loop will prefer, in order:
> > >
> > > 1. Whatever is specified in $PYTHON
> > > 2. python3
> > > 3. python (Which is usually 2.x, but might be 3.x on some platforms.)
> > > 4. python3.11 down through python3.6
> > >
> > > Notes:
> > >
> > > - Python virtual environments provide binaries for "python3", "python",
> > >    and whichever version you used to create the venv,
> > >    e.g. "python3.8". If configure is invoked from inside of a venv, this
> > >    configure loop will not "break out" of that venv unless that venv is
> > >    created using an explicitly non-suitable version of Python that we
> > >    cannot use.
> > >
> > > - In the event that no suitable python is found, the first python found
> > >    is the version used to generate the human-readable error message.
> > >
> > > - The error message isn't printed right away to allow later
> > >    configuration code to pick up an explicitly configured python.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >   configure | 34 ++++++++++++++++++++++++++--------
> > >   1 file changed, 26 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/configure b/configure
> > > index cf6db3d5518..6abf5a72078 100755
> > > --- a/configure
> > > +++ b/configure
> > > @@ -592,20 +592,40 @@ esac
> > >
> > >   : ${make=${MAKE-make}}
> > >
> > > -# We prefer python 3.x. A bare 'python' is traditionally
> > > -# python 2.x, but some distros have it as python 3.x, so
> > > -# we check that too
> > > +
> > > +check_py_version() {
> > > +    # We require python >= 3.6.
> > > +    # NB: a True python conditional creates a non-zero return code
> > (Failure)
> > > +    "$1" -c 'import sys; sys.exit(sys.version_info < (3,6))'
> > > +}
> > > +
> > >   python=
> > > +first_python=
> > >   explicit_python=no
> > > -for binary in "${PYTHON-python3}" python
> > > +# Check for $PYTHON, python3, python, then explicitly-versioned
> > interpreters.
> > > +for binary in "${PYTHON-python3}" ${PYTHON:+python3} python \
> > > +                                  python3.11 python3.10 python3.9 \
> > > +                                  python3.8 python3.7 python3.6
> >
> > I think if PYTHON is set we shouldn't look at anything else.
> >
> > Paolo
> >
> 
> PYTHON is one we made up, right?

$PYTHON is explicitly set in all our dockerfiles. We should
ensure we honour it and not fallback to anything else when
it is set. ie it would be a user error to set it to point
to a python that is missing/broken, so the user should
expect an error, not fallback to another version.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


