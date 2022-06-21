Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0AE5531CE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 14:20:27 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3crq-0007OU-D3
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 08:20:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3co3-0003pc-Dc
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:16:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3cnx-0007A3-OH
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655813783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urWtuzewQhCtAL8Sii2UXFzHALGJlNRJFxHWUZZwbYo=;
 b=YVc028VGTOdPT88fiOwYsdIA3r68R0Vh0OlZRV1MM752qA8XK9qUubBxYHbUvrNlnLvEq0
 /wIgk/WI3ZgB1+msLqb9MJZOibLjS/pj8vzn9X3m3cyE//YPv9QmNgG5EAA+qOYHpjyFBJ
 PNYZdCSJIMyY/87YtO94eUyyYeOwkfQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-drumY_rPNVawtEMgKv7u_A-1; Tue, 21 Jun 2022 08:16:22 -0400
X-MC-Unique: drumY_rPNVawtEMgKv7u_A-1
Received: by mail-wm1-f71.google.com with SMTP id
 j31-20020a05600c1c1f00b0039c481c4664so4227947wms.7
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 05:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=urWtuzewQhCtAL8Sii2UXFzHALGJlNRJFxHWUZZwbYo=;
 b=kMPQ4YlWbjcmh2774hLhlvyAkVqmNRkhUZHDQbbZTffWJomHOUCLp1vF5/hFnnOq1W
 dJa/4VJ1PPLaeg8qhXn7cus6NAZCV82XT6VqHKOFK9cp09k78tC+LAcsn3K1hhKZ99+7
 Gi/vv6D2iBktu4qdZoR089xRSGIDWVvc/YveYeZstX601C4DfL2HpyB2GuNIQ1i1wmaI
 2wWTp0AWxeRLq7DhSyDdgzwbGVU4ZBct9ZLcGACEc4ytvbp+U23Wvi93Nnzx5+Lw8koU
 FJssEasn3AU2B2f6LCRTvANwv99ZegSUgaF8k5b7nSZO+EbZu5rbrbnBfXVB7ROdc0Hg
 i+Ow==
X-Gm-Message-State: AJIora/z3jC4WHsyqyt5HzKWiwnPXwEqV5PHewlVDgLaJeW44G0dyiC2
 3ZIsD9Mc6YKzrhucIdIdV2z6dNwbA17k8mUbfWm1MAuUuTgrUyinFHYlStC8M7FQXxJ6KyVlp/N
 7KqQz+9hsLup38dA=
X-Received: by 2002:adf:e903:0:b0:21b:9204:c0 with SMTP id
 f3-20020adfe903000000b0021b920400c0mr7822035wrm.443.1655813780951; 
 Tue, 21 Jun 2022 05:16:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1td5h1jtXj8/PuciMngMvYYii08bEgN6glE8bpaMSPQiIsrQkTBosH5uHlkDfplZITriXsssQ==
X-Received: by 2002:adf:e903:0:b0:21b:9204:c0 with SMTP id
 f3-20020adfe903000000b0021b920400c0mr7822010wrm.443.1655813780731; 
 Tue, 21 Jun 2022 05:16:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c1d1200b0039c5642e430sm18124810wms.20.2022.06.21.05.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 05:16:20 -0700 (PDT)
Date: Tue, 21 Jun 2022 13:16:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v3 00/11] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <YrG2ktpkLXWJL6R5@work-vm>
References: <20220620101828.518865-1-lvivier@redhat.com>
 <YrC7U1XH0pGsn5Df@work-vm>
 <92fb6e19-342a-aab6-b610-79e755ac69d3@redhat.com>
 <YrGeCJzWCi+Je9cl@work-vm> <YrGjbf17VdVF/Zj3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrGjbf17VdVF/Zj3@redhat.com>
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Jun 21, 2022 at 11:31:36AM +0100, Dr. David Alan Gilbert wrote:
> > * Laurent Vivier (lvivier@redhat.com) wrote:
> > > On 20/06/2022 20:24, Dr. David Alan Gilbert wrote:
> > > > * Laurent Vivier (lvivier@redhat.com) wrote:
> > > > > "-netdev socket" only supports inet sockets.
> > > > > 
> > > > > It's not a complex task to add support for unix sockets, but
> > > > > the socket netdev parameters are not defined to manage well unix
> > > > > socket parameters.
> > > > > 
> > > > > As discussed in:
> > > > > 
> > > > >    "socket.c added support for unix domain socket datagram transport"
> > > > >    https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
> > > > > 
> > > > > This series adds support of unix socket type using SocketAddress QAPI structure.
> > > > > 
> > > > > Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
> > > > > backend but they use the SocketAddress QAPI to provide socket parameters.
> > > > > And then they also implement unix sockets (TCP and UDP).
> > > > 
> > > > Had you considered a -netdev chardev?
> > > > 
> > > 
> > > I think by definition a "chardev" doesn't behave like a "netdev". Moreover
> > > "chardev" is already a frontend for several backends (socket, udp, ...),
> > > this would mean we use the frontend "chardev" as a backend of a "netdev".
> > > More and more layers...
> > 
> > Yeh definitely more layers; but perhaps avoiding some duplication.
> > 
> > > And in the case of "-netdev dgram", we can use unix socket and
> > > sendto()/recv() while something like "-chardev udp,id=char0 -netdev
> > > chardev,chardev=char0,id=net0" doesn't support unix (see
> > > qio_channel_socket_dgram_sync()/socket_dgram()) and uses a
> > > "connect()/sendmsg()/recv()" (that really changes the behaviour of the
> > > backend)
> > 
> > It was -chardev socket, path=/unix/socket/path    that I was thinking
> > of; -chardev socket supports both tcp and unix already.
> 
> IMHO we've over-used & abused chardevs in contexts where we really
> should not have done. The chardev API is passable when all you need
> is a persistent bidirectional channel, but is a really bad fit for
> backends wanting to be aware of the dynamic connection oriented
> semantics that sockets offer. The hoops we've had to jump through
> in places to deal with having chardevs open asynchronously or deal
> with automatic chardev re-connection is quite gross.
> 
> Chardev in the past was convenient to use, because we were not so
> great at doing CLI syntax modelling & implementation, so it was
> useful to re-use the chardev code for socket address handling on
> the CLI.  We also didn't historically have nice APIs for dealing
> with sockets - if you didn't use chardevs, you were stuck with
> the raw sockets APIs. With our aim for CLI to be modelled &
> implemented with QAPI these days, that benefit of re-using chardevs
> for CLI is largely eliminated.  With our QIOChannel APIs, the
> benefits of re-using chardevs from an impl POV is also largely
> eliminated.

OK, fair enough.

Dave

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


