Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C1A699432
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdGV-00085n-DU; Thu, 16 Feb 2023 07:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSdGU-00084o-0Q
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pSdGS-0005yh-8Y
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676550087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q7wgjOkH4EoAmSXdF7LtMEAMjRi09lzI7AGm1QJVQtM=;
 b=XW1x5NMCEMd/oQE54oBH7/RR3zOItK9DlwZe0hze7fFuf4eJV9aIEB78VFGI5pbtgEST8Q
 l3RG3Nj6My8/HNO9N8af6uN8IotfGCFrm4y1ATv6MGVdrST2dDrmcJBklh7VKCacZdVh7p
 GkwmwLYOvQWITJgwKcuZ8LXPEBGa+zg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-NBHjF4lSPDKF8u1WcGu-dA-1; Thu, 16 Feb 2023 07:21:25 -0500
X-MC-Unique: NBHjF4lSPDKF8u1WcGu-dA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j37-20020a05600c1c2500b003deaf780ab6so1039051wms.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7wgjOkH4EoAmSXdF7LtMEAMjRi09lzI7AGm1QJVQtM=;
 b=xG4+IT02ANsT4mNO1h3LB0SK5yso1nm0lzwpj5R6kxQTQ1qiGzs0o1jpKcMQ6AsPeF
 4+P6r/JbIRd+tKL7ikeqOA5x2mY4BRy42bwJwX8qr8CPE/SR0/KZChJOToZyj9MKl9vx
 PCnZVeOcPzxEvBy0F2BmeEA1fmELX0HY11oclo3AbW8NyNWRUCxuL04v2tIjqu5zBfzA
 cMos8V3RUPwFTIm7DTid2emDuE3e3X2xwI9/oG2KKYTT+GmWKuxU4ZfZBoRheAvKyyYM
 nlYLoTFWY1mfvhJZAJfml/fugEkiR/BdEPwcEm3ST5L9zH+UsrJN2udFvl13p5vm3BLf
 AjyQ==
X-Gm-Message-State: AO0yUKUJtWhu08n7nXfNqjRcVVmXn5d2ifWVWFMB3YyQe+u6IoHT+42J
 0yS/c5Ic7bQwYHmMFGMgfcNNo2gaLbjMw9ddznHzbDVNwLkhQiLxsNP4r86ljGTNC2j40IT/VzF
 9iT5ke7f8pBT+IRI=
X-Received: by 2002:a05:600c:18a6:b0:3e2:f80:3df1 with SMTP id
 x38-20020a05600c18a600b003e20f803df1mr1478187wmp.19.1676550084798; 
 Thu, 16 Feb 2023 04:21:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9ppS6xdslt0BqZjGsZVqX3Cp1RN7U+5o9LOGbbfiTmWvaljIOyAJcO7qQMqSBa3l0PeYD3IA==
X-Received: by 2002:a05:600c:18a6:b0:3e2:f80:3df1 with SMTP id
 x38-20020a05600c18a600b003e20f803df1mr1478170wmp.19.1676550084473; 
 Thu, 16 Feb 2023 04:21:24 -0800 (PST)
Received: from redhat.com ([2.52.5.34]) by smtp.gmail.com with ESMTPSA id
 q19-20020a05600c46d300b003dc434b39c7sm11277259wmo.0.2023.02.16.04.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:21:23 -0800 (PST)
Date: Thu, 16 Feb 2023 07:21:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>
Subject: Re: [PATCH v1 1/2] vhost: Defer filtering memory sections until
 building the vhost memory structure
Message-ID: <20230216072002-mutt-send-email-mst@kernel.org>
References: <20230216114752.198627-1-david@redhat.com>
 <20230216114752.198627-2-david@redhat.com>
 <20230216070037-mutt-send-email-mst@kernel.org>
 <0fe7b18c-507a-2c11-8440-e9e35294b4ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fe7b18c-507a-2c11-8440-e9e35294b4ba@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 16, 2023 at 01:10:54PM +0100, David Hildenbrand wrote:
> On 16.02.23 13:04, Michael S. Tsirkin wrote:
> > On Thu, Feb 16, 2023 at 12:47:51PM +0100, David Hildenbrand wrote:
> > > Having multiple devices, some filtering memslots and some not filtering
> > > memslots, messes up the "used_memslot" accounting. If we'd have a device
> > > the filters out less memory sections after a device that filters out more,
> > > we'd be in trouble, because our memslot checks stop working reliably.
> > > For example, hotplugging a device that filters out less memslots might end
> > > up passing the checks based on max vs. used memslots, but can run out of
> > > memslots when getting notified about all memory sections.
> > > 
> > > Further, it will be helpful in memory device context in the near future
> > > to know that a RAM memory region section will consume a memslot, and be
> > > accounted for in the used vs. free memslots, such that we can implement
> > > reservation of memslots for memory devices properly. Whether a device
> > > filters this out and would theoretically still have a free memslot is
> > > then hidden internally, making overall vhost memslot accounting easier.
> > > 
> > > Let's filter the memslots when creating the vhost memory array,
> > > accounting all RAM && !ROM memory regions as "used_memslots" even if
> > > vhost_user isn't interested in anonymous RAM regions, because it needs
> > > an fd.
> > > 
> > > When a device actually filters out regions (which should happen rarely
> > > in practice), we might detect a layout change although only filtered
> > > regions changed. We won't bother about optimizing that for now.
> > 
> > That caused trouble in the past when using VGA because it is playing
> > with mappings in weird ways.
> > I think we have to optimize it, sorry.
> 
> We still filter them out, just later.


The issue is sending lots of unnecessary system calls to update the kernel which
goes through a slow RCU.

> > > Note: we cannot simply filter out the region and count them as
> > > "filtered" to add them to used, because filtered regions could get
> > > merged and result in a smaller effective number of memslots. Further,
> > > we won't touch the hmp/qmp virtio introspection output.
> > > 
> > > Fixes: 988a27754bbb ("vhost: allow backends to filter memory sections")
> > > Cc: Tiwei Bie <tiwei.bie@intel.com>
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > 
> > I didn't review this yet but maybe you can answer:
> > will this create more slots for the backend?
> > Because some backends are limited in # of slots and breaking them is
> > not a good idea.
> 
> It restores the handling we had before 988a27754bbb. RAM without an fd
> should be rare for vhost-user setups (where we actually filter) I assume?

Hmm, I guess so.

> -- 
> Thanks,
> 
> David / dhildenb


