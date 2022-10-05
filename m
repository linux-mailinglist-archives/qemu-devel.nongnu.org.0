Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A35F5BCC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 23:36:36 +0200 (CEST)
Received: from localhost ([::1]:42202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogC4B-0001Ea-L6
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 17:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ogBxw-0005cG-2v
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1ogBxp-0005Fb-3E
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665005396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RPGb06g3u3dLIYreuGz5UP9flOu+pnVv+vk2s9/Ws2o=;
 b=Gwh5JiF8s0zvxeiw6RNDEB+2FVkIpyoSbK3k8anUY/bObtV/B4jRJmrsNQ4cAoKaokI8Uv
 mbldqrhEwDOf2GkJLX2tXAess5brlmB5U9oZ6cenls/6TUOBm4tGs+DpRs6NEGnxvIWZYK
 fyZhfD9kQWZMy3FNsvGstB/1Xvy52b8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-xScfA8ybM0Gybfy9BAPRHQ-1; Wed, 05 Oct 2022 17:29:56 -0400
X-MC-Unique: xScfA8ybM0Gybfy9BAPRHQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A16161C05192;
 Wed,  5 Oct 2022 21:29:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.33.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DCC9492B05;
 Wed,  5 Oct 2022 21:29:55 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id D0FBE50A48; Wed,  5 Oct 2022 17:29:54 -0400 (EDT)
Date: Wed, 5 Oct 2022 17:29:54 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Colin Walters <walters@verbum.org>
Cc: Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 German Maglione <gmaglione@redhat.com>
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
Message-ID: <Yz33UikaqR4cagWK@redhat.com>
References: <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora>
 <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
 <YzSgeDdpHOw1hTM0@redhat.com>
 <b963f623-aa85-4285-9bfa-5fcb4744c354@app.fastmail.com>
 <YzWnPZ5Y6ivS8e1v@redhat.com>
 <b1cf0d02-cc45-4f5c-bfef-fda3e750bef3@app.fastmail.com>
 <YzXP8XhCG5ta2Dvv@redhat.com>
 <aa26d28d-d352-467c-910c-ab5973a6d759@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa26d28d-d352-467c-910c-ab5973a6d759@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 03, 2022 at 06:51:42PM -0400, Colin Walters wrote:
> 
> 
> On Thu, Sep 29, 2022, at 1:03 PM, Vivek Goyal wrote:
> > 
> > So rust version of virtiofsd, already supports running unprivileged
> > (inside a user namespace).
> 
> I know, but as I already said, the use case here is running inside an OpenShift unprivileged pod where *we are already in a container*.
> 
> > host$ podman unshare -- virtiofsd --socket-path=/tmp/vfsd.sock 
> > --shared-dir /mnt \
> >         --announce-submounts --sandbox chroot &
> 
> Yes, but in current OCP 4.11 our seccomp policy denies CLONE_NEWUSER:

Hmm..., no user namespaces allowed. 

So sandbox=none in theory should work once we fix it for unprivileged
user.

https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/136

Given you are already running inside a pod/container, not sure if
locking down virtiofsd with openat2(RESOLVE_IN_ROOT)/landlock is
must for you from security point of view. virtiofsd should not be
able to access anything outside the pod/container anyway and can
only affect things inside the pod/container.

Once we add support for openat2(). Next issue is do you need
arbitrary uid/gid support. By default it will be a single uid/gid
filesystem. Is that enough for your use case? Or inside the guest
you need to be able to switch between arbitrary uid/gid on this
virtiofs filesystem.



> 
> ```
> $ unshare -m
> unshare: unshare failed: Function not implemented
> ```
> 
> https://docs.openshift.com/container-platform/4.11/security/seccomp-profiles.html
> 
> > I think only privileged operation it needs is assigning a range of
> > subuid/subgid to the uid you are using on host.
> 
> We also turn on NO_NEW_PRIVILEGES by default in OCP pods.  
> 
> Now, I *could* in general get elevated permissions where I need to today.  But it's also really important to me to have a long term goal of having operating system builds and tests work well as "just another workload" in our production container platform (now, one *does* want to bind in /dev/kvm, but that's generally safe, and even that strictly speaking is optional if one can stomach the ~10x perf hit).

I am assuming this 10x performance hit is being compared with native
container build and test where no VM will be launched.


> 
> > Can you give rust virtiofsd (unprivileged) a try.
> 
> I admit to not actually trying it in a pod, but I think we all agree it can't work, and the only thing that can today is openat2.

Agreed. Right now we rely on using user namespace for unpriviliged use
case. 

We should be able to enable sandbox=none for unprivileged user (no user
namespace) and possibly add openat2() support as well. 

I think being able to provide arbitrary uid/gid support will be more
tricky and more work. It will need to store actual uid/gid into some
sort of user xattr. (as done by 9pfs and fuse-overlay and libkrun etc).
And I will not be surprised that there are bunch of corner cases using
that approach. (setuid/setgid automatic clearing etc.)

Thanks
Vivek


