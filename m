Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888036B3CD
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:08:09 +0200 (CEST)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0y8-00058T-3F
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lb0xH-0004hL-Mr
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:07:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lb0xE-0004E7-PC
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619442431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W70ArGKX6Y4Frj6HnPB0N8oXSjXv+tEEUpcatPNgCag=;
 b=iygBagEnVhhl2YZgoAcunlqdPxsSSw3l5t1mRUvJdiqi7JSsP2Qw2otPMgoi4kQgYkoaK2
 QU7SlExCkgT8LLBrAY404FCdPUT0B6ZP605i4G+ua6S6JLrcBTt50tYRCVzSCK8m5zy2dg
 rcNfoSFuh9QG+VJplb5792IPrKGD4zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-sPEflZ35PKCl7lwogt8uhQ-1; Mon, 26 Apr 2021 09:07:09 -0400
X-MC-Unique: sPEflZ35PKCl7lwogt8uhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B00F880197D;
 Mon, 26 Apr 2021 13:07:08 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-150.ams2.redhat.com
 [10.36.113.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D78A110016FC;
 Mon, 26 Apr 2021 13:07:03 +0000 (UTC)
Date: Mon, 26 Apr 2021 15:07:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v2] vfio-ccw: Permit missing IRQs
Message-ID: <20210426150700.43b980b4.cohuck@redhat.com>
In-Reply-To: <48d2a3b8ef52ac657d8d0ea2f292d21e0ef0383c.camel@linux.ibm.com>
References: <20210421152053.2379873-1-farman@linux.ibm.com>
 <20210423134252.264059e5.cohuck@redhat.com>
 <7be02ac9-c5d7-1263-ea0e-e0e0a2894521@linux.ibm.com>
 <48d2a3b8ef52ac657d8d0ea2f292d21e0ef0383c.camel@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 12:24:57 -0400
Eric Farman <farman@linux.ibm.com> wrote:

> On Fri, 2021-04-23 at 09:22 -0400, Matthew Rosato wrote:

> > So, this looks OK to me.  
> 
> +1 (Thanks for doing the research, Matt)

+1 to both the analysis and the thanks :)

> 
> > 
> >   
> > > handle any ioctl failure gracefully), but worth a second look. In
> > > fact,
> > > we already unregister the crw irq unconditionally, so we would
> > > likely
> > > already have seen any problems for that one, so I assume all is
> > > good.
> > >   
> > 
> > But +1 on driving the path and making sure it works anyway (do a 
> > double-unregister?)  
> 
> Yeah, works fine. Tried skipping the register of the CRW and double-
> unregistering the IO IRQ.
> 
> I also tried a combination where I unconditionally unregister the REQ
> IRQ, which obviously throws a message when it doesn't exist on the
> host.

Good, thanks for double-checking.

> 
> That might be nice to clean up so that adding new IRQs in the future is
> more intuitive; I'll add it to the list unless you want me to address
> it in a v2 of this. (Previously, the addition of the REQ IRQ needed to
> add the cleanup of the CRW IRQ. So the next IRQ would need to cleanup
> the REQ IRQ.)

Yeah, let's just do it on top.


