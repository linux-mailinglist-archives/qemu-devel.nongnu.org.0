Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F052368F43
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 11:17:50 +0200 (CEST)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZrwa-0000e4-NX
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 05:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZrvP-0008Pe-7Z
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lZrvK-0000hC-GL
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 05:16:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619169388;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=o2epj5cx2PXwSw98RVwKpXJs2zl0DSdcv6Js5quoOHw=;
 b=i1f3R3K8SxuP+t6klEln6EucV/lnVH6tuqcB1c6azfna1je84lfo72RbvjeH3B3+qA73cd
 WqMc4UwOfhMuOvVcVVkY4sIEty6O8WZtCSEbB12LfgwOwtND8CWkhcUqzK6W+Y3reo/7Og
 z4xj4MlSbBlKroYqezAuRPgC/vPRk/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-1-HqIjHLOW2XyzS07UO4BA-1; Fri, 23 Apr 2021 05:16:26 -0400
X-MC-Unique: 1-HqIjHLOW2XyzS07UO4BA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A829A81744F;
 Fri, 23 Apr 2021 09:16:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9B381865D;
 Fri, 23 Apr 2021 09:16:24 +0000 (UTC)
Date: Fri, 23 Apr 2021 10:16:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ralph Schmieder <ralph.schmieder@gmail.com>
Subject: Re: socket.c added support for unix domain socket datagram transport
Message-ID: <YIKQZSHKeXjvthDp@redhat.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 23, 2021 at 08:56:48AM +0200, Ralph Schmieder wrote:
> Hey...  new to this list.  I was looking for a way to use Unix domain sockets as a network transport between local VMs.
> 
> I'm part of a team where we run dozens if not hundreds of VMs on a single compute instance which are highly interconnected.
> 
> In the current implementation, I use UDP sockets (e.g. something like 
> 
> -netdev id=bla,type=socket,udp=localhost:1234,localaddr=localhost:5678) 
> 
> which works great.
> 
> The downside of this approach is that I need to keep track of all the UDP ports in use and that there's a potential for clashes.  Clearly, having Unix domain sockets where I could store the sockets in the VM's directory would be much easier to manage.
> 
> However, even though there is some AF_UNIX support in net/socket.c, it's
> 
> - not configurable
> - it doesn't work
> 
> As a side note, I tried to pass in an already open FD, but that didn't work either.
> 
> So, I added some code which does work for me... e.g.
> 
> - can specify the socket paths like -netdev id=bla,type=socket,unix=/tmp/in:/tmp/out
> - it does forward packets between two Qemu instances running back-to-back
> 
> I'm wondering if this is of interest for the wider community and, if so, how to proceed.

As a general rule, any place in QEMU that supports sockets, ought to
support all of IPv4, IPv6 and UNIX sockets.   Where there are gaps
it generally just needs someone motivated to provide a patch.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


