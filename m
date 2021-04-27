Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B72136C23D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:59:44 +0200 (CEST)
Received: from localhost ([::1]:34536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKVL-0006Nl-CL
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbKSq-0005ap-M2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbKSp-0003FP-81
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619517426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NdOPgJLgsTuktuVTWGp1N3xlJm8UY9kHn5krS5lw/iE=;
 b=LHNFPtrpSCb+CiNSw0XvyJi9/cm52bCwgctIKGaqkwFgWvT5QHmYiW2hW56PCnmjH5SyMO
 RyHsw9nSV/ruiEN4adglQvlj7VKXrAoORlZ4TUg12McpXfDx2AOLMreebgDS1fUV8CKNa9
 e3SWwmPlc3EOOx35G6HgBetH953wj3Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-7hEenAfdMPG-vsgStrR4AQ-1; Tue, 27 Apr 2021 05:57:04 -0400
X-MC-Unique: 7hEenAfdMPG-vsgStrR4AQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c76-20020a1c9a4f0000b02901429c95d1c8so1194254wme.9
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NdOPgJLgsTuktuVTWGp1N3xlJm8UY9kHn5krS5lw/iE=;
 b=WXbGGKDHE7pAyG40W9XhIxmxuy/RBzPhqLZ1Q93NylJfb5k2YvWLUE62UJtnQUF1/D
 ZvYKpuvICtNPYbMruR71utwFUuiga8SlG26gsZ8NdjDNidfYojEce1edGaF0MYHSCX8M
 mYQdkQWT5cruhVs2bVdFPnIlJXiSFgwehX9qMIdKDnYx5nydqRpPerw0094eNVPAMdOu
 HlcBLN4O5y6sLkOHQmWG25XaKGGo5RF2dtc5io/7HFFWAnzajkhoMIXXLDZmDx1eYrHy
 bZdpGJ20FW5zEM50Nzhf3y9jGBUZxwCBTPg0lPpuG7hF1AvY3UkinFZv4Xupn/lhQ/8C
 5e2A==
X-Gm-Message-State: AOAM532G0aw7kwmMBOFYfOqXzSaBzCtAakKfUS0nQ+AKCjA7jwlEKQY6
 YTa+EVQu7bqmSebZlSUK5nPBKiECeAZVxFLuHWkgpd63J0b4/f5YtZ0T61JUQitbJ6DB2+Wa2dp
 Bw6g2iseOwcfkSZE=
X-Received: by 2002:a05:600c:228a:: with SMTP id
 10mr24464193wmf.115.1619517423646; 
 Tue, 27 Apr 2021 02:57:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/anQQdRhfm7SwCTgAiRmxDdtAploiR4GRoxT6gXXD5qQ5kguNVwUBUfvS39yk6bmq6QAggQ==
X-Received: by 2002:a05:600c:228a:: with SMTP id
 10mr24464155wmf.115.1619517423335; 
 Tue, 27 Apr 2021 02:57:03 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f7sm3125511wrp.48.2021.04.27.02.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 02:57:02 -0700 (PDT)
Subject: Re: [RFC PATCH 0/6] Introduce cluster cpu topology support
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20210331095343.12172-1-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <13983bec-8b6b-4277-288a-e243d096bfb3@redhat.com>
Date: Tue, 27 Apr 2021 11:57:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210331095343.12172-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yanan,

On 3/31/21 11:53 AM, Yanan Wang wrote:
> Hi,
> This series introduces the cluster cpu topology support, besides now
> existing sockets, cores, and threads.
> 
> A cluster means a group of cores that share some resources (e.g. cache)
> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
> share L3 cache data while cores within each cluster share the L2 cache.
> 
> Also, there are some x86 CPU implementations (e.g. Jacobsville) where L2
> cache is shared among a cluster of cores instead of being exclusive to
> one single core. For example, on Jacobsville there are 6 clusters of 4
> Atom cores, each cluster sharing a separate L2, and 24 cores sharing L3).

> About this series:
> Note that, this series was implemented based on [3] and [4]. Although they
> have not merged into qemu mainline for now, it's still meaning to post this
> series to express the thoughts first. So a RFC is sent and any comments are
> welcomed and appreciated.

At a glance: tests/unit/test-x86-cpuid.c should be adapted to be generic
(but still supporting target-specific sub-tests) and some aarch64 tests
added.

Similarly the ARM PPTT tables tested in tests/qtest/bios-tables-test.c.

Otherwise, the overall series looks good and coherent, but it isn't my
area :)

Regards,

Phil.


