Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C9336E28
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:47:34 +0100 (CET)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGyj-0007Io-SR
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKGwd-0006YK-MR
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:45:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKGwa-0005H1-Lp
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:45:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615452319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wo+E6QQv6ocQz3uWG9X3aL9ERHdEuTPZ4xX9M+If67Y=;
 b=CcZDFtp8QT1mc4zCbHc5DmiTG+5XgSLRRYyy3XdgENMSCKT6IrfXdQeRAPU8ss8fXBJp6e
 hC030pZKwUYQWo/bJZUkjnAZQ86Rno3C5w+JBglbs6EjQh3cPxdAQRYEvP2PchjhefFOef
 ARA7QzLh4wgtEhsElcRB4VsNl06/w/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-VtqRlh-dMyGVUK0na52jEw-1; Thu, 11 Mar 2021 03:45:18 -0500
X-MC-Unique: VtqRlh-dMyGVUK0na52jEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 355741084D69;
 Thu, 11 Mar 2021 08:45:17 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C73418E59;
 Thu, 11 Mar 2021 08:45:04 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:45:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <20210311084502.GB9008@merkur.fritz.box>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
 <ad85d8d9-74a7-9e8f-8287-b6ce66670ed3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ad85d8d9-74a7-9e8f-8287-b6ce66670ed3@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.03.2021 um 09:14 hat Paolo Bonzini geschrieben:
> On 10/03/21 18:30, Kevin Wolf wrote:
> > Am 10.03.2021 um 15:31 hat Paolo Bonzini geschrieben:
> > > On 10/03/21 15:22, Peter Krempa wrote:
> > > > I've stumbled upon a regression with this patchset applied:
> > > > 
> > > > error: internal error: process exited while connecting to monitor: qemu-system-x86_64: -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind: Invalid parameter type for 'host-nodes', expected: array
> > > 
> > > This is the magic conversion of "string containing a list of integers"
> > > to "list of integers".
> > 
> > Ah, crap. This one wouldn't have been a problem when converting only
> > object-add, and I trusted your audit that user creatable objects don't
> > depend on any QemuOpts magic. I should have noticed it, too, of course,
> > but during the convertion I didn't have QemuOpts in mind, only QOM and
> > QAPI.
> 
> Yeah, let's just drop the -object conversion for now. It will just remove a
> few patches.

I think it's only patch 29 and 30 that we would have to drop, actually.

Unfortunately, that still removes one of the most immediately useful
features, which is non-scalar properties for -object in the system
emulator. But of course, a lot better than not merging it at all.

> Who is going to include this series in the next pull request, Markus or
> myself?  The time is ticking for soft freeze.

QOM is probably the right subsystem, so that would be you. Or I can just
merge it myself as long as everyone is fine with it.

Eric has some minor comments that I think could be addressed while
applying the series. Or should I send a v4 for that (and for dropping
patches 29 and 30)?

Kevin


