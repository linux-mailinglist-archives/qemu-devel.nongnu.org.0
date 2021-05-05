Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C3B37386C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:16:05 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEZY-0003oS-Dn
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leEUk-0008TL-B5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1leEUi-0000LK-MV
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620209464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MEd+QhQXICiiEuUEEMXR5BxV2UgtOfRXCh9RdvwCkY0=;
 b=DLdDc3zmlzf0sfqHgKKZwU1FiTlOp40BCxhs6lPCIpvGKAFTKbHsF+xDytnH+zocA2X17c
 v6FrQQGd7zTBvXdQqM4DKhYoPLxmt29KujcDRpz6OWM1DtXMGzPEI3S8MyXSulaEUYg8/g
 LRQ6PjFesHA6461RG7toEZLOu79b6j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-mkv39TPxOu2QfRAiKMJx7g-1; Wed, 05 May 2021 06:11:02 -0400
X-MC-Unique: mkv39TPxOu2QfRAiKMJx7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD633A40E6;
 Wed,  5 May 2021 10:11:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-138.ams2.redhat.com [10.36.115.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 729955D742;
 Wed,  5 May 2021 10:10:59 +0000 (UTC)
Date: Wed, 5 May 2021 12:10:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] qcow2: set bdi->is_dirty
Message-ID: <YJJvMc9HbwgFlu3g@merkur.fritz.box>
References: <20210504160656.462836-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210504160656.462836-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: den@openvz.org, ktkhai@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.05.2021 um 18:06 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Set bdi->is_dirty, so that qemu-img info could show dirty flag.
> 
> After this commit the following check will show '"dirty-flag": true':
> 
> ./build/qemu-img create -f qcow2 -o lazy_refcounts=on x 1M
> ./build/qemu-io x
> qemu-io> write 0 1M
> 
>  After "write" command success, kill the qemu-io process:
> 
> kill -9 <qemu-io pid>
> 
> ./build/qemu-img info --output=json x
> 
> This will show '"dirty-flag": true' among other things. (before this
> commit it shows '"dirty-flag": false')
> 
> Note, that qcow2's dirty-bit is not a "dirty bit for the image". It
> only protects qcow2 lazy refcounts feature. So, there are a lot of
> conditions when qcow2 session may be not closed correctly, but bit is
> 0. Still, when bit is set, the last session is definitely not finished
> correctly and it's better to report it.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

Kevin


