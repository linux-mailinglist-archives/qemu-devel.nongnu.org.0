Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6066A0EB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:43:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMZv-0006Cg-8D; Fri, 13 Jan 2023 11:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pGMZg-00066Q-6h
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:06:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pGMZb-0002On-KV
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 11:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673625986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SOXPlxJb+n2+aex3tIvX+n2Eliv+95ORwO+UcBKbiWk=;
 b=QKYFBfTUuVJR6U/64to7yY3E6iyDe8TjPzLu9YbRhwI0TOvPW/Ou8ymnPfQbEcGNWgfnjG
 qfVSuQTtxrI+o/OzmROJkC23eNCRN0RmHeuj5PcxVdjB8+O8v5KOREA+aiY8p5J0KI59AC
 s28XRny6xK5dQnSp4TVLlmOV0qO1368=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-F6ckDle5PWKOLv_N46Uecg-1; Fri, 13 Jan 2023 11:06:25 -0500
X-MC-Unique: F6ckDle5PWKOLv_N46Uecg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a1c3507000000b003d355c13ba8so11115612wma.6
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 08:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOXPlxJb+n2+aex3tIvX+n2Eliv+95ORwO+UcBKbiWk=;
 b=n1XkWkd2Gx/uMKGmYI1+tXIKMnA6gfdu1ls5m3XuDe0MmUt8cft161OFY3L4q9apYb
 ywnNs1RArKQW+LZOAVdz92KuqpreRb+N1ypzRDzNRFkeZp4IS6VkH3m3nh3QzsOxW/OR
 abNRktlHQ0WnFxWpdeWjGT8YW5bisKHTVSAb9y3el0NEaA00DvkmSr8zmjIPsMfAcOH0
 4DqMeIrhD1UMUYjWM7DK6g//m0dUAvLO94sAg5hgSTqHpO1mKdVRdL6LWnJOW/R2z5kT
 2sdu/WX+meA6waLE5SLSYXWnYv9JrV1a+dZcf3diDmq68p9+Kls4c97bWmXyBgw5qhyC
 hKxg==
X-Gm-Message-State: AFqh2komoYhMij/ny24c1H/AsD5h5lJvZQqj6tk10gHxP5DO5jiWqqHz
 l3oRkqTT/sJl51/JpyyuJHBeMbRJHeqnBct4+H8KEv22lKVKFcNtBTMHHH2jj+4BPhC8/ERfdWR
 TkEnXkJ8Ds/4WzfE=
X-Received: by 2002:a05:6000:18c9:b0:242:88af:d88b with SMTP id
 w9-20020a05600018c900b0024288afd88bmr50807426wrq.43.1673625984499; 
 Fri, 13 Jan 2023 08:06:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvS+6SUsGBu27lCYzLtnif60yVnSJ32jTOL739k7W/x6XVzdP5nLbS9hwGIgVlhRtrF66rwSQ==
X-Received: by 2002:a05:6000:18c9:b0:242:88af:d88b with SMTP id
 w9-20020a05600018c900b0024288afd88bmr50807409wrq.43.1673625984274; 
 Fri, 13 Jan 2023 08:06:24 -0800 (PST)
Received: from [192.168.124.101] (149.37.22.93.rev.sfr.net. [93.22.37.149])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002bbeb700c38sm14091218wrw.91.2023.01.13.08.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 08:06:23 -0800 (PST)
Message-ID: <655fdbc6-50c9-3960-d05b-4d404587712a@redhat.com>
Date: Fri, 13 Jan 2023 17:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 12/13] vfio: Alphabetize migration section of VFIO
 trace-events file
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
 <20230112085020.15866-13-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230112085020.15866-13-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/12/23 09:50, Avihai Horon wrote:
> Sort the migration section of VFIO trace events file alphabetically
> and move two misplaced traces to common.c section.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>



Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/trace-events | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 60c49b2ecf..db9cb94952 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -119,6 +119,8 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
>   vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
>   vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
>   vfio_dma_unmap_overflow_workaround(void) ""
> +vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
> +vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
>   
>   # platform.c
>   vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
> @@ -148,20 +150,18 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
>   vfio_display_edid_write_error(void) ""
>   
>   # migration.c
> +vfio_load_cleanup(const char *name) " (%s)"
> +vfio_load_device_config_state(const char *name) " (%s)"
> +vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
> +vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
> +vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size) " (%s) stopcopy size 0x%"PRIx64
>   vfio_migration_probe(const char *name) " (%s)"
>   vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
> -vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
>   vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
> -vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
>   vfio_save_cleanup(const char *name) " (%s)"
> +vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
>   vfio_save_device_config_state(const char *name) " (%s)"
>   vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible, uint64_t stopcopy_size) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64" stopcopy size 0x%"PRIx64
> -vfio_save_complete_precopy(const char *name, int ret) " (%s) ret %d"
> -vfio_load_device_config_state(const char *name) " (%s)"
> -vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
> -vfio_load_state_device_data(const char *name, uint64_t data_size, int ret) " (%s) size 0x%"PRIx64" ret %d"
> -vfio_load_cleanup(const char *name) " (%s)"
> -vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
> -vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
> -vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
> -vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size) " (%s) stopcopy size 0x%"PRIx64
> +vfio_save_setup(const char *name, uint64_t data_buffer_size) " (%s) data buffer size 0x%"PRIx64
> +vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"


