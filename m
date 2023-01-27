Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6B67F061
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 22:27:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLWEq-00075W-Rj; Fri, 27 Jan 2023 16:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLWEo-00074o-Pg
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 16:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pLWEm-0000Ap-Vj
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 16:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674854779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5joQAFDvnzFVS4QE265Iy6mQ5n6ABt7DgSb2bnviCF8=;
 b=KxqYvwm6nTKFMzg9pLp3s6LqhzoyPMnhgdhyWgZDKIS6vNX1j3YZGKEE2MuDc5x3ApiApw
 /uBhyaL8qfmM48y84Oc+fE/mtTnz4cieMtlJTpHhAUVzk6KWOOIRFhY7I2wk45J1Wv1/mg
 qON7WdoSZCIqggQWYHvyWXQtNDUnHpo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-ucvhHb5LMcS19ARI87Vndw-1; Fri, 27 Jan 2023 16:26:18 -0500
X-MC-Unique: ucvhHb5LMcS19ARI87Vndw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D5E29AA3B3;
 Fri, 27 Jan 2023 21:26:17 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58ECA492C14;
 Fri, 27 Jan 2023 21:26:17 +0000 (UTC)
Date: Fri, 27 Jan 2023 15:26:15 -0600
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: berrange@redhat.com, rjones@redhat.com, kwolf@redhat.com
Subject: RFC: towards systemd socket activation in q-s-d
Message-ID: <20230127212233.k6rlqkmubhovjxs4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In https://bugzilla.redhat.com/show_bug.cgi?id=2055229, the question
was raised on how to make qemu-storage-daemon sufficiently powerful to
be a full-blown replacement to qemu-nbd.  One of the features still
lacking is the ability to do systemd socket activation (qemu-nbd does
this, qemu-storage-daemon needs a way to do it).

But that bug further noted that systemd supports LISTEN_FDNAMES to
supply names to a passed-in fd (right now, qemu-nbd does not use
names, but merely expects one fd in LISTEN_FDS).  Dan had the idea
that it would be nice to write a systemd file that passes in a socket
name for a QMP socket, as in:

 [Socket]
 ListenStream=/var/run/myapp/qsd.qmp
 FileDescriptorName=qmp
 Service=myapp-qsd.service

and further notes that QAPI SocketAddressType supports @fd which is a
name in QMP (a previously-added fd passed through the older 'getfd'
command, rather than the newer 'add-fd' command), but an integer on
the command line.  With LISTEN_FDNAMES, we could mix systemd socket
activation with named fds for any command line usage that already
supports SocketAddressType (not limited to just q-s-d usage).

I'm at a point where I can take a shot at implementing this, but want
some feedback on whether it is better to try to shoehorn a generic
solution into the existing @fd member of the SocketAddressType union,
or whether it would be better to add yet another union member
@systemd-fd or some similar name to make it explicit when a command
line parameter wants to refer to an fd being passed through systemd
socket activation LISTEN_FDS and friends.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


