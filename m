Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E818A185
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 18:29:00 +0100 (CET)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEcV1-0002AZ-Bs
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 13:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jEcUB-0001kX-5k
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:28:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jEcU7-0002ch-9b
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:28:05 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:39628)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jEcU7-0002bX-5p
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584552482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCAqA9MwGPTVHWbpP3JTc3SIku0UB7/aYOVrwRvsiAw=;
 b=hPvza3jxXI8z7L/Cp3vkSLVQFJbq/16vTxBpF/+GVFvIFpzG7D0eE9kWN+euDEOm1gcpn8
 iPYUslWIXkbLdMVa57dVnIciw1cw7TlX4SMtgVVctDKKnLWL4jl2SyvBloPPWeddyL2AdP
 ppWaMeZEEfCgvyyE37Fje6JwZhkiZp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-jwkcAKdrOLObc_WP74oCNw-1; Wed, 18 Mar 2020 13:28:01 -0400
X-MC-Unique: jwkcAKdrOLObc_WP74oCNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFC49189D6D6;
 Wed, 18 Mar 2020 17:27:59 +0000 (UTC)
Received: from gondolin (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CF95BBBC5;
 Wed, 18 Mar 2020 17:27:55 +0000 (UTC)
Date: Wed, 18 Mar 2020 18:27:53 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v10 05/16] s390x: protvirt: Inhibit balloon when
 switching to protected mode
Message-ID: <20200318182753.4c48d8cb.cohuck@redhat.com>
In-Reply-To: <20200318143047.2335-6-frankja@linux.ibm.com>
References: <20200318143047.2335-1-frankja@linux.ibm.com>
 <20200318143047.2335-6-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Mar 2020 10:30:36 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> Ballooning in protected VMs can only be done when the guest shares the
> pages it gives to the host. If pages are not shared, the integrity
> checks will fail once those pages have been altered and are given back
> to the guest.
> 
> As we currently do not yet have a solution for this we will continue
> like this:
> 
> 1. We block ballooning now in QEMU (with this patch).
> 
> 2. Later we will provide a change to virtio that removes the blocker
> and adds VIRTIO_F_IOMMU_PLATFORM automatically by QEMU when doing the
> protvirt switch. This is OK, as the balloon driver in Linux (the only
> supported guest) will refuse to work with the IOMMU_PLATFORM feature
> bit set.
> 
> 3. Later, we can fix the guest balloon driver to accept the IOMMU
> feature bit and correctly exercise sharing and unsharing of balloon
> pages.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  hw/s390x/s390-virtio-ccw.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


