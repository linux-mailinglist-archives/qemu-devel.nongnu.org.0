Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A68454EC7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 21:51:11 +0100 (CET)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnRte-0001QO-15
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 15:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnRs9-0008MN-MN
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 15:49:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mnRs7-0000Qt-6T
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 15:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637182174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XipeqRxci+ecldBkFo4N7ynocW87e/hdFl4FUP9onSI=;
 b=VHoJgImoICl2jHVv484MF80eGSVOK5zJ+GujhvGDEOXG6M1MSjrkfQcGhNKryFyvtu5jJq
 NheHpAqUXqHM1zDnK/jPKwvhkp30JVKRgZSLslFBVJc2yVN1jtRf2X7PyOFxR3A0yvbNji
 U3ZmMefp7/W9kgakL13lVeBtE6rWL0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-276-zWrGXmmxPOuPySWhsrAN5w-1; Wed, 17 Nov 2021 15:49:31 -0500
X-MC-Unique: zWrGXmmxPOuPySWhsrAN5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E2F8799ED;
 Wed, 17 Nov 2021 20:49:30 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA2410016F2;
 Wed, 17 Nov 2021 20:49:29 +0000 (UTC)
Date: Wed, 17 Nov 2021 14:49:27 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH for-6.2? 2/2] nbd/server: Simplify zero and trim
Message-ID: <20211117204927.r7mlgcstlatgzskr@redhat.com>
References: <20211117170230.1128262-1-eblake@redhat.com>
 <20211117170230.1128262-3-eblake@redhat.com>
 <d0c72875-4b2e-a1b4-646f-8380b0f3f6f2@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d0c72875-4b2e-a1b4-646f-8380b0f3f6f2@virtuozzo.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, rjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 09:04:34PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 17.11.2021 20:02, Eric Blake wrote:
> > Now that the block layer supports 64-bit operations, we no longer have
> > to self-fragment requests larger than 2G, reverting the workaround
> > added in 890cbccb08 (nbd: Fix large trim/zero requests).
> > 
> > Signed-off-by: Eric Blake<eblake@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Any preferences on whether this should be in 6.2, or deferred to 7.0?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


