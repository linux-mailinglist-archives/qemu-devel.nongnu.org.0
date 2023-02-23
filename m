Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A2E6A124D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJU6-0004Of-5z; Thu, 23 Feb 2023 16:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVJTw-0004OH-ND
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:50:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pVJTs-0006lc-KV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677189023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOVWoqUkJiGSYDLJj5K/oGE5uVBN5OMJblBOqO/Zm5k=;
 b=i2ckC32zldkzfp9Dfe1XSoPy53AT3vMw5OH0VXaNPWF1ALtHq4rK9dGIKY/SyjbcNQnHUA
 jtgo5jCABawzJnBJDiwNANFNAWSfbkJ376dCI0yXOsOkUMVjNm4EkXVS3+rK+hNgF3kVlu
 GvSLg4XnlKp/ouPG1iVEsffU4FlM1YQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-YEi7yj-AOx26yYQ89VwyuQ-1; Thu, 23 Feb 2023 16:50:21 -0500
X-MC-Unique: YEi7yj-AOx26yYQ89VwyuQ-1
Received: by mail-il1-f198.google.com with SMTP id
 v3-20020a92c6c3000000b003159a0109ceso7274304ilm.12
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:50:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOVWoqUkJiGSYDLJj5K/oGE5uVBN5OMJblBOqO/Zm5k=;
 b=EWvJAD9NlAAJxbhDJRXyJxP46liIoFzppbw+GIR3Otvvtf/SqSvaKhwj64fZS7C99L
 9N4ET6xwEOy0tCUgypxpcykOFDevgbaoeQmX8R/kqgMMvka+z+BnfQngQrG/YNoAG9aL
 59MbmsuYqKZp21hTyxheTnLOQTuflATguGtQjAw/Y7RMM0JCCVUPTfbwXVcRXS5pvP50
 2GNdBccDm8iSXmInPHxPEXA4a/g9IBHj380Frwc2cfM/ibuUOMZgzGIUJ6t+GreprmO9
 0BzmFugCFIA8y8qsYrfKzr4O0cEuURZrmudrbgP2wrHU3meE86ngkzst1i2ijLvUU3V0
 kDaQ==
X-Gm-Message-State: AO0yUKWAss5e/C46EonNxHlXQ7fkxMwPQNVBrop5W4zoUw/olqlb5X03
 nQ1kTOoEx/5AW0UMBW6FVACtSnuTaGUiWWjZJMUrbimEAdAVUvVZ6nywCFOHPLAhYhcz9i04DXL
 m85W1hGQ0JSfYC90=
X-Received: by 2002:a05:6e02:b44:b0:313:d961:94ac with SMTP id
 f4-20020a056e020b4400b00313d96194acmr13595415ilu.14.1677189020444; 
 Thu, 23 Feb 2023 13:50:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+5gI/+65E1G6WTTVAGXEqJFiJ9zSCeulucbB0ufoWrTAu8fng+zPhV41IYlWOm1iWH0FoxVQ==
X-Received: by 2002:a05:6e02:b44:b0:313:d961:94ac with SMTP id
 f4-20020a056e020b4400b00313d96194acmr13595392ilu.14.1677189020204; 
 Thu, 23 Feb 2023 13:50:20 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x8-20020a02ac88000000b003e44371702fsm1636809jan.67.2023.02.23.13.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 13:50:19 -0800 (PST)
Date: Thu, 23 Feb 2023 14:50:18 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Message-ID: <20230223145018.3c46a966.alex.williamson@redhat.com>
In-Reply-To: <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
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

On Thu, 23 Feb 2023 21:19:12 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 23/02/2023 21:05, Alex Williamson wrote:
> > On Thu, 23 Feb 2023 10:37:10 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:  
> >> On 22/02/2023 22:10, Alex Williamson wrote:  
> >>> On Wed, 22 Feb 2023 19:49:05 +0200
> >>> Avihai Horon <avihaih@nvidia.com> wrote:    
> >>>> From: Joao Martins <joao.m.martins@oracle.com>
> >>>> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
> >>>>          .iova = iova,
> >>>>          .size = size,
> >>>>      };
> >>>> +    int ret;
> >>>> +
> >>>> +    ret = vfio_record_mapping(container, iova, size, readonly);
> >>>> +    if (ret) {
> >>>> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
> >>>> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
> >>>> +                     iova, size, ret, strerror(-ret));
> >>>> +
> >>>> +        return ret;
> >>>> +    }    
> >>>
> >>> Is there no way to replay the mappings when a migration is started?
> >>> This seems like a horrible latency and bloat trade-off for the
> >>> possibility that the VM might migrate and the device might support
> >>> these features.  Our performance with vIOMMU is already terrible, I
> >>> can't help but believe this makes it worse.  Thanks,
> >>>     
> >>
> >> It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
> >> that uses a max-iova based IOVA range. So this is really for iommu identity
> >> mapping and no-VIOMMU.  
> > 
> > Ok, yes, there are no mappings recorded for any containers that have a
> > non-empty giommu_list.
> >   
> >> We could replay them if they were tracked/stored anywhere.  
> > 
> > Rather than piggybacking on vfio_memory_listener, why not simply
> > register a new MemoryListener when migration is started?  That will
> > replay all the existing ranges and allow tracking to happen separate
> > from mapping, and only when needed.
> >   
> 
> The problem with that is that *starting* dirty tracking needs to have all the
> range, we aren't supposed to start each range separately. So on a memory
> listener callback you don't have introspection when you are dealing with the
> last range, do we?

As soon as memory_listener_register() returns, all your callbacks to
build the IOVATree have been called and you can act on the result the
same as if you were relying on the vfio mapping MemoryListener.  I'm
not seeing the problem.  Thanks,

Alex


