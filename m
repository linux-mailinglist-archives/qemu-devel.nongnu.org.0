Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC33F7CA3
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 21:21:24 +0200 (CEST)
Received: from localhost ([::1]:42062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIySh-00065K-8T
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 15:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mIyRh-0005RC-NM
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:20:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mIyRf-0001sk-6x
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629919218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JFJRc3pEHJESuaVj3XH96GD7wDo6iJGw3btejJvZEzA=;
 b=gsuy6ceuwx0zgyCozlQMMm1iVGjDEGF+f6tbSdrX4HOXKKPCbPTao8jgzYRLGf2Z7UXeJD
 PJF/9NWrvFkK3nsG86LBBkNVTI4Tg2XNFeuR0OD9+wovD5s4UPqMaX6+QTWpFZq2Vw1XbJ
 Os1p4cwiRWPtrf+9l+IMP8j8B2k3UPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-8e5nw9ofMxS5336VLRDipw-1; Wed, 25 Aug 2021 15:20:17 -0400
X-MC-Unique: 8e5nw9ofMxS5336VLRDipw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3DC107ACF5;
 Wed, 25 Aug 2021 19:20:16 +0000 (UTC)
Received: from redhat.com (ovpn-112-96.phx2.redhat.com [10.3.112.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFD126A057;
 Wed, 25 Aug 2021 19:20:07 +0000 (UTC)
Date: Wed, 25 Aug 2021 14:20:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH 2/2] monitor: allow VNC related QMP and HMP commands to
 take a display ID
Message-ID: <20210825192006.jklsbrdc43cojctq@redhat.com>
References: <20210825093701.668122-1-s.reiter@proxmox.com>
 <20210825093701.668122-3-s.reiter@proxmox.com>
 <CAJ+F1CKf5icfpA4X_kHQQJGfiHj+dvct9OqEvtOQ2UD4WPCbtw@mail.gmail.com>
 <4400f41b-4ecc-9340-a20d-8acdaae033be@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <4400f41b-4ecc-9340-a20d-8acdaae033be@proxmox.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Wolfgang Bumiller <w.bumiller@proxmox.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 01:26:09PM +0200, Stefan Reiter wrote:
> > It's not something done with other commands afaik, feels a bit awkward (the
> > "connected = display"...).
> > 
> 
> Indeed, if there is a better way I'd love to use it.
> 
> One idea I had was making the parameter 'connected' OR 'display', since
> the former only supports 'keep' for VNC anyway - but that introduces a
> weird double-meaning again.

That's not too bad.  See for example hmp_hostfwd_add, which merely
names its two arguments arg1 and arg2. Naming your argument 'arg'
instead of 'connected' or 'display' lets you interpret it in whatever
context-sensitive manner is easiest for your use case.

> > Is it really necessary to add support for HMP?
> > 
> 
> For us it would be, as we provide an easy HMP interface to our users, but
> not a QMP one, so it ended up being a bit of a regression with 6.0.

Okay, you do have a point that until users can reliably use QMP to do
the same, then keeping pre-existing HMP commands working is
worthwhile.  But long-term HMP stability is not an end goal.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


