Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B44D6A1103
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:08:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVHra-0005kh-DZ; Thu, 23 Feb 2023 15:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVHrV-0005kN-LV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:06:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVHrS-0006gz-V8
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677182797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MeGOzKN9lLZ+b8851teOax+vfcwHvJzkRRRHr7Fc1Y=;
 b=ceS0VGFunPBX2bYiffgvp+gdvajTeXitv4p7rMxKZqrJGJeCFm226uloIyKL6Zl887JSxh
 sHvdwYYq6xA9h5lMWOWGkFrBY6G2pDBXOMEDNa/iC8STBeAi6q6iDd/MtfYbGvmARy4jxl
 9CzkOzyn5FD7WeT+iHSHSEJOCyXNxFw=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-mvZTbxL5OyWjccG9wltvIw-1; Thu, 23 Feb 2023 15:06:36 -0500
X-MC-Unique: mvZTbxL5OyWjccG9wltvIw-1
Received: by mail-il1-f198.google.com with SMTP id
 k10-20020a92b70a000000b00316fed8644fso1468221ili.21
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MeGOzKN9lLZ+b8851teOax+vfcwHvJzkRRRHr7Fc1Y=;
 b=VM66NM9K2Eaoz/eic6Z7v2IWFOMvoXad/Jt7AIxkae6GZ5k+2SWZHZdFe6IKxpFvqo
 jKAH2S1uSVLGe13AqY6qfHCUCC1siwtcQwekQDHkdkD0CPdFobRksT1Gop3BOC4xlkDE
 cdBstWUcWub5jvWJTsJcd3OguSDLRprCMR9tsA8uZL2ni+8gGdjV8/X5ExIebiv7dta+
 TSVJ0QpL7UHWgbA2aCqn2t/jbTa7uamR2IlZEK8xvEr++5NAbepEcc07uKzrLil0git8
 9mpUsQLTGH9M0xj7fC/QPCQC0Gpxx1AK2uDj1gue8AWByJo4rOB6Po0f++4sNoSUPjyc
 jYvQ==
X-Gm-Message-State: AO0yUKWDjB6G0bgxRMmQNSIH3lhK8aPekb956DW6nfszUHavs9LMjGzv
 R+eINsQP3E9uwttS5pXq5YKS/HEE1Pi6VAa6kv7DjvTlT77tthSL/FE87ZNKKbtLqywMpF+6Cm9
 SMMMTsnBT67Zs1CY=
X-Received: by 2002:a05:6e02:1d0f:b0:315:7004:3e49 with SMTP id
 i15-20020a056e021d0f00b0031570043e49mr11413324ila.26.1677182795745; 
 Thu, 23 Feb 2023 12:06:35 -0800 (PST)
X-Google-Smtp-Source: AK7set82kb+ytxUhiwgBL/ll/wN+RJcHFXbqXvx2MFtdgZjYGCj3K4RT+1Taef4BkNfGC77x0A5kXw==
X-Received: by 2002:a05:6e02:1d0f:b0:315:7004:3e49 with SMTP id
 i15-20020a056e021d0f00b0031570043e49mr11413302ila.26.1677182795489; 
 Thu, 23 Feb 2023 12:06:35 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056e02014700b00313d32f8345sm3807621ilr.66.2023.02.23.12.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:06:35 -0800 (PST)
Date: Thu, 23 Feb 2023 13:06:33 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page
 tracking with vIOMMU
Message-ID: <20230223130633.4bd07948.alex.williamson@redhat.com>
In-Reply-To: <Y/bKoUBe17YNhGEA@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Wed, 22 Feb 2023 22:08:33 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Feb 22, 2023 at 04:34:39PM -0700, Alex Williamson wrote:
> > > +    /*
> > > +     * With vIOMMU we try to track the entire IOVA space. As the IOVA space can
> > > +     * be rather big, devices might not be able to track it due to HW
> > > +     * limitations. In that case:
> > > +     * (1) Retry tracking a smaller part of the IOVA space.
> > > +     * (2) Retry tracking a range in the size of the physical memory.  
> > 
> > This looks really sketchy, why do we think there's a "good enough"
> > value here?  If we get it wrong, the device potentially has access to
> > IOVA space that we're not tracking, right?  
> 
> The idea was the untracked range becomes permanently dirty, so at
> worst this means the migration never converges.

I didn't spot the mechanics where that's implemented, I'll look again.
 
> #2 is the presumption that the guest is using an identity map.

This is a dangerous assumption.

> > I'd think the only viable fallback if the vIOMMU doesn't report its max
> > IOVA is the full 64-bit address space, otherwise it seems like we need
> > to add a migration blocker.  
> 
> This is basically saying vIOMMU doesn't work with migration, and we've
> heard that this isn't OK. There are cases where vIOMMU is on but the
> guest always uses identity maps. eg for virtual interrupt remapping.

Yes, the vIOMMU can be automatically added to a VM when we exceed 255
vCPUs, but I don't see how we can therefore deduce anything about the
usage mode of the vIOMMU.  Users also make use of vfio with vIOMMU for
nested assignment, ie. userspace drivers running within the guest,
where making assumptions about the IOVA extents of the userspace driver
seems dangerous.

Let's backup though, if a device doesn't support the full address width
of the platform, it's the responsibility of the device driver to
implement a DMA mask such that the device is never asked to DMA outside
of its address space support.  Therefore how could a device ever dirty
pages outside of its own limitations?

Isn't it reasonable to require that a device support dirty tracking for
the entire extent if its DMA address width in order to support this
feature?

If we can make those assumptions, then the vfio driver should happily
accept a range exceeding the device's DMA address width capabilities,
knowing that the device cannot dirty anything beyond its addressable
range.

> We also have future problems that nested translation is incompatible
> with device dirty tracking..

:-\  Thanks,

Alex


