Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FEE6A1091
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 20:28:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVHFc-0004rb-Tk; Thu, 23 Feb 2023 14:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVHFb-0004q1-6b
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:27:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVHFZ-0004FC-89
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677180448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Upd7YnNujj4RL7b+qnECYPeuWQPwyOC367hT5QlmIaY=;
 b=LBlrfCcsBqmwzpGbZP/ZPhamGbCpQV65oJ6Wd7jbFhawvwnbn/JtsXrJofm95Vvfa/9zyB
 bJOMJBjPXy1Umnlrpflow/747aBhMUbtUl3USeKoQwg1gxqVkqG0OCyjcdqo93E0ImTuxn
 XCkU7d4aV2Xm3vuq1STklElKQDHFSZc=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-_houtp1sMda_X5V82gBIPw-1; Thu, 23 Feb 2023 14:27:26 -0500
X-MC-Unique: _houtp1sMda_X5V82gBIPw-1
Received: by mail-io1-f70.google.com with SMTP id
 f23-20020a6bdd17000000b00745576ba61cso6556127ioc.18
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 11:27:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Upd7YnNujj4RL7b+qnECYPeuWQPwyOC367hT5QlmIaY=;
 b=wHDuWDUeaT6AHSy79uHPpOhKrfzaPiS7lwLG05tkhZ3duLe/V4vFXZ+l66lzoG6ufC
 vy8wqtJJ39UD+J1XmSJnIUTKHvEHsMkbeMXFDvKJ/UMF+GZJkvufxjMJ2M34xdll4ivV
 85P7zDkhdgMWu564XCQtalq+JAOQePWIX8BjP688tkSeaAaFXo82GJ2PPlLEeXpJ5Dus
 BsuwvTkd2yFI6p1ln+Fx+dwFqdyEf+yIHP1wJUmusTl5ZeiHxRC+a1FrK/Iait0VNY6A
 8vKDyXXda7RqIptd7vMtTIfWSH6SVjS7KA65gJSppXvJFykbi+egB1up1Bi0LYFzHTTL
 YXZA==
X-Gm-Message-State: AO0yUKVuX9x+P29b2Sm6Oz/NBm4zOEygcqtT+mPIJGyQsvXQR8SLW+D5
 26SUpHQvOFwf3GGQwLs5Ovv7TQoZ/Up7YyYQjo35JbcYi0cNii5tscV4DVbtYSLcZa9M4YvgL8R
 bJ5GuF6o2k1HaGfo=
X-Received: by 2002:a05:6e02:1569:b0:316:e39f:1449 with SMTP id
 k9-20020a056e02156900b00316e39f1449mr7731947ilu.32.1677180446070; 
 Thu, 23 Feb 2023 11:27:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+L0Yq5UvLpwJUltczkld4lqdck6xdI5IXphXWqrxhLrSyEvwTUnaXhpv0X8yiuaKi3RwbqjA==
X-Received: by 2002:a05:6e02:1569:b0:316:e39f:1449 with SMTP id
 k9-20020a056e02156900b00316e39f1449mr7731921ilu.32.1677180445832; 
 Thu, 23 Feb 2023 11:27:25 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u8-20020a02cbc8000000b003a058610fc8sm1659385jaq.82.2023.02.23.11.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 11:27:25 -0800 (PST)
Date: Thu, 23 Feb 2023 12:27:23 -0700
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
Subject: Re: [PATCH v2 11/20] vfio/common: Add device dirty page tracking
 start/stop
Message-ID: <20230223122723.6a204e1b.alex.williamson@redhat.com>
In-Reply-To: <Y/bJMIR8stBcJpW7@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-12-avihaih@nvidia.com>
 <20230222154043.35644d31.alex.williamson@redhat.com>
 <Y/bJMIR8stBcJpW7@nvidia.com>
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

On Wed, 22 Feb 2023 22:02:24 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Wed, Feb 22, 2023 at 03:40:43PM -0700, Alex Williamson wrote:
> > > +    /*
> > > +     * DMA logging uAPI guarantees to support at least num_ranges that fits into
> > > +     * a single host kernel page. To be on the safe side, use this as a limit
> > > +     * from which to merge to a single range.
> > > +     */
> > > +    max_ranges = qemu_real_host_page_size() / sizeof(*ranges);
> > > +    cur_ranges = iova_tree_nnodes(container->mappings);
> > > +    control->num_ranges = (cur_ranges <= max_ranges) ? cur_ranges : 1;  
> > 
> > This makes me suspicious that we're implementing to the characteristics
> > of a specific device rather than strictly to the vfio migration API.
> > Are we just trying to avoid the error handling to support the try and
> > fall back to a single range behavior?  
> 
> This was what we agreed to when making the kernel patches. Userspace
> is restricted to send one page of range list to the kernel, and the
> kernel will always adjust that to whatever smaller list the device needs.
> 
> We added this limit only because we don't want to have a way for
> userspace to consume a lot of kernel memory.
> 
> See LOG_MAX_RANGES in vfio_main.c
> 
> If qemu is viommu mode and it has a huge number of ranges then it must
> cut it down before passing things to the kernel.

Ok, that's the kernel implementation, but the uAPI states:

 * The core kernel code guarantees to support by minimum num_ranges that fit
 * into a single kernel page. User space can try higher values but should give
 * up if the above can't be achieved as of some driver limitations.

So again, I think I'm just looking for a better comment that doesn't
add FUD to the reasoning behind switching to a single range, ie. a)
it's easier to deal with given the kernel guarantee and b) the current
kernel implementation imposes a hard limit at page size anyway.  Thanks,

Alex


