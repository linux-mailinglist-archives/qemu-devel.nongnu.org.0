Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AD54D4E46
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:14:02 +0100 (CET)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLQP-0000bu-9H
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:14:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nSLPU-0008LB-9l
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:13:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nSLPQ-0001j2-Un
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646928779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KryEwts34p25sptO0JKQieQ9Qnksw9bszl7/kvfIhmc=;
 b=b4UlRzDDTojvGc76Go7UTYaqFM0c7Q9vsg1ILT4tF4GLIgB8Up5Sv3PXZ0wO/jqOo6e5DA
 sSIj6whgVop+Tv4cFE+Ph3AF05Gsm2/jty/ItWhl3sKgLSdWm3PRNdzj7Y1YlR3p4YH108
 xdS/T61U5eXxr+CvJSencJeTAIkbdNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-tfrtE4u9OYKwcWhn5Zr5pg-1; Thu, 10 Mar 2022 11:12:56 -0500
X-MC-Unique: tfrtE4u9OYKwcWhn5Zr5pg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0A0951DC;
 Thu, 10 Mar 2022 16:12:54 +0000 (UTC)
Received: from localhost (unknown [10.39.194.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6C237FFEE;
 Thu, 10 Mar 2022 16:12:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/1] virtio: fix feature negotiation for ACCESS_PLATFORM
In-Reply-To: <20220307112939.2780117-1-pasic@linux.ibm.com>
Organization: Red Hat GmbH
References: <20220307112939.2780117-1-pasic@linux.ibm.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Thu, 10 Mar 2022 17:12:38 +0100
Message-ID: <87wnh1hjm1.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07 2022, Halil Pasic <pasic@linux.ibm.com> wrote:

> Unlike most virtio features ACCESS_PLATFORM is considered mandatory by
> QEMU, i.e. the driver must accept it if offered by the device. The
> virtio specification says that the driver SHOULD accept the
> ACCESS_PLATFORM feature if offered, and that the device MAY fail to
> operate if ACCESS_PLATFORM was offered but not negotiated.
>
> While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
> the device when the driver fences ACCESS_PLATFORM. With commit
> 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
> decision to do so whenever the get_dma_as() callback is implemented (by
> the bus), which in practice means for the entirety of virtio-pci.
>
> That means, if the device needs to translate I/O addresses, then
> ACCESS_PLATFORM is mandatory. The aforementioned commit tells us in the
> commit message that this is for security reasons. More precisely if we
> were to allow a less then trusted driver (e.g. an user-space driver, or
> a nested guest) to make the device bypass the IOMMU by not negotiating
> ACCESS_PLATFORM, then the guest kernel would have no ability to
> control/police (by programming the IOMMU) what pieces of guest memory
> the driver may manipulate using the device. Which would break security
> assumptions within the guest.
>
> If ACCESS_PLATFORM is offered not because we want the device to utilize
> an IOMMU and do address translation, but because the device does not
> have access to the entire guest RAM, and needs the driver to grant
> access to the bits it needs access to (e.g. confidential guest support),
> we still require the guest to have the corresponding logic and to accept
> ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
> things are bound to go wrong, and we may see failures much less graceful
> than failing the device because the driver didn't negotiate
> ACCESS_PLATFORM.
>
> So let us make ACCESS_PLATFORM mandatory for the driver regardless
> of whether the get_dma_as() callback is implemented or not.
>
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")
>
> ---
> v2 -> v3:
> * Rebased onto the next branch of the git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git
>   repository
> v1 -> v2:
> * Change comment: reflect that this is not about the verify
>   but also about the device features as seen by the driver (Connie)
> RFC -> v1:
> * Tweaked the commit message and fixed typos (Connie)
> * Added two sentences discussing the security implications (Michael)
>
> This patch is based on:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html
>
> During the review of "virtio: fix the condition for iommu_platform not
> supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
> iff has_iommu && !!klass->get_dma_as. My answer to that was, that
> this logic ain't right.
>
> While at it I used the opportunity to re-organize the code a little
> and provide an explanatory comment.
> ---
>  hw/virtio/virtio-bus.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


