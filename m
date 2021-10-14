Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3142D4B9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 10:23:57 +0200 (CEST)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maw1s-0006u2-UR
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 04:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mavzj-0004DW-Ir
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mavzg-00066a-Oy
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 04:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634199699;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hi8TpwTjEDkvRVDGnWNh4yso/u8iJxd8dYzJaRvQYUg=;
 b=WiOHmQnCz/BDhsOby/J5uEkZklIF4/qPY5GaiO9MKIEXgIQNpxiJIXiofpWDhkJrNRm87B
 C72zx19BNQ9WHasNT/5F/jMI+5V0zNmK/CkLzqaGo2eKg88Dq5x03hHOpbFkffIalOqJ7D
 d4lWG+pYe/l9u9kE6kBEphfHCRzDNwk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-MNvWHkDcNGytVOOoKB5zWw-1; Thu, 14 Oct 2021 04:21:38 -0400
X-MC-Unique: MNvWHkDcNGytVOOoKB5zWw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso3921514wrg.16
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 01:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Hi8TpwTjEDkvRVDGnWNh4yso/u8iJxd8dYzJaRvQYUg=;
 b=Z/2qDX3dUxTQNdtzykvxbE7l/oWR+Xpqg31juLF7THM3OpTetpLKEzdIB2wfTkqtCv
 I0pUoukU+rpy7pKW0wg0kKA4eLWYOOPznWgKThNSGSmQ/UWz5Ruy6iOX8tgXiIATHnyC
 cZEwSR+TffnD5efP6urohxFh9IkoqwEg+ao6b6N9jRf4jPmekazb0I0Xc+hlbdK/wWrt
 QRI0QFY9odPT0bw/anQ59W+UIpzC18s/wIh81xAa7TiT+ihnxNYo+AITOfgCUsNCAx4F
 HiSueX6dDsvlB9FbGZYJbpTzWazR9PdLX8znJ3RszDp4q6nbWz5hSy6kX8c3KR1FJwGj
 IfwQ==
X-Gm-Message-State: AOAM532fcADvAcTrCfEdp+GCpFBdvwuUpRb+E9WqNZQx3gItNwarQhj2
 j8niHoKtWcLwug7XmkZNK3dXSvPlIoncdPPT2oEwVicUc4A/zPOyvDysjzhIhdwY4r7UszbZwi3
 RgypuV5mVHaz8N4A=
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr4824392wry.273.1634199696827; 
 Thu, 14 Oct 2021 01:21:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp5pqlJ602Qs817AzKd/+yr7QXibBmAPcq1rOs5n+tb0bj7r2QXuNurZYp6bN75nO9ln5VRA==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr4824365wry.273.1634199696510; 
 Thu, 14 Oct 2021 01:21:36 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p17sm1752309wro.34.2021.10.14.01.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 01:21:36 -0700 (PDT)
Subject: Re: [PATCH v2] tests: qtest: Add virtio-iommu test
To: Thomas Huth <thuth@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211013195010.737789-1-eric.auger@redhat.com>
 <07db071b-acd6-67e9-efc1-fdb215fcc2e6@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <ef26cc8f-9121-e245-a0ac-ae159d191bef@redhat.com>
Date: Thu, 14 Oct 2021 10:21:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <07db071b-acd6-67e9-efc1-fdb215fcc2e6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 10/14/21 7:58 AM, Thomas Huth wrote:
> On 13/10/2021 21.50, Eric Auger wrote:
>> Add the framework to test the virtio-iommu-pci device
>> and tests exercising the attach/detach, map/unmap API.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
> ...
>> +/**
>> + * send_map - Send a map command to the device
>> + * @domain: domain the new binding is attached to
>> + * @virt_start: iova start
>> + * @virt_end: iova end
>> + * @phys_start: base physical address
>> + * @flags: mapping flags
>> + */
>> +static int send_map(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                    uint32_t domain, uint64_t virt_start, uint64_t
>> virt_end,
>> +                    uint64_t phys_start, uint32_t flags)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_map req;
>> +    size_t ro_size = sizeof(req) - sizeof(struct
>> virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    char buffer[64];
>> +    int ret;
>> +
>> +    req.head.type = VIRTIO_IOMMU_T_MAP;
>> +    req.domain = domain;
>> +    req.virt_start = virt_start;
>> +    req.virt_end = virt_end;
>> +    req.phys_start = phys_start;
>> +    req.flags = flags;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    memread(wr_addr, buffer, wr_size);
>
> qtest_memread() please.

My apologies, I forgot those qtest_memread() comment and the char
buffer[64] replacement too :-(
>
>> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>> +
>> +/**
>> + * send_unmap - Send an unmap command to the device
>> + * @domain: domain the new binding is attached to
>> + * @virt_start: iova start
>> + * @virt_end: iova end
>> + */
>> +static int send_unmap(QTestState *qts, QVirtioIOMMU *v_iommu,
>> +                      uint32_t domain, uint64_t virt_start, uint64_t
>> virt_end)
>> +{
>> +    QVirtioDevice *dev = v_iommu->vdev;
>> +    QVirtQueue *vq = v_iommu->vq;
>> +    uint64_t ro_addr, wr_addr;
>> +    uint32_t free_head;
>> +    struct virtio_iommu_req_unmap req;
>> +    size_t ro_size = sizeof(req) - sizeof(struct
>> virtio_iommu_req_tail);
>> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
>> +    char buffer[64];
>> +    int ret;
>> +
>> +    req.head.type = VIRTIO_IOMMU_T_UNMAP;
>> +    req.domain = domain;
>> +    req.virt_start = virt_start;
>> +    req.virt_end = virt_end;
>> +
>> +    ro_addr = guest_alloc(alloc, ro_size);
>> +    wr_addr = guest_alloc(alloc, wr_size);
>> +
>> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
>> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
>> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
>> +    qvirtqueue_kick(qts, dev, vq, free_head);
>> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
>> +                           QVIRTIO_IOMMU_TIMEOUT_US);
>> +    memread(wr_addr, buffer, wr_size);
>
> qtest_memread() please.
>
>> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
>> +    guest_free(alloc, ro_addr);
>> +    guest_free(alloc, wr_addr);
>> +    return ret;
>> +}
>
> With the two memread()s changed into qtest_memread()s:
>
> Acked-by: Thomas Huth <thuth@redhat.com>
Thank you for your patience!

Eric


