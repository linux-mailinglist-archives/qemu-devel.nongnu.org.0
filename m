Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C6F69904E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaoX-0007yR-15; Thu, 16 Feb 2023 04:44:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSaoU-0007yF-Gj
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:44:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSaoS-0006E7-Oz
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676540664;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Jnw7z1r+Yt81rvN04BJvgSnQOy4cP3/QQixLjDOgzlI=;
 b=glm9BhzJNPreiVRhmuC2AHPl2AtWvD4rS0Otn2LnZFadGaNUIC2izW/qocvQ3eCWxE0+g2
 ty2498nNJ/95YjHQaSrd30wjwp3DZBCxS+zM5Px8f5RGOJ4jZdGjQvNltDVN+/DFFgBmjf
 wMz+KkCSk3/RyYyxLbKCKu9uf1oxJJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-bshjoJlUO-GirpwwfmGBZw-1; Thu, 16 Feb 2023 04:44:22 -0500
X-MC-Unique: bshjoJlUO-GirpwwfmGBZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE5C6280AA22;
 Thu, 16 Feb 2023 09:44:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E00F12166B30;
 Thu, 16 Feb 2023 09:44:20 +0000 (UTC)
Date: Thu, 16 Feb 2023 09:44:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, pbonzini@redhat.com,
 Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] qemu: make version available in coredump
Message-ID: <Y+368RcZsG+t7SjW@redhat.com>
References: <20220607203221.966261-1-vsementsov@yandex-team.ru>
 <CAJSP0QVNnGg+5OkDwpk3Kgc=kicsSt+f5QVg1tyd+ze76N_KVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJSP0QVNnGg+5OkDwpk3Kgc=kicsSt+f5QVg1tyd+ze76N_KVw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Wed, Feb 15, 2023 at 05:05:47PM -0500, Stefan Hajnoczi wrote:
> On Tue, 7 Jun 2022 at 16:33, Vladimir Sementsov-Ogievskiy
> <vsementsov@yandex-team.ru> wrote:
> >
> > Add a variable with QEMU_FULL_VERSION definition. Then the content of
> > the variable is easily searchable:
> >
> >    strings /path/to/core | grep QEMU_FULL_VERSION
> >
> > 'volatile' keyword is used to avoid removing the variable by compiler as
> > unused.
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > ---
> >
> > Hi all!
> >
> > Probably, I just don't know the correct way to get version from core
> > file. If so, please teach me :)
> 
> I've never hit this issue because bug reports usually include the QEMU
> distro package version. Keeping the version string in the core file
> seems reasonable (unless there is already another way to do this).
> 
> Something I'm curious about: is the coredump guaranteed to contain
> static const variables? I wondered if they might be located in the
> .rodata ELF section and excluded from the coredump because they are
> referenced in the NT_FILE mmap note instead. Maybe volatile prevents
> this?

In Fedora / RHEL based systems (and some other distros too IIUC) for
many years, all binaries have included a "build-id" ELF note which
uniquely identifies the package build.

Note section [ 3] '.note.gnu.build-id' of 36 bytes at offset 0x3c0:
  Owner          Data size  Type
  GNU                   20  GNU_BUILD_ID
    Build ID: e3143405b7f653a0a65b3295df760fdf2c09ba79

This can be used to query what RPM it came from (assuming the RPM
is still in your repos)

 dnf repoquery --whatprovides debuginfo(build-id) = ...hash...

this makes it into the coredump files and is what current distro
tooling uses to find the binary (and libraries).

There are some downsides/limitations with this though, so in
Fedora 36 a new impl was added alongside which provides full
package info in json

Note section [ 5] '.note.package' of 136 bytes at offset 0x404:
  Owner          Data size  Type
  FDO                  120  FDO_PACKAGING_METADATA
    Packaging Metadata: {"type":"rpm","name":"qemu","version":"7.0.0-13.fc37","architecture":"x86_64","osCpe":"cpe:/o:fedoraproject:fedora:37"}

This format is supported by systemd core dump tools

  https://systemd.io/ELF_PACKAGE_METADATA/

I believe it has been proposed (and possibly implemented?) for
Debian too.

This is a long winded way of asking, do we really need a QEMU specific
solution here ? Especially one that only tells us a QEMU verison, and
nothing about the many libraries QEMU links to which affect its
operational behaviour.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


