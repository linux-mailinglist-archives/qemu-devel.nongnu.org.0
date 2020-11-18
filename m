Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1DC2B7753
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 08:51:32 +0100 (CET)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfIFX-0004HH-QX
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 02:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfIEA-0003kV-A4
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 02:50:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kfIE8-0007ij-9L
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 02:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605685803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=875ExDgujjG7x+qxkqbVrQhyIJWpSBtUawvueclUcWI=;
 b=U13MnSIUAPunrtdEqweFbpCEOOTrJv4GdGB/+Oae5DFSU3wPMFJbELiK0Zn3vcWB8kA8Kl
 ezhKp6k5NO4aiawJ0RqObwJ4k6maIxpBjsfZz6YdixU+Gq9guIi9+UFiV15p+m258ZA5HQ
 w63KRSW7n6O2M6s+PsWHm4x+dTC2oIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-b1Mkw0bHNeCBGByUzx-mfw-1; Wed, 18 Nov 2020 02:49:59 -0500
X-MC-Unique: b1Mkw0bHNeCBGByUzx-mfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96C366D585;
 Wed, 18 Nov 2020 07:49:58 +0000 (UTC)
Received: from gondolin (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B708A5C1BB;
 Wed, 18 Nov 2020 07:49:49 +0000 (UTC)
Date: Wed, 18 Nov 2020 08:49:47 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH for-5.2] s390x/pci: fix endianness issues
Message-ID: <20201118084947.172002fe.cohuck@redhat.com>
In-Reply-To: <f4f665ad-c499-7824-bfd7-78b75b6216c4@linux.ibm.com>
References: <20201117171340.1289659-1-cohuck@redhat.com>
 <6a1b2ba1-642a-9cee-4d7d-2c1e4ea826ed@redhat.com>
 <f4f665ad-c499-7824-bfd7-78b75b6216c4@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 14:49:53 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> On 11/17/20 2:21 PM, Thomas Huth wrote:
> > On 17/11/2020 18.13, Cornelia Huck wrote:  
> >> zPCI control blocks are big endian, we need to take care that we
> >> do proper accesses in order not to break tcg guests on little endian
> >> hosts.
> >>
> >> Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
> >> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
> >> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")  
> > 
> > This fixes the problem with my old Fedora 28 under TCG, too, but... do we
> > really want to store this information in big endian on the QEMU side (e.g.
> > in the QTAILQ lists)? ... that smells like trouble again in the future...
> > 
> > I think it would be better if we rather replace all those memcpy() functions
> > in the patches that you cited in the "Fixes:" lines above with code that
> > changes the endianess when we copy the date from QEMU space to guest space
> > and vice versa. What do you think?  
> 
> Hmm, that's actually a fair point...  Such an approach would have the 
> advantage of avoiding weird lines like the following:
> 
>       memory_region_add_subregion(&pbdev->iommu->mr,
> -                                pbdev->pci_group->zpci_group.msia,
> +                                ldq_p(&pbdev->pci_group->zpci_group.msia),
>                                   &pbdev->msix_notify_mr);
> 
> 
> And would keep messing with endianness largely contained to the code 
> that handles CLPs.  It does take away the niceness of being able to 
> gather the CLP response in one fell memcpy but...  It's not like these 
> are done very often (device init).
> 

Not opposed to it, can try to put a patch together and see what it
looks like. As long as we get this into 5.2 :)


