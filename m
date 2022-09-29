Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566635EFC8E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 20:00:09 +0200 (CEST)
Received: from localhost ([::1]:42290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxpN-0005X1-IW
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 14:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1odwx4-0007yP-W1
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1odwww-0000Vd-Lp
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664471029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uqdJKino+WGH39SvgH4nladSze3TiEm6JjOeBEiq17E=;
 b=H6cYxVD5bYnN/J4jfYXwbe2nGnpP/Q6nAIsYXOVxPuzsq2zgpbQqTKjUVMPsd1wSmmOJMF
 xOg9QOuvUWQZnROyJio5VBLn5D5M0EJHNy5sfFjIsTphO+JNfQiWRZv8zVNtsQYWO9gkHd
 KOuHQUU6DcUTXi9+icIlxqXTVoia7Fg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-0_eeVH5pPBSGHOx8paTymA-1; Thu, 29 Sep 2022 13:03:46 -0400
X-MC-Unique: 0_eeVH5pPBSGHOx8paTymA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8CA5101A528;
 Thu, 29 Sep 2022 17:03:45 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.9.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEC9CC15BB1;
 Thu, 29 Sep 2022 17:03:45 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id 5B5204B01F; Thu, 29 Sep 2022 13:03:45 -0400 (EDT)
Date: Thu, 29 Sep 2022 13:03:45 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Colin Walters <walters@verbum.org>
Cc: Sergio Lopez <slp@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 German Maglione <gmaglione@redhat.com>
Subject: Re: [Virtio-fs] virtiofsd: Any reason why there's not an "openat2"
 sandbox mode?
Message-ID: <YzXP8XhCG5ta2Dvv@redhat.com>
References: <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
 <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
 <YzNZnPiUqySu6sGh@fedora>
 <20220928083340.eyizwu6mm3cc3bxu@mhamilton>
 <YzSgeDdpHOw1hTM0@redhat.com>
 <b963f623-aa85-4285-9bfa-5fcb4744c354@app.fastmail.com>
 <YzWnPZ5Y6ivS8e1v@redhat.com>
 <b1cf0d02-cc45-4f5c-bfef-fda3e750bef3@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1cf0d02-cc45-4f5c-bfef-fda3e750bef3@app.fastmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Sep 29, 2022 at 11:47:32AM -0400, Colin Walters wrote:
> 
> 
> On Thu, Sep 29, 2022, at 10:10 AM, Vivek Goyal wrote:
> 
> > What's your use case. How do you plan to use virtiofs.
> 
> At the current time, the Kubernetes that we run does not support user namespaces.  We want to do the production builds of our operating system (Fedora CoreOS and RHEL CoreOS) today inside an *unprivileged* Kubernetes pod (actually in OpenShift using anyuid, i.e. random unprivileged uid too), just with /dev/kvm exposed from the host (which is safe).  Operating system builds *and* tests in qemu are just another workload that can be shared with other tenants.
> 
> qemu works fine in this model, as does 9p.  It's just the virtiofs isolation requires privileges to be used today.

[ cc German ]

Hi Colin,

So rust version of virtiofsd, already supports running unprivileged
(inside a user namespace).

https://gitlab.com/virtio-fs/virtiofsd/-/blob/main/README.md#running-as-non-privileged-user

host$ podman unshare -- virtiofsd --socket-path=/tmp/vfsd.sock --shared-dir /mnt \
        --announce-submounts --sandbox chroot &

I think only privileged operation it needs is assigning a range of
subuid/subgid to the uid you are using on host.

I think that should be usable for you as of now.

Having said that, openat2() and landlock are interesting improvements,
especially when somebody does not want to use user namespaces. Without
user namespaces, one will not be able to do arbitrary swithing of uid/gid.
IOW, inside guest, you will be limited to one uid/gid.

I am hoping German or somebody else can have a look openat2() and landlock
improvements in near future.

I am assuming you are fine with using user namespaces on host. And by
assigning subuid/subgid range, it will allow you arbitrary swithching
of uid/gid inside guest.

Can you give rust virtiofsd (unprivileged) a try.

Thanks
Vivek


