Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71AD48AA16
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 10:05:14 +0100 (CET)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7D5d-0003hC-MB
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 04:05:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7D2r-0002CI-G6
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:02:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n7D2o-0007Sq-UN
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 04:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641891737;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmKt3iI4mRTGz+lD/+sEilr22APwXw4mH+0KJGI7k9I=;
 b=Y4rUlT/sWSOeVkQALbkHGoV04kmkEo9JLJZFzyMebHQOyTIVU7wsF/esRHpEFZEn3O7Z2A
 +JFkkAh6wY2ePL/vzHHqMpS6nZ4Wzo1s0ZEWrDVntUAXkRgOl52woRVOQabYZT1qaVodF4
 7D1/02NYgyZHfvDQ5AluUXw29IjHivk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-AlSe6CgzN5yd6K-1WDHT7Q-1; Tue, 11 Jan 2022 04:02:15 -0500
X-MC-Unique: AlSe6CgzN5yd6K-1WDHT7Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 i8-20020adfa508000000b001ad5418833cso93729wrb.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 01:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=wmKt3iI4mRTGz+lD/+sEilr22APwXw4mH+0KJGI7k9I=;
 b=by/aKYWqldvB/4ZxxcOYpX5vP3iNzikMurvjcKpkaN3XIQiO1rbpRiLnFTNQQUtc9d
 oic0KOAM+AYcWHUWhO8CASSrNPcUiRGfgbD5amWhpn801kgSpBlnmfgV/RRLU51ICwaO
 eMwFH1mIMXTzp+mkKZW/k1BOV0mlycTWgsA+puKoXwW4/fA+jdgLyj1iBnxxuOIVAHZ9
 hTmYAOExB/pCesyZNm1M2Kuz2Ym4cVPZLu/8zX2HDaF66l/OEKmjlHqyOuSFyD8g6jux
 95HRWDui4wfj2oxPc4NwE30BzIYbPFvQ8uJ2upn0jhwd1u8BK4hsIqRI4QKrDxzSENm8
 osjA==
X-Gm-Message-State: AOAM533NiN+Y66GXDl4nOUoJKJ0kXq6vcJNdZ8kz8slseVdHLGgML3ry
 tPPTnRn35HjJJkszCv4ij1nk/az47OPERivSNZCaaJFg7KV1kkq4ABe+x8KBPPBV7ZTr9TpkP+N
 5fmix91/zGcv7x/w=
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr1541052wmb.128.1641891734141; 
 Tue, 11 Jan 2022 01:02:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznjHUgYLGwpPD0cHDu/59i2gWLANsSJl7XqzmpDbX6F9zJfX7bnlK1uNQ/INC52OjjowTbsA==
X-Received: by 2002:a7b:c00d:: with SMTP id c13mr1541026wmb.128.1641891733889; 
 Tue, 11 Jan 2022 01:02:13 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id o10sm1216184wmq.31.2022.01.11.01.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 01:02:13 -0800 (PST)
Subject: Re: [PATCH 0/3] virtio-iommu: Support VIRTIO_IOMMU_F_BYPASS_CONFIG
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a98b63f9-000b-7647-0ac5-3e6e5ec7f6a7@redhat.com>
Date: Tue, 11 Jan 2022 10:02:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210930185050.262759-1-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean, Michael,

On 9/30/21 8:50 PM, Jean-Philippe Brucker wrote:
> Replace the VIRTIO_IOMMU_F_BYPASS feature with
> VIRTIO_IOMMU_F_BYPASS_CONFIG, which enables a config space bit to switch
> global bypass on and off.
>
> Add a boot-bypass option, which defaults to 'on' to be in line with
> other vIOMMUs and to allow running firmware/bootloader that are unaware
> of the IOMMU.
>
> See the spec change for more rationale
> https://lists.oasis-open.org/archives/virtio-dev/202109/msg00137.html

I guess the kernel bits should be merged in 5.17?

Thanks

Eric
>
> Jean-Philippe Brucker (3):
>   NOMERGE: virtio-iommu: Add definitions for
>     VIRTIO_IOMMU_F_BYPASS_CONFIG
>   virtio-iommu: Default to bypass during boot
>   virtio-iommu: Support bypass domain
>
>  include/hw/virtio/virtio-iommu.h              |  1 +
>  include/standard-headers/linux/virtio_iommu.h | 10 +++-
>  hw/virtio/virtio-iommu.c                      | 60 ++++++++++++++++---
>  hw/virtio/trace-events                        |  4 +-
>  4 files changed, 64 insertions(+), 11 deletions(-)
>


