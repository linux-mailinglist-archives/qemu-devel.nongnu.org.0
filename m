Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C8767F5CE
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 08:52:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLfzU-0001xw-K5; Sat, 28 Jan 2023 02:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pLfzO-0001vQ-PX
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 02:51:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1pLfzJ-00055S-SR
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 02:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674892261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NKhFxAMR8g325BDIgIg+y3a5WRV0QjaPLiyYEkF+pR4=;
 b=BBZbEhZgzzoV6Szy7Y4HBLi9374FfAN7FI+GHBc9QMlFhhjIa9jOvbrk0hPuw8wgF05BFA
 qFpmSeE4UinZJzBsFeJCMWUV1SPHpOTFM1cOyLKTFj2gtviInbMEUW7dLV+m0nBc+rhTKL
 yh6+7yrKRYtjbwP2fPy3E4rqBOrYLXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-3MCYCe-wNYu60bEQbf8odA-1; Sat, 28 Jan 2023 02:49:38 -0500
X-MC-Unique: 3MCYCe-wNYu60bEQbf8odA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F96585C069;
 Sat, 28 Jan 2023 07:49:37 +0000 (UTC)
Received: from localhost (unknown [10.39.195.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2A392166B26;
 Sat, 28 Jan 2023 07:49:36 +0000 (UTC)
Date: Sat, 28 Jan 2023 07:49:35 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, berrange@redhat.com,
 kwolf@redhat.com
Subject: Re: RFC: towards systemd socket activation in q-s-d
Message-ID: <20230128074935.GO7636@redhat.com>
References: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 27, 2023 at 03:26:15PM -0600, Eric Blake wrote:
> In https://bugzilla.redhat.com/show_bug.cgi?id=2055229, the question
> was raised on how to make qemu-storage-daemon sufficiently powerful to
> be a full-blown replacement to qemu-nbd.  One of the features still
> lacking is the ability to do systemd socket activation (qemu-nbd does
> this, qemu-storage-daemon needs a way to do it).
> 
> But that bug further noted that systemd supports LISTEN_FDNAMES to
> supply names to a passed-in fd (right now, qemu-nbd does not use
> names, but merely expects one fd in LISTEN_FDS).  Dan had the idea
> that it would be nice to write a systemd file that passes in a socket
> name for a QMP socket, as in:
> 
>  [Socket]
>  ListenStream=/var/run/myapp/qsd.qmp
>  FileDescriptorName=qmp
>  Service=myapp-qsd.service
> 
> and further notes that QAPI SocketAddressType supports @fd which is a
> name in QMP (a previously-added fd passed through the older 'getfd'
> command, rather than the newer 'add-fd' command), but an integer on
> the command line.  With LISTEN_FDNAMES, we could mix systemd socket
> activation with named fds for any command line usage that already
> supports SocketAddressType (not limited to just q-s-d usage).

I couldn't find a good description of LISTEN_FDNAMES anywhere, and we
don't use it in libnbd / nbdkit / qemu-nbd right now.  So here's my
interpretation of what this environment variable means ...

Currently systemd socket activation in qemu-nbd or nbdkit uses only
LISTEN_PID and LISTEN_FDS, usually with a single fd being passed.
(I'll ignore LISTEN_PID.)  So:

  LISTEN_FDS=1
    fd 3 --> NBD socket

This works because there's only one NBD protocol, it doesn't need to
be named.

However if we imagine that a superserver wants to run a webserver, it
might need to pass two sockets carrying distinct protocols (HTTP and
HTTPS).  In this case it would use:

  LISTEN_FDS=2
    fd 3 --> HTTP socket
    fd 4 --> HTTPS socket
  LISTEN_FDNAMES=http:https

LISTEN_FDNAMES is telling the webserver that the first socket is HTTP
and the second is HTTPS, so it knows which protocol to negotiate on
each socket.

I believe what you're saying above is that you'd like to have the
ability to pass multiple sockets to q-s-d carrying distinct protocols,
with the obvious ones being NBD + QMP (although other combinations
could be possible, eg. NBD + vhost + QMP?):

  LISTEN_FDS=2
    fd 3 --> NBD socket
    fd 4 --> QMP socket
  LISTEN_FDNAMES=nbd:qmp

If my understanding is correct, then this makes sense.  We might also
modify libnbd to pass LISTEN_FDNAMES=nbd in:

  https://gitlab.com/nbdkit/libnbd/-/blob/master/generator/states-connect-socket-activation.c

(Current servers would ignore the new environment variable.)

> I'm at a point where I can take a shot at implementing this, but want
> some feedback on whether it is better to try to shoehorn a generic
> solution into the existing @fd member of the SocketAddressType union,
> or whether it would be better to add yet another union member
> @systemd-fd or some similar name to make it explicit when a command
> line parameter wants to refer to an fd being passed through systemd
> socket activation LISTEN_FDS and friends.

It sounds like the q-s-d command lines will be even more convoluted
and inelegant than before.

That's fine, but please keep qemu-nbd around as a sane alternative.
It might in the end just be a wrapper that translates the command line
to q-s-d.  I don't believe it's ever going to be possible or desirable
to deprecate or remove qemu-nbd.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


