Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB5C63D49B
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 12:30:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0LHZ-0000rg-Ne; Wed, 30 Nov 2022 06:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0LHX-0000r7-KG
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0LHV-0007Zu-Sl
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669807777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhTHkRrkfBn+9UPW8X87H40SuNwF7BSKvFvXipWIx1U=;
 b=MMI+hZNLVvPDSe2bKCCmh5852YbqQ09ZHlZ5kEgveXnmSgIXsiD2EMfGA7bwUwAHioxdKp
 fhT1lznqhWHtoUdNWx62NndokQPUw13L6ojbSeapwbQ2KNIPEsIULhYMyX/9N0W7C8vn91
 mvfPgi/IW1abnQCgefJU0Ux4KYmxd1g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-fAqz5WbEPzie6ZUB36X4mQ-1; Wed, 30 Nov 2022 06:29:35 -0500
X-MC-Unique: fAqz5WbEPzie6ZUB36X4mQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so862678wmb.5
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 03:29:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhTHkRrkfBn+9UPW8X87H40SuNwF7BSKvFvXipWIx1U=;
 b=qegd/1/MinfRYufV36XH2h3ibGat3Pc+FOB9qO5ZOD3+l9And8Cuuo3yXxJI6Lboxc
 EQl2lWuIEIE5qfCEFnuxNcid1+cBlgM43K5fQE0mHAJmYLGuhLJQH/Zu5UqNfQjXbGkJ
 mdGrShgnGLNjHqoN70KvRIo9id9O5ex2NC3QCHwuqJlQNl0/OYw0jtaHye+rVCjclELm
 XK4Ie5llQopSnqwJVGAaH/ooBuN/8lf/QMp0YDUsevEWDm28nW4OhvAHTLWBGpdWcrPk
 J3uySmFSaXHGlKcb4FzeUf66c7XlyxUP8J13ds3c8TaPnDuB/HYQikWrlTAt5i/Qy89K
 dLZg==
X-Gm-Message-State: ANoB5pnuWE6ufvWhJD5UvwyLH/NVLxkxSCdvNl7KDdty2JagMp71eHab
 nyA64t65khHbA0k8VJQSRYnooufS583w7mk7v5Dts2q5XDl85YzbWPrxE0AdinPqjUVjhbVlWqV
 KVDS6KM2bXsItoD4=
X-Received: by 2002:a5d:526b:0:b0:242:380:c10e with SMTP id
 l11-20020a5d526b000000b002420380c10emr17064509wrc.132.1669807774231; 
 Wed, 30 Nov 2022 03:29:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6MkKkAtgyrEF1+czab7JRDchDhM7KcWGyVYBZ4uReWeybxnjmWotNYW3WjTqEgaG3V4lqpZg==
X-Received: by 2002:a5d:526b:0:b0:242:380:c10e with SMTP id
 l11-20020a5d526b000000b002420380c10emr17064498wrc.132.1669807773984; 
 Wed, 30 Nov 2022 03:29:33 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 p21-20020a1c5455000000b003b4cba4ef71sm4968237wmi.41.2022.11.30.03.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 03:29:33 -0800 (PST)
Message-ID: <db28b205-4797-4bc0-09c9-53d54c0ce268@redhat.com>
Date: Wed, 30 Nov 2022 12:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com
References: <20221130015444.1459842-1-tommy.wu@sifive.com>
 <20221130015444.1459842-4-tommy.wu@sifive.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 3/3] tests/qtest: sifive-e-aon-watchdog-test.c : Add
 QTest of watchdog of sifive_e
In-Reply-To: <20221130015444.1459842-4-tommy.wu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/11/2022 02.54, Tommy Wu wrote:
> Add some simple tests of the watchdog timer in the always-on domain device
> of HiFive 1 rev b.
> 
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> ---
...
> diff --git a/tests/qtest/sifive-e-aon-watchdog-test.c b/tests/qtest/sifive-e-aon-watchdog-test.c
> new file mode 100644
> index 0000000000..1f454c266a
> --- /dev/null
> +++ b/tests/qtest/sifive-e-aon-watchdog-test.c
> @@ -0,0 +1,650 @@

I'd suggest to add at least add a SPDX identifier so that people know which 
license this file has. A short comment on what is being tested here would 
also be nice (though it is already quite obvious from the file name).

> +#include "qemu/osdep.h"
> +#include "qemu/timer.h"
> +#include "qemu/bitops.h"
> +#include "libqtest-single.h"

Note that libqtest-single.h restricts your code to testing with one QEMU 
binary. If you want to write code that is a little bit more future-proof 
(e.g. if some of the functions should be used with migration testing later 
etc.), I'd suggest to get along without libqtest-single.h and pass the 
QTestState around as a parameter of the functions.

[...]
> +static void test_wdogcfg(void)
> +{
> +    uint32_t tmp_cfg;
> +
> +    test_init();
> +
> +    tmp_cfg = readl(WDOG_BASE + WDOGCFG);
> +    writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
> +    g_assert(readl(WDOG_BASE + WDOGCFG) == tmp_cfg);
> +
> +    writel(WDOG_BASE + WDOGKEY, SIFIVE_E_AON_WDOGKEY);
> +    writel(WDOG_BASE + WDOGCFG, 0xFFFFFFFF);
> +    g_assert(0xFFFFFFFF == readl(WDOG_BASE + WDOGCFG));
> +
> +    tmp_cfg = readl(WDOG_BASE + WDOGCFG);
> +    g_assert(15 ==
> +             FIELD_EX32(tmp_cfg,
> +                        AON_WDT_WDOGCFG,
> +                        SCALE));
> +    g_assert(1 ==
> +             FIELD_EX32(tmp_cfg,
> +                        AON_WDT_WDOGCFG,
> +                         RSTEN));
> +    g_assert(1 ==
> +             FIELD_EX32(tmp_cfg,
> +                        AON_WDT_WDOGCFG,
> +                        ZEROCMP));
> +    g_assert(1 ==
> +             FIELD_EX32(tmp_cfg,
> +                        AON_WDT_WDOGCFG,
> +                        EN_ALWAYS));
> +    g_assert(1 ==
> +             FIELD_EX32(tmp_cfg,
> +                        AON_WDT_WDOGCFG,
> +                        EN_CORE_AWAKE));
> +    g_assert(1 ==
> +             FIELD_EX32(tmp_cfg,
> +                        AON_WDT_WDOGCFG,
> +                        IP0));

Just a matter of taste, but at least I would prefer the statements on one 
line as long as they still fit into 80 columns.

  Thomas


