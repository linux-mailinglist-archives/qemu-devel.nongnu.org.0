Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244FC34FDBE
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 12:04:04 +0200 (CEST)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXhj-0003av-5k
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 06:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRXez-0001o9-2r
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRXew-0006gF-Ly
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 06:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617184869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZa2lbaW6j3OHjjfakP75jYZ8L7n/dYU2TdTcRCWy2k=;
 b=I65wnbkntrslPY5O4h4RTpdAXKUU1hP9OYAQEOZ2Veyb9vUczTbajvLjuEHOdpjyYovzdD
 ZyKQK8tCTQh6BoA5fOGOW1zwr0U/Cz/bAy3yWShqTaRHdfvafXsMJrWwfaJLgV4G9RcGfR
 qpxLVa3F3fOFjT2p8Acwf+xGCGYM4zg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-xhHBAD6YP0O69xAxSYTmaw-1; Wed, 31 Mar 2021 06:01:05 -0400
X-MC-Unique: xhHBAD6YP0O69xAxSYTmaw-1
Received: by mail-ed1-f69.google.com with SMTP id q12so831629edv.9
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 03:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PZa2lbaW6j3OHjjfakP75jYZ8L7n/dYU2TdTcRCWy2k=;
 b=LJhZHMB6xE/IdXPvZrNVRE0+xD1fEhZFWlk4vJadTGSeaefN4kxq9qT5ggMIPOezMy
 UGVkqZFu/o3bYD28PErPgYcCLbp0f17ze5mj4Ol6O9f+WQrMciQsG7bnxE/bmElNBmDW
 58+7ygVRu5rY3eVPWQs6z60ghPAQ4Fg1w8lxsfMQ37KdvN07fXfHGAmLxbaGWqTEbCgf
 FjStJ+gYRw9rWGRNWP1TyHkgry9rqVAkBreX6z8sDMfaazhDOgN8ihQVeFX6RraHFkTc
 rbYZ+CMdyHkkeUQ/uUIPrOKHXZrCEyotLsNR4wNEJCVmWdh8mixUlj9v4N4fJAI8zPlB
 Cf2Q==
X-Gm-Message-State: AOAM531O7rHVbQGM+8NiATnCxtltfNG44XdUJl8EtgjzQmMbmrxE6mov
 +ju1cgBUoB3DEuxMFpCxqrjdYtQHQfFPZRyTvG/NJ0wfiuc5i+cftmvnsjvchHtAvrzw1bAMeyL
 4VVvpqDRYO5USM7w=
X-Received: by 2002:a17:907:9808:: with SMTP id
 ji8mr2629759ejc.333.1617184864245; 
 Wed, 31 Mar 2021 03:01:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlgEEJbXav+R3OWMCWqQSOc2vsR7Oth5iMm6rYS1O6Y26LkcjPkoszwY7uUhkYacHxrVk44A==
X-Received: by 2002:a17:907:9808:: with SMTP id
 ji8mr2629710ejc.333.1617184863953; 
 Wed, 31 Mar 2021 03:01:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id l1sm1152626edt.59.2021.03.31.03.00.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 03:00:58 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] Introduce cluster cpu topology support
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210331095343.12172-1-wangyanan55@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20162bd1-b31e-e180-8792-81934e0d005b@redhat.com>
Date: Wed, 31 Mar 2021 12:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210331095343.12172-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/21 11:53, Yanan Wang wrote:
> A cluster means a group of cores that share some resources (e.g. cache)
> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
> share L3 cache data while cores within each cluster share the L2 cache.

Is this different from what we already have with "-smp dies"?

Paolo


