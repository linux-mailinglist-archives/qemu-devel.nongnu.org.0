Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005E9229DC2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 19:04:59 +0200 (CEST)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyIAt-0007AI-28
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 13:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jyI9l-0005vJ-6P
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 13:03:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22563
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jyI9j-0003cm-5z
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 13:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595437426;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X3jedd/L/YiiKx3NgbVUiuKhlTyLHUpYqAYzM6jydcs=;
 b=Ai6sBSHeLZEHpZFHUtpv47ltdEaNZN2ia7dx1QXdlwa+pkwBbWU+wdJtPeEsogYCGtnJ2o
 OLdPAB+VC77Uyi5+ueC3SEMu5Z64IPbYxpm+3R19HLc/FcNe2S6F1AARFi8tTpSd9GfzOz
 0QOjTkCrXgdfLWEeIqFXqLP9mdwkqPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-SIb7xwl1MsOv6ebDNHz3DQ-1; Wed, 22 Jul 2020 13:03:40 -0400
X-MC-Unique: SIb7xwl1MsOv6ebDNHz3DQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20FDC800C64;
 Wed, 22 Jul 2020 17:03:39 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 444D08BED2;
 Wed, 22 Jul 2020 17:03:31 +0000 (UTC)
Date: Wed, 22 Jul 2020 18:03:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-5.1 3/3] virtiofsd: probe unshare(CLONE_FS) and print
 an error
Message-ID: <20200722170328.GU2324845@redhat.com>
References: <20200722130206.224898-1-stefanha@redhat.com>
 <20200722130206.224898-4-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200722130206.224898-4-stefanha@redhat.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:34:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: vromanso@redhat.com, Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>,
 qemu-devel@nongnu.org, virtio-fs@redhat.com, rmohr@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 22, 2020 at 02:02:06PM +0100, Stefan Hajnoczi wrote:
> An assertion failure is raised during request processing if
> unshare(CLONE_FS) fails. Implement a probe at startup so the problem can
> be detected right away.
> 
> Unfortunately Docker/Moby does not include unshare in the seccomp.json
> list unless CAP_SYS_ADMIN is given. Other seccomp.json lists always
> include unshare (e.g. podman is unaffected):
> https://raw.githubusercontent.com/seccomp/containers-golang/master/seccomp.json
> 
> Use "docker run --security-opt seccomp=path/to/seccomp.json ..." if the
> default seccomp.json is missing unshare.
> 
> Cc: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 3b6d16a041..ebeb352514 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -949,6 +949,19 @@ int virtio_session_mount(struct fuse_session *se)
>  {
>      int ret;
>  
> +    /*
> +     * Test that unshare(CLONE_FS) works. fv_queue_worker() will need it. It's
> +     * an unprivileged system call but some Docker/Moby versions are known to
> +     * reject it via seccomp when CAP_SYS_ADMIN is not given.
> +     */
> +    ret = unshare(CLONE_FS);
> +    if (ret == -1 && errno == EPERM) {
> +        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_FS) failed with EPERM. If "
> +                "running in a container please check that the container "
> +                "runtime seccomp policy allows unshare.\n");
> +        return -1;
> +    }
> +

This describes the unshare() call as a "probe" and a "test", but that's
misleading IMHO. A "probe" / "test" implies that after it has completed,
there's no lingering side-effect, which isn't the case here.

This is actively changing the process' namespace environment in the
success case, and not putting it back how it was originally.

May be this is in fact OK, but if so I think the commit message and
comment should explain/justify what its fine to have this lingering
side-effect.

If we want to avoid the side-effect then we need to fork() and run
unshare() in the child, and use a check of exit status of the child
to determine the result.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


