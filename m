Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAFF48E734
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 10:14:44 +0100 (CET)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8IfT-0007e3-VJ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 04:14:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IOT-0004zK-O8
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:57:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n8IOS-0000cp-1n
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 03:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642150626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xc1r2+mAmNKMz834tct/RAdtqugVn0my1bFIICtY1sA=;
 b=AJunxsEBaTHaGPUV9Y5n6LqdY7BKiTkea/vUzvQ0ZGjMJzjJulQlXoRq8cKlgTXkD5ZavH
 P7k/FqJumVKemH73GzkG9jrE3WPbTMKrTTahrBs1hwtgTEwtAlwI05AVRiWSywrCIj+PnT
 6cU3/B7X3xx5X7uTyfLhud8AkodhSl4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-k9pi0w0RPY2FXIiegTXB9Q-1; Fri, 14 Jan 2022 03:57:05 -0500
X-MC-Unique: k9pi0w0RPY2FXIiegTXB9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 n14-20020a7bcbce000000b003488820f0d9so5186541wmi.8
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 00:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xc1r2+mAmNKMz834tct/RAdtqugVn0my1bFIICtY1sA=;
 b=XmnRP4eYS9/q3Rav05k9HCp96afQktq9oJCkhk6dGlWceFhmhaJ47CRZMjnY8T/Wej
 ZSQoaSCU+hwU9TL81tKfJXc9U6qcep3/4hxu/rIkvjkPMCG2Trdc8hZAAv9ajgdcnOm8
 2grncvFane5qeVkpeUupexk0nKf+AvyVIkVAAZ+bOMrSfG4GaSc38eqRSzpMDyg9FUfK
 Zt3zW2pasqLpB9uXngZfpF2BUGyLPSSVAxOYF9Mxi+kXYmbB9BKpse/bHM0mOmBHoWuX
 LKUdRpVrrEfdkehZ3cDL/zoEKrDuYahaYQXMv8WtO6kBvZ9cVYbc1XZP3fIarz9Kk4EX
 JPvg==
X-Gm-Message-State: AOAM531Z1WMmSeFczyQ+hjPFO8OjL7Y0AZ1MBRubZEiPKfSZxQM686i2
 marZ1Wahef+CIecKbyzb6R0was6qdLgGi5ZN22B4qw79omEIze5Z1k2uS0s7AD8WDXg09swftZd
 9nP3C+XB8V3A3iHM=
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr1819126wms.96.1642150624443; 
 Fri, 14 Jan 2022 00:57:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzExCpIOd4HFrZdPTb3JdRRv3PxVw4bgXKCymTbQcE+n17epjA3thCtkJTMbqMaZiJ6MrqeEw==
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr1819112wms.96.1642150624263; 
 Fri, 14 Jan 2022 00:57:04 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u16sm4651877wrn.24.2022.01.14.00.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:57:03 -0800 (PST)
Message-ID: <4cbc788f-7935-9d1f-9d56-0cebeda7a5bb@redhat.com>
Date: Fri, 14 Jan 2022 09:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/6] tests/qtest/libqos: Skip hotplug tests if pci root
 bus is not hotpluggable
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org
References: <20220110211915.2749082-1-eric.auger@redhat.com>
 <20220110211915.2749082-4-eric.auger@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220110211915.2749082-4-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2022 22.19, Eric Auger wrote:
> ARM does not not support hotplug on pcie.0. Add a flag on the bus
> which tells if devices can be hotplugged and skip hotplug tests
> if the bus cannot be hotplugged. This is a temporary solution to
> enable the other pci tests on aarch64.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   tests/qtest/e1000e-test.c         |  6 ++++++
>   tests/qtest/libqos/pci.h          |  1 +
>   tests/qtest/vhost-user-blk-test.c | 10 ++++++++++
>   tests/qtest/virtio-blk-test.c     |  5 +++++
>   tests/qtest/virtio-net-test.c     |  5 +++++
>   tests/qtest/virtio-rng-test.c     |  5 +++++
>   6 files changed, 32 insertions(+)
> 
> diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
> index 0273fe4c156..0d656d3af63 100644
> --- a/tests/qtest/e1000e-test.c
> +++ b/tests/qtest/e1000e-test.c
> @@ -235,6 +235,12 @@ static void test_e1000e_multiple_transfers(void *obj, void *data,
>   static void test_e1000e_hotplug(void *obj, void *data, QGuestAllocator * alloc)
>   {
>       QTestState *qts = global_qtest;  /* TODO: get rid of global_qtest here */
> +    QE1000E_PCI *dev = obj;
> +
> +    if (dev->pci_dev.bus->not_hotpluggable) {
> +        g_test_skip("bus pci.0 does not support hotplug");

I'd maybe rather say "pci bus does not support hotplug", i.e. avoid "pci.0" 
here, in case this is ever used for another port, too.

Apart from that:
Acked-by: Thomas Huth <thuth@redhat.com>


> +        return;
> +    }


