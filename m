Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEFE400437
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:38:07 +0200 (CEST)
Received: from localhost ([::1]:39618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMD8g-00013l-PT
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMD7g-0000FL-2X
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMD7e-0002Ip-4i
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630690621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tMbrjynsqYCpt/B9MgxzmWrAo/c3Dh7l0gfE+2O5rsE=;
 b=QUNMR2IozXLPuVZNypUF7QmjhgEkQV/fg1Gtg+VTHgxjJXmhE/unDNZc6Pqv1W2JdlPqjx
 F6EsosdMb153CjlvAwDUz+KoCXfNYsvalknDZHBEbHtfE2h8oy/5UuST0vhDdci1HiIi9a
 EzzIXwtUX88eGWksCLRLOsj63CZbzxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-aU6-wHwxNPOMhkRvDUpAgQ-1; Fri, 03 Sep 2021 13:36:58 -0400
X-MC-Unique: aU6-wHwxNPOMhkRvDUpAgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DA601854E27;
 Fri,  3 Sep 2021 17:36:57 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E39C60BF1;
 Fri,  3 Sep 2021 17:36:56 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:36:54 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 3/5] block/nbd: refactor nbd_recv_coroutines_wake_all()
Message-ID: <20210903173654.2zrgl3zmup76gash@redhat.com>
References: <20210902103805.25686-1-vsementsov@virtuozzo.com>
 <20210902103805.25686-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210902103805.25686-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, rkagan@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 01:38:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Split out nbd_recv_coroutine_wake_one(), as it will be used in
> separate.
> Rename the function and add a possibility to wake only first found
> sleeping coroutine.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/nbd.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


