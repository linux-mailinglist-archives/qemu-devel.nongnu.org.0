Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DD92DE1DB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:17:51 +0100 (CET)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDle-0004p6-1E
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kqDZ9-0006EC-OL
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:04:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kqDZ6-0003cl-8v
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:04:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608289491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=376jLot6ICkh+Oi/lgzPdEAsdFS+rwQIi8tE0SRyz78=;
 b=OpNccHAF1L5oA/qIyOjQIcgVoq42PAuxPeqmsxcapq0pcVk7SPafUDGw6XXbBjmo7ImEkM
 B7umgfYF+uvi0AsyyGJQXxGh6E1P7bkI2/gzOkAi7WdWBXZaxcQhvUFZTQ/X3SnaxtH53b
 sa0q9U/h/GIZlPouR9iNQljpBBNQSsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-xj9C8lAGP-Sdm_VsmNKiNQ-1; Fri, 18 Dec 2020 06:04:49 -0500
X-MC-Unique: xj9C8lAGP-Sdm_VsmNKiNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0064659;
 Fri, 18 Dec 2020 11:04:48 +0000 (UTC)
Received: from gondolin (ovpn-113-130.ams2.redhat.com [10.36.113.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1AB8118993;
 Fri, 18 Dec 2020 11:04:42 +0000 (UTC)
Date: Fri, 18 Dec 2020 12:04:40 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] s390x/pci: Fix memory_region_access_valid call
Message-ID: <20201218120440.36b56e80.cohuck@redhat.com>
In-Reply-To: <72f4e03f-7208-6af0-4cd2-9715d9f9ec77@linux.ibm.com>
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
 <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
 <72f4e03f-7208-6af0-4cd2-9715d9f9ec77@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: thuth@redhat.com, Matthew Rosato <mjrosato@linux.ibm.com>, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 10:37:38 +0100
Pierre Morel <pmorel@linux.ibm.com> wrote:

> On 12/17/20 11:16 PM, Matthew Rosato wrote:
> > In pcistb_service_handler, a call is made to validate that the memory
> > region can be accessed.  However, the call is made using the entire length
> > of the pcistb operation, which can be larger than the allowed memory
> > access size (8).  Since we already know that the provided buffer is a
> > multiple of 8, fix the call to memory_region_access_valid to iterate
> > over the memory region in the same way as the subsequent call to
> > memory_region_dispatch_write.
> > 
> > Fixes: 863f6f52b7 ("s390: implement pci instructions")
> > Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> > ---
> >   hw/s390x/s390-pci-inst.c | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> > index e230293..76b08a3 100644
> > --- a/hw/s390x/s390-pci-inst.c
> > +++ b/hw/s390x/s390-pci-inst.c
> > @@ -821,10 +821,12 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
> >       mr = s390_get_subregion(mr, offset, len);
> >       offset -= mr->addr;
> >   
> > -    if (!memory_region_access_valid(mr, offset, len, true,
> > -                                    MEMTXATTRS_UNSPECIFIED)) {
> > -        s390_program_interrupt(env, PGM_OPERAND, ra);
> > -        return 0;
> > +    for (i = 0; i < len; i += 8) {
> > +        if (!memory_region_access_valid(mr, offset + i, 8, true,
> > +                                        MEMTXATTRS_UNSPECIFIED)) {
> > +            s390_program_interrupt(env, PGM_OPERAND, ra);
> > +            return 0;
> > +        }
> >       }
> >   
> >       if (s390_cpu_virt_mem_read(cpu, gaddr, ar, buffer, len)) {
> >   
> 
> wouldn't it be made automatically by defining the io_region 
> max_access_size when reading the bars in clp_service_call?
> 

But that's already what is happening, isn't it? The access check is
done for a size that is potentially too large, while the actual access
will happen in chunks of 8? I think that this patch is correct.


