Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA742BB15
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:05:04 +0200 (CEST)
Received: from localhost ([::1]:45714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaC7-0007eu-08
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maa9e-0006CU-OJ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1maa9U-00082W-7A
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634115734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEZximonIFg3nGapQvW9JQvjf1+4kHbayvLzn9ZfIHQ=;
 b=EzQeLWHdQO2FYmBufHjCd5ONf/iMYwnHx6NhP3/LzqBNtKXA3GkbV2Qg9jcqQvA/pfw9Mm
 V2Z25tknNxCTJAaX2iKgJZcu3RXqrlCbQ0d1J43T0ix8z5k6MGm1EWRENm70hB8CkTYqju
 ZKG3pK3f1LuX9yaf2YN46fkwLpUus2g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166--XbtQ-5lM2qPnlQAlZkXCQ-1; Wed, 13 Oct 2021 05:02:13 -0400
X-MC-Unique: -XbtQ-5lM2qPnlQAlZkXCQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso1452717wrc.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nEZximonIFg3nGapQvW9JQvjf1+4kHbayvLzn9ZfIHQ=;
 b=F3DvEVKWdejafLrWbwL/ENnPmsjfp851iRdkuNXLt96R8UOVRKCQDrWaSdhMY5MgPZ
 gA8qKDsXyat9z/YkL6p9NS97+z3It0SilneEi/cW+V8eeIWuShgCCPRAlOWghhHKGUGW
 HgifaRS4xIiqVoPzoOHi0NTyd/CZqwdicGdh5m/rDXBJEnctn98xZxA+gXDx8ZDMiDiH
 HWLocWBJMwNzhMTdstEam4QpO/5KpR6od+ZsQqrfIwUwqnYim6Lcwr6I0nb6C9TzZFes
 cHSt5AqiPyXnaLInbKzLBQQwLWQM2nTW/IWG4ITFwfvTN7jJo91G0nUuz75Soe/qGkf2
 WjLw==
X-Gm-Message-State: AOAM533L7fw6fcjBWnNjUfZnS/Jsr1BqqJ77p4BRWStqGyR1Xrw2jYbN
 s0T5hNAh3kLj6lH7q5W3lO229TyX/JCJqHearFc1aRcY+gR1V7nDVo70tTV0TiDIX3igo1RxU5d
 tV/kwApYbVuFhrqs=
X-Received: by 2002:adf:bd84:: with SMTP id l4mr38724389wrh.420.1634115732116; 
 Wed, 13 Oct 2021 02:02:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPOFbGZ39I+SRFaH9E28xT5ZY6DutLzUmd3BHpzDkUzoYKMbD/yFKR1I3EevyjCvn90GRuxQ==
X-Received: by 2002:adf:bd84:: with SMTP id l4mr38724347wrh.420.1634115731808; 
 Wed, 13 Oct 2021 02:02:11 -0700 (PDT)
Received: from redhat.com ([2.55.30.112])
 by smtp.gmail.com with ESMTPSA id e9sm4746321wme.37.2021.10.13.02.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:02:10 -0700 (PDT)
Date: Wed, 13 Oct 2021 05:02:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Message-ID: <20211013050158-mutt-send-email-mst@kernel.org>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
 <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
 <20210930052900.GA15735@raphael-debian-dev>
 <YVWH2YUDLzaRxHYW@stefanha-x1.localdomain>
 <20211005102944-mutt-send-email-mst@kernel.org>
 <20211013062526.GA30621@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20211013062526.GA30621@raphael-debian-dev>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 "mreitz@redhat.com" <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 06:25:33AM +0000, Raphael Norwitz wrote:
> On Tue, Oct 05, 2021 at 10:31:06AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Sep 30, 2021 at 10:48:09AM +0100, Stefan Hajnoczi wrote:
> > > On Thu, Sep 30, 2021 at 05:29:06AM +0000, Raphael Norwitz wrote:
> > > > On Tue, Sep 28, 2021 at 10:55:00AM +0200, Stefan Hajnoczi wrote:
> > > > > On Mon, Sep 27, 2021 at 05:17:01PM +0000, Raphael Norwitz wrote:
> > > > > > In the vhost-user-blk-test, as of now there is nothing stoping
> > > > > > vhost-user-blk in QEMU writing to the socket right after forking off the
> > > > > > storage daemon before it has a chance to come up properly, leaving the
> > > > > > test hanging forever. This intermittently hanging test has caused QEMU
> > > > > > automation failures reported multiple times on the mailing list [1].
> > > > > > 
> > > > > > This change makes the storage-daemon notify the vhost-user-blk-test
> > > > > > that it is fully initialized and ready to handle client connections by
> > > > > > creating a pidfile on initialiation. This ensures that the storage-daemon
> > > > > > backend won't miss vhost-user messages and thereby resolves the hang.
> > > > > > 
> > > > > > [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_qemu-2Ddevel_CAFEAcA8kYpz9LiPNxnWJAPSjc-3Dnv532bEdyfynaBeMeohqBp3A-40mail.gmail.com_&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=In4gmR1pGzKB8G5p6LUrWqkSMec2L5EtXZow_FZNJZk&m=fB3Xs9HB_Joc1WbeoKGaipFGQA7TPiMQPKa9OS04FM8&s=buSM5F3BMoUQEmVsEOXaCdERM0onDwoqit7nbLblkVs&e= 
> > > > > 
> > > > 
> > > > Hey Stefan,
> > > > 
> > > > > Hi Raphael,
> > > > > I would like to understand the issue that is being worked around in the
> > > > > patch.
> > > > > 
> > > > > QEMU should be okay with listen fd passing. The qemu-storage-daemon
> > > > > documentation even contains example code for this
> > > > > (docs/tools/qemu-storage-daemon.rst) and that may need to be updated if
> > > > > listen fd passing is fundamentally broken.
> > > > > 
> > > > 
> > > > The issue is that the "client" (in this case vhost-user-blk in QEMU) can
> > > > proceed to use the socket before the storage-daemon has a chance to
> > > > properly start up and monitor it. This is nothing unique to the
> > > > storage-daemon - I've seen races like this happen happend with different
> > > > vhost-user backends before.
> > > > 
> > > > Yes - I do think the docs can be improved to explicitly state that the
> > > > storage-daemon must be allowed to properly initialize before any data is
> > > > sent over the socket. Maybe we should even perscribe the use of the pidfile
> > > > option?
> > > > 
> > > > > Can you share more details about the problem?
> > > > > 
> > > > 
> > > > Did you see my analysis [1]?
> > > > 
> > > > [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_qemu-2Ddevel_20210827165253.GA14291-40raphael-2Ddebian-2Ddev_&d=DwIBAg&c=s883GpUCOChKOHiocYtGcg&r=In4gmR1pGzKB8G5p6LUrWqkSMec2L5EtXZow_FZNJZk&m=fB3Xs9HB_Joc1WbeoKGaipFGQA7TPiMQPKa9OS04FM8&s=o_S2kKO4RQnWw2QnzVi7dgOwgiPbusI9Zche7mWV22I&e= 
> > > > 
> > > > Basically QEMU sends VHOST_USER_GET_PROTOCOL_FEATURES across the vhost
> > > > socket and the storage daemon never receives it. Looking at the
> > > > QEMU state we see it is stuck waiting for a vhost-user response. Meanwhile
> > > > the storage-daemon never receives any message to begin with. AFAICT
> > > > there is nothing stopping QEMU from running first and sending a message
> > > > before vhost-user-blk comes up, and from testing we can see that waiting
> > > > for the storage-daemon to come up resolves the problem completely.
> > > 
> > > The root cause has not been determined yet. QEMU should accept the
> > > incoming connection and then read the previously-sent
> > > VHOST_USER_GET_PROTOCOL_FEATURES message. There is no reason at the
> > > Sockets API level why the message should get lost, so there is probably
> > > a QEMU bug here.
> > 
> > Right. However the test does randomly hang for people and it's
> > not really of interest to anyone. I think we should apply the
> > work-around but yes we should keep working on the root cause, too.
> >
> 
> From my end I have spent some more time looking at it but have not made
> much progress. I was hopeful that David HiIdenbrand’s libvhost-user bug
> fixes may have resolved it, but I tested and even with his patches I
> still see the hang.
> 
> I am determined to get to the bottom of it, but I’m not sure how long it
> will take. If this is impacting people than I agree with merging the
> patch as a workaround.
> 
> From my end, I will send a v6 updating the commit message and add
> comments to make it clear that the patch is a workaround and the root
> cause has not been determined yet. Sound good?


Makes sense for now.

> >
> > > > > Does "writing to the socket" mean writing vhost-user protocol messages
> > > > > or does it mean connect(2)?
> > > > > 
> > > > 
> > > > Yes - it means writing vhost-user messages. We see a message sent from
> > > > QEMU to the backend.
> > > > 
> > > > Note that in qtest_socket_server() (called from create_listen_socket())
> > > > we have already called listen() on the socket, so I would expect QEMU
> > > > calling connect(2) to succeed and proceed to successfully send messages
> > > > whether or not there is another listener. I even tried commenting out the
> > > > execlp for the storage-daemon and I saw the same behavior from QEMU - it
> > > > sends the message and hangs indefinitely.
> > > 
> > > QEMU is correct in waiting for a vhost-user reply. The question is why
> > > qemu-storage-daemon's vhost-user-block export isn't processing the
> > > request and replying to it?
> > > 
> > > > > Could the problem be that vhost-user-blk-test.c creates the listen fds
> > > > > and does not close them? This means the host network stack doesn't
> > > > > consider the socket closed after QEMU terminates and therefore the test
> > > > > process hangs after QEMU is gone? In that case vhost-user-blk-test needs
> > > > > to close the fds after spawning qemu-storage-daemon.
> > > > > 
> > > > 
> > > > When the test hangs both QEMU and storage-daemon are still up and
> > > > connected to the socket and waiting for messages from each other. I don't
> > > > see how we would close the FD in this state or how it would help.
> > > 
> > > Yes, I see. In that case the theory about fds doesn't apply.
> > > 
> > > > We may want to think about implementing some kind of timeoout for initial
> > > > vhost-user messages so that we fail instead of hang in cases like these,
> > > > as I proposed in [1]. What do you think?
> > > 
> > > Let's hold off on workarounds until the root cause has been found.
> > > 
> > > Do you have time to debug why vu_accept() and vu_message_read() don't
> > > see the pending VHOST_USER_GET_PROTOCOL_FEATURES message?
> > > 
> > > Thanks,
> > > Stefan
> > 
> > 


