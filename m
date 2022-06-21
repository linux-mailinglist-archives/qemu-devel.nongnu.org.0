Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F20552FCA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:34:11 +0200 (CEST)
Received: from localhost ([::1]:60746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3bCz-0006vj-WA
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3bAh-00068G-Nk
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 06:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3bAe-0006KU-3M
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 06:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655807502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwZCuVNgbzTlQkO5EDLr9nyM8KBuvh3IstxCrhDoRK0=;
 b=C0cZmO+vBZDWedxUe47XTwizH0p/usqT6n7ckjtHgilAPvNED0s8LufOpuD/p4+VAq1LuX
 uFnwM1EKKeLpbjXgdHTIsxWHhv2uBEHZ8ialLlVec9WCauBOfT/orw/PSnmpd9qeVFc20g
 mSnt7s2vBO7RDJDtk3vJaqe0kAyuLMA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-dH-39CgQMbe-n_8_ECZDsg-1; Tue, 21 Jun 2022 06:31:41 -0400
X-MC-Unique: dH-39CgQMbe-n_8_ECZDsg-1
Received: by mail-wr1-f72.google.com with SMTP id
 z11-20020a056000110b00b0021b9c009d09so43060wrw.17
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 03:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RwZCuVNgbzTlQkO5EDLr9nyM8KBuvh3IstxCrhDoRK0=;
 b=R1L4JW3w1bZvcWZrcdGqS19PV799tLHhsqcRCM1Zr3gUDmqA9ESgt2/vTDDLoAEBPq
 WPsVQROvA2OHprJKT9qxpCoc1Tn1geJIQT4wXVNVXKLi0xQy6V13ejuc1WxLSSqxg9iF
 mcztKZUsUazBEdbo81bISzeHHb9PtwpBeu8EME7otCwnpWRUU9LeYgK8GCKv4zvpZMMZ
 eaOkFeInyl6FunSkYXddYzPq9qu00nkDSHyNhYfFUCPDR5+9dLcVbtiHCp7zBZfPbU8p
 r/dOqR8GShlLoyjjqgaoig45pGYmJYrmsMs/EFevvvXKndakuA7FLuYypiZ9OnF4w+jy
 ZWDA==
X-Gm-Message-State: AJIora9oFJbK8MgijUuLHBRLCFYbdiwzEa/0OIaKme3aX06/C9kN+ih5
 qVC4A4Pd4DWf67oLWUG7b5IIXUR1jijP6C8b+Z7LZA3ay8xTsK0pwYJT5bVi4Xd8qITc4JONhzn
 Cilvci4nPdIIgIjc=
X-Received: by 2002:a5d:6daf:0:b0:21b:994a:a6d1 with SMTP id
 u15-20020a5d6daf000000b0021b994aa6d1mr2067936wrs.75.1655807500360; 
 Tue, 21 Jun 2022 03:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1xAdKMmw+NTX38illMf5SkKu+B7al4RnCyQ266Dm+JbYTZ0NNuD4qx+B8fLrNjSMaBtLE1w==
X-Received: by 2002:a5d:6daf:0:b0:21b:994a:a6d1 with SMTP id
 u15-20020a5d6daf000000b0021b994aa6d1mr2067899wrs.75.1655807500057; 
 Tue, 21 Jun 2022 03:31:40 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 q2-20020a05600000c200b0021b8ea5c7bdsm6073699wrx.42.2022.06.21.03.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 03:31:39 -0700 (PDT)
Date: Tue, 21 Jun 2022 11:31:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v3 00/11] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <YrGeCJzWCi+Je9cl@work-vm>
References: <20220620101828.518865-1-lvivier@redhat.com>
 <YrC7U1XH0pGsn5Df@work-vm>
 <92fb6e19-342a-aab6-b610-79e755ac69d3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92fb6e19-342a-aab6-b610-79e755ac69d3@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> On 20/06/2022 20:24, Dr. David Alan Gilbert wrote:
> > * Laurent Vivier (lvivier@redhat.com) wrote:
> > > "-netdev socket" only supports inet sockets.
> > > 
> > > It's not a complex task to add support for unix sockets, but
> > > the socket netdev parameters are not defined to manage well unix
> > > socket parameters.
> > > 
> > > As discussed in:
> > > 
> > >    "socket.c added support for unix domain socket datagram transport"
> > >    https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
> > > 
> > > This series adds support of unix socket type using SocketAddress QAPI structure.
> > > 
> > > Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
> > > backend but they use the SocketAddress QAPI to provide socket parameters.
> > > And then they also implement unix sockets (TCP and UDP).
> > 
> > Had you considered a -netdev chardev?
> > 
> 
> I think by definition a "chardev" doesn't behave like a "netdev". Moreover
> "chardev" is already a frontend for several backends (socket, udp, ...),
> this would mean we use the frontend "chardev" as a backend of a "netdev".
> More and more layers...

Yeh definitely more layers; but perhaps avoiding some duplication.

> And in the case of "-netdev dgram", we can use unix socket and
> sendto()/recv() while something like "-chardev udp,id=char0 -netdev
> chardev,chardev=char0,id=net0" doesn't support unix (see
> qio_channel_socket_dgram_sync()/socket_dgram()) and uses a
> "connect()/sendmsg()/recv()" (that really changes the behaviour of the
> backend)

It was -chardev socket, path=/unix/socket/path    that I was thinking
of; -chardev socket supports both tcp and unix already.

> The aim of this series is to add unix socket support.

Yes.

Dave

> Thanks,
> Laurent
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


