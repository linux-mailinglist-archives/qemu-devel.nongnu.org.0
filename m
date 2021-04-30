Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39736F7C6
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:24:18 +0200 (CEST)
Received: from localhost ([::1]:41952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPNh-0007Fk-54
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcPHO-0000qr-Ec
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:17:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcPHL-0006jO-6i
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619774261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7urHHONh9IDXDyQKb0aGY/wID91MoVJ4Eh7HYtbgL0o=;
 b=Uw1S8UEjyKTT0dIyuAXnz1pbiU3BqCZI2YLH3unDzZL2WQg71RTMxVTQr8jkoPVsr43wcK
 R+zB5hSFjIeNRF+yd5MtSycMQamFn7doOE4TyZoNNnnZEawgxj8InIBtRSLh6wqp0ko2yf
 fCO+jRU1wjqQtmi31ZjQediD867xARw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-KDNu90wyOjacR69hXsrvIQ-1; Fri, 30 Apr 2021 05:17:39 -0400
X-MC-Unique: KDNu90wyOjacR69hXsrvIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDC51107ACF2;
 Fri, 30 Apr 2021 09:17:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C481A77F1D;
 Fri, 30 Apr 2021 09:17:29 +0000 (UTC)
Date: Fri, 30 Apr 2021 11:17:28 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: Re: [PATCH v2] vhost-user-blk: Fail gracefully on too large queue size
Message-ID: <YIvLKGjwF9XPjAAp@merkur.fritz.box>
References: <20210413165654.50810-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210413165654.50810-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: raphael.norwitz@nutanix.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.04.2021 um 18:56 hat Kevin Wolf geschrieben:
> virtio_add_queue() aborts when queue_size > VIRTQUEUE_MAX_SIZE, so
> vhost_user_blk_device_realize() should check this before calling it.
> 
> Simple reproducer:
> 
> qemu-system-x86_64 \
>     -chardev null,id=foo \
>     -device vhost-user-blk-pci,queue-size=4096,chardev=foo
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1935014
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Thanks for the review, applied to the block branch.

Kevin


