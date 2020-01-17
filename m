Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44B140A88
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 14:17:08 +0100 (CET)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isRUo-00027W-Rq
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 08:17:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1isRTU-0001ZI-Gz
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:15:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1isRTQ-00005A-09
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:15:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45862
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1isRTP-0008Vc-Gv
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579266938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iIBOlwwddxLm/wFmbClDgfBUiXwTJeo1h7DFwBHfUWM=;
 b=HpiFy5AfbJZhdaXFSwOJsw5/AjIrHUlQIkSzcjKsR2Yp55xzGrZmUNdtkE/04Wo6Phy7ZK
 uhQabgaCqDvS2Sf8h18seGSW7VcTC0iins1Tben6Nb/ad2GyfJalm7Xf/TE8HcJb6kkErv
 o/So3OvgwnzuMDUF62sDjc2QjVvSvaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-ltJOukHcOdScL78F8Q298Q-1; Fri, 17 Jan 2020 08:15:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B762DB60;
 Fri, 17 Jan 2020 13:15:36 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 328D180895;
 Fri, 17 Jan 2020 13:15:35 +0000 (UTC)
Date: Fri, 17 Jan 2020 14:15:33 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>
Subject: Re: [PATCH v2] s390x: adapter routes error handling
Message-ID: <20200117141533.0e31b9f5.cohuck@redhat.com>
In-Reply-To: <20200117111147.5006-1-cohuck@redhat.com>
References: <20200117111147.5006-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ltJOukHcOdScL78F8Q298Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Jan 2020 12:11:47 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> If the kernel irqchip has been disabled, we don't want the
> {add,release}_adapter_routes routines to call any kvm_irqchip_*
> interfaces, as they may rely on an irqchip actually having been
> created. Just take a quick exit in that case instead.
> 
> Also initialize routes->gsi[] with -1 in the virtio-ccw handling,
> to make sure we don't trip over other errors, either. (Nobody
> else uses the gsi array in that structure.)
> 
> Fixes: d426d9fba8ea ("s390x/virtio-ccw: wire up irq routing and irqfds")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> v1->v2:
>   - also initialize the gsi array with -1
> 
> ---
>  hw/intc/s390_flic_kvm.c | 8 ++++++++
>  hw/s390x/virtio-ccw.c   | 4 ++++
>  2 files changed, 12 insertions(+)

Queued (with amended commit message) to s390-next.


