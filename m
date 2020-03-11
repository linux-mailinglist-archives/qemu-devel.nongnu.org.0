Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B0181D18
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 17:01:39 +0100 (CET)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3ne-0003f7-AU
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 12:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1jC3li-0000lr-Ie
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1jC3lh-000122-Bu
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:59:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59015
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1jC3lh-00011l-7V
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:59:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583942376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fWJpUPep3YTlk3lEfIr2BcXQ93gQSgQNCOsD7OOntk=;
 b=MYw1KQxZN8ZQRcVoIipelZsKvFd7Ra7UliXQ/1tU30a8cin1Gw/ZxlrK7tOKXICjygwCAj
 meKLgYYL+Y3o8xFDwMDrZqs3/+NJEasrHWNzagpWBwJrUbXXvN5LkqbPIDJke1IJacMi4j
 OjjJew5M9qhtv+UtTOchYmjhMQRK01U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-ICGoPtKeNdmfYVCRz0jHrw-1; Wed, 11 Mar 2020 11:59:34 -0400
X-MC-Unique: ICGoPtKeNdmfYVCRz0jHrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB8E0101FC67;
 Wed, 11 Mar 2020 15:59:33 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D56710013A1;
 Wed, 11 Mar 2020 15:59:33 +0000 (UTC)
Date: Wed, 11 Mar 2020 09:59:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
Subject: Re: [PATCH] vfio/pci: Use defined memcpy() behavior
Message-ID: <20200311095933.790cd53c@w520.home>
In-Reply-To: <9487f777-20ab-2257-b03a-f99382b0bfec@huawei.com>
References: <158386047731.30997.5580377889283866404.stgit@gimli.home>
 <9487f777-20ab-2257-b03a-f99382b0bfec@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 10:54:12 +0800
"Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
<longpeng2@huawei.com> wrote:

> On 2020/3/11 1:15, Alex Williamson wrote:
> > vfio_rom_read() relies on memcpy() doing the logically correct thing,
> > ie. safely copying zero bytes from a NULL pointer when rom_size is
> > zero, rather than the spec definition, which is undefined when the
> > source or target pointers are NULL.  Resolve this by wrapping the
> > call in the condition expressed previously by the ternary.
> > 
> > Additionally, we still use @val to fill data based on the provided
> > @size regardless of mempcy(), so we should initialize @val rather
> > than @data.
> > 
> > Reported-by: Longpeng <longpeng2@huawei.com>
> > Reported-by: Laszlo Ersek <lersek@redhat.com>
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > ---
> >  hw/vfio/pci.c |    9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index 5e75a95129ac..b0799cdc28ad 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -859,16 +859,17 @@ static uint64_t vfio_rom_read(void *opaque, hwaddr addr, unsigned size)
> >          uint16_t word;
> >          uint32_t dword;
> >          uint64_t qword;
> > -    } val;
> > -    uint64_t data = 0;
> > +    } val = { 0 };
> > +    uint64_t data;
> >    
> 'val.qword' won't be used, maybe we could drop it silently.

Or we could specify that we support 8-byte accesses and expand the
switch to include it.  Neither is terribly pressing at this point, so
I'll leave that for some future work.
 
> Reviewed-by: Longpeng <longpeng2@huawei.com>

Thanks!

Alex
 
> >      /* Load the ROM lazily when the guest tries to read it */
> >      if (unlikely(!vdev->rom && !vdev->rom_read_failed)) {
> >          vfio_pci_load_rom(vdev);
> >      }
> >  
> > -    memcpy(&val, vdev->rom + addr,
> > -           (addr < vdev->rom_size) ? MIN(size, vdev->rom_size - addr) : 0);
> > +    if (addr < vdev->rom_size) {
> > +        memcpy(&val, vdev->rom + addr, MIN(size, vdev->rom_size - addr));
> > +    }
> >  
> >      switch (size) {
> >      case 1:
> > 
> > .
> >   
> ---
> Regards,
> Longpeng(Mike)
> 


