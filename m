Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AB424C449
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 19:13:57 +0200 (CEST)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8o8S-0006GL-Ia
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 13:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k8o7C-0005HQ-Hx
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:12:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57416
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k8o7A-0008A1-Jd
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597943555;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OM45psDIITjTFNs+OwwO361xg4HfIR3CxYJywVIc8yc=;
 b=WTJ93623L2pSz342/Rb0KxD33kQBMF0xqUQMSu1ydRRkSMyjcTjpZ0GfZ7cg7l7aF2xgu5
 9aqMr8EAWrcbmZF/8pDE2ZBhVu9BcWifUkEgaxsKgwotsChcySiQHO3J1zf+bK/PpNGK/a
 9VuAf9pYWHL0/prxvC7OlvS1zOO1TZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-9iyfueq5MVeAjxHCnvBTvA-1; Thu, 20 Aug 2020 13:12:27 -0400
X-MC-Unique: 9iyfueq5MVeAjxHCnvBTvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B6DE1019625;
 Thu, 20 Aug 2020 17:12:26 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B6F10013C2;
 Thu, 20 Aug 2020 17:12:24 +0000 (UTC)
Date: Thu, 20 Aug 2020 18:12:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] configure: add support for psuedo-"in source tree" builds
Message-ID: <20200820171221.GO109518@redhat.com>
References: <20200820165543.215372-1-berrange@redhat.com>
 <CAFEAcA_a+0N8FXQ4CrBwJ9jt8LptaTO3d=LZ_S2B0H7h1Ev94g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_a+0N8FXQ4CrBwJ9jt8LptaTO3d=LZ_S2B0H7h1Ev94g@mail.gmail.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 08:28:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 20, 2020 at 06:10:34PM +0100, Peter Maydell wrote:
> On Thu, 20 Aug 2020 at 17:56, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > Meson requires the build dir to be separate from the source tree. Many
> > people are used to just running "./configure && make" though and the
> > meson conversion breaks that.
> >
> > This introduces some backcompat support to make it appear as if an
> > "in source tree" build is being done, but with the the results in the
> > "build/" directory. This allows "./configure && make" to work as it
> > did historically, albeit with the output binaries staying under build/.
> 
> > +if test "$PWD" == "$source_path"
> > +then
> > +    echo "Using './build' as the directory for build output"
> > +    rm -rf build
> > +    mkdir -p build
> 
> Can we put in a mollyguard here so we only blow away build/
> if we previously auto-created it? Something like
> 
>       if ! -e build || -e build/created-by-configure; then
>           rm -rf build
>           mkdir -p build
>           touch build/created-by-configure
>       else
>           echo "some helpful error message here"
>       fi
> 
> (shell syntax probably wrong but you get the idea)
> 
> My current setup has multiple build-directories like
> build/x86, build/clang, ... and I'd like a guard against
> configure blowing them all away if I accidentally run it
> from the source tree some day.

Sure, that makes sense.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


