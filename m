Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AC3402FDA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 22:44:37 +0200 (CEST)
Received: from localhost ([::1]:56662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNhxM-0000ua-7i
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 16:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNhv7-0007Ud-Fr
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 16:42:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNhv5-0003fK-KK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 16:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631047334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=16J/uN4kM9fmWTvVNf63fladX6PRrNGyj6CFqx9K3ZI=;
 b=f6B6IqJrjV+BcUA9vzJGDBH+v1wk7yrcXuYVLi6XYsDqxMNtFmZH0H92N+YsCyNJSOQIar
 WFg+9hiVrKwC22r5PaZi/++5AAXKSspoUvsEFssoaRr+8PIzYBer1s0sEiES2Oe9XMpAek
 tr66gZ9eL/7xgCxrbpKsyuITN3jg77E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-t8dLRznQMrS1DQ0mV5aAZQ-1; Tue, 07 Sep 2021 16:42:13 -0400
X-MC-Unique: t8dLRznQMrS1DQ0mV5aAZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D6A310054F6;
 Tue,  7 Sep 2021 20:42:12 +0000 (UTC)
Received: from redhat.com (ovpn-112-95.phx2.redhat.com [10.3.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99B3C1972E;
 Tue,  7 Sep 2021 20:42:11 +0000 (UTC)
Date: Tue, 7 Sep 2021 15:42:09 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 4/9] nbd/client-connection:
 nbd_co_establish_connection(): return real error
Message-ID: <20210907204209.dwkbue4xsset5qc5@redhat.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210906190654.183421-5-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 06, 2021 at 10:06:49PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> The only user of errp is call to nbd_do_establish_connection() in
> nbd_open(). The only way to cancel this call is through open_timer

The only caller of nbd_do_establish_connection() that uses errp is
nbd_open().

> timeout. And for this case, user will be more interested in description
> of last failed connect rather than in
> "Connection attempt cancelled by other operation".
> 
> So, let's change behavior on cancel to return previous failure error if
> available.
> 
> Do the same for non-blocking failure case. In this case we still don't
> have a caller that is interested in errp. But let's be consistent.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  nbd/client-connection.c | 50 ++++++++++++++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 16 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


