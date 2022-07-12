Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C82571FEC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:51:01 +0200 (CEST)
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBIA7-00082k-Sl
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBI42-00028I-CW
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:44:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBI40-0007kJ-8h
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:44:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657640679;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqgTDr35Vvlz9sGFjhawS7TauJqHXN7uibTrNxkJRSA=;
 b=i3tkPqtZbEimwwVgiKROoMHD9zNCKExMpliMy367Z+zZQKGzP3UDz6bOEhk2BuZJX2dPRO
 08Up8Dg//UD1+WXRYCTc2xs98ocGUvLzpyYXOUMkphEZ1LvgSjGV6jaJ08QmzAgzNgpRaQ
 KbMmShsSL2AWXVjHgTjPHFcG/lMDMYg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-aqRwOPhlN6KEo8UH3ze27A-1; Tue, 12 Jul 2022 11:44:30 -0400
X-MC-Unique: aqRwOPhlN6KEo8UH3ze27A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8E5D185A7A4;
 Tue, 12 Jul 2022 15:44:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 323E02026D64;
 Tue, 12 Jul 2022 15:44:24 +0000 (UTC)
Date: Tue, 12 Jul 2022 16:44:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PULL 06/18] vfio-user: build library
Message-ID: <Ys2W1bm7LQVk7ifa@redhat.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
 <20220615155129.1025811-7-stefanha@redhat.com>
 <Ys0zQiFvsLozii7U@redhat.com>
 <5CF345CD-94BE-452C-A817-4A8AD3CD734A@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5CF345CD-94BE-452C-A817-4A8AD3CD734A@oracle.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 12, 2022 at 03:27:09PM +0000, Jag Raman wrote:
> 
> 
> On Jul 12, 2022, at 4:39 AM, Daniel P. Berrangé <berrange@redhat.com<mailto:berrange@redhat.com>> wrote:
> 
> On Wed, Jun 15, 2022 at 04:51:17PM +0100, Stefan Hajnoczi wrote:
> From: Jagannathan Raman <jag.raman@oracle.com<mailto:jag.raman@oracle.com>>
> 
> add the libvfio-user library as a submodule. build it as a meson
> subproject.
> 
> libvfio-user is distributed with BSD 3-Clause license and
> json-c with MIT (Expat) license
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com<mailto:elena.ufimtseva@oracle.com>>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com<mailto:john.g.johnson@oracle.com>>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com<mailto:jag.raman@oracle.com>>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com<mailto:stefanha@redhat.com>>
> Message-id: c2adec87958b081d1dc8775d4aa05c897912f025.1655151679.git.jag.raman@oracle.com<mailto:c2adec87958b081d1dc8775d4aa05c897912f025.1655151679.git.jag.raman@oracle.com>
> 
> [Changed submodule URL to QEMU's libvfio-user mirror on GitLab. The QEMU
> project mirrors its dependencies so that it can provide full source code
> even in the event that its dependencies become unavailable. Note that
> the mirror repo is manually updated, so please contact me to make newer
> libvfio-user commits available. If I become a bottleneck we can set up a
> cronjob.
> 
> Updated scripts/meson-buildoptions.sh to match the meson_options.txt
> change. Failure to do so can result in scripts/meson-buildoptions.sh
> being modified by the build system later on and you end up with a dirty
> working tree.
> --Stefan]
> 
> snip
> 
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index 4b20925bbf..10618bfa83 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -51,6 +51,7 @@ RUN dnf update -y && \
> libbpf-devel \
> libcacard-devel \
> libcap-ng-devel \
> + libcmocka-devel \
> libcurl-devel \
> libdrm-devel \
> libepoxy-devel \
> @@ -59,6 +60,7 @@ RUN dnf update -y && \
> libgcrypt-devel \
> libiscsi-devel \
> libjpeg-devel \
> + json-c-devel \
> libnfs-devel \
> libpmem-devel \
> libpng-devel \
> 
> Per the big warning message at the top of this file, this package listing
> is entirely auto-generated so should not be hand editted like this. Its
> content is all driven by mappings in the tests/lcitool/libvirt-ci submodule,
> which is what should have been updated. It would have then ensured these
> new packages were added to all the dockerfiles, and that the changes are
> not losted when the dockerfile is re-generated.
> 
> Thanks for pointing this out, Daniel!
> 
> Will update the libvirt-ci project with this, and update QEMU
> once that change is pulled into libvirt-ci.

Don't worry, I've just got a libvirt-ci update merged:

  https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/293

as I need to fix QEMU CI for FreeBSD already.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


