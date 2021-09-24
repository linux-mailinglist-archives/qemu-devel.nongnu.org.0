Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB4417BD2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:31:46 +0200 (CEST)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqvC-0002B2-1y
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqjB-0002lt-34
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:19:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqj6-00061N-HD
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632511155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f4sLZKmgvDAMeCZw21vlwwJaWf7xSfIuHDeboPiH0+g=;
 b=URnEP2V/fHjjTPzKJ8bOWs2aKMffiXEofRPwONRr/22GXbEzstERmnYs3Ug7fDBFrc8wyn
 U0/QQ0pI7xqRHT1x0PQpxzDkpsrLRi4TpyryzzrHOZmiLHVMoqMvPi//yaeQHYm7YhCLdJ
 IsSvPY5fGbrTrvtVqyQxSmEA8v9PSkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-bmCmSwS3MA6NJtEfUkBtFg-1; Fri, 24 Sep 2021 15:19:09 -0400
X-MC-Unique: bmCmSwS3MA6NJtEfUkBtFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1654C802921;
 Fri, 24 Sep 2021 19:19:08 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB9C060BF4;
 Fri, 24 Sep 2021 19:19:02 +0000 (UTC)
Date: Fri, 24 Sep 2021 14:19:01 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 1/9] nbd/client-connection:
 nbd_co_establish_connection(): fix non set errp
Message-ID: <20210924191901.b5egwqqo67v74fng@redhat.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-2-vsementsov@virtuozzo.com>
 <20210907174453.vyzq6f5xgcrg6qdk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210907174453.vyzq6f5xgcrg6qdk@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 07, 2021 at 12:44:53PM -0500, Eric Blake wrote:
> On Mon, Sep 06, 2021 at 10:06:46PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > When we don't have a connection and blocking is false, we return NULL
> > but don't set errp. That's wrong.
> 
> Oops...
> 
> > 
> > We have two paths for calling nbd_co_establish_connection():
> > 
> > 1. nbd_open() -> nbd_do_establish_connection() -> ...
> >   but that will never set blocking=false
> > 
> > 2. nbd_reconnect_attempt() -> nbd_co_do_establish_connection() -> ...
> >   but that uses errp=NULL
> > 
> > So, we are safe with our wrong errp policy in
> > nbd_co_establish_connection(). Still let's fix it.
> 
> ...phew!  Thus, it's not critical to backport.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Queuing this one through my NBD tree.  Given the discussion on 2/9,
I'll leave the rest of the series for later.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


