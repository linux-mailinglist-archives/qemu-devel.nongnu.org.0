Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8073C45A18D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 12:35:01 +0100 (CET)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpU4i-0000Nh-70
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 06:35:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mpU2y-0007U3-1B
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mpU2p-00087U-Kz
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 06:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637667182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/uoq7kwD4oGeGzaXPqAbYrl2/kNTnfS43Clek7wtLw=;
 b=Sr5labbTMqMk74DBIJgPW52nINgzM8pLtMIn2Wf1l1YpjemQqCWSQc9T2qBqsmwE+BfkRN
 yAN5nCo4AWIMjxaeaaI2ZERcxXiI2p5+wHWjaqtVv4cFJPnNLDXLYvql8NbEkIy1oVlvrl
 MH9rkS30tT9Kl1Pa4JTOW03Q4NWnfQI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-prXXCzyEPvywIZbE7Mgkzg-1; Tue, 23 Nov 2021 06:33:01 -0500
X-MC-Unique: prXXCzyEPvywIZbE7Mgkzg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p12-20020a05600c1d8c00b0033a22e48203so1366133wms.6
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 03:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y/uoq7kwD4oGeGzaXPqAbYrl2/kNTnfS43Clek7wtLw=;
 b=mUAY4lJpijJJBuZ9yq/QRAr23KvHFXgx/r60B28YkgUDoymRro3aMxt7BKyh+t/t1p
 a3c96skoik/QHVOi+J4Vgd2+smI0BqEMFQJF2/RaWlGLlCFG8gz3jpj8c5KD3zI7Q34Z
 BqHjCsxlD3fkMgvT/hfXpiVh+bP2LMaq7O1upcLKM6xr3mgOcOzy7ZAYFl6mGIXsVP6i
 i79is5pzTzSrXZa8+X0WzgOdZpbskL9ziyxM/i8CYJFkrJLkytd93SCP9E/UftV1GLbQ
 xtviwhAhGto83HosF4nlxDaHsrEFv4ia3uGEn6YN9RkVio33qNOrx7UGXHy3lrEpxEGY
 74jg==
X-Gm-Message-State: AOAM5313emxpIXO4ih00Ezi6od3f35thtqRUJrOlA8z5AuN65onBhRce
 v1hivFIPfPRBo8IJFX/gYgjKE1BSXDKaSltNHLUJ662VckHVUP+572RAnqSwOIFkK2QiQ7MPk6F
 HAJ4J9OCiNRti4mw=
X-Received: by 2002:adf:e109:: with SMTP id t9mr6037668wrz.387.1637667179665; 
 Tue, 23 Nov 2021 03:32:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkjkJ5E+6j35rtiRqxrayi5m22rDUWBvY52TMBlReOs3BGCmQWSRzwudiqMplWSXQSCHo2Pw==
X-Received: by 2002:adf:e109:: with SMTP id t9mr6037626wrz.387.1637667179433; 
 Tue, 23 Nov 2021 03:32:59 -0800 (PST)
Received: from [192.168.100.42] ([82.142.2.234])
 by smtp.gmail.com with ESMTPSA id u23sm12639487wru.21.2021.11.23.03.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 03:32:59 -0800 (PST)
Message-ID: <150b245e-10db-bd58-87a7-c4dcc504d1c1@redhat.com>
Date: Tue, 23 Nov 2021 12:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 2/2] tests/qtest: Add fuzz-lsi53c895a-test
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211123111732.83137-1-philmd@redhat.com>
 <20211123111732.83137-3-philmd@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211123111732.83137-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/2021 12:17, Philippe Mathieu-Daudé wrote:
> Without the previous commit, this test triggers:
> 
>    $ make check-qtest-x86_64
>    [...]
>    Running test qtest-x86_64/fuzz-lsi53c895a-test
>    qemu-system-x86_64: hw/scsi/lsi53c895a.c:624: lsi_do_dma: Assertion `s->current' failed.
>    ERROR qtest-x86_64/fuzz-lsi53c895a-test - too few tests run (expected 1, got 0)
> 
> Suggested-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/fuzz-lsi53c895a-test.c | 52 ++++++++++++++++++++++++++++++
>   MAINTAINERS                        |  1 +
>   tests/qtest/meson.build            |  1 +
>   3 files changed, 54 insertions(+)
>   create mode 100644 tests/qtest/fuzz-lsi53c895a-test.c
> 
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> new file mode 100644
> index 00000000000..ba5d468970c
> --- /dev/null
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QTest fuzzer-generated testcase for LSI53C895A device
> + *
> + * Copyright (c) Red Hat
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +
> +/*
> + * This used to trigger the assert in lsi_do_dma()
> + * https://bugs.launchpad.net/qemu/+bug/697510
> + * https://bugs.launchpad.net/qemu/+bug/1905521
> + * https://bugs.launchpad.net/qemu/+bug/1908515
> + */
> +static void test_lsi_do_dma_empty_queue(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-M q35 -nographic -monitor none -serial none "
> +                   "-drive if=none,id=drive0,"
> +                            "file=null-co://,file.read-zeroes=on,format=raw "
> +                   "-device lsi53c895a,id=scsi0 "
> +                   "-device scsi-hd,drive=drive0,"
> +                            "bus=scsi0.0,channel=0,scsi-id=0,lun=0");
> +    qtest_outl(s, 0xcf8, 0x80001814);
> +    qtest_outl(s, 0xcfc, 0xe1068000);
> +    qtest_outl(s, 0xcf8, 0x80001818);
> +    qtest_outl(s, 0xcf8, 0x80001804);
> +    qtest_outw(s, 0xcfc, 0x7);
> +    qtest_outl(s, 0xcf8, 0x80002010);
> +
> +    qtest_writeb(s, 0xe106802e, 0xff); /* Fill DSP bits 16-23 */
> +    qtest_writeb(s, 0xe106802f, 0xff); /* Fill DSP bits 24-31: trigger SCRIPT */
> +
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
> +        qtest_add_func("fuzz/lsi53c895a/lsi_do_dma_empty_queue",
> +                       test_lsi_do_dma_empty_queue);
> +    }
> +
> +    return g_test_run();
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d3879aa3c12..3c0f76b7801 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1825,6 +1825,7 @@ F: hw/scsi/*
>   F: tests/qtest/virtio-scsi-test.c
>   F: tests/qtest/fuzz-virtio-scsi-test.c
>   F: tests/qtest/am53c974-test.c
> +F: tests/qtest/fuzz-lsi53c895a-test.c
>   T: git https://github.com/bonzini/qemu.git scsi-next
>   
>   SSI
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c9d8458062f..d2ce20d3047 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -19,6 +19,7 @@
>   
>   qtests_generic = \
>     (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_VIRTIO_SCSI') ? ['fuzz-virtio-scsi-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_SB16') ? ['fuzz-sb16-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_SDHCI_PCI') ? ['fuzz-sdcard-test'] : []) + \
> 

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


