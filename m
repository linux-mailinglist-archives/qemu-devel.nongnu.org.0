Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94D22B0DA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 15:57:05 +0200 (CEST)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jybia-00047F-HU
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 09:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1jybhr-0003f5-4U
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:56:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52350
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1jybho-0001mv-Kn
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595512574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sFajibqmkKg6QpXeK2bQ916jthKVU9mU9g4SXH3fuM=;
 b=FhSiwf1ekrVeaESPeJkSSH6mB1j3unC+8HFuNMuGh4kozlOkLkYeUCS60RuT3vr+EwxBfp
 hifZEq+ULJKwSiVW62+FaMm5r9WKiZFNrDyYLZOGoWwgmFLKMIHN9kxbtYSIh4EqQUsHPG
 fid3zajAXvg2gZIfdoOa5ZYWrw/wJDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-IWzaUm8CNheByVKZ63IP7w-1; Thu, 23 Jul 2020 09:56:11 -0400
X-MC-Unique: IWzaUm8CNheByVKZ63IP7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EF62100A8EA
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 13:56:10 +0000 (UTC)
Received: from horse.redhat.com (ovpn-118-146.rdu2.redhat.com [10.10.118.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 540575C1D3;
 Thu, 23 Jul 2020 13:56:04 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B32452204C7; Thu, 23 Jul 2020 09:56:03 -0400 (EDT)
Date: Thu, 23 Jul 2020 09:56:03 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [Virtio-fs] [PATCH for-5.1 3/3] virtiofsd: probe
 unshare(CLONE_FS) and print an error
Message-ID: <20200723135603.GB5885@redhat.com>
References: <20200722130206.224898-1-stefanha@redhat.com>
 <20200722130206.224898-4-stefanha@redhat.com>
 <20200722170328.GU2324845@redhat.com>
 <20200723124611.GL186372@stefanha-x1.localdomain>
 <20200723125035.GH2615312@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200723125035.GH2615312@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 22:13:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, rmohr@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, vromanso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 23, 2020 at 01:50:35PM +0100, Daniel P. Berrangé wrote:
> On Thu, Jul 23, 2020 at 01:46:11PM +0100, Stefan Hajnoczi wrote:
> > On Wed, Jul 22, 2020 at 06:03:28PM +0100, Daniel P. Berrangé wrote:
> > > On Wed, Jul 22, 2020 at 02:02:06PM +0100, Stefan Hajnoczi wrote:
> > > > An assertion failure is raised during request processing if
> > > > unshare(CLONE_FS) fails. Implement a probe at startup so the problem can
> > > > be detected right away.
> > > > 
> > > > Unfortunately Docker/Moby does not include unshare in the seccomp.json
> > > > list unless CAP_SYS_ADMIN is given. Other seccomp.json lists always
> > > > include unshare (e.g. podman is unaffected):
> > > > https://raw.githubusercontent.com/seccomp/containers-golang/master/seccomp.json
> > > > 
> > > > Use "docker run --security-opt seccomp=path/to/seccomp.json ..." if the
> > > > default seccomp.json is missing unshare.
> > > > 
> > > > Cc: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > >  tools/virtiofsd/fuse_virtio.c | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > > 
> > > > diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> > > > index 3b6d16a041..ebeb352514 100644
> > > > --- a/tools/virtiofsd/fuse_virtio.c
> > > > +++ b/tools/virtiofsd/fuse_virtio.c
> > > > @@ -949,6 +949,19 @@ int virtio_session_mount(struct fuse_session *se)
> > > >  {
> > > >      int ret;
> > > >  
> > > > +    /*
> > > > +     * Test that unshare(CLONE_FS) works. fv_queue_worker() will need it. It's
> > > > +     * an unprivileged system call but some Docker/Moby versions are known to
> > > > +     * reject it via seccomp when CAP_SYS_ADMIN is not given.
> > > > +     */
> > > > +    ret = unshare(CLONE_FS);
> > > > +    if (ret == -1 && errno == EPERM) {
> > > > +        fuse_log(FUSE_LOG_ERR, "unshare(CLONE_FS) failed with EPERM. If "
> > > > +                "running in a container please check that the container "
> > > > +                "runtime seccomp policy allows unshare.\n");
> > > > +        return -1;
> > > > +    }
> > > > +
> > > 
> > > This describes the unshare() call as a "probe" and a "test", but that's
> > > misleading IMHO. A "probe" / "test" implies that after it has completed,
> > > there's no lingering side-effect, which isn't the case here.
> > > 
> > > This is actively changing the process' namespace environment in the
> > > success case, and not putting it back how it was originally.
> > > 
> > > May be this is in fact OK, but if so I think the commit message and
> > > comment should explain/justify what its fine to have this lingering
> > > side-effect.
> > > 
> > > If we want to avoid the side-effect then we need to fork() and run
> > > unshare() in the child, and use a check of exit status of the child
> > > to determine the result.
> > 
> > Thanks for pointing this out. I'll add a comment explaining that
> > virtiofsd is single-threaded at this point. No other threads share the
> > file system attributes so the call has no observable side-effects.
> 
> Also, if we do an unshare() here, do we still need the unshare() later
> on in the code ?

I think so. That unshare() later is to isolate one thread from other.

Thanks
Vivek


