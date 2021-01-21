Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE75F2FF2DC
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:09:18 +0100 (CET)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eOT-000086-QP
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2eNI-0007RF-9z
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:08:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l2eNC-0004cC-7X
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611252476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JEfg91RsOe/av34AtN9XwVGJDUbXeuAur+120ibSiRA=;
 b=f3GnQfkp8WSUPSqPiibPIg0P9lIaGGVRlm1H0A9vZpNFWBBHLCx+Phae3WjgterDX+Lfca
 V79L/8kDe5x9dEhpf19bUQqPDTEcFwcXY0DPE6vmHC72QTPEQHgfhhLc1u4D6ga5lTKykY
 L8yWv1Z+7CtdVR1Krpg0jsLddEqkjxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-YsSb0dvKOheLMoFkPKhZaA-1; Thu, 21 Jan 2021 13:07:54 -0500
X-MC-Unique: YsSb0dvKOheLMoFkPKhZaA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10B0B18C8C0C;
 Thu, 21 Jan 2021 18:07:53 +0000 (UTC)
Received: from work-vm (ovpn-115-101.ams2.redhat.com [10.36.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EEF161F55;
 Thu, 21 Jan 2021 18:07:49 +0000 (UTC)
Date: Thu, 21 Jan 2021 18:07:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: Add _llseek to the seccomp whitelist
Message-ID: <20210121180746.GN3072@work-vm>
References: <20210121171540.1449777-1-groug@kaod.org>
 <20210121173553.GL3072@work-vm> <20210121185743.66138047@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20210121185743.66138047@bahia.lan>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> On Thu, 21 Jan 2021 17:35:53 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Greg Kurz (groug@kaod.org) wrote:
> > > This is how glibc implements lseek(2) on POWER.
> > > 
> > > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1917692
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > 
> > OK, I'm going to assume that _llseek is present on pretty much
> > everything?
> > 
> 
> I've only manually checked it is present on fedora x86,
> but this patch successfully passed gitlab CI and travis
> before being posted.

Ok, great - with the newer syscalls we had to be more careful; but this
seems older.

Dave

> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > > ---
> > >  tools/virtiofsd/passthrough_seccomp.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> > > index a60d7da4b4e2..1ecf5bf318b3 100644
> > > --- a/tools/virtiofsd/passthrough_seccomp.c
> > > +++ b/tools/virtiofsd/passthrough_seccomp.c
> > > @@ -65,6 +65,7 @@ static const int syscall_whitelist[] = {
> > >      SCMP_SYS(linkat),
> > >      SCMP_SYS(listxattr),
> > >      SCMP_SYS(lseek),
> > > +    SCMP_SYS(_llseek), /* For POWER */
> > >      SCMP_SYS(madvise),
> > >      SCMP_SYS(mkdirat),
> > >      SCMP_SYS(mknodat),
> > > -- 
> > > 2.26.2
> > > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


