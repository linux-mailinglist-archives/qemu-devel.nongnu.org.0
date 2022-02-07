Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F114ACBBF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:03:37 +0100 (CET)
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHC6h-0005cd-QM
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:03:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHC30-00041a-Qy
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nHC2x-0007tL-Mc
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644271182;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9SaDH2NIi/9JzlvSC6uJ0Ti0uOl9Jmur3IxhzTLH58=;
 b=fgA/bH2vXfcruo14Eg5XquuPAh6/LwTbxzU3NlT0EMRw0jkCXebfnNCMRDpZEjtFl4f/FI
 XxzBlV7h+jAadSkWa5/FBOa30zFd6iyR2SGu5osP6Pi7XewqRvh8cevG0Do177nnAKdSNI
 XfZTsNu4ayGsM/kjeNyganyNj3W5tQI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-GxA39Q1YMd6wQeelxa9IWw-1; Mon, 07 Feb 2022 16:59:40 -0500
X-MC-Unique: GxA39Q1YMd6wQeelxa9IWw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v2-20020adfa1c2000000b001e31fe03e3cso1298174wrv.4
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 13:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=q9SaDH2NIi/9JzlvSC6uJ0Ti0uOl9Jmur3IxhzTLH58=;
 b=prvcEWy47pAMUTXBuqqqtRD2pWlsM+3wEHo8u3nLj0MO67PbXn694UwbZwgYw+Zy/c
 vPnv5rTGfMBBB6j2wvrm9xWC1b30ckDNIK7v8/e+/ceHi3gjOIfEZ6TTREEnBCjHG7sE
 yN/0VXrKjcKM/lDiPNf/qOieuX8kIA6wR/CwKyILEExQMdX2l5zr0KbZq2rG4POnYs2w
 wKZteBC32XvMyelH78G5jMUwOe6a33YwalMnB6aIxPVjQDKNpe3wyzqktNspvep4uzc5
 +rk6UoNbxpLuOKV1AGVPRv29rHW90oIiu0OxtiHStCwvomFUMFa6ozYZ7g0pKadQ9jvp
 1SuA==
X-Gm-Message-State: AOAM533GgCmAR8k/NG/lUHmTvwIvUYwoRpHcybfM4gmyG0TbN1vrb1r0
 RGDC1In/IqVbEEong+oxyLciH+8JbxEMVpuVWGhJJhvc0LDfdGY34TUYZTxWCqU3KkqiITk2WWT
 cANC7gCSzETdlNp4=
X-Received: by 2002:a5d:49c1:: with SMTP id t1mr1101338wrs.359.1644271178950; 
 Mon, 07 Feb 2022 13:59:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgWfEhb5nBg41ZgPHIsZnXK5zYpkJdMEeIXrymB1AlbJKtHhtz9GejyBVr27h7NK7YQu8kAA==
X-Received: by 2002:a5d:49c1:: with SMTP id t1mr1101318wrs.359.1644271178651; 
 Mon, 07 Feb 2022 13:59:38 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r11sm2724071wrt.28.2022.02.07.13.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 13:59:38 -0800 (PST)
Subject: Re: [PATCH v2 0/6] qtests/libqos: Allow PCI tests to be run with
 virt-machine
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220204204301-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <d6f1e88d-da84-6d7f-fc87-bffebb750ff8@redhat.com>
Date: Mon, 7 Feb 2022 22:59:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220204204301-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 jean-philippe@linaro.org, eesposit@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 2/5/22 2:43 AM, Michael S. Tsirkin wrote:
> On Tue, Jan 18, 2022 at 09:38:27PM +0100, Eric Auger wrote:
>> Up to now the virt-machine node only contains a virtio-mmio
>> driver node but no driver that eventually produces any pci-bus
>> interface.
>>
>> Hence, PCI libqos tests cannot be run with aarch64 binary.
>>
>> This series brings the pieces needed to be able to run PCI tests
>> with the aarch64 binary: a generic-pcihost driver node gets
>> instantiated by the machine. This later contains a pci-bus-generic
>> driver which produces a pci-bus interface. Then all tests
>> consuming the pci-bus interface can be run with the libqos arm
>> virt machine.
>>
>> One of the first goal was to be able to run the virtio-iommu-pci
>> tests as the virtio-iommu was initially targetting ARM and it
>> was awkard to be run the test with the pc machine. This is now
>> possible.
>>
>> Only the tests doing hotplug cannot be run yet as hotplug is
>> not possible on the root bus. This will be dealt with separately
>> by adding a root port to the object tree.
>>
>> Best Regards
>>
>> Eric
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/libqos-pci-arm-v2
>>
>> History
>
> I dropped this due to make check failures. Pls make sure
> to make and test all targets. Thanks!
Sorry for the inconvenience.

qos-test now is failing on aarch64 and definitively it was passing when
I submitted the patches (ie. with above branch).
I bisected and d9afe24c29a0 ("hw/arm/virt: Disable highmem devices that
don't fit in the PA range") recenly applied upstream changed the way the
test behave and now is causing
/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/megasas/megasas-tests/dcmd/pd-get-info/fuzz
to fail.

This is due to the fact GPA is limited to 32b and the device seems to
require high ECAM. I will fix that.

Thanks

Eric
>
>> v1 -> v2:
>> - copyright updated to 2022
>> - QPCIBusARM renamed into QGenericPCIBus
>> - QGenericPCIHost declarations and definitions moved in the same
>>   place as the generic pci implementation
>> - rename pci-arm.c/h in generic-pcihost.c/h and remove any ref to
>>   ARM there
>> - remove qos_node_produces_opts, qpci_new_arm, qpci_free_arm
>> - ecam_alloc_ptr now is a field of QGenericPCIBus and not QPCIBus
>> - new libqos_init to create generic-pcihost driver that contains
>>   pci-bus-generic
>> - QGenericPCIHost moved in the same place as the generic pci
>>   bindings
>> - collected Thomas A-b/R-b
>>
>>
>> Eric Auger (6):
>>   tests/qtest/vhost-user-test.c: Use vhostforce=on
>>   tests/qtest/libqos/pci: Introduce pio_limit
>>   tests/qtest/libqos: Skip hotplug tests if pci root bus is not
>>     hotpluggable
>>   tests/qtest/vhost-user-blk-test: Setup MSIx to avoid error on aarch64
>>   tests/qtest/vhost-user-blk-test: Factorize vq setup code
>>   tests/qtest/libqos: Add generic pci host bridge in arm-virt machine
>>
>>  tests/qtest/e1000e-test.c             |   6 +
>>  tests/qtest/libqos/arm-virt-machine.c |  18 +-
>>  tests/qtest/libqos/generic-pcihost.c  | 231 ++++++++++++++++++++++++++
>>  tests/qtest/libqos/generic-pcihost.h  |  54 ++++++
>>  tests/qtest/libqos/meson.build        |   1 +
>>  tests/qtest/libqos/pci-pc.c           |   1 +
>>  tests/qtest/libqos/pci-spapr.c        |   1 +
>>  tests/qtest/libqos/pci.c              |  78 +++++----
>>  tests/qtest/libqos/pci.h              |   6 +-
>>  tests/qtest/vhost-user-blk-test.c     |  39 ++++-
>>  tests/qtest/vhost-user-test.c         |   2 +-
>>  tests/qtest/virtio-blk-test.c         |   5 +
>>  tests/qtest/virtio-net-test.c         |   5 +
>>  tests/qtest/virtio-rng-test.c         |   5 +
>>  14 files changed, 408 insertions(+), 44 deletions(-)
>>  create mode 100644 tests/qtest/libqos/generic-pcihost.c
>>  create mode 100644 tests/qtest/libqos/generic-pcihost.h
>>
>> -- 
>> 2.26.3


