Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C589D5ECAA8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:20:03 +0200 (CEST)
Received: from localhost ([::1]:37078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odEFW-00025b-MA
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1odDtP-0001WQ-QV
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1odDtM-0003jm-J9
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 12:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664297826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9GxowGyNkcClzXlNjE6ad3kwp1LEz8l53WRIJYYcCrw=;
 b=PuxlEJ2pFwoUdnXxBH7PlC8AXZQssPCdJ9VRlYxXws2nx7h6sRzfIdhBmmdrBQl1WgHCnX
 5iN8GGxZjfDEsBooQn8omV3k/vIHhYXu0j7Xy/0PK1MySrs2Iz8KMrWStr6kBGzBBbLwCG
 mX5vs8PrWpS07pvXE5HUSVwTKMhopHo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-XJmYNhHRMXiV8hsQU_FlZA-1; Tue, 27 Sep 2022 12:57:05 -0400
X-MC-Unique: XJmYNhHRMXiV8hsQU_FlZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B0F23C10226;
 Tue, 27 Sep 2022 16:57:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.8.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AFEA40C6EC2;
 Tue, 27 Sep 2022 16:57:05 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id DFB244A7A5; Tue, 27 Sep 2022 12:57:04 -0400 (EDT)
Date: Tue, 27 Sep 2022 12:57:04 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Colin Walters <walters@verbum.org>
Cc: qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 German Maglione <gmaglione@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: Re: virtiofsd: Any reason why there's not an "openat2" sandbox mode?
Message-ID: <YzMrYAJQeSP2hDSs@redhat.com>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzMmu3xfOtQwuFUx@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Tue, Sep 27, 2022 at 12:37:15PM -0400, Vivek Goyal wrote:
> On Fri, Sep 09, 2022 at 05:24:03PM -0400, Colin Walters wrote:
> > We previously had a chat here https://lore.kernel.org/all/348d4774-bd5f-4832-bd7e-a21491fdac8d@www.fastmail.com/T/
> > around virtiofsd and privileges and the case of trying to run virtiofsd inside an unprivileged (Kubernetes) container.
> > 
> > Right now we're still using 9p, and it has bugs (basically it seems like the 9p inode flushing callback tries to allocate memory to send an RPC, and this causes OOM problems)
> > https://github.com/coreos/coreos-assembler/issues/1812
> > 
> > Coming back to this...as of lately in Linux, there's support for strongly isolated filesystem access via openat2():
> > https://lwn.net/Articles/796868/
> > 
> > Is there any reason we couldn't do an -o sandbox=openat2 ?  This operates without any privileges at all, and should be usable (and secure enough) in our use case.
> 
> [ cc virtio-fs-list, german, sergio ]
> 
> Hi Colin,
> 
> Using openat2(RESOLVE_IN_ROOT) (if kernel is new enough), sounds like a
> good idea. We talked about it few times but nobody ever wrote a patch to
> implement it.
> 
> And it probably makes sense with all the sandboxes (chroot(), namespaces).
> 
> I am wondering that it probably should not be a new sandbox mode at all.
> It probably should be the default if kernel offers openat2() syscall.
> 
> Now all the development has moved to rust virtiofsd.
> 
> https://gitlab.com/virtio-fs/virtiofsd
> 
> C version of virtiofsd is just seeing small critical fixes.
> 
> And rust version allows running unprivileged (inside a user namespace).
> German is also working on allowing running unprivileged without
> user namespaces but this will not allow arbitrary uid/gid switching.
> 
> https://gitlab.com/virtio-fs/virtiofsd/-/merge_requests/136
> 
> If one wants to run unprivileged and also do arbitrary uid/gid switching,
> then you need to use user namepsaces and map a range of subuid/subgid
> into the user namepsace virtiofsd is running in.
> 
> If possible, please try to use rust virtiofsd for your situation. Its
> already packaged for fedora.
> 
> Coming back to original idea of using openat2(), I think we should
> probably give it a try in rust virtiofsd and if it works, it should
> work across all the sandboxing modes.

Thinking more about it, enabling openat2() usage conditionally based on
some option probably is not a bad idea. I was assuming that using
openat2() by default will not break any of the existing use cases. But
I am not sure. I have burnt my fingers so many times and had to back
out on default settings that enabling usage of openat2() conditionally
will probably be a safer choice. :-)

Vivek


