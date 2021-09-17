Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6690240FDC2
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:19:28 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGaF-0005mT-GG
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mRGRx-0003ok-II
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mRGRu-0003kR-1P
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631895048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pBAduwEuFo/pbkgs6E5WXLKNkorA44XpdlapDUpXyZc=;
 b=P5JU9LNKp3G7kb/6rfhsqc7e07j7Zl870ilPUjj7+I4PSFzUzh79Dplb92gQQCE4lWyttn
 3nsOLpEdZSJp3uf3nd6yCYLoxOZBL3XVzdgtE3W3Yvb/GSVvjaeWokKRL04UiwDVG2A/rZ
 vUSGsfAPF9bNPJ5r3p4wziB+QEDRwC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-OTHuKKFyMaG3LKp9IK21Og-1; Fri, 17 Sep 2021 12:10:46 -0400
X-MC-Unique: OTHuKKFyMaG3LKp9IK21Og-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAD2191279;
 Fri, 17 Sep 2021 16:10:45 +0000 (UTC)
Received: from redhat.com (ovpn-113-101.phx2.redhat.com [10.3.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B8B060C2B;
 Fri, 17 Sep 2021 16:10:45 +0000 (UTC)
Date: Fri, 17 Sep 2021 11:10:43 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] nbd/server: Suppress Broken pipe errors on abrupt
 disconnection
Message-ID: <20210917161043.5xxfice6bbf7acb7@redhat.com>
References: <20210913151936.392705-1-rjones@redhat.com>
 <6c59b070-b9b4-6ecb-8557-3ea54af3d45a@virtuozzo.com>
 <20210914145200.GJ26415@redhat.com>
 <997fe8b4-3610-2336-c7f3-67a0e2cbf34e@virtuozzo.com>
 <20210914163232.GN26415@redhat.com>
 <0bdef3d9-df05-f49d-038c-9930c2677f54@virtuozzo.com>
 <20210915090025.GP26415@redhat.com>
 <637d695d-7910-9bdf-3b6e-18408c556825@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <637d695d-7910-9bdf-3b6e-18408c556825@virtuozzo.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, "Richard W.M. Jones" <rjones@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 12:11:35PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > >    There are two methods of terminating the transmission phase:
> > > >    ...
> > > >    "The client or the server drops the TCP session (in which case it
> > > >    SHOULD shut down the TLS session first). This is referred to as
> > > >    'initiating a hard disconnect'."
> > > 
> > > Right. Here the method is defined, no word that client can do it at any time.

Note that right now, most TLS clients are NOT gracefully shutting down
the TLS session, on either hard or soft disconnect.  And this is even
observable in non-deterministic behavior of what message the server
reports when it diagnoses that a TLS client has gone away.  As argued
elsewhere, a hard disconnect does not necessarily lose data, but it
does add non-determinism into the equation, which makes regression
testing a bit harder.

> > 
> > I don't read this as a definition.
> 
> If so, next paragraphs that specify client behavior doesn't make sense.
> 
> > 
> > But we should probably clarify the spec to note that dropping the
> > connection is fine, because it is - no one has made any argument so
> > far that there's an actual reason to waste time on NBD_CMD_DISC.
> > 
> 
> I agree that it's safe enough..
> 
> Hmm. If we update the spec to clarify that sending DISC is not necessary, is there any reason to send it at all? We can stop sending it in Qemu as well.

No, I'd still prefer that qemu send NBD_CMD_DISC where possible.
Although existing servers tolerate hard disconnects, the way I read
the NBD spec is that clients SHOULD prefer soft disconnect, in case it
deals with a server where the difference matters.

When implementing 'qemu-nbd --list', I remember having to rejigger
code to add in a graceful NBD_OPT_ABORT into more places, for the same
reason as sending NBD_CMD_DISC at the end of transmission phase
reduces the chance for non-determinism on how the server may react.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


