Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05D336BB25
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 23:23:43 +0200 (CEST)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb8hi-0005k2-Ce
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 17:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lb8gH-0005AM-1t
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 17:22:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lb8gD-0004dp-8E
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 17:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619472128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oP0O+mKvnnhFpp+vgFChfrVZBOeXKMp+lgXFk5L79T4=;
 b=Cprd3HJn3uKPYqUlIUnIzv/VQd/42Pd9/awxM7ba5xwfERQPgzH4KRh8WT/FY6c9wLClLP
 shDs1a6BHEa6C6osEPMvMQr2hKWv02rQHlitwr20bg/LoedtVsxy13LbOWKCjsG6Z8FbWX
 51Xsm8D4yLpTfA0/pe/dYOH7ZVH6ntM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-mPLlCkzzO9GLy_VYRsq7Hw-1; Mon, 26 Apr 2021 17:22:06 -0400
X-MC-Unique: mPLlCkzzO9GLy_VYRsq7Hw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 746361008060;
 Mon, 26 Apr 2021 21:22:04 +0000 (UTC)
Received: from redhat.com (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09A435C67A;
 Mon, 26 Apr 2021 21:22:03 +0000 (UTC)
Date: Mon, 26 Apr 2021 15:22:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Dev Audsin <dev.devaqemu@gmail.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
Message-ID: <20210426152203.379dab00@redhat.com>
In-Reply-To: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
References: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 21:50:38 +0100
Dev Audsin <dev.devaqemu@gmail.com> wrote:

> Hi Alex and David
> 
> @Alex:
> 
> Justification on why this region cannot be a DMA target for the device,
> 
> virtio-fs with DAX is currently not compatible with NIC Pass through.
> When a SR-IOV VF attaches to a qemu process, vfio will try to pin the
> entire DAX Window but it is empty when the guest boots and will fail.
> A method to make VFIO and DAX to work together is to make vfio skip
> DAX cache.
> 
> Currently DAX cache need to be set to 0, for the SR-IOV VF to be
> attached to Kata containers. Enabling both SR-IOV VF and DAX work
> together will potentially improve performance for workloads which are
> I/O and network intensive.

Sorry, there's no actual justification described here.  You're enabling
a VM with both features, virtio-fs DAX and VFIO, but there's no
evidence that they "work together" or that your use case is simply
avoiding a scenario where the device might attempt to DMA into the area
with this designation.  With this change, if the device were to attempt
to DMA into this region, it would be blocked by the IOMMU, which might
result in a data loss within the VM.  Justification of this change
needs to prove that this region can never be a DMA target for the
device, not simply that both features can be enabled and we hope that
they don't interact.  Thanks,

Alex


