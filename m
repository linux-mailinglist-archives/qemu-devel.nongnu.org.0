Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E250D1CFA8F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 18:25:49 +0200 (CEST)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYXj3-0001BW-02
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 12:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jYXhy-0000f3-6H
 for qemu-devel@nongnu.org; Tue, 12 May 2020 12:24:42 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25836
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jYXhw-0002yd-U9
 for qemu-devel@nongnu.org; Tue, 12 May 2020 12:24:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589300679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r294NouPfiywlw5AD5hRTT3E0nnOo15M9FK+pKIj9AI=;
 b=Lte6l+hS9JQzB+T4fgaG5GPRu1WEzDbiKL6od8M594W9QcHYC+yFKU0s/Q6l3SbKG9CKlH
 MPoJSuMf9VjzHwNI+i84O6BdWpDJFaUnG9RIJWFGhBcLycwCR67kYOJJIx3+LVzeVzauJS
 8f54klNTLPLGiwYFJ9gO0MCMtaYJefU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-V0ezHK1sP-yo2wan-M-Yxw-1; Tue, 12 May 2020 12:24:37 -0400
X-MC-Unique: V0ezHK1sP-yo2wan-M-Yxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2188107ACF2;
 Tue, 12 May 2020 16:24:35 +0000 (UTC)
Received: from gondolin (ovpn-112-176.ams2.redhat.com [10.36.112.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C21AD5C1B2;
 Tue, 12 May 2020 16:24:27 +0000 (UTC)
Date: Tue, 12 May 2020 18:24:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Collin Walling <walling@linux.ibm.com>
Subject: Re: [PATCH v1 2/8] s390/sclp: check sccb len before filling in data
Message-ID: <20200512182425.0ab4411c.cohuck@redhat.com>
In-Reply-To: <dc423845-2b63-7c08-774e-9546c2defe58@linux.ibm.com>
References: <20200508230823.22956-1-walling@linux.ibm.com>
 <20200508230823.22956-3-walling@linux.ibm.com>
 <58bc496c-28bb-26f8-ab46-aba6ad141717@linux.ibm.com>
 <737869a8-13b2-1831-00c6-629d5a109d9c@redhat.com>
 <05ab2e59-10c0-c7df-c014-b54883ddccd3@linux.ibm.com>
 <9a39a948-91a1-7cfe-f2a5-d30e5564f318@redhat.com>
 <20200512180140.4be69d60.cohuck@redhat.com>
 <dc423845-2b63-7c08-774e-9546c2defe58@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 01:41:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Janosch Frank <frankja@linux.ibm.com>, mst@redhat.com,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 svens@linux.ibm.com, pbonzini@redhat.com, mihajlov@linux.ibm.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 May 2020 12:16:45 -0400
Collin Walling <walling@linux.ibm.com> wrote:

> On 5/12/20 12:01 PM, Cornelia Huck wrote:
> > On Mon, 11 May 2020 17:02:06 +0200
> > David Hildenbrand <david@redhat.com> wrote:
> >   
> >> On 11.05.20 16:50, Janosch Frank wrote:  
> >>> On 5/11/20 4:44 PM, David Hildenbrand wrote:  
> >>>> On 11.05.20 16:36, Janosch Frank wrote:  
> >>>>> On 5/9/20 1:08 AM, Collin Walling wrote:  
> >>>>>> The SCCB must be checked for a sufficient length before it is filled
> >>>>>> with any data. If the length is insufficient, then the SCLP command
> >>>>>> is suppressed and the proper response code is set in the SCCB header.
> >>>>>>
> >>>>>> Signed-off-by: Collin Walling <walling@linux.ibm.com>  
> >>>>>
> >>>>> Fixes tag?  
> > 
> > Probably
> > 
> > Fixes: 832be0d8a3bb ("s390x: sclp: Report insufficient SCCB length")
> > 
> > ?
> >   
> 
> Sounds reasonable. This patch doesn't fix any explicitly-known bugs 
> AFAIK. The s390 Linux kernel is hard-coded to use a 4K size SCCB when
> executing these commands.
> 
> I suppose this could introduce a bug if things change in the Linux 
> kernel or if some other OS wants to use this command. That should be 
> enough of a justification, right? (Just want to make sure I understand 
> the use of the tag correctly).

Yes; from the description of how this is supposed to work it fixes
architectural conformance, not a bug that is triggered by today's guest
systems.

[Usage of the Fixes: tag in QEMU is not quite as essential as in Linux,
as we don't do the numerous, big stable updates here; I don't think
this is stable material, but we can certainly record where this was
introduced.]


