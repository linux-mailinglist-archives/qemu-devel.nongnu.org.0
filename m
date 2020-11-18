Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9012B801A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:08:06 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfP41-0002Qy-JH
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfOx3-00052Q-UJ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfOx1-0006le-Gf
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605711647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9T5ArolKtt9fsjLl+GZYhKC8vIeNENICblwUmeGDkI8=;
 b=TI9TvNN8j2+vdAdFuodwDeswJswsmLj+PThfSdexHf7YK1yp3mvsIPrmoubQDZL4TOC+fC
 MammcJojaDstaLS6sY3MSKTWCFkjgu/mldNS2CIajFY6na1eH8GmdM2U8pn2tolWLao558
 KZ+Dtf+XeIQ5Q2XN2hbefg6R/GrJ1mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-IiP_ygN_PdyYe2xgujq8VQ-1; Wed, 18 Nov 2020 10:00:45 -0500
X-MC-Unique: IiP_ygN_PdyYe2xgujq8VQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A96C100F7BA;
 Wed, 18 Nov 2020 15:00:43 +0000 (UTC)
Received: from gondolin (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70B8660853;
 Wed, 18 Nov 2020 15:00:34 +0000 (UTC)
Date: Wed, 18 Nov 2020 16:00:32 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH for-5.2 v3] s390x/pci: fix endianness issues
Message-ID: <20201118160032.02998aba.cohuck@redhat.com>
In-Reply-To: <39445c44-6f2c-e337-08fd-cde55f8be586@linux.ibm.com>
References: <20201118104202.1301363-1-cohuck@redhat.com>
 <39445c44-6f2c-e337-08fd-cde55f8be586@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Nov 2020 09:20:39 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> On 11/18/20 5:42 AM, Cornelia Huck wrote:
> > The zPCI group and function structures are big endian. However, we do
> > not consistently store them as big endian locally, and are missing some
> > conversions.
> > 
> > Let's just store the structures as host endian instead and convert to
> > big endian when actually handling the instructions retrieving the data.
> > 
> > Also fix the layout of ClpReqQueryPciGrp: g is actually only 8 bit. This
> > also fixes accesses on little endian hosts, and makes accesses on big
> > endian hosts consistent.
> > 
> > Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
> > Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> > Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > 
> > v2->v3: added missing zpci_fn.flags copy, removed forgotten memcopy
> > v1->v2: switched to keeping the internal structures as host-endian
> > 
> > Again, tested on x86 and s390x (tcg/kvm) with virtio-pci devices;
> > testing vfio-pci devices would be good.  
> 
> Thanks Connie, code looks good to me:
> 
> Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
> 
> And I once again took this for a spin with vfio-pci, driving network and 
> disk workloads using a fairly recent (5.10-rc3) kernel in host/guest.  I 
> also rolled back the host to an older kernel to drive the default clp 
> paths with vfio -- Everything works fine.  I also verified that a tcg 
> guest on x86 using a virtio pci device can see it as expected (Lesson 
> learned: I will make a point of testing against tcg moving forward).  I 
> further double-checked the live pfgid / g values going to/from the guest 
> in all 3 environments since this structure was changed; everything looks 
> good.
> 
> So if you'd like:
> 
> Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>

Wonderful, thanks!

> 
> 
> 
> > 
> > ---
> >   hw/s390x/s390-pci-bus.c         | 10 +++++-----
> >   hw/s390x/s390-pci-inst.c        | 16 ++++++++++++++--
> >   hw/s390x/s390-pci-vfio.c        | 12 ++++++------
> >   include/hw/s390x/s390-pci-clp.h |  8 ++++----
> >   4 files changed, 29 insertions(+), 17 deletions(-)


