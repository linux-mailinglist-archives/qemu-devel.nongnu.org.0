Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CD201B17
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 21:16:48 +0200 (CEST)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmMVL-0004yi-KJ
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 15:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1jmMUT-0004RN-Jc
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 15:15:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50127
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1jmMUR-00010z-Uz
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 15:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592594150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t21k1U6S7U9WKM5QqQkL3iAtt4A8qkLHkkfB0i72AsI=;
 b=AzS/16qde7dBVsTNPl6xxYJkW1OfpEYSOFnej4Du4wKgNWkuCqPQOe8sey3oWodX5wzl5/
 8mXZ8INNvBpmw4xClQR/EvCRhIbv+SoacPlk6/WG+pNOJYl+hwa6TtxyelV2/WYxgzFntC
 TE/qRyePXZnLKngPHyDwtRbwWy0JjCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-4nsCQTVRNBaYgLem4TwigQ-1; Fri, 19 Jun 2020 15:15:47 -0400
X-MC-Unique: 4nsCQTVRNBaYgLem4TwigQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D32DBFC3;
 Fri, 19 Jun 2020 19:15:41 +0000 (UTC)
Received: from horse.redhat.com (ovpn-114-35.rdu2.redhat.com [10.10.114.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 319D32AF4D;
 Fri, 19 Jun 2020 19:15:41 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id AC260220390; Fri, 19 Jun 2020 15:15:40 -0400 (EDT)
Date: Fri, 19 Jun 2020 15:15:40 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Chirantan Ekbote <chirantan@chromium.org>
Subject: Re: [Virtio-fs] [PATCH 0/2] virtiofsd: drop Linux capabilities(7)
Message-ID: <20200619191540.GI3154@redhat.com>
References: <20200416164907.244868-1-stefanha@redhat.com>
 <20200618190816.GD3814@redhat.com> <20200618191655.GI2769@work-vm>
 <20200618192717.GE3814@redhat.com>
 <CAJFHJrrJzPLatNvw2xC3WYLbzCW0+DB+4UczQHGPBF9p+WGYQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJFHJrrJzPLatNvw2xC3WYLbzCW0+DB+4UczQHGPBF9p+WGYQA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:45:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 19, 2020 at 01:46:20PM +0900, Chirantan Ekbote wrote:
> On Fri, Jun 19, 2020 at 4:27 AM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Thu, Jun 18, 2020 at 08:16:55PM +0100, Dr. David Alan Gilbert wrote:
> > > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > > On Thu, Apr 16, 2020 at 05:49:05PM +0100, Stefan Hajnoczi wrote:
> > > > > virtiofsd doesn't need of all Linux capabilities(7) available to root.  Keep a
> > > > > whitelisted set of capabilities that we require.  This improves security in
> > > > > case virtiofsd is compromised by making it hard for an attacker to gain further
> > > > > access to the system.
> > > >
> > > > Hi Stefan,
> > > >
> > > > I just noticed that this patch set breaks overlayfs on top of virtiofs.
> > > >
> > > > overlayfs sets "trusted.overlay.*" and xattrs in trusted domain
> > > > need CAP_SYS_ADMIN.
> > > >
> 
> Not just that but it needs CAP_SYS_ADMIN in the init namespace[1].  We
> have the same problem.  Our virtiofs process has CAP_SYS_ADMIN in a
> user namespace and it cannot set any trusted or security xattrs.  The
> security xattrs check is at least namespace aware so you only need
> CAP_SYS_ADMIN in the namespace that mounted the fs but that doesn't
> help us much.
> 
> We ended up working around it by prefixing "user.virtiofs." to the
> xattr name[2], which has its own problems but there was pretty much no
> chance that we would be able to give the fs device CAP_SYS_ADMIN in
> the init namespace.

Chirantan, 

So you ended up renaming all "trusted", "security" and "system" xattrs?
Only "user" xattrs are complete passthrough?

IOW, security.selinux will be renamed to user.virtiofs.security.selinux
on host?

Thanks
Vivek


