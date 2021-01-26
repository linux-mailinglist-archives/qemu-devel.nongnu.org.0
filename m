Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B058E3045C6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 18:55:54 +0100 (CET)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4SZB-0005sH-Cg
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 12:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4SWV-0005Eo-90
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:53:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l4SWQ-000434-DR
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 12:53:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611683577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZz5Xs2N1UE/5KYflbPfquMQUKAsO7rO8paqJBQz6cI=;
 b=LkhDXnDIRIRPw5HOAAFnpD7S9X9pcZmCm42RWeWCvWvEY9yIKVaIdCYLU/v71uo6irHKlj
 RSZvycHvTwA+FYakokRwqpIL6vL01/mS8yRuZLkEqcYYqvPTOJfTMtJ5l1ZKbAXwfTIWlk
 YEOGkz30xZAVCHb3gfQJvGo+EzBCci4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-cxLQj4cPPQqx1YMwVFrB2g-1; Tue, 26 Jan 2021 12:52:52 -0500
X-MC-Unique: cxLQj4cPPQqx1YMwVFrB2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B547E1005586;
 Tue, 26 Jan 2021 17:52:51 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-182.ams2.redhat.com [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DDB25C3E4;
 Tue, 26 Jan 2021 17:52:46 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] tests/qtest: Only run fuzz-virtio-scsi when
 virtio-scsi is available
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>
References: <20210126111638.3141780-1-philmd@redhat.com>
 <20210126111638.3141780-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dff6001a-8628-aa18-e874-8678211a12b5@redhat.com>
Date: Tue, 26 Jan 2021 18:52:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126111638.3141780-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2021 12.16, Philippe Mathieu-Daudé wrote:
> This test fails when QEMU is built without the virtio-scsi device,
> restrict it to its availability.
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/fuzz-test.c             | 51 --------------------
>   tests/qtest/fuzz-virtio-scsi-test.c | 75 +++++++++++++++++++++++++++++
>   MAINTAINERS                         |  1 +
>   tests/qtest/meson.build             |  1 +
>   4 files changed, 77 insertions(+), 51 deletions(-)
>   create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c
> 
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index 6188fbb8e96..d112798afe3 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -25,55 +25,6 @@ static void test_lp1878642_pci_bus_get_irq_level_assert(void)
>       qtest_quit(s);
>   }
>   
> -/*
> - * Here a MemoryRegionCache pointed to an MMIO region but had a
> - * larger size than the underlying region.
> - */
> -static void test_mmio_oob_from_memory_region_cache(void)
> -{
> -    QTestState *s;
> -
> -    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
> -		   "-device virtio-scsi,num_queues=8,addr=03.0 ");
> -
> -    qtest_outl(s, 0xcf8, 0x80001811);
> -    qtest_outb(s, 0xcfc, 0x6e);
> -    qtest_outl(s, 0xcf8, 0x80001824);
> -    qtest_outl(s, 0xcf8, 0x80001813);
> -    qtest_outl(s, 0xcfc, 0xa080000);
> -    qtest_outl(s, 0xcf8, 0x80001802);
> -    qtest_outl(s, 0xcfc, 0x5a175a63);
> -    qtest_outb(s, 0x6e08, 0x9e);
> -    qtest_writeb(s, 0x9f003, 0xff);
> -    qtest_writeb(s, 0x9f004, 0x01);
> -    qtest_writeb(s, 0x9e012, 0x0e);
> -    qtest_writeb(s, 0x9e01b, 0x0e);
> -    qtest_writeb(s, 0x9f006, 0x01);
> -    qtest_writeb(s, 0x9f008, 0x01);
> -    qtest_writeb(s, 0x9f00a, 0x01);
> -    qtest_writeb(s, 0x9f00c, 0x01);
> -    qtest_writeb(s, 0x9f00e, 0x01);
> -    qtest_writeb(s, 0x9f010, 0x01);
> -    qtest_writeb(s, 0x9f012, 0x01);
> -    qtest_writeb(s, 0x9f014, 0x01);
> -    qtest_writeb(s, 0x9f016, 0x01);
> -    qtest_writeb(s, 0x9f018, 0x01);
> -    qtest_writeb(s, 0x9f01a, 0x01);
> -    qtest_writeb(s, 0x9f01c, 0x01);
> -    qtest_writeb(s, 0x9f01e, 0x01);
> -    qtest_writeb(s, 0x9f020, 0x01);
> -    qtest_writeb(s, 0x9f022, 0x01);
> -    qtest_writeb(s, 0x9f024, 0x01);
> -    qtest_writeb(s, 0x9f026, 0x01);
> -    qtest_writeb(s, 0x9f028, 0x01);
> -    qtest_writeb(s, 0x9f02a, 0x01);
> -    qtest_writeb(s, 0x9f02c, 0x01);
> -    qtest_writeb(s, 0x9f02e, 0x01);
> -    qtest_writeb(s, 0x9f030, 0x01);
> -    qtest_outb(s, 0x6e10, 0x00);
> -    qtest_quit(s);
> -}
> -
>   int main(int argc, char **argv)
>   {
>       const char *arch = qtest_get_arch();
> @@ -83,8 +34,6 @@ int main(int argc, char **argv)
>       if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>           qtest_add_func("fuzz/test_lp1878642_pci_bus_get_irq_level_assert",
>                          test_lp1878642_pci_bus_get_irq_level_assert);
> -        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
> -                       test_mmio_oob_from_memory_region_cache);
>       }
>   
>       return g_test_run();
> diff --git a/tests/qtest/fuzz-virtio-scsi-test.c b/tests/qtest/fuzz-virtio-scsi-test.c
> new file mode 100644
> index 00000000000..aaf6d10e189
> --- /dev/null
> +++ b/tests/qtest/fuzz-virtio-scsi-test.c
> @@ -0,0 +1,75 @@
> +/*
> + * QTest fuzzer-generated testcase for virtio-scsi device
> + *
> + * Copyright (c) 2020 Li Qiang <liq3ea@gmail.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "libqos/libqtest.h"
> +
> +/*
> + * Here a MemoryRegionCache pointed to an MMIO region but had a
> + * larger size than the underlying region.
> + */
> +static void test_mmio_oob_from_memory_region_cache(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-M pc-q35-5.2 -display none -m 512M "
> +                   "-device virtio-scsi,num_queues=8,addr=03.0 ");
> +
> +    qtest_outl(s, 0xcf8, 0x80001811);
> +    qtest_outb(s, 0xcfc, 0x6e);
> +    qtest_outl(s, 0xcf8, 0x80001824);
> +    qtest_outl(s, 0xcf8, 0x80001813);
> +    qtest_outl(s, 0xcfc, 0xa080000);
> +    qtest_outl(s, 0xcf8, 0x80001802);
> +    qtest_outl(s, 0xcfc, 0x5a175a63);
> +    qtest_outb(s, 0x6e08, 0x9e);
> +    qtest_writeb(s, 0x9f003, 0xff);
> +    qtest_writeb(s, 0x9f004, 0x01);
> +    qtest_writeb(s, 0x9e012, 0x0e);
> +    qtest_writeb(s, 0x9e01b, 0x0e);
> +    qtest_writeb(s, 0x9f006, 0x01);
> +    qtest_writeb(s, 0x9f008, 0x01);
> +    qtest_writeb(s, 0x9f00a, 0x01);
> +    qtest_writeb(s, 0x9f00c, 0x01);
> +    qtest_writeb(s, 0x9f00e, 0x01);
> +    qtest_writeb(s, 0x9f010, 0x01);
> +    qtest_writeb(s, 0x9f012, 0x01);
> +    qtest_writeb(s, 0x9f014, 0x01);
> +    qtest_writeb(s, 0x9f016, 0x01);
> +    qtest_writeb(s, 0x9f018, 0x01);
> +    qtest_writeb(s, 0x9f01a, 0x01);
> +    qtest_writeb(s, 0x9f01c, 0x01);
> +    qtest_writeb(s, 0x9f01e, 0x01);
> +    qtest_writeb(s, 0x9f020, 0x01);
> +    qtest_writeb(s, 0x9f022, 0x01);
> +    qtest_writeb(s, 0x9f024, 0x01);
> +    qtest_writeb(s, 0x9f026, 0x01);
> +    qtest_writeb(s, 0x9f028, 0x01);
> +    qtest_writeb(s, 0x9f02a, 0x01);
> +    qtest_writeb(s, 0x9f02c, 0x01);
> +    qtest_writeb(s, 0x9f02e, 0x01);
> +    qtest_writeb(s, 0x9f030, 0x01);
> +    qtest_outb(s, 0x6e10, 0x00);
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> +        qtest_add_func("fuzz/test_mmio_oob_from_memory_region_cache",
> +                       test_mmio_oob_from_memory_region_cache);
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 44cd74b03cd..48c0ec41e93 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1717,6 +1717,7 @@ S: Supported
>   F: include/hw/scsi/*
>   F: hw/scsi/*
>   F: tests/qtest/virtio-scsi-test.c
> +F: tests/qtest/fuzz-virtio-scsi-test.c
>   T: git https://github.com/bonzini/qemu.git scsi-next
>   
>   SSI
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 85682d0dfce..f2090296597 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -6,6 +6,7 @@
>   
>   qtests_generic = \
>     (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
>     [
>     'cdrom-test',
>     'device-introspect-test',
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


