Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5302D5BAE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:26:01 +0100 (CET)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLxI-0004As-ET
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knKrV-00068E-Or
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:15:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knKrU-0007Xs-4H
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okeWZVLBuHF77Pt2D2yAEu4SYWYRW6QMbNqMiwI7QwE=;
 b=N3yfjZxrJ0l0vsriQVLNFw/JZskfxU7KqPZOWMsuL58mAkxZJKlR9a1sgcNR7s8UvJ7kGb
 YH/+OZZ9/ePxhRg+W1NS4czusH2xzIL9V2+bh7hT8Td6AUSn3ygDGGrPL+b0Zthf+8jZJM
 Bcf/CadseDn6qzIJ294qTLkLDAd0leg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-onGenxAGOQGJPvzzapnYiQ-1; Thu, 10 Dec 2020 07:15:54 -0500
X-MC-Unique: onGenxAGOQGJPvzzapnYiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F974803627;
 Thu, 10 Dec 2020 12:15:52 +0000 (UTC)
Received: from gondolin (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B7106E41C;
 Thu, 10 Dec 2020 12:15:39 +0000 (UTC)
Date: Thu, 10 Dec 2020 13:15:37 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [RFC 5/8] s390x/pci: Fix memory_region_access_valid call
Message-ID: <20201210131537.7723d397.cohuck@redhat.com>
In-Reply-To: <1607546066-2240-6-git-send-email-mjrosato@linux.ibm.com>
References: <1607546066-2240-1-git-send-email-mjrosato@linux.ibm.com>
 <1607546066-2240-6-git-send-email-mjrosato@linux.ibm.com>
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 schnelle@linux.ibm.com, richard.henderson@linaro.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  9 Dec 2020 15:34:23 -0500
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> In pcistb_service_handler, a call is made to validate that the memory
> region can be accessed.  However, the call is made using the entire length
> of the pcistb operation, which can be larger than the allowed memory
> access size (8).  Since we already know that the provided buffer is a
> multiple of 8, fix the call to memory_region_access_valid to iterate
> over the memory region in the same way as the subsequent call to
> memory_region_dispatch_write.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  hw/s390x/s390-pci-inst.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index b07ef2a..a5270d0 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -795,9 +795,11 @@ static int pcistb_default(S390PCIBusDevice *pbdev, S390CPU *cpu,
>      mr = s390_get_subregion(mr, offset, len);
>      offset -= mr->addr;
>  
> -    if (!memory_region_access_valid(mr, offset, len, true,
> -                                    MEMTXATTRS_UNSPECIFIED)) {
> -        return -EINVAL;
> +    for (i = 0; i < len / 8; i++) {
> +        if (!memory_region_access_valid(mr, offset + i * 8, 8, true,
> +                                        MEMTXATTRS_UNSPECIFIED)) {
> +            return -EINVAL;
> +        }
>      }
>  
>      if (s390_cpu_virt_mem_read(cpu, gaddr, ar, pbdev->pcistb_buf, len)) {

Hm, that looks like a fix that's applicable for the current code base
as well... do you want to split this out?


