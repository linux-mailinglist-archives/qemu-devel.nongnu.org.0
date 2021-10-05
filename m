Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C240A422B16
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:33:38 +0200 (CEST)
Received: from localhost ([::1]:45464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlVh-0000Jc-CG
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:33:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXlTU-0007z6-OL
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXlTR-0001g0-Fd
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=po4pqR4evJhWNqjYY5CcISaycYJrgd2P8PQsjGq2f20=;
 b=hNdnXOK4tZX1nZ6q0UmKUvCMJu3oUwZu6KFiNv7diy685i4MAw2lzTm2QAjyoGhT3a4t70
 GZ3TeXSKuinMMrwU6wjH0mVAj62dVnPnZpQ/UaNa6obEwo0ExiQW1l9SOg2asHO2/4gp8D
 P66uMQJrIZwippABHQNO6CZto9XxuFQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-UbFqj1n4Oim08HxHqPdo1Q-1; Tue, 05 Oct 2021 10:31:12 -0400
X-MC-Unique: UbFqj1n4Oim08HxHqPdo1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so1127324wmj.6
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 07:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=po4pqR4evJhWNqjYY5CcISaycYJrgd2P8PQsjGq2f20=;
 b=iLrtDhgKdlcuiUR4wc+ncMOepQW+LuKEMvcN1bUzUxyR3gyuS4na3044htrTsA3B1Z
 8Q2Z1Hnd4BxUL3jfuueCpb6S+vDfxlmOu7YVBuE0vY9RcMf0FptpVT66uOOCypBwY2/H
 LI8yH1seZTGJ4jm0k4FD42Svb2TJyxZQNzpHJbCWeH3Ic5KTnsXVWNLppg/wYPpI0mDn
 q4NtOgZAN7EFjmtGZAEoMsdktyhHxt6AtVnYw6XY5OeogrbTDmhLU9NnYj6qlfQ8opjK
 HAtYBBlI4uMFTft2+xjbrNxQ/RkfMuzuv5/9G4u93dPu2Z0LVged725ByDDIia8U0n1L
 7O7A==
X-Gm-Message-State: AOAM531qI+cYRo9Q/0AjNphtWeAazap8ram3rz0K4z8xJWaThTXYSXP/
 BOoLlHSSHybHjaDcZB8YVSj/9N6OFj4qgISsAebaaOv+Ez04C/eTNzg+Rr0dzJRnDS0Pq5eCQvZ
 cq6K874Fy4HctFro=
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr1719771wrd.418.1633444271089; 
 Tue, 05 Oct 2021 07:31:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIApn5RObkCIM6d27tOYoj2RrZlURpbigFQRKfJlbqW+Oxqw7ryhhU8fmEBCpog+CLR4tkjA==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr1719723wrd.418.1633444270783; 
 Tue, 05 Oct 2021 07:31:10 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id j6sm4200015wrh.76.2021.10.05.07.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 07:31:09 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:31:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Message-ID: <20211005102944-mutt-send-email-mst@kernel.org>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
 <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
 <20210930052900.GA15735@raphael-debian-dev>
 <YVWH2YUDLzaRxHYW@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVWH2YUDLzaRxHYW@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 10:48:09AM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 05:29:06AM +0000, Raphael Norwitz wrote:
> > On Tue, Sep 28, 2021 at 10:55:00AM +0200, Stefan Hajnoczi wrote:
> > > On Mon, Sep 27, 2021 at 05:17:01PM +0000, Raphael Norwitz wrote:
> > > > In the vhost-user-blk-test, as of now there is nothing stoping
> > > > vhost-user-blk in QEMU writing to the socket right after forking off the
> > > > storage daemon before it has a chance to come up properly, leaving the
> > > > test hanging forever. This intermittently hanging test has caused QEMU
> > > > automation failures reported multiple times on the mailing list [1].
> > > > 
> > > > This change makes the storage-daemon notify the vhost-user-blk-test
> > > > that it is fully initialized and ready to handle client connections by
> > > > creating a pidfile on initialiation. This ensures that the storage-daemon
> > > > backend won't miss vhost-user messages and thereby resolves the hang.
> > > > 
> > > > [1] https://lore.kernel.org/qemu-devel/CAFEAcA8kYpz9LiPNxnWJAPSjc=nv532bEdyfynaBeMeohqBp3A@mail.gmail.com/
> > > 
> > 
> > Hey Stefan,
> > 
> > > Hi Raphael,
> > > I would like to understand the issue that is being worked around in the
> > > patch.
> > > 
> > > QEMU should be okay with listen fd passing. The qemu-storage-daemon
> > > documentation even contains example code for this
> > > (docs/tools/qemu-storage-daemon.rst) and that may need to be updated if
> > > listen fd passing is fundamentally broken.
> > > 
> > 
> > The issue is that the "client" (in this case vhost-user-blk in QEMU) can
> > proceed to use the socket before the storage-daemon has a chance to
> > properly start up and monitor it. This is nothing unique to the
> > storage-daemon - I've seen races like this happen happend with different
> > vhost-user backends before.
> > 
> > Yes - I do think the docs can be improved to explicitly state that the
> > storage-daemon must be allowed to properly initialize before any data is
> > sent over the socket. Maybe we should even perscribe the use of the pidfile
> > option?
> > 
> > > Can you share more details about the problem?
> > > 
> > 
> > Did you see my analysis [1]?
> > 
> > [1] https://lore.kernel.org/qemu-devel/20210827165253.GA14291@raphael-debian-dev/
> > 
> > Basically QEMU sends VHOST_USER_GET_PROTOCOL_FEATURES across the vhost
> > socket and the storage daemon never receives it. Looking at the
> > QEMU state we see it is stuck waiting for a vhost-user response. Meanwhile
> > the storage-daemon never receives any message to begin with. AFAICT
> > there is nothing stopping QEMU from running first and sending a message
> > before vhost-user-blk comes up, and from testing we can see that waiting
> > for the storage-daemon to come up resolves the problem completely.
> 
> The root cause has not been determined yet. QEMU should accept the
> incoming connection and then read the previously-sent
> VHOST_USER_GET_PROTOCOL_FEATURES message. There is no reason at the
> Sockets API level why the message should get lost, so there is probably
> a QEMU bug here.

Right. However the test does randomly hang for people and it's
not really of interest to anyone. I think we should apply the
work-around but yes we should keep working on the root cause, too.


> > > Does "writing to the socket" mean writing vhost-user protocol messages
> > > or does it mean connect(2)?
> > > 
> > 
> > Yes - it means writing vhost-user messages. We see a message sent from
> > QEMU to the backend.
> > 
> > Note that in qtest_socket_server() (called from create_listen_socket())
> > we have already called listen() on the socket, so I would expect QEMU
> > calling connect(2) to succeed and proceed to successfully send messages
> > whether or not there is another listener. I even tried commenting out the
> > execlp for the storage-daemon and I saw the same behavior from QEMU - it
> > sends the message and hangs indefinitely.
> 
> QEMU is correct in waiting for a vhost-user reply. The question is why
> qemu-storage-daemon's vhost-user-block export isn't processing the
> request and replying to it?
> 
> > > Could the problem be that vhost-user-blk-test.c creates the listen fds
> > > and does not close them? This means the host network stack doesn't
> > > consider the socket closed after QEMU terminates and therefore the test
> > > process hangs after QEMU is gone? In that case vhost-user-blk-test needs
> > > to close the fds after spawning qemu-storage-daemon.
> > > 
> > 
> > When the test hangs both QEMU and storage-daemon are still up and
> > connected to the socket and waiting for messages from each other. I don't
> > see how we would close the FD in this state or how it would help.
> 
> Yes, I see. In that case the theory about fds doesn't apply.
> 
> > We may want to think about implementing some kind of timeoout for initial
> > vhost-user messages so that we fail instead of hang in cases like these,
> > as I proposed in [1]. What do you think?
> 
> Let's hold off on workarounds until the root cause has been found.
> 
> Do you have time to debug why vu_accept() and vu_message_read() don't
> see the pending VHOST_USER_GET_PROTOCOL_FEATURES message?
> 
> Thanks,
> Stefan



