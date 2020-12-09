Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821B12D4228
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:32:25 +0100 (CET)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyds-0006gm-JE
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:32:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmybv-0005z6-Q8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:30:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmybj-0005eU-8L
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607517009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knk/7SMK06nT463TgLi3CGb9tMWaA9M2L0P91mUeT+M=;
 b=i1r1IHKEfW+kbeaMHX+3As1rBW1/NqXvX+pqZuIvLkKyIHptI7UPdV618NE2scljjcFROj
 iJ0STi/0HAcKuHHdHKkD8E3ljKItScpgRi2Br5uxKGRKv/xquX4q28D2vcrALwPu6r9DoW
 vYP689EblTWzfdRbOXy+brB2v6NhooM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-DUszSkpbPESt4OPb73Ohlw-1; Wed, 09 Dec 2020 07:30:05 -0500
X-MC-Unique: DUszSkpbPESt4OPb73Ohlw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6DE1C73A0;
 Wed,  9 Dec 2020 12:30:03 +0000 (UTC)
Received: from gondolin (ovpn-113-135.ams2.redhat.com [10.36.113.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74FCB60BF3;
 Wed,  9 Dec 2020 12:29:50 +0000 (UTC)
Date: Wed, 9 Dec 2020 13:29:47 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
Message-ID: <20201209132947.3177f130.cohuck@redhat.com>
In-Reply-To: <20201209080919.156-2-lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, qemu-devel@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 16:09:17 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
> setup, if the restoring of the VFIO PCI device config space is
> before the VGIC, an error might occur in the kernel.
> 
> So we move the saving of the config space to the non-iterable
> process, so that it will be called after the VGIC according to
> their priorities.
> 
> As for the possible dependence of the device specific migration
> data on it's config space, we can let the vendor driver to
> include any config info it needs in its own data stream.
> (Should we note this in the header file linux-headers/linux/vfio.h?)

Given that the header is our primary source about how this interface
should act, we need to properly document expectations about what will
be saved/restored when there (well, in the source file in the kernel.)
That goes in both directions: what a userspace must implement, and what
a vendor driver can rely on.

[Related, but not a todo for you: I think we're still missing proper
documentation of the whole migration feature.]

> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>  hw/vfio/migration.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)


