Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D5F22E9CC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 12:12:10 +0200 (CEST)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0077-0006tG-Cx
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 06:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k006K-0006PT-CN
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 06:11:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38469
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k006I-0002II-N6
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 06:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595844678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1RXvpvbJUNqLsIsqGecdNIZwEbPFPSUSIdozP4PyYU=;
 b=IEw6a5owsitxkgZJE6X/sBs3M0BaMXZmbD3HIAD6AV8G/AtNjQjlGlhmBiJEqK2sztK/gS
 CimyauCFTnLYf7onu0YckPt76m5zVEoS834MwP9SlEm/CeqWjN+EzLsAf6F1SViorHmPad
 uMANQrqNOInIPu2Ul3WUOi4BjyEEsDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-sCB1jdBpMA6Zc7zAtlmAOg-1; Mon, 27 Jul 2020 06:11:14 -0400
X-MC-Unique: sCB1jdBpMA6Zc7zAtlmAOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA5AD80183C;
 Mon, 27 Jul 2020 10:11:12 +0000 (UTC)
Received: from gondolin (ovpn-112-210.ams2.redhat.com [10.36.112.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE28310013D0;
 Mon, 27 Jul 2020 10:11:04 +0000 (UTC)
Date: Mon, 27 Jul 2020 12:11:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFCv3 8/9] s390x: implement virtio-mem-ccw
Message-ID: <20200727121102.12c5bc38.cohuck@redhat.com>
In-Reply-To: <c55dbd7e-2786-c797-50ac-e6536d00d86c@redhat.com>
References: <20200724143750.59836-1-david@redhat.com>
 <20200724143750.59836-9-david@redhat.com>
 <20200727115829.46fd241a.cohuck@redhat.com>
 <c55dbd7e-2786-c797-50ac-e6536d00d86c@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 01:46:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Jul 2020 12:02:07 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 27.07.20 11:58, Cornelia Huck wrote:
> > On Fri, 24 Jul 2020 16:37:49 +0200
> > David Hildenbrand <david@redhat.com> wrote:
> >   
> >> Add a proper CCW proxy device, similar to the PCI variant.
> >>
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >>  hw/s390x/virtio-ccw-mem.c | 167 ++++++++++++++++++++++++++++++++++++++
> >>  hw/s390x/virtio-ccw.h     |  13 +++
> >>  2 files changed, 180 insertions(+)
> >>  create mode 100644 hw/s390x/virtio-ccw-mem.c  
> > 
> > What happens on an old machine type -- I guess the device is just
> > useless?  
> 
> Trying to plug will fail in the pre_plug stage via
> 
> hw/mem/memory-device.c:memory_device_pre_plug()->memory_device_get_free_addr()
> 
> with "memory devices (e.g. for memory hotplug) are not supported by the
> machine"
> 
> whereby never machines where "maxmem" was not properly specified will
> result in
> 
> "memory devices (e.g. for memory hotplug) are not enabled, please
> specify the maxmem option"
> 

Ah, sounds good :)


