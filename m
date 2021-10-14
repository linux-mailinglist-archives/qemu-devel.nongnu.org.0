Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CCD42D215
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 08:00:09 +0200 (CEST)
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1matmj-0007Mi-3g
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 02:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1matkw-0005lA-5f
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 01:58:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1matks-0002ej-S7
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 01:58:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634191094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzkIiR5FQ/aqJ3LyIalinX4bRK8N14Qb6Ny1bn45zCQ=;
 b=NpecggQjohLNIV9WZ4Kf4xRUR7rEIpNo4jBThZy2LlsP8dxH8tl9HE0CRziO/D0p7ffQxi
 wPcEiX6tclAEHTa/PusHOp1x2DBV5L4qO6tUUorcBYFywraG+RFeJ7oPKSGOyHW+GSq+Ns
 wDqY2Z8bNcP1M3otcwivVizsWeIrI5o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-SYcLjzPFPRqfhTu2LjqTrw-1; Thu, 14 Oct 2021 01:58:12 -0400
X-MC-Unique: SYcLjzPFPRqfhTu2LjqTrw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h99-20020adf906c000000b001644add8925so515494wrh.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 22:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HzkIiR5FQ/aqJ3LyIalinX4bRK8N14Qb6Ny1bn45zCQ=;
 b=fXC6XHeLToZ8WspU42/DegRp4iIZdYzle5EXgdqV3yo7I8ydqeCOAjhsqczIbaQ3Nj
 Km4EMVqRXJ2jQR43z0TTDCPA2kltFnbbpJgtevBMHLWzx2iiD1GQjdbfYfbigmjksQHT
 RrADR+pnb0TK6vRj79JWHSTVFhkIv7nHhsUWRdg9cSGyCYwKW3atXl+sLL+FxsS/S5Sd
 H8OkmHJRPf6nT5r4HDP96hwM2/0QxHiIUoVb+QopQ8g5wFAFBb3ymeFJcYIcwpjiz/iQ
 bCIBf6o7HkAbA8LInTRzkWQYrWnQTRDONwAZeC+CARs00UCP9dQs/FzAjgkiLRISvgIl
 IgnQ==
X-Gm-Message-State: AOAM531P8lSwzBbhHMxDfp9WFzJRGGLtmjX6L7JhL+WDAHS/O5QvgV+v
 +xsWtiFXX+XIYvDhLrkmpH0VU3OCGc0YC1UhHbAAFlfLkpkddBQsFT+ZRSvyOqskJMqQIa5dcFN
 Lng3Bf0as+s3KeCQ=
X-Received: by 2002:adf:979a:: with SMTP id s26mr4366426wrb.2.1634191091437;
 Wed, 13 Oct 2021 22:58:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdIlGyjmNa2slZdxWRVhX98ZEA+FrYMwDrvLrCUu2AYRzXjReIBkW84GRcY4qVNxZ4rR1KzQ==
X-Received: by 2002:adf:979a:: with SMTP id s26mr4366396wrb.2.1634191091172;
 Wed, 13 Oct 2021 22:58:11 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id h22sm1344062wmq.42.2021.10.13.22.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 22:58:10 -0700 (PDT)
Subject: Re: [PATCH v2] tests: qtest: Add virtio-iommu test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211013195010.737789-1-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <07db071b-acd6-67e9-efc1-fdb215fcc2e6@redhat.com>
Date: Thu, 14 Oct 2021 07:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013195010.737789-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/2021 21.50, Eric Auger wrote:
> Add the framework to test the virtio-iommu-pci device
> and tests exercising the attach/detach, map/unmap API.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
...
> +/**
> + * send_map - Send a map command to the device
> + * @domain: domain the new binding is attached to
> + * @virt_start: iova start
> + * @virt_end: iova end
> + * @phys_start: base physical address
> + * @flags: mapping flags
> + */
> +static int send_map(QTestState *qts, QVirtioIOMMU *v_iommu,
> +                    uint32_t domain, uint64_t virt_start, uint64_t virt_end,
> +                    uint64_t phys_start, uint32_t flags)
> +{
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    QVirtQueue *vq = v_iommu->vq;
> +    uint64_t ro_addr, wr_addr;
> +    uint32_t free_head;
> +    struct virtio_iommu_req_map req;
> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
> +    char buffer[64];
> +    int ret;
> +
> +    req.head.type = VIRTIO_IOMMU_T_MAP;
> +    req.domain = domain;
> +    req.virt_start = virt_start;
> +    req.virt_end = virt_end;
> +    req.phys_start = phys_start;
> +    req.flags = flags;
> +
> +    ro_addr = guest_alloc(alloc, ro_size);
> +    wr_addr = guest_alloc(alloc, wr_size);
> +
> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> +                           QVIRTIO_IOMMU_TIMEOUT_US);
> +    memread(wr_addr, buffer, wr_size);

qtest_memread() please.

> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
> +    guest_free(alloc, ro_addr);
> +    guest_free(alloc, wr_addr);
> +    return ret;
> +}
> +
> +/**
> + * send_unmap - Send an unmap command to the device
> + * @domain: domain the new binding is attached to
> + * @virt_start: iova start
> + * @virt_end: iova end
> + */
> +static int send_unmap(QTestState *qts, QVirtioIOMMU *v_iommu,
> +                      uint32_t domain, uint64_t virt_start, uint64_t virt_end)
> +{
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    QVirtQueue *vq = v_iommu->vq;
> +    uint64_t ro_addr, wr_addr;
> +    uint32_t free_head;
> +    struct virtio_iommu_req_unmap req;
> +    size_t ro_size = sizeof(req) - sizeof(struct virtio_iommu_req_tail);
> +    size_t wr_size = sizeof(struct virtio_iommu_req_tail);
> +    char buffer[64];
> +    int ret;
> +
> +    req.head.type = VIRTIO_IOMMU_T_UNMAP;
> +    req.domain = domain;
> +    req.virt_start = virt_start;
> +    req.virt_end = virt_end;
> +
> +    ro_addr = guest_alloc(alloc, ro_size);
> +    wr_addr = guest_alloc(alloc, wr_size);
> +
> +    qtest_memwrite(qts, ro_addr, &req, ro_size);
> +    free_head = qvirtqueue_add(qts, vq, ro_addr, ro_size, false, true);
> +    qvirtqueue_add(qts, vq, wr_addr, wr_size, true, false);
> +    qvirtqueue_kick(qts, dev, vq, free_head);
> +    qvirtio_wait_used_elem(qts, dev, vq, free_head, NULL,
> +                           QVIRTIO_IOMMU_TIMEOUT_US);
> +    memread(wr_addr, buffer, wr_size);

qtest_memread() please.

> +    ret = ((struct virtio_iommu_req_tail *)buffer)->status;
> +    guest_free(alloc, ro_addr);
> +    guest_free(alloc, wr_addr);
> +    return ret;
> +}

With the two memread()s changed into qtest_memread()s:

Acked-by: Thomas Huth <thuth@redhat.com>


