Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309F2B5C20
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:47:25 +0100 (CET)
Received: from localhost ([::1]:47680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexa8-0003JO-92
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kexYv-0002KA-W1
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kexYu-0007ij-BJ
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:46:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605606367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/EBC6JmDAwZ2rGIFumlTUXYxKcYI/z5NmIx6oRZyMlI=;
 b=HrqmF/4bwWHEqk+RmEUea1CHuGhVFbsQZJN6QF5L7LH2/PVROaEu12YuWTYy+bc17V0IsA
 PocAc8m/9LP4HEQBtR9pELsSAripWVKEpDEgsc13a0SwQf5znKsvRqH8IWuwAeNnOOmFeb
 RBUmrujEmSKm8sl/qYDyhyjy1K+NrdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-fScvmpIeNxyZdowGcxpCng-1; Tue, 17 Nov 2020 04:46:03 -0500
X-MC-Unique: fScvmpIeNxyZdowGcxpCng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22433186840D;
 Tue, 17 Nov 2020 09:46:02 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBB325D9CC;
 Tue, 17 Nov 2020 09:45:52 +0000 (UTC)
Date: Tue, 17 Nov 2020 10:45:50 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH for-5.2] s390x/pci: Unregister listeners before
 destroying IOMMU address space
Message-ID: <20201117104550.74465dab.cohuck@redhat.com>
In-Reply-To: <1605562955-21152-1-git-send-email-mjrosato@linux.ibm.com>
References: <1605562955-21152-1-git-send-email-mjrosato@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, schnelle@linux.ibm.com, richard.henderson@linaro.org,
 groug@kaod.org, mlevitsk@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 16:42:35 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> Hot-unplugging a vfio-pci device on s390x causes a QEMU crash:
> 
> qemu-system-s390x: ../softmmu/memory.c:2772:
>  do_address_space_destroy: Assertion `QTAILQ_EMPTY(&as->listeners)' failed.
> 
> In s390, the IOMMU address space is freed during device unplug but the
> associated vfio-pci device may not yet be finalized and therefore may
> still have a listener registered to the IOMMU address space.
> 
> Commit a2166410ad74 ("spapr_pci: Unregister listeners before destroying
> the IOMMU address space") previously resolved this issue for spapr_pci.
> We are now seeing this in s390x; it would seem the possibility for this
> issue was already present but based on a bisect commit 2d24a6466154
> ("device-core: use RCU for list of children of a bus") has now changed
> the timing such that it is now readily reproducible.
> 
> Add logic to ensure listeners are removed before destroying the address
> space.
> 
> Reported-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  hw/s390x/s390-pci-bus.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks, queued to s390-fixes.


