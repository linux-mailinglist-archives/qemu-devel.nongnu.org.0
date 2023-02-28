Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EE46A5883
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 12:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyQO-0008K9-1x; Tue, 28 Feb 2023 06:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWyQE-0008Hr-RY
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWyQ9-0006z1-3w
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 06:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677584712;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QYJqTrc7Zwyd4661Pi87D7RX7WRY8cXPISR3mo7dQyk=;
 b=S45ZHtaaXhG7CUbT2cfRhshj6AEdyw6wy3EXFgw+wThzwRSKQ/X7OxN2lKXcq8I88ok9B9
 bKVRVhLiLEDIv9q9L43+4xg2WGGrOaaUCaIiUkamVE2zRcJBT5fassBU8/NihksvOhF8L2
 30Ht8NDuCsEGiMVVlWz2n0LazRaBLxw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-Xq-4ydFkMqCdhSV-PmMG_A-1; Tue, 28 Feb 2023 06:45:08 -0500
X-MC-Unique: Xq-4ydFkMqCdhSV-PmMG_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDCEB3C0DDA1;
 Tue, 28 Feb 2023 11:45:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 265EF1121315;
 Tue, 28 Feb 2023 11:45:03 +0000 (UTC)
Date: Tue, 28 Feb 2023 11:45:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 4/7] tests/docker: add USER stanzas to non-lci images
Message-ID: <Y/3pPAXgnoReOBVi@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-5-alex.bennee@linaro.org>
 <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Tue, Feb 28, 2023 at 12:43:01PM +0100, Philippe Mathieu-Daudé wrote:
> On 24/2/23 19:08, Alex Bennée wrote:
> > These are flat but not generated by lcitool so we need to manually
> > update them with the `useradd` stanza.
> > 
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> >   tests/docker/dockerfiles/debian-all-test-cross.docker     | 5 +++++
> >   tests/docker/dockerfiles/debian-alpha-cross.docker        | 5 +++++
> >   tests/docker/dockerfiles/debian-hexagon-cross.docker      | 5 +++++
> >   tests/docker/dockerfiles/debian-hppa-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/debian-loongarch-cross.docker    | 5 +++++
> >   tests/docker/dockerfiles/debian-m68k-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/debian-mips-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/debian-mips64-cross.docker       | 5 +++++
> >   tests/docker/dockerfiles/debian-native.docker             | 5 +++++
> >   tests/docker/dockerfiles/debian-powerpc-test-cross.docker | 6 +++++-
> >   tests/docker/dockerfiles/debian-riscv64-cross.docker      | 5 +++++
> >   tests/docker/dockerfiles/debian-riscv64-test-cross.docker | 5 +++++
> >   tests/docker/dockerfiles/debian-sh4-cross.docker          | 5 +++++
> >   tests/docker/dockerfiles/debian-sparc64-cross.docker      | 5 +++++
> >   tests/docker/dockerfiles/debian-toolchain.docker          | 5 +++++
> >   tests/docker/dockerfiles/debian-tricore-cross.docker      | 5 +++++
> >   tests/docker/dockerfiles/debian-xtensa-cross.docker       | 5 +++++
> >   tests/docker/dockerfiles/fedora-cris-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/fedora-i386-cross.docker         | 5 +++++
> >   tests/docker/dockerfiles/python.docker                    | 5 +++++
> >   20 files changed, 100 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
> > index 8dc5e1b5de..981e9bdc7b 100644
> > --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
> > @@ -61,3 +61,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
> >   ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs --disable-tools
> >   ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
> > +# As a final step configure the user (if env is defined)
> > +ARG USER
> > +ARG UID
> > +RUN if [ "${USER}" ]; then \
> > +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
> 
> Is that intended for local image building?
> 
> Personally I only use the image built by gitlab and mount the containers
> with -u $UID -v $HOME/.ccache -v $HOME/source/qemu. Would that still
> keep working, or do I have to map from gitlab user to mine?

The images fetched from gitlab already have this present, as the
current docker.py  adds it to all our containers. So this should
essentially be a no functional change.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


