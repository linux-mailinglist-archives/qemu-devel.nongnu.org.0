Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35940B1BA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:43:36 +0200 (CEST)
Received: from localhost ([::1]:36414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9ep-0004E0-4W
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQ9N6-0007Ei-3V
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mQ9N3-0005wr-A9
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bdDqxrvLXBK/wggyI9HXquQDXtl3zAMLUe5541k+iJk=;
 b=AeLBnXABwJrj3qoelgjgG6bprT6q0zHRyOM+VYHE2dQteM596y0rpMjjeKdwjT1qvgLSeE
 uqUrPUkAJeuOxf+4hF6dZrdy9SZQtbS3hacNQQm2k1lx1Bp21dP+Apscsb+YstCaNfPkkl
 kKRkaxrXoxYtXJBdLgrmWQgMayXrm88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-kcHZ4vtuOc2mFgPrX-S6OQ-1; Tue, 14 Sep 2021 10:25:09 -0400
X-MC-Unique: kcHZ4vtuOc2mFgPrX-S6OQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B097E1006AA0;
 Tue, 14 Sep 2021 14:25:07 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DF895D9DD;
 Tue, 14 Sep 2021 14:25:02 +0000 (UTC)
Date: Tue, 14 Sep 2021 09:25:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
Message-ID: <20210914142500.iq4pwvkt3rl2hddb@redhat.com>
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
 <20210914122454.141075-7-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210914122454.141075-7-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 03:24:50PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Check subcluster bitmap of the l2 entry for different types of
> clusters:
> 
>  - for compressed it must be zero
>  - for allocated check consistency of two parts of the bitmap
>  - for unallocated all subclusters should be unallocated
>    (or zero-plain)
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>  block/qcow2-refcount.c | 28 ++++++++++++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


