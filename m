Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CFB3F50E2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:57:45 +0200 (CEST)
Received: from localhost ([::1]:49554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIF7h-0003Xi-97
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIF0n-0007ey-D9
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:49:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIF0l-0000EC-SK
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629744571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RALgCDRJhfbNmXpWCK8ruSE4S4CPzSe/A2D1ORzDJxQ=;
 b=cOIgOtPr5mVw3InhLDWFIfcgCI2Jg5pmdA88sm3WZMJOTGH4oKK8wxi7kIXYh3F46yMlqG
 lBiOGuMUscxA3Ib0T/KlTeSjNilnluMuaPoAZaxDys7T+aecYoGn9cvBpBPtP+rQKzmyjy
 NwsxeuCn0hbYcB5aEF7LZsYtObPKOFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-xlo97c93OZu3xXEyHF0R9A-1; Mon, 23 Aug 2021 14:49:29 -0400
X-MC-Unique: xlo97c93OZu3xXEyHF0R9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0804A760C4
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 18:49:29 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B37B60C9D;
 Mon, 23 Aug 2021 18:49:13 +0000 (UTC)
Date: Mon, 23 Aug 2021 14:49:12 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210823184912.mazqfn7gurntj7ld@habkost.net>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210818194318.110993-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 18, 2021 at 03:43:18PM -0400, Peter Xu wrote:
> QEMU creates -device objects in order as specified by the user's cmdline.
> However that ordering may not be the ideal order.  For example, some platform
> devices (vIOMMUs) may want to be created earlier than most of the rest
> devices (e.g., vfio-pci, virtio).
> 
> This patch orders the QemuOptsList of '-device's so they'll be sorted first
> before kicking off the device realizations.  This will allow the device
> realization code to be able to use APIs like pci_device_iommu_address_space()
> correctly, because those functions rely on the platfrom devices being realized.
> 
> Now we rely on vmsd->priority which is defined as MigrationPriority to provide
> the ordering, as either VM init and migration completes will need such an
> ordering.  In the future we can move that priority information out of vmsd.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Can we be 100% sure that changing the ordering of every single
device being created won't affect guest ABI?  (I don't think we can)

How many device types in QEMU have non-default vmsd priority?

Can we at least ensure devices with the same priority won't be
reordered, just to be safe?  (qsort() doesn't guarantee that)

If very few device types have non-default vmsd priority and
devices with the same priority aren't reordered, the risk of
compatibility breakage would be much smaller.

-- 
Eduardo


