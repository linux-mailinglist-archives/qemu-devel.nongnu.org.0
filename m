Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CEC6A9CC3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:07:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY8r8-0004P8-F8; Fri, 03 Mar 2023 12:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pY8r6-0004Oj-9c
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:06:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pY8r4-00078H-7t
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677863161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6hIVqnyKBxAfffwkiANTdNL3I3M8zggHjLElpv+uMg=;
 b=hdyQAd30ZqY+4NlxjEgSaNkU0mEVKUw8ju5aQErUuED5n/FAdm7brA32Yd+laYfkrErQaC
 WEDq+49Ncns1NfuMED/7EgO41Dlka+gTHPeSbhz46AWevU1JgSlQ2PM7l8O/d7ZY70twtp
 2JWB/D2Lv0H11T7x+Ngl/xEf+Vqjphg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-GqM8uuCMNBWsNt3EtLU6Yg-1; Fri, 03 Mar 2023 12:06:00 -0500
X-MC-Unique: GqM8uuCMNBWsNt3EtLU6Yg-1
Received: by mail-io1-f69.google.com with SMTP id
 l7-20020a0566022dc700b0074cc9aba965so1617607iow.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M6hIVqnyKBxAfffwkiANTdNL3I3M8zggHjLElpv+uMg=;
 b=cq7Ahv1iDZecy6c1BVq135VsFHJq5+3u+ZclJnxfPzzgjG1YItaeJT+JPLQfdRhUPI
 JdsxObUe+aOaoW56e2eSo5arTACLTMYNPuVroe7ZQMB0qdYcnDc0jd3gCoOMKSbQarfm
 TD2f4X4kx/49DQl/6dh7stbT4x3aVYLWzQkhNcO+f3bGJXkhO1GVxMfDXfDBNcuzB+zg
 ZK9K/8mzr78Hyx4o1mb4lFG8wpi3KtiF3+Z6VE9NSnyXIJiEzz0q8Q5oU6zyNHBZZccg
 YlUv5agDQt99a/Usw7D9H50CmzjoIUt1adrX8SE75zOS+Sl1OkCC8a0jE1oxzaxrUEVV
 ikmQ==
X-Gm-Message-State: AO0yUKVa8clpsMdINW+nvmGcBu+TFCvFLk2pbpGBT0RgdSw73znC/GUc
 93pdpyqMNohzRs7M7r8+bl5fVq9eJ3c2mcDfGcAyFpt6qjWTfmHoWoknqCKPj7b2OSjqroqW81u
 tyNiQWPFUHw5ooM0=
X-Received: by 2002:a92:b509:0:b0:315:8bc0:1d85 with SMTP id
 f9-20020a92b509000000b003158bc01d85mr1673218ile.11.1677863159454; 
 Fri, 03 Mar 2023 09:05:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9pJD7fy8Gzs71Y5rtCm4hO5HSSzrWUqH5/7DTZhgrwPBlkqUkdqPD3KKX+mC/TfwfY6sOLDw==
X-Received: by 2002:a92:b509:0:b0:315:8bc0:1d85 with SMTP id
 f9-20020a92b509000000b003158bc01d85mr1673194ile.11.1677863159209; 
 Fri, 03 Mar 2023 09:05:59 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02a713000000b0038a5b48f3d4sm863264jam.3.2023.03.03.09.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:05:58 -0800 (PST)
Date: Fri, 3 Mar 2023 10:05:51 -0700
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
Message-ID: <20230303100551.435e8cd3.alex.williamson@redhat.com>
In-Reply-To: <9e219add-ec7c-4408-902f-fce8c5c64020@oracle.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
 <20230223145018.3c46a966.alex.williamson@redhat.com>
 <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
 <20230228133653.2f911490.alex.williamson@redhat.com>
 <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
 <20230302114248.41b6c21b.alex.williamson@redhat.com>
 <c1e5fa47-7028-5e24-2158-2e64aa44006a@oracle.com>
 <9e219add-ec7c-4408-902f-fce8c5c64020@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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

On Fri, 3 Mar 2023 16:58:55 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 03/03/2023 00:19, Joao Martins wrote:
> > On 02/03/2023 18:42, Alex Williamson wrote:  
> >> On Thu, 2 Mar 2023 00:07:35 +0000
> >> Joao Martins <joao.m.martins@oracle.com> wrote:  
> >>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
> >>>      multiple_devices_migration_blocker = NULL;
> >>>  }
> >>>
> >>> +static bool vfio_have_giommu(VFIOContainer *container)
> >>> +{
> >>> +    return !QLIST_EMPTY(&container->giommu_list);
> >>> +}  
> >>
> >> I think it's the case, but can you confirm we build the giommu_list
> >> regardless of whether the vIOMMU is actually enabled?
> >>  
> > I think that is only non-empty when we have the first IOVA mappings e.g. on
> > IOMMU passthrough mode *I think* it's empty. Let me confirm.
> >   
> Yeap, it's empty.
> 
> > Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
> > the VM was configured with a vIOMMU or not. That is to create the LM blocker.
> >   
> I am trying this way, with something like this, but neither
> x86_iommu_get_default() nor below is really working out yet. A little afraid of
> having to add the live migration blocker on each machine_init_done hook, unless
> t here's a more obvious way. vfio_realize should be at a much later stage, so I
> am surprised how an IOMMU object doesn't exist at that time.

Can we just test whether the container address space is system_memory?
Thanks,

Alex


