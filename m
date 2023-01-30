Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70D6816C1
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 17:45:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMXHY-0006Zq-5h; Mon, 30 Jan 2023 11:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMXHS-0006Xn-9C
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:45:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMXHP-0005ZD-Lj
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 11:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675097114;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyunV7e3ASfwglHAUyPSK4LzvXJkAdbZJoj/oxFSjoc=;
 b=Uf6/BcNl5BHr9QDNdCZEIRMtzj7AIRQXiS3sYBjtvDsIItfBpJj82lhccUaI7uier+giXY
 VfwJqPyIeCZVuk0ECD7Z94Y+RWnszIMaDUXsEn6s14gWgRCHOA8z4qauEh7pK0HniZHCiD
 lWqNW4T1D0VKbkKIGEyL8TgTeORgu+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-y1FQsLQ0N8GGK1PpPikLQw-1; Mon, 30 Jan 2023 11:45:13 -0500
X-MC-Unique: y1FQsLQ0N8GGK1PpPikLQw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04297802C18;
 Mon, 30 Jan 2023 16:45:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72045492B05;
 Mon, 30 Jan 2023 16:45:11 +0000 (UTC)
Date: Mon, 30 Jan 2023 16:45:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, rjones@redhat.com, kwolf@redhat.com
Subject: Re: RFC: towards systemd socket activation in q-s-d
Message-ID: <Y9f0FNvmYwaDzyn1@redhat.com>
References: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
 <Y9fa+Zm5VLNoDDo0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9fa+Zm5VLNoDDo0@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Mon, Jan 30, 2023 at 02:58:01PM +0000, Daniel P. Berrangé wrote:
> > I'm at a point where I can take a shot at implementing this, but want
> > some feedback on whether it is better to try to shoehorn a generic
> > solution into the existing @fd member of the SocketAddressType union,
> > or whether it would be better to add yet another union member
> > @systemd-fd or some similar name to make it explicit when a command
> > line parameter wants to refer to an fd being passed through systemd
> > socket activation LISTEN_FDS and friends.
> 
> I don't think we should change SocketAddress at all, just use the
> @fd member that already exists, by fixing its semantics to always
> take an alphanumeric FD name and deprecate the use of pure numeric
> FD numbers.
> 
> Currently the socket code has an annoying structural connection
> to the monitor code, because the monitor is tracking the passed
> in FDs.
> 
> It would be nice to separate this by introducing some dedicated
> APIs for handling named FDs. The monitor can feed named FDs into
> this from getfd, and the CLI can feed named FDS into this from
> activation.   The socket code can then use these named FD handling
> APIs and thus isolate/detach itself from the monitor.

Some worked examples of what I would like to see being possible.

First the bare minimum, allowing a zero-conf setup (ok not possible
today, but lets assume QEMU can configure machine hardware entirely
via QMP):

  $ cat /etc/system/system/myvm.service
  [Unit]
  Description=My VM
  [Service]
  Exec=/usr/bin/qemu-system-x86_64 

  $ cat /etc/system/system/myvm-qmp.socket
  [Unit]
  Description=My VM QMP
  [Socket]
  ListenStream=/var/run/myvm-qmp.socket
  FileDescriptorName=qmp

So in this example, /usr/bin/qemu-system-x86_64 would be started
with no args, and LISTEN_FDS=1 and LISTEN_FDNAMES=qmp. QEMU will
have declared that 'qmp' is a reserved activation name that results
in creation of a QMP chardev.

This would be functionally equivalent to the following more explicit
syntax, which avoids the reserved name:

  $ cat /etc/system/system/myvm.service
  [Unit]
  Description=My VM
  [Service]
  Exec=/usr/bin/qemu-system-x86_64 -chardev socket,fd=control,id=qmp0 -qmp chardev=qmp0

  $ cat /etc/system/system/myvm-qmp.socket
  [Unit]
  Description=My VM QMP
  [Socket]
  ListenStream=/var/run/myvm-qmp.socket
  FileDescriptorName=control

which is LISTEN_FDS=1, LISTEN_FDNAMES=control

A more advanced usage would be to pass many FDs for different
tasks:

  $ cat /etc/system/system/myvm.service
  [Unit]
  Description=My VM
  [Service]
  Exec=/usr/bin/qemu-system-x86_64 \
     -chardev socket,fd=control,id=qmp0 -qmp chardev=qmp0 \
     -vnc fd=vnc-listen

  $ cat /etc/system/system/myvm-qmp.socket
  [Unit]
  Description=My VM QMP
  [Socket]
  ListenStream=/var/run/myvm-qmp.socket
  FileDescriptorName=control

  $ cat /etc/system/system/myvm-vnc.socket
  [Unit]
  Description=My VM VNC
  [Socket]
  ListenStream=0.0.0.0:5901
  FileDescriptorName=vnc

which is LISTEN_FDS=2, LISTEN_FDNAMES=control,vnc


This can apply to q-s-d too with the -export flag taking a FD name.
eg here we use the implicit QMP socket, and the explicit NBD exports:

  $ cat /etc/system/system/mydisks.service
  [Unit]
  Description=My DISKS
  [Service]
  Exec=/usr/bin/qemu-storage-daemon \
     -blockdev id=pubdisk,.... \
     -blockdev id=privdisk,.... \
     -export type=nbd,id=nbdpub,node-name=pubdisk,addr.type=fd,addr.fd=nbd-public
     -export type=nbd,id=nbdpub,node-name=privdisk,addr.type=fd,addr.fd=nbd-private

  $ cat /etc/system/system/mydisks-qmp.socket
  [Unit]
  Description=My disks QMP
  [Socket]
  ListenStream=/var/run/mydisks-qmp.socket
  FileDescriptorName=qmp

  $ cat /etc/system/system/mydisks-nbd-public.socket
  [Unit]
  Description=My disks Public
  [Socket]
  ListenStream=0.0.0.0:9000
  FileDescriptorName=nbd-public

  $ cat /etc/system/system/mydisks-nbd-private.socket
  [Unit]
  Description=My disks private
  [Socket]
  ListenStream=/var/run/mydisks-nbd-private.sock
  FileDescriptorName=nbd-private


which is LISTEN_FDS=3, LISTEN_FDNAMES=qmp,nbd-public,nbd-private, giving
you a QMP server on a UNIX socket, a private disk on a NBD UNIX socket
and a public disk on a NBD TCP socket.

The above system units are overly simplified for illustration, real
world ones would have more such as SocketMode for unit sockets and
dependencies, etc

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


