Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67B536DE65
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:37:08 +0200 (CEST)
Received: from localhost ([::1]:35146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbo7X-0002lO-Sh
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbnk0-0007QG-2Q
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:12:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbnjx-0000rx-UL
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619629962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EPCDwygkCCgPKhB317DvbFYmY7AzMnKsonTlFWQolM=;
 b=ZIb05Inp1tFKDLFYIRW/oAYJnZU4YXNF4HYJQ9yoEFK+g7COg9nleiO/71D4Q+hgma46Nt
 Mx/M228fEdmyUm9ZLq1mHp6oBHrW9vtu5I/uzMq8MKaOtFaEY4JnSH/tCu85ah2eAoq9BB
 SDcpy+n4LSz0z5Y65Ia91bCV1QtJXvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-2w--X453PZeJwFdgsDzv6Q-1; Wed, 28 Apr 2021 13:12:40 -0400
X-MC-Unique: 2w--X453PZeJwFdgsDzv6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD17A10066E5;
 Wed, 28 Apr 2021 17:12:38 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-113.ams2.redhat.com
 [10.36.113.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D642B19C45;
 Wed, 28 Apr 2021 17:12:37 +0000 (UTC)
Date: Wed, 28 Apr 2021 19:12:35 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v2] vfio-ccw: Attempt to clean up all IRQs on error
Message-ID: <20210428191235.35ca2c35.cohuck@redhat.com>
In-Reply-To: <20210428143652.1571487-1-farman@linux.ibm.com>
References: <20210428143652.1571487-1-farman@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 16:36:52 +0200
Eric Farman <farman@linux.ibm.com> wrote:

> The vfio_ccw_unrealize() routine makes an unconditional attempt to
> unregister every IRQ notifier, though they may not have been registered
> in the first place (when running on an older kernel, for example).
> 
> Let's mirror this behavior in the error cleanups in vfio_ccw_realize()
> so that if/when new IRQs are added, it is less confusing to recognize
> the necessary procedures. The worst case scenario would be some extra
> messages about an undefined IRQ, but since this is an error exit that
> won't be the only thing to worry about.
> 
> And regarding those messages, let's change it to a warning instead of
> an error, to better reflect their severity. The existing code in both
> paths handles everything anyway.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
> 
> Notes:
>     v1->v2:
>      - Downgrade unregister IRQ message from error to warning [CH]
>     
>     v1: https://lore.kernel.org/qemu-devel/20210427142511.2125733-1-farman@linux.ibm.com/
> 
>  hw/vfio/ccw.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Thanks, applied.


