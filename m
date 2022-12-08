Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098C6469DD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:50:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3BeY-0004Ds-9D; Thu, 08 Dec 2022 02:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p3Bdi-0003xW-Nr
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:48:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p3Bdg-0000ar-Fy
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670485695;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w735L7rG/1OHFXxc8VQz9XUEVB9DpDTD+RfPH0Wrz7I=;
 b=em5AvYLaac45cMXWTPgirb2jXFwE6oqd6B/elFtIsDNMObr4Uszy4GqlxWdnG2i5tvobe6
 4bqjRs5iJiWtwROXv3/xfn3NXb3rhE2sgwb8GGerq11ihoZlIqjI1lcAo5ecg7D3ZR1Uwf
 xYfiq+MBkVuWcnQ7P+383o5ugeOFQTk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-6xEad3IHPrafDkZXyyx3og-1; Thu, 08 Dec 2022 02:48:13 -0500
X-MC-Unique: 6xEad3IHPrafDkZXyyx3og-1
Received: by mail-qt1-f199.google.com with SMTP id
 fz10-20020a05622a5a8a00b003a4f466998cso731659qtb.16
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 23:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w735L7rG/1OHFXxc8VQz9XUEVB9DpDTD+RfPH0Wrz7I=;
 b=4BUuiMUc2Vvzk6xNwuWnlYyfszi6vEt/mBnixU6gyV2XVOn+UN9+eW3wwbKUO0UzV/
 C/H1ZZYmS1RwV/Edhvb2ZF4dSi+Ua8slXzDUZpp/KRMpsK2sIF7rQR42xFUDfrewx6c6
 rYm0G3JGiFtMPhiS1Vy02Z768GUMUJzBIcxN/7qdP5gWgVbYl/q7ZQF5Y+RdQqPsm3Vg
 mWuOj2xmWf5rdpRIo9JdvyDk68kLGTWWyafdhl25Mu/JXNoDNHaBizIMiUQop4t3NSnj
 stUOJUQ9ywypJ0SLaeoQI7J0cA9YwlmttZDneGF3XWTmdFEVd2djXqqsmc4xUamW3YHc
 oFxA==
X-Gm-Message-State: ANoB5pkUdK8GoQUB8o+y0ZlzOYDtPCbwcGr2SrSCeU6Az+/pF4JAxRXx
 Zwn+piBnO+iZFNpnAs+IttExU6mD54bMbWNZGIxkuOibJidw4JZzMXZkPKx37T2hadKcOuk2zXG
 tDFm/QsTdQqQQPxM=
X-Received: by 2002:a37:a94a:0:b0:6fe:b1f7:38c9 with SMTP id
 s71-20020a37a94a000000b006feb1f738c9mr13677178qke.250.1670485693197; 
 Wed, 07 Dec 2022 23:48:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77+ahFyXa922rdJTJdVdybnTBu6h4xymNszWgSi+QtAnmNOMGhNsgvRP4L7P8JF6LbLR2I9g==
X-Received: by 2002:a37:a94a:0:b0:6fe:b1f7:38c9 with SMTP id
 s71-20020a37a94a000000b006feb1f738c9mr13677169qke.250.1670485692975; 
 Wed, 07 Dec 2022 23:48:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ay9-20020a05620a178900b006faa88ba2b5sm18515674qkb.7.2022.12.07.23.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 23:48:12 -0800 (PST)
Message-ID: <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
Date: Thu, 8 Dec 2022 08:48:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
References: <20221207133646.635760-1-eric.auger@redhat.com>
 <Y5EmmjKBBnjSlvd+@x1n>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y5EmmjKBBnjSlvd+@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

On 12/8/22 00:49, Peter Xu wrote:
> Hi, Eric,
>
> On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
>> When assigning VFIO devices protected by a virtio-iommu we need to replay
>> the mappings when adding a new IOMMU MR and when attaching a device to
>> a domain. While we do a "remap" we currently fail to first unmap the
>> existing IOVA mapping and just map the new one. With some device/group
>> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
>> ranges onto existing ones.
> I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
> we were working on the vt-d replay for vfio.  The issue is whether DMA can
> happen right after UNMAP but before MAP of the same page if the page was
> always mapped.

I don't think it can race because a mutex is hold while doing the
virtio_iommu_replay(), and each time a virtio cmd is handled (attach,
map, unmap), see virtio_iommu_handle_command.
So I think it is safe.

Thanks

Eric
>
> The vt-d resolved it by using iova_tree so in a replay vt-d knows the page
> didn't change, so it avoids unmap+map.  It only notifies newly unmapped or
> newly mapped.
>
> Thanks,
>


