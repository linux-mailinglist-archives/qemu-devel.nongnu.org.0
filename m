Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE66209EF1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:56:36 +0200 (CEST)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joRQh-0002WZ-Ko
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1joRPZ-0001zu-Kz
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:55:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43686
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1joRPX-0002vF-Lq
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593089721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zPgGveoEcIPwwKuNjqOnkzQK7VIfWsWo7auf9xUDKyQ=;
 b=iG8cf/AupdCL/31BOcmSE09P55vsM1hlvMNFUYzA/OJxpRkrKWTpzwtF8M+tUPuNlO+Nq/
 3iM8AyKBOaqG+IeAu89HDGArai71e/g7jspXfz2uajT+B37PdLuMozppvRgo0Yjx0A3hNg
 n/p2NSQttCBLznICdFTNUcStIEzNBWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-QpKnL-S3P8CADkVQ9gntkw-1; Thu, 25 Jun 2020 08:55:19 -0400
X-MC-Unique: QpKnL-S3P8CADkVQ9gntkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A077E8464CF;
 Thu, 25 Jun 2020 12:55:18 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-4.rdu2.redhat.com [10.10.116.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D83B1101E66D;
 Thu, 25 Jun 2020 12:55:08 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 6AF69220244; Thu, 25 Jun 2020 08:55:08 -0400 (EDT)
Date: Thu, 25 Jun 2020 08:55:08 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Chirantan Ekbote <chirantan@chromium.org>
Subject: Re: [Virtio-fs] [PATCH 0/2] virtiofsd: drop Linux capabilities(7)
Message-ID: <20200625125508.GB149340@redhat.com>
References: <20200416164907.244868-1-stefanha@redhat.com>
 <20200618190816.GD3814@redhat.com> <20200618191655.GI2769@work-vm>
 <20200618192717.GE3814@redhat.com>
 <CAJFHJrrJzPLatNvw2xC3WYLbzCW0+DB+4UczQHGPBF9p+WGYQA@mail.gmail.com>
 <20200619191540.GI3154@redhat.com>
 <CAJFHJroGNbfO-tXqrod_snCHcnN4NKjX8t9LTeroyiNEwjtVcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJFHJroGNbfO-tXqrod_snCHcnN4NKjX8t9LTeroyiNEwjtVcQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
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

On Thu, Jun 25, 2020 at 12:19:39PM +0900, Chirantan Ekbote wrote:
[..]
> > Chirantan,
> >
> > So you ended up renaming all "trusted", "security" and "system" xattrs?
> > Only "user" xattrs are complete passthrough?
> >
> 
> No, we only rename "security" xattrs (except for selinux).
> 
> >
> > IOW, security.selinux will be renamed to user.virtiofs.security.selinux
> > on host?
> >
> 
> We don't relabel security.selinux because it only requires CAP_FOWNER
> in the process's user namespace and it also does its own MAC-based
> checks.  Also we have some tools that label files beforehand so it
> seemed easier to leave them unchanged.

If we rename selinux xattr also, then we can support selinux both in
guest and host and they both can have their own independent policies.

Otherwise we either have to disable selinux on host (if we want to
support it in guest) or somehow guest and how policies will have
to know about each other and be able to work together (which will
be hard for a generic use case).

Vivek


