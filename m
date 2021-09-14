Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9640B4D3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 18:34:45 +0200 (CEST)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQBOM-000615-Rj
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 12:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mQBMO-0004Ah-El
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mQBMM-00054f-4V
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 12:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631637157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z3h/cTMiykD+G4AgydT8/I6945Vt4VkkCp0LS4ngdTY=;
 b=dQihSma2feNz8cLCyX1Z5HiaskcRBIMWCNgHUr+PZL4Mew0tjQnTAPb568q1IxiY7RIU/x
 GbnAvDmsc8soJBXEz/uwxCZ5ZMRlX+SGsjATt3A8J67auYEV2kaexaMBXZIXqRqbFQIAqh
 knTiU5f44Rhro6vjbKCuASyznJ/cQR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-a0LUrp6sO4i7s4LlQdV_6w-1; Tue, 14 Sep 2021 12:32:34 -0400
X-MC-Unique: a0LUrp6sO4i7s4LlQdV_6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C440B1006AA1;
 Tue, 14 Sep 2021 16:32:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46B5D7A8CE;
 Tue, 14 Sep 2021 16:32:33 +0000 (UTC)
Date: Tue, 14 Sep 2021 17:32:32 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210914163232.GN26415@redhat.com>
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
 <20210914145200.GJ26415@redhat.com>
 <997fe8b4-3610-2336-c7f3-67a0e2cbf34e@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <997fe8b4-3610-2336-c7f3-67a0e2cbf34e@virtuozzo.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 06:21:58PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 14.09.2021 17:52, Richard W.M. Jones wrote:
> > On the
> >server side when the server receives NBD_CMD_DISC it must complete any
> >in-flight requests, but there's no requirement for the server to
> >commit anything to disk.  IOW you can still lose data even though you
> >took the time to disconnect.
> >
> >So I don't think there's any reason for libnbd to always gracefully
> 
> Hmm. Me go to NBD spec :)
> 
> I think, there is a reason:
> 
> "The client and the server MUST NOT initiate any form of disconnect other than in one of the above circumstances."
> 
> And the only possibility for client to initiate a hard disconnect listed above is "if it detects a violation by the other party of a mandatory condition within this document".
> 
> So at least, nbdsh violates NBD protocol. May be spec should be updated to satisfy your needs.

I would say the spec is at best contradictory, but if you read other
parts of the spec, then it's pretty clear that we're allowed to drop
the connection whenever we like.  This section says as much:

https://github.com/NetworkBlockDevice/nbd/blob/5805b25ad3da96e7c0b3160cda51ea19eb518d5b/doc/proto.md#terminating-the-transmission-phase

  There are two methods of terminating the transmission phase:
  ...
  "The client or the server drops the TCP session (in which case it
  SHOULD shut down the TLS session first). This is referred to as
  'initiating a hard disconnect'."

Anyway we're dropping the TCP connection because sometimes we are just
interrogating an NBD server eg to find out what it supports, and doing
a graceful shutdown is a waste of time and internet.

> >shut down (especially in this case where there are no in-flight
> >requests), and anyway it would break ABI to make that change and slow
> >down the client in cases when there's nothing to clean up.
> 
> Which ABI will it break?

Our contract with callers using nbd_close(3), if nbd_shutdown(3) is
not called beforehand.
https://libguestfs.org/nbd_shutdown.3.html
https://libguestfs.org/nbd_create.3.html (really nbd_close ...)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


