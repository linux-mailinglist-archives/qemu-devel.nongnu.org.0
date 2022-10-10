Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7595F9B99
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:07:12 +0200 (CEST)
Received: from localhost ([::1]:34530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohokh-0006a9-6h
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohoUg-0001c4-CR
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:50:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohoUc-0005uq-8y
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665391832;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arakQlFf/W3CgNE0jQOsN7wPkZQNFeJtxgCX9iZZdgI=;
 b=Ihdc7J2hJZbFjVrwrjH8I3H5pLgGwm7CO1W15aC2OdPsAd9dEYK+hJ08eJE178NBVdgk6T
 SYJ8LflGFTwMQ5T4q4d4+AjCyWDm/oeloIUxTIJOofFGGvd8V+YJ0gML4ZZApS+hy34pVt
 c7qa1uDfUVoKS2xRo062phb1cemsLHI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-Qk3zn7R_P9WdyK7d_3SIwA-1; Mon, 10 Oct 2022 04:50:29 -0400
X-MC-Unique: Qk3zn7R_P9WdyK7d_3SIwA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0C41382F1A0;
 Mon, 10 Oct 2022 08:50:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE10E200BA7D;
 Mon, 10 Oct 2022 08:50:26 +0000 (UTC)
Date: Mon, 10 Oct 2022 09:50:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] tests: Add sndio to the FreeBSD CI containers / VM
Message-ID: <Y0Pc0NQQVrXDPgCH@redhat.com>
References: <Yz/TeblRI77AIHJe@humpty.home.comstyle.com>
 <CANCZdfoE=cXBnamXYFLV0ZDOYUsPKGr8RNpOLMmpRT3=w6ug8A@mail.gmail.com>
 <56a8c363-d2f2-3aa5-6b35-5c11cc967bf8@comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56a8c363-d2f2-3aa5-6b35-5c11cc967bf8@comstyle.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 07, 2022 at 06:27:29PM -0400, Brad Smith wrote:
> On 10/7/2022 4:33 PM, Warner Losh wrote:
> > 
> > 
> > On Fri, Oct 7, 2022 at 1:21 AM Brad Smith <brad@comstyle.com> wrote:
> > 
> >     tests: Add sndio to the FreeBSD CI containers / VM
> > 
> >     ---
> >      .gitlab-ci.d/cirrus/freebsd-12.vars           |   2 +-
> >      .gitlab-ci.d/cirrus/freebsd-13.vars           |   2 +-
> >      tests/docker/dockerfiles/alpine.docker        |   3 +-
> >      tests/docker/dockerfiles/centos8.docker       |   2 +-
> >      .../dockerfiles/debian-amd64-cross.docker     | 235 ++++++++---------
> >      tests/docker/dockerfiles/debian-amd64.docker  | 237
> >     +++++++++---------
> >      .../dockerfiles/debian-arm64-cross.docker     | 233 ++++++++---------
> >      .../dockerfiles/debian-armel-cross.docker     | 231 ++++++++---------
> >      .../dockerfiles/debian-armhf-cross.docker     | 233 ++++++++---------
> >      .../dockerfiles/debian-mips64el-cross.docker  | 227 ++++++++---------
> >      .../dockerfiles/debian-mipsel-cross.docker    | 227 ++++++++---------
> >      .../dockerfiles/debian-ppc64el-cross.docker   | 231 ++++++++---------
> >      .../dockerfiles/debian-s390x-cross.docker     | 229 ++++++++---------
> >      tests/docker/dockerfiles/fedora.docker        | 230 ++++++++---------
> >      tests/docker/dockerfiles/opensuse-leap.docker |   3 +-
> >      tests/docker/dockerfiles/ubuntu2004.docker    | 235 ++++++++---------
> >      tests/lcitool/libvirt-ci                      |   2 +-
> >      tests/lcitool/projects/qemu.yml               |   1 +
> >      tests/vm/freebsd                              |   3 +
> >      19 files changed, 1291 insertions(+), 1275 deletions(-)
> > 
> > 
> > This looks good to me. Why did the Linux containers need updating for
> > the FreeBSD update?
> > 
> > Otherwise, the changes look good to my eye
> > 
> > Reviewed-by:  Warner Losh <imp@bsdimp.com>
> 
> 
> Because the CI configs are auto-generated. When refreshing them it generates
> them all. The intent was
> to update the FreeBSD configs, but when adding the dependency to
> tests/lcitool/projects/qemu.yml
> the FreeBSD configs are updated as well as the rest. Whatever OS's have a
> corresponding mapping
> in libvirt-ci are updated.

The POV of libvirt-ci, is that if the dependancy exists in any given
platform, we add it to the package list, so that we maximise the test
coverage across platforms. Surprisingly sndio was available in several
Linux distros.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


