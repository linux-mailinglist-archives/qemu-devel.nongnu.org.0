Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0C402FD6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 22:38:44 +0200 (CEST)
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNhre-0005rR-Mh
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 16:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNhq7-0004XS-Jk
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 16:37:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mNhq5-0000ed-2K
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 16:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631047022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r0mIVp1Yli1I4yEYozPSJjOGyElRH6OMi+Y+2UCDPwE=;
 b=IWKWomjEPLfQDpva1kchHEanf/2uNn/7PQShnluQ5KUw1sq7wGBpcGriIZ3WUTojzPbhfR
 wEezRrCfw9HPIfLFJTQ6Q8wFlq31MfnJPClo64mzItfMzFFd+nxoQZHXGExb3a3ku/UhOR
 LmXfEiV7llwAMTXcGEIFNuUM16xx8Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-CyqpfilUOheWLboE8L93GQ-1; Tue, 07 Sep 2021 16:36:59 -0400
X-MC-Unique: CyqpfilUOheWLboE8L93GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDAD6800FF3;
 Tue,  7 Sep 2021 20:36:57 +0000 (UTC)
Received: from redhat.com (ovpn-112-95.phx2.redhat.com [10.3.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEDD66A902;
 Tue,  7 Sep 2021 20:36:56 +0000 (UTC)
Date: Tue, 7 Sep 2021 15:36:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 3/9] nbd: allow reconnect on open, with corresponding
 new options
Message-ID: <20210907203655.smjfnr4bj72esd4v@redhat.com>
References: <20210906190654.183421-1-vsementsov@virtuozzo.com>
 <20210906190654.183421-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210906190654.183421-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Mon, Sep 06, 2021 at 10:06:48PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> It is useful when start of vm and start of nbd server are not
> simple to sync.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qapi/block-core.json |  9 ++++++++-
>  block/nbd.c          | 45 +++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 2 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

This is when qemu is acting as NBD client (and does not affect qemu
acting as NBD server).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


