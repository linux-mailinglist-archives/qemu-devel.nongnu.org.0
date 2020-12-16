Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE252DBFF1
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:59:11 +0100 (CET)
Received: from localhost ([::1]:49296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpVSY-0001q5-Ae
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpVRM-0001AZ-Rs
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:57:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpVRJ-0003EP-Bc
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:57:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608119872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ubqAnZsA6rvL3fOKSX1fYzqBXOnn4Ul0yTm2zrsA3bc=;
 b=ZLssD8Vs+O7tiO5VqINrDKkb+ohmDjRsDJJjQQAg3vt20kxCrm3axi0EszkoAJaPm8wPt5
 QEnwlkJzbiMYPJFshuPONgu4zodb1bQ+09g4aoMRb6AmNZdiVYdqlkIeQb1Mrc0dDY5KX7
 6t7OGNHdXTQR4ofPoxRljLewycIlcY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-RIjE4ycBNbSOD_HhTECy8w-1; Wed, 16 Dec 2020 06:57:51 -0500
X-MC-Unique: RIjE4ycBNbSOD_HhTECy8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B319801B16;
 Wed, 16 Dec 2020 11:57:49 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 660821975F;
 Wed, 16 Dec 2020 11:57:48 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:57:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: David Edmondson <dme@dme.org>
Subject: Re: [PATCH] block: report errno when flock fcntl fails
Message-ID: <20201216115746.GC7548@merkur.fritz.box>
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
 <20201216112940.GB7548@merkur.fritz.box>
 <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
In-Reply-To: <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.12.2020 um 12:38 hat David Edmondson geschrieben:
> On Wednesday, 2020-12-16 at 12:29:40 +01, Kevin Wolf wrote:
> 
> > Am 15.12.2020 um 20:01 hat David Edmondson geschrieben:
> >> When a call to fcntl(2) for the purpose of manipulating file locks
> >> fails, report the error returned by fcntl.
> >> 
> >> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> >
> > Is appending "Resource temporarily unavailable" in the common case (a
> > file locked by another process) actually an improvement for the message
> > or more confusing? It would be good to mention the motivation for the
> > change in the commit message.
> 
> Distinguishing between the common case and others is at least a start
> when trying to figure out why it failed. We have potentially useful
> information to assist in diagnosis, why throw it away?

I agree in principle, just when I saw the result, it felt more confusing
than helpful. Maybe the best option would be to include the errno only
if it's different from EAGAIN? Then the qemu-iotests reference output
would probably stay unchanged, too.

> In the case I encountered the failure appears to have been caused by
> SELinux misconfiguration.

Ah, so you got EPERM?

It can useful information in the future, let's include it in the commit
message.

> > Either way, this breaks some qemu-iotests cases whose reference output
> > needs to be updated.
> 
> Will fix and send a v2.

Thanks!

Kevin


