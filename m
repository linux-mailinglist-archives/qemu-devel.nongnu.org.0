Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75BC397BC1
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:30:54 +0200 (CEST)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loByP-0007Y9-RU
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loBwv-0006OK-Jn
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:29:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1loBwt-0000fi-4r
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622582957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kKe02AX6eUu56AZG6fv4u2VZcT6820q0YzoA/2BfL9E=;
 b=CvmHs6EgAOo7/SWOftfnUXkvrq+QP5C3I/h78voGRXR90swvCp3qAddTnlezgoQfagHZvF
 FgFvsQRpKnlu0QU61SSLElt6Gq4fhUdZN/5yyjhbh3+cr71xuUFMFShc8iCypBug6avS0Q
 Drh+VQ+0DfT1lK2b+zw6ewh8YmktWPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-1qZB5DxyPsiiQk4ndskP1Q-1; Tue, 01 Jun 2021 17:29:14 -0400
X-MC-Unique: 1qZB5DxyPsiiQk4ndskP1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F93B100945E;
 Tue,  1 Jun 2021 21:29:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-154.phx2.redhat.com [10.3.113.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 899CD608DB;
 Tue,  1 Jun 2021 21:29:09 +0000 (UTC)
Date: Tue, 1 Jun 2021 16:29:07 -0500
From: Eric Blake <eblake@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 2/2] nbd/server: Use drained block ops to quiesce the
 server
Message-ID: <20210601212907.hc4u4hgjxml5aqjd@redhat.com>
References: <20210601055728.90849-1-slp@redhat.com>
 <20210601055728.90849-3-slp@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601055728.90849-3-slp@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 07:57:28AM +0200, Sergio Lopez wrote:
> Before switching between AioContexts we need to make sure that we're
> fully quiesced ("nb_requests == 0" for every client) when entering the
> drained section.
> 
> To do this, we set "quiescing = true" for every client on
> ".drained_begin" to prevent new coroutines to be created, and check if

s/to be created/from being created/

> "nb_requests == 0" on ".drained_poll". Finally, once we're exiting the
> drained section, on ".drained_end" we set "quiescing = false" and
> call "nbd_client_receive_next_request()" to resume the processing of
> new requests.
> 
> With these changes, "blk_aio_attach()" and "blk_aio_detach()" can be
> reverted to be as simple as they were before f148ae7d36.

Is that reversion planned to be patch 3 of your series in v2?

> 
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1960137
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  nbd/server.c | 99 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 75 insertions(+), 24 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


