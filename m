Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094F2D4ADE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:48:30 +0100 (CET)
Received: from localhost ([::1]:52942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5Rt-0005J7-8a
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kn4Ib-0000z1-Cn
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kn4IX-00081r-RB
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607538883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g+1Q8auRqEosiI+y9hZxOmmaj+CXcQnPb06PCi+j7WA=;
 b=ExSZRRk3vUc9aq1Ji9VjeNfIR17TeSYRa3kgXcweOCM1ywPnfdva7174XQyOygGZEm7V32
 OJ1f5x6U0vZ4XmFwFrUXMrW5QV+wE05gTqdV2AJ8ayKwSB9/0sA34j9mmdNoWDIQAsDSzn
 h9JnoP+1H163njxWG/d8STIg7tSCvXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-DrwJQ9wOM1mqPAUf4T49gQ-1; Wed, 09 Dec 2020 13:34:41 -0500
X-MC-Unique: DrwJQ9wOM1mqPAUf4T49gQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 750E71005504;
 Wed,  9 Dec 2020 18:34:39 +0000 (UTC)
Received: from omen.home (ovpn-112-10.phx2.redhat.com [10.3.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 658B310016F5;
 Wed,  9 Dec 2020 18:34:32 +0000 (UTC)
Date: Wed, 9 Dec 2020 11:34:31 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
Message-ID: <20201209113431.5b252e93@omen.home>
In-Reply-To: <20201209132947.3177f130.cohuck@redhat.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
 <20201209132947.3177f130.cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Shenming Lu <lushenming@huawei.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 13:29:47 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 9 Dec 2020 16:09:17 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
> > On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
> > setup, if the restoring of the VFIO PCI device config space is
> > before the VGIC, an error might occur in the kernel.
> > 
> > So we move the saving of the config space to the non-iterable
> > process, so that it will be called after the VGIC according to
> > their priorities.
> > 
> > As for the possible dependence of the device specific migration
> > data on it's config space, we can let the vendor driver to
> > include any config info it needs in its own data stream.
> > (Should we note this in the header file linux-headers/linux/vfio.h?)  
> 
> Given that the header is our primary source about how this interface
> should act, we need to properly document expectations about what will
> be saved/restored when there (well, in the source file in the kernel.)
> That goes in both directions: what a userspace must implement, and what
> a vendor driver can rely on.
> 
> [Related, but not a todo for you: I think we're still missing proper
> documentation of the whole migration feature.]

Yes, we never saw anything past v1 of the documentation patch.  Thanks,

Alex


> > Signed-off-by: Shenming Lu <lushenming@huawei.com>
> > ---
> >  hw/vfio/migration.c | 25 +++++++++++++++----------
> >  1 file changed, 15 insertions(+), 10 deletions(-)  


