Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DD9681597
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMWRy-0002DG-2P; Mon, 30 Jan 2023 10:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMWRv-00025i-2l
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:52:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMWRs-0002iS-GF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675093918;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyxDox3bOgeHZ3XIkezoyoegI3o7dbDIAVvrICG4t6g=;
 b=McFmESZDFtJslmwRt1d3++flPfst8taYwBh3EIbt4N9PDVGuF/PKGZR0iuzXC/Cj5OsumA
 UZtTnVbBFnJEmNH/516xBuUhEhF0TRH4rQ8Exwo3xEyNhRDcmPWfLyGJL0LZATHlHNM5N3
 qRZkwFO0DcePpEluNillptcto+L/Ee4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-G_e97LcRPUGl3kit7aiFoQ-1; Mon, 30 Jan 2023 10:51:57 -0500
X-MC-Unique: G_e97LcRPUGl3kit7aiFoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7FBC296A629;
 Mon, 30 Jan 2023 15:51:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC1CD2026D4B;
 Mon, 30 Jan 2023 15:51:54 +0000 (UTC)
Date: Mon, 30 Jan 2023 15:51:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, kwolf@redhat.com
Subject: Re: RFC: towards systemd socket activation in q-s-d
Message-ID: <Y9fnmIDV3gh5e9o7@redhat.com>
References: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
 <Y9fa+Zm5VLNoDDo0@redhat.com> <20230130154448.GS7636@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130154448.GS7636@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 30, 2023 at 03:44:48PM +0000, Richard W.M. Jones wrote:
> On Mon, Jan 30, 2023 at 02:58:01PM +0000, Daniel P. Berrangé wrote:
> > Obviously at startup QEMU can trivially inherit the FDs from whatever
> > spawned it. The only task is to identify the FDs that are passed into,
> > and systemd defined a mechanism for this using LISTEN_FDNAMES. IOW the
> > socket activation can fully replace 'getfd' for purpose of initial
> > startup. This will get rid of the annoying difference that SocketAddress
> > only allows numeric FDs at startup and named FDs at runtime, by making
> > named FDs the consistent standard. We could thus deprecate the use of
> > non-named numeric FDs in SocketAddress to improve our sanity.
> > 
> > The question is how to define semantics for the LISTEN_FDNAMES while
> > also still remaining back compat with the existing QEMU utilities
> > that allow socket activation. Some kind of naming scheme would need
> > to be decided upon, as well as handling the use of activation without
> > LISTEN_FDNAMES being set. 
> 
> If I understand LISTEN_FDNAMES correctly, it's the names of the
> protocols to be used (rather clumsily expressed through IANA
> registered names from /etc/services).  It would be valid to use
> LISTEN_FDNAMES=http:http for example, for a service that must use HTTP
> on both sockets.

That's not accurate, it is not related to IANA service names.

> In other words it's not just names of file descriptors that you can
> make up.

By default the FD name matches the name of the systemd .socket unit
file, but it can be set to an arbitrary string using FileDescriptorName=.
It is upto the application to decide if it wants to require specific
file naming schemes, or is happy to receive the default system .socket
based names.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


