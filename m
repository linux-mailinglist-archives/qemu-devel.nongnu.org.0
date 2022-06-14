Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51A54ACD6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 11:05:38 +0200 (CEST)
Received: from localhost ([::1]:39676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12UT-0004R4-9c
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 05:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o12OY-00020S-E8
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:59:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o12OV-0001Y5-7y
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655197166;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CB0PgzoWEELB5kkCSZXWim2W/P4bmVqi2YWC2i0rR8w=;
 b=F2L0U4owL/Ye7OQdOBWgL3j/PSxQOnNdwLG3Xx3/a5sdgo76DAKN7Tl9HlWkt+jsK9Dins
 AG9ubk7Pxley4MeVpoLX3E0LGNj8imiIvwdUBJY001NCSxKA9jb6pfYLvdnUlopMd31Gtz
 xYDgIR29Z/tAylB3Q3FEkIF0XEidrOg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-F4d3_4vgOBKZ10yETDfmTA-1; Tue, 14 Jun 2022 04:59:23 -0400
X-MC-Unique: F4d3_4vgOBKZ10yETDfmTA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 060E3811E75;
 Tue, 14 Jun 2022 08:59:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89E9F492CA2;
 Tue, 14 Jun 2022 08:59:21 +0000 (UTC)
Date: Tue, 14 Jun 2022 09:59:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/5] tests/qemu-iotests: skip 108 when FUSE is not loaded
Message-ID: <YqhN50NeY3RIfvmy@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-3-jsnow@redhat.com>
 <fa6e9152-73a1-d6ca-269a-1b1513472aa8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fa6e9152-73a1-d6ca-269a-1b1513472aa8@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 14, 2022 at 06:46:35AM +0200, Thomas Huth wrote:
> On 14/06/2022 03.50, John Snow wrote:
> > In certain container environments we may not have FUSE at all, so skip
> > the test in this circumstance too.
> > 
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/108 | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
> > index 9e923d6a59f..e401c5e9933 100755
> > --- a/tests/qemu-iotests/108
> > +++ b/tests/qemu-iotests/108
> > @@ -60,6 +60,12 @@ if sudo -n losetup &>/dev/null; then
> >   else
> >       loopdev=false
> > +    # Check for fuse support in the host environment:
> > +    lsmod | grep fuse &>/dev/null;
> 
> That doesn't work if fuse has been linked statically into the kernel. Would
> it make sense to test for /sys/fs/fuse instead?
> 
> (OTOH, we likely hardly won't run this on statically linked kernels anyway,
> so it might not matter too much)

But more importantly 'lsmod' may not be installed in our container
images. So checking /sys/fs/fuse avoids introducing a dep on the
'kmod' package.

> 
> > +    if [[ $? -ne 0 ]]; then
> 
> I'd prefer single "[" instead of "[[" ... but since we're requiring bash
> anyway, it likely doesn't matter.

Or

    if  test $? != 0 ; then

> 
> > +        _notrun 'No Passwordless sudo nor FUSE kernel module'
> > +    fi
> > +
> >       # QSD --export fuse will either yield "Parameter 'id' is missing"
> >       # or "Invalid parameter 'fuse'", depending on whether there is
> >       # FUSE support or not.
> 
>  Thomas
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


