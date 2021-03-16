Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E7E33D812
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:49:28 +0100 (CET)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBwl-0007bb-Fe
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMBuk-0006NU-P4
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMBuh-0001Ce-Nz
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:47:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615909635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uO4Oi54oe9o+i016MX4DIsX4psFWXLy4E1tpXis0Qvw=;
 b=Or1FJ/WmaAVn/bGRgF/Vw14HMrzHZPIGhFhkEzyHcAsseSrI7ziApFHLdWK9klRLzHpWjp
 ogsm8ZyJADzGoyn0w4S/89xW5TN/negaM8gAW8/nxb6dgpjTULym43TbP0kkRNj27EuSkI
 Gucj67JTiKmL8RyrU2PtS5gQPfZWSsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-Fn6HXSPqNIiyuHHvzYWnAw-1; Tue, 16 Mar 2021 11:47:11 -0400
X-MC-Unique: Fn6HXSPqNIiyuHHvzYWnAw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2D8DA40C1;
 Tue, 16 Mar 2021 15:47:08 +0000 (UTC)
Received: from work-vm (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 475F760C0F;
 Tue, 16 Mar 2021 15:47:01 +0000 (UTC)
Date: Tue, 16 Mar 2021 15:46:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
Message-ID: <YFDS8eavuGHh6EwT@work-vm>
References: <20210310192009.53848-1-targupta@nvidia.com>
 <YEnlmqNuvIxAB9mc@redhat.com> <YEpyYY2jE8TAWD8u@work-vm>
 <MWHPR11MB1886E79EB08B27A46D3AC8E88C6F9@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1886E79EB08B27A46D3AC8E88C6F9@MWHPR11MB1886.namprd11.prod.outlook.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>, "lushenming@huawei.com" <lushenming@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "dnigam@nvidia.com" <dnigam@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Tian, Kevin (kevin.tian@intel.com) wrote:
> > From: Qemu-devel <qemu-devel-bounces+kevin.tian=intel.com@nongnu.org>
> > On Behalf Of Dr. David Alan Gilbert
> > 
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Thu, Mar 11, 2021 at 12:50:09AM +0530, Tarun Gupta wrote:
> > > > Document interfaces used for VFIO device migration. Added flow of state
> > changes
> > > > during live migration with VFIO device. Tested by building docs with the
> > new
> > > > vfio-migration.rst file.
> > > >
> > > > v2:
> > > > - Included the new vfio-migration.rst file in index.rst
> > > > - Updated dirty page tracking section, also added details about
> > > >   'pre-copy-dirty-page-tracking' opt-out option.
> > > > - Incorporated comments around wording of doc.
> > > >
> > > > Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> > > > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > > > ---
> > > >  MAINTAINERS                   |   1 +
> > > >  docs/devel/index.rst          |   1 +
> > > >  docs/devel/vfio-migration.rst | 135
> > ++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 137 insertions(+)
> > > >  create mode 100644 docs/devel/vfio-migration.rst
> > >
> > >
> > > > +Postcopy
> > > > +========
> > > > +
> > > > +Postcopy migration is not supported for VFIO devices.
> > >
> > > What is the problem here and is there any plan for how to address it ?
> > 
> > There's no equivalent to userfaultfd for accesses to RAM made by a
> > device.
> > There's some potential for this to be doable with an IOMMU or the like,
> > but:
> >   a) IOMMUs and devices aren't currently happy at recovering from
> > failures
> >   b) the fragementation you get during a postcopy probably isn't pretty
> > when you get to build IOMMU tables.
> 
> To overcome such limitations one may adopt a prefault-and-pull scheme if 
> the vendor driver has the capability to track pending DMA buffers in the
> migration process (with additional uAPI changes in VFIO or userfaultfd), 
> as discussed here:
> 
> https://static.sched.com/hosted_files/kvmforum2019/7a/kvm-forum-postcopy-final.pdf

Did that get any further?

I can imagine that might be tricikier for a GPU than a network card; the
shaders in a GPU are pretty random as to what they go off and access, so
I can't see how you could prefault.

Dave

> > 
> > > Postcopy is essentially the only migration mechanism that can reliably
> > > complete, so it really should be considered the default approach to
> > > migration for all mgmt apps wanting to do migration, except in special
> > > cases.   IOW, if we want VFIO migration to be viable, we need postcopy
> > > support.
> > 
> > There's lots of other things postcopy doesn't work with; so hmm.
> > 
> 
> Agree. Also given the amount of work even for pre-copy migration, it makes 
> more sense to do things step-by-step.
> 
> Thanks
> Kevin
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


