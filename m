Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A24458E0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 18:46:41 +0100 (CET)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1migoy-0007T8-LK
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 13:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1migit-0003DU-VZ
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:40:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1migiq-0004sH-7c
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 13:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636047618;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L++LmwRwGZBcsNENaV/8Fgm8RrQyRvi3omcP9luCXdg=;
 b=GZNISxB1483yJnVj3P/2wnaBxFvJ541+OsSAOcgl2VemuKvQMNyN0gzw6thYGek1FxQeDq
 l3gJ6wSAGMjCSZpaZYY+r9bhYUn7HEeyvVYU3NqK1HKnjMTR2h0GTZLqb/kf1m4LSe6pCc
 ETR2QzUxVIHWJBYCIF4zC+1e6DsxUz4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425--Q3b8UpiOgK8gqGAevX1jQ-1; Thu, 04 Nov 2021 13:40:16 -0400
X-MC-Unique: -Q3b8UpiOgK8gqGAevX1jQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f3-20020a5d50c3000000b00183ce1379feso1266598wrt.5
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 10:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=L++LmwRwGZBcsNENaV/8Fgm8RrQyRvi3omcP9luCXdg=;
 b=S7cYEReXfidJO8+DUOVbhC7/NYsiAQ5kzhBxEzvb5yrJoXSUd57RRjZhxDaT7XeORy
 m+ORRVHBDUjwsG/ATRodYBxAH0obFkxtlLvb7f72amGxNs1NzSFvEwsU57jXhaa5ywBt
 sSXtZPedJoOee2fV78tT79C8km8MCB8wxNTtKIWzhaYA35UVKaBPhHGT4oLDz7nNAafn
 HjCP+Sk7W4SOpcYi2DgbNzZvUNhgd+tWdZjJMMJ+gnsz4wQIYy2JlwIifAKzjvOUYodk
 D86cHgOfiJUnLqYgy3pDIvVO8C4NvQfgh4xrAGsYRW+aQ75Z+7PR6gRwR4nEn4BNwczq
 ES1w==
X-Gm-Message-State: AOAM532/vqytq+C33YW1T1IF8JncFETQ6tGtWjISzCyGOjKTa4d22sLc
 NN83K5bYplRyDAz2KG/D3FFIPrj/YjliyxZMxW86EAJMpyda4HGqIhEXO3WPcmnZjfaHDK0P0+w
 eoiGRZ9uxa1d+rvA=
X-Received: by 2002:a5d:5846:: with SMTP id i6mr32719837wrf.19.1636047614796; 
 Thu, 04 Nov 2021 10:40:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJt8vHPsInQq1ybO5JubR41pvxuWAel7XPnhzR1vA798OQr7xq+b/8mGbRpyCULQ98aTTMOQ==
X-Received: by 2002:a5d:5846:: with SMTP id i6mr32719823wrf.19.1636047614658; 
 Thu, 04 Nov 2021 10:40:14 -0700 (PDT)
Received: from [192.168.1.104] (rm-19-28-6.service.infuturo.it. [151.19.28.6])
 by smtp.gmail.com with ESMTPSA id
 t8sm4692903wmn.44.2021.11.04.10.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:40:14 -0700 (PDT)
Subject: Re: [PATCH v5] tests: qtest: Add virtio-iommu test
To: Thomas Huth <thuth@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211101184858.15223-1-eric.auger@redhat.com>
 <ab71888b-fd72-4b08-0d36-4add85ba6278@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <0f03ae53-ba78-1f87-9b85-eedb5714f8b4@redhat.com>
Date: Thu, 4 Nov 2021 18:40:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ab71888b-fd72-4b08-0d36-4add85ba6278@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,
On 11/2/21 2:34 PM, Thomas Huth wrote:
> On 01/11/2021 19.48, Eric Auger wrote:
>> Add the framework to test the virtio-iommu-pci device
>> and tests exercising the attach/detach, map/unmap API.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> ---
>>
>> v4 -> v5:
>> - remove printf and move a comment
>> - Added Jean-Philippe's T-b and R-b
>> ---
>>   tests/qtest/libqos/meson.build    |   1 +
>>   tests/qtest/libqos/virtio-iommu.c | 126 ++++++++++++
>>   tests/qtest/libqos/virtio-iommu.h |  40 ++++
>>   tests/qtest/meson.build           |   1 +
>>   tests/qtest/virtio-iommu-test.c   | 326 ++++++++++++++++++++++++++++++
>>   5 files changed, 494 insertions(+)
>>   create mode 100644 tests/qtest/libqos/virtio-iommu.c
>>   create mode 100644 tests/qtest/libqos/virtio-iommu.h
>>   create mode 100644 tests/qtest/virtio-iommu-test.c
>
> There's another failure on Travis-CI:
>
>  https://app.travis-ci.com/github/huth/qemu/jobs/546268575#L7240
>
>  ERROR:../tests/qtest/virtio-iommu-test.c:38:pci_config:
>  assertion failed (domain_range_end == 32): (536870912 == 32)
>
> 536870912 is 0x20000000, so this is likely an endianess issue?
Hum It seems so. Thank you for reporting the issue. I think the
get_config() cb implementation in the virtio-iommu device is wrong and
needs to be fixed.
I will send a fix along with the test.

Thanks!

Eric
>
>  Thomas
>


