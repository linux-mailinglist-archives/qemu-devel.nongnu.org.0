Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6C2A00A1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 10:02:51 +0100 (CET)
Received: from localhost ([::1]:35508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYQJ8-00089F-FV
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 05:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYQHz-0007j2-6l
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 05:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYQHu-0003V3-3g
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 05:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604048493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B3RfOVD0Q/jSSxFWzAoDSQhjZlMUr0/H+Tl6vl3k+dQ=;
 b=ZXAZlMN6DdvKu3ctKAMwHUkAvbnuZWQUR0pwVb6/rYXY+D/HOnHU6enpqwO9o5RhAP3SKU
 GPvImZjAszvLParlt+tM2gUs7hOYKFsulJNu89FCcCf6+R7EhMn74rcv2KX6siPc/SYO59
 SW5+bvU9nkDNW7J3GsdkKMqsBEtEuWE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-f9i_x1faNi6joyVcOYXesw-1; Fri, 30 Oct 2020 05:01:29 -0400
X-MC-Unique: f9i_x1faNi6joyVcOYXesw-1
Received: by mail-wr1-f69.google.com with SMTP id 91so2385115wrk.20
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 02:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B3RfOVD0Q/jSSxFWzAoDSQhjZlMUr0/H+Tl6vl3k+dQ=;
 b=f5FPzWvcbUXahxnj7Z4Rx1aWxs5FpsBgnCYz7RbQFDVphbXG4Wfp8IPMpyTHYIBWwX
 Ji3ajyvizBJBQXYSGug2zziForeLDpyO5z8Bi7mBLZfp3CF2iwNznWa/JcJxBKPtV8GI
 kpqsrsP/WG7lePq4369N69+AxU7Z55Q77XqmNc/doTmPM5ccsaC6t0jjbZ7eCDkGVZ7u
 +bBlbx/kTlwcbGwQXcZIEInKMDcgBIM+7QUJL0gWMBv4pYLcptPNZzi5xsurC5ukiKLq
 6zcMUu447RZiQDmrUxJtGcDIQ2vXJVs8hejdoX8L1+88xU5Oug9cw9ie0zI3gWDZ051a
 if3Q==
X-Gm-Message-State: AOAM531cCj8GcaCr0FXNi34VssIh0j32sQOFvX5ivugT9V1GTDBIQP/3
 yXRZ331XCyY6Wi37caFAtax5WioAPXS0JIM6zS80HMXME3dGeFOuv7nZ91TPktzeSgHHJyW7yWf
 tJM8qC5LlkroeVYs=
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr1678633wrw.283.1604048487929; 
 Fri, 30 Oct 2020 02:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8Y1SJtq9DkA7yWP3szozBuH7sEM3mVGerBoBqmNBZsVouKdZ6gWe/vTKdrkzD3ANzGfXT4w==
X-Received: by 2002:a05:6000:1085:: with SMTP id
 y5mr1678596wrw.283.1604048487669; 
 Fri, 30 Oct 2020 02:01:27 -0700 (PDT)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id h62sm10348655wrh.82.2020.10.30.02.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 02:01:26 -0700 (PDT)
Date: Fri, 30 Oct 2020 05:01:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH] pci: check bus pointer before dereference
Message-ID: <20201030050050-mutt-send-email-mst@kernel.org>
References: <20200827114917.1851111-1-ppandit@redhat.com>
 <CAKXe6SJNio2cy05ecr_DyB0Z6WjxHN_X8ZiOU5By0jwdRq12fg@mail.gmail.com>
 <b0859f8a-1224-66d0-7e32-091caa5cfcbe@redhat.com>
 <nycvar.YSQ.7.78.906.2009161152040.10832@xnncv>
 <CAFEAcA8Y+sJkapmrjNOdWP4xXa9kWTmSyXpthkvdb6QgUyDh5Q@mail.gmail.com>
 <nycvar.YSQ.7.78.906.2009281616200.10832@xnncv>
 <nycvar.YSQ.7.78.906.2009301029460.10832@xnncv>
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.78.906.2009301029460.10832@xnncv>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 02:24:40
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Ruhr-University <bugs-syssec@rub.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 30, 2020 at 10:32:42AM +0530, P J P wrote:
> 
> [+Paolo, +Fam Zheng - for scsi]
> 
> +-- On Mon, 28 Sep 2020, P J P wrote --+
> | +-- On Wed, 16 Sep 2020, Peter Maydell wrote --+
> | | On Wed, 16 Sep 2020 at 07:28, P J P <ppandit@redhat.com> wrote:
> | | > -> https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=%2Flsi_nullptr1
> | | > ==1183858==Hint: address points to the zero page.
> | | > #0 pci_change_irq_level hw/pci/pci.c:259
> | | > #1 pci_irq_handler hw/pci/pci.c:1445
> | | > #2 pci_set_irq hw/pci/pci.c:1463
> | | > #3 lsi_set_irq hw/scsi/lsi53c895a.c:488
> | | > #4 lsi_update_irq hw/scsi/lsi53c895a.c:523
> | | > #5 lsi_script_scsi_interrupt hw/scsi/lsi53c895a.c:554
> | | > #6 lsi_execute_script hw/scsi/lsi53c895a.c:1149
> | | > #7 lsi_reg_writeb hw/scsi/lsi53c895a.c:1984
> | | > #8 lsi_io_write hw/scsi/lsi53c895a.c:2146
> | ...
> | | Generally we don't bother to assert() that pointers that shouldn't be NULL 
> | | really are NULL immediately before dereferencing them, because the 
> | | dereference provides an equally easy-to-debug crash to the assert, and so 
> | | the assert doesn't provide anything extra. assert()ing that a pointer is 
> | | non-NULL is more useful if it is done in a place that identifies the problem 
> | | at an earlier and easier-to-debug point in execution rather than at a later 
> | | point which is distantly removed from the place where the bogus pointer was 
> | | introduced.
> | 
> | * The NULL dereference above occurs because the 'pci_dev->qdev->parent_bus' 
> |   address gets overwritten (with 0x0) during scsi 'Memory Move' operation in
> | 
> |  ../hw/scsi/lsi53c895a.c
> |   #define LSI_BUF_SIZE 4096
> | 
> | lsi_mmio_write
> |  lsi_reg_writeb
> |   lsi_execute_script
> |    static void lsi_memcpy(LSIState *s, ... int count=12MB)
> |    {
> |       int n;
> |       uint8_t buf[LSI_BUF_SIZE];
> | 
> |       while (count) {
> |         n = (count > LSI_BUF_SIZE) ? LSI_BUF_SIZE : count;
> |         lsi_mem_read(s, src, buf, n);          <== read from DMA memory
> |         lsi_mem_write(s, dest, buf, n);        <== write to I/O memory
> |         src += n;
> |         dest += n;
> |         count -= n;
> |      }
> |    }
> | -> https://www.manualslib.com/manual/1407578/Lsi-Lsi53c895a.html?page=254#manual
> | 
> | * Above loop moves data between DMA memory to i/o address space.
> | 
> | * Going through the manual above, it seems 'Memory Move' can move upto 16MB of 
> |   data between memory spaces.
> | 
> | * I tried to see a suitable fix, but couldn't get one.
> | 
> |   - Limiting 'count' value does not seem right, as allowed value is upto 16MB.
> | 
> |   - Manual above talks about moving data via 'dma_buf'. But it doesn't seem to 
> |     be used here.
> | 
> | * During above loop, 'dest' address moves past its 'MemoryRegion mr' and 
> |   overwrites the adjacent 'mr' memory area, overwritting 'parent_bus' value.
> | 
> | Any thoughts/hints please...?
> 
> @Paolo, @Fam...wdyt?
> 
> Thank you.

Guys are we going anywhere with this patch?

> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


