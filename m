Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BDA19BE82
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 11:23:07 +0200 (CEST)
Received: from localhost ([::1]:35878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJw42-0005oP-8Z
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 05:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52747)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jJw3I-0005N1-U7
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:22:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jJw3I-0008Un-0Z
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:22:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jJw3H-0008Uc-Tj
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585819339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vddQOmvtxg6zWkptO4fPxV4A9VXzTF4H9XbwvtgvWHs=;
 b=Lq7dql230eS+cCMH2GqLYiyMZoT+N8Y3pc+Ck+nrqF9ZWfynpV2YfatarzJRVh6VVdvMhm
 fUiEu3jfSPHDyku2IxG6AOkFh1wHWbY9aYiqlinBS6+nx1883fJwQ/edhiO/Gba4UOUyth
 j1TJAaTad4QqdUoap8tFQuUUJsqjvmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-duJSzTU1OCWEKNjomFST9Q-1; Thu, 02 Apr 2020 05:22:15 -0400
X-MC-Unique: duJSzTU1OCWEKNjomFST9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49976107ACCC;
 Thu,  2 Apr 2020 09:22:14 +0000 (UTC)
Received: from gondolin (ovpn-113-176.ams2.redhat.com [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E603C101F96B;
 Thu,  2 Apr 2020 09:22:09 +0000 (UTC)
Date: Thu, 2 Apr 2020 11:22:06 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 1/1] vl/s390x: fixup ram sizes for compat machines
Message-ID: <20200402112206.17c942de.cohuck@redhat.com>
In-Reply-To: <285819e0-e23e-32ac-b061-a0b683baeb5a@redhat.com>
References: <20200401123754.109602-1-borntraeger@de.ibm.com>
 <285819e0-e23e-32ac-b061-a0b683baeb5a@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?B?THVr?= =?UTF-8?B?w6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Apr 2020 15:14:12 +0200
David Hildenbrand <david@redhat.com> wrote:

> On 01.04.20 14:37, Christian Borntraeger wrote:

> > +static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
> > +{
> > +    /* same logic as in sclp.c */
> > +    int increment_size = 20;
> > +    ram_addr_t newsz;
> > +
> > +    while ((sz >> increment_size) > MAX_STORAGE_INCREMENTS) {
> > +        increment_size++;
> > +    }
> > +    newsz = sz >> increment_size << increment_size;
> > +
> > +    if (sz != newsz) {
> > +        qemu_printf("Ram size %" PRIu64 "MB was fixed up to %" PRIu64
> > +                    "MB to match machine restrictions. Consider updating "
> > +                    "the guest definition.i\n", sz / MiB, newsz / MiB);  
> 
> Not sure if news/zs will be printed correctly in case ram_addr_t !=
> uint64_t.

RAM_ADDR_FMT might be the right thing to use here?


