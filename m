Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D789F36CDFC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 23:54:01 +0200 (CEST)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbVea-0002lD-UP
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 17:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lbVct-00021u-1k
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 17:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1lbVcq-0002Et-BE
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 17:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619560331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYEiooE6hCTVUo5eieG+jtzQK3yimXP4priwKJPwHIY=;
 b=eQ/8qUZ8COSWXZLpJLHOV7dl5sDPS7TJ9P7Gz4Wns07DTqyqWrzTgk7gh0FGLY8GGC71sD
 i40fWjeZ/Gik7OM8IgGRuYS2Znp0p/mqjDLyqdTEnRWNp0KPL071MdrZQVIL108nDnL6Hi
 kAXpmuGJAPPEysYpn1L6JWFvbQ9aiac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-UxNfJbGlN0Sge0j-sWz3yw-1; Tue, 27 Apr 2021 17:52:04 -0400
X-MC-Unique: UxNfJbGlN0Sge0j-sWz3yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F8D6801107;
 Tue, 27 Apr 2021 21:52:03 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.36.110.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA3BE60C0F;
 Tue, 27 Apr 2021 21:52:02 +0000 (UTC)
Received: from elisabeth (011-177-165-046.ip-addr.inexio.net [46.165.177.11])
 by maya.cloud.tilaa.com (Postfix) with ESMTPSA id EB08540098;
 Tue, 27 Apr 2021 23:52:01 +0200 (CEST)
Date: Tue, 27 Apr 2021 23:51:52 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Ralph Schmieder <ralph.schmieder@gmail.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
Message-ID: <20210427235152.6e1e080a@elisabeth>
In-Reply-To: <2DC6F891-4F28-4044-A055-0CDAB45A3C24@gmail.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth>
 <F0191BF0-7C7A-4587-8B94-BACA7E1F911F@gmail.com>
 <20210423183901.12a71759@redhat.com>
 <2DC6F891-4F28-4044-A055-0CDAB45A3C24@gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 13:14:48 +0200
Ralph Schmieder <ralph.schmieder@gmail.com> wrote:

> > On Apr 23, 2021, at 18:39, Stefano Brivio <sbrivio@redhat.com>
> > wrote:
> > 
> > [...]
> >
> > Okay, so it doesn't seem to fit your case, but this specific point
> > is where you actually have a small advantage using a stream-oriented
> > socket. If you receive a packet and have a smaller receive buffer,
> > you can read the length of the packet from the vnet header and then
> > read the rest of the packet at a later time.
> > 
> > With a datagram-oriented socket, you would need to know the maximum
> > packet size in advance, and use a receive buffer that's large
> > enough to contain it, because if you don't, you'll discard data.  
> 
> For me, the maximum packet size is a jumbo frame (e.g. 9x1024) anyway
> -- everything must fit into an atomic write of that size.

Well, the day you want to do some batching... ;) but sure, I see your
point.

> > [...]
> > 
> > On a side note, I wonder why you need two named sockets instead of
> > one -- I mean, they're bidirectional...  
> 
> Hmm... each peer needs to send unsolicited frames/packets to the
> other end... and thus needs to bind to their socket.  Pretty much for
> the same reason as the UDP transport requires you to specify a local
> and a remote 5-tuple.  Even though for AF_INET, the local port does
> not have to be specified, the OS would assign an ephemeral port to
> make it unique. Am I missing something?

I see your point now. Well, I think it's different from the AF_INET case
due to the way AF_UNIX works: UNIX domain sockets don't necessarily
need to make the endpoint known or visible, see a more detailed
explanation at:
	https://comp.unix.admin.narkive.com/AhAOKP1s/lsof-find-both-endpoints-of-a-unix-socket

Even though, nowadays on Linux:

$ nc -luU my_path & (sleep 1; nc.openbsd -uU my_path & lsof +E -aUc nc)
[1] 373285
COMMAND      PID    USER   FD   TYPE             DEVICE SIZE/OFF    NODE NAME
nc        373285 sbrivio    3u  unix 0x000000004076431a      0t0 3957568 my_path type=DGRAM ->INO=3956394 373288,nc.openbs,4u
nc.openbs 373288 sbrivio    4u  unix 0x00000000f5b2e2e1      0t0 3956394 /tmp/nc.XXXXC0whUu type=DGRAM ->INO=3957568 373285,nc,3u

for datagram sockets, the endpoint is exported, and lsof can report that
the endpoint for "my_path" here (-luU binds to a UNIX domain datagram
socket, -uU connects to it). With a stream socket, by the way:

$ nc -lU my_path & (sleep 1; nc.openbsd -U my_path & lsof +E -aUc nc)
[1] 375445
COMMAND      PID    USER   FD   TYPE             DEVICE SIZE/OFF    NODE NAME
nc        375445 sbrivio    3u  unix 0x0000000053abf57c      0t0 3969787 my_path type=STREAM
nc        375445 sbrivio    4u  unix 0x000000001960c1ef      0t0 3969788 my_path type=STREAM ->INO=3970624 375448,nc.openbs,3u
nc.openbs 375448 sbrivio    3u  unix 0x000000000538fa63      0t0 3970624 type=STREAM ->INO=3969788 375445,nc,4u

so I think it should be optional. Even with datagram sockets, just like
the example above (I'm not suggesting that you do this, it's just
another possible choice), only one peer needs to bind to a named
socket, and yet they can exchange data.

> Another thing: on Windows, there's a AF_UNIX/SOCK_STREAM
> implementation... So, technically it should be possible to use that
> code path on Windows, too.  Not a windows guy, though... So, can't
> say whether it would simply work or not:
> 
> https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/

Thanks for the pointer. I can't test this, so I wouldn't remove that
#ifndef, but perhaps I could add a link to this, in case somebody needs
it and stumbles upon this code path.

-- 
Stefano


