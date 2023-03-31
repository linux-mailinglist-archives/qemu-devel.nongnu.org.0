Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D9B6D2200
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:01:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFJh-0003K3-16; Fri, 31 Mar 2023 10:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFJb-0003C2-8z; Fri, 31 Mar 2023 10:01:18 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1piFJZ-0007we-DJ; Fri, 31 Mar 2023 10:01:14 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id cf7so27507379ybb.5;
 Fri, 31 Mar 2023 07:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680271272; x=1682863272;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ByPIoPx0ZrWexgRaIPhlGfo2kAd1Na+8wyIySIdvJg=;
 b=nFN7k19JaJXKJswrFzjzezbp8ZrnrdmyFq6+1Y/8if5hqlklKmTc2YdySn+63ktxGz
 qoD2V9jRmax3TcAdQUbVV+CKF31eEZn8sEUdnepUvAXzzs2ZDO8pZuT/oVncT268tMDX
 AzIY/ONoNLV/0cjDvcVSCqcxvEkYm5ZWbSvJCif7npo+FyIzqZ3sdhaXsXui71/0dFqB
 5K175TO3FhlytTPZwE9SWv+7bjx6memHc2j536qGy9ANtFd1x3U5KurAwQg5Gmu3YD34
 7UusEMSipzE31p5usiaJ8A3Vneqb/+pfY91eYDVvDri1zQEmYa1Sf1qDQa1MJJ88m/9C
 1EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680271272; x=1682863272;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1ByPIoPx0ZrWexgRaIPhlGfo2kAd1Na+8wyIySIdvJg=;
 b=kT86Skb4h3wOig56w9z+8lgahKIXocdhuvQbvpKjs9KnzL6sGYiZsOqQgkPNqMVo9d
 6w2tLJHFwmGZMYfkDvpyI4acQ+nErCu1+VxzzpbYUYrXZX2zSJCMpzbagF+6bYY0bLtg
 M8sUZXtNBhVlxipDgTUFF0fidmZr7So+3nLMTFXDQmIybjdnCS2s8BGb3KWcxvVSYWng
 tG74EmbHKPJV9IY+ycQkbjq7KGbyZZ2dOcZkKEc5uwsSwJ/fGZ6+uE6kKQlpAECQ1bFH
 PoMy125/VmqykevjWiX+imr1rrv/mRxGoGy1KmDo1plHIEjqpQm+3SJDELWEVsiTRSbw
 0BGQ==
X-Gm-Message-State: AAQBX9d8hXq8988vKwKhvVQEYj4ZJQUrjHI7PcX5AAnj7+05j4yIrP+Q
 hVeS6kvQm3h2T/ZN/VcMF75JC4mJtA==
X-Google-Smtp-Source: AKy350bI8qxJuZg3BMdGtKQ+NbITADUJYsYewL24Oizhz8GKRlwnirS8d9Q7YmriBZN/dOd6g1i6ag==
X-Received: by 2002:a25:2584:0:b0:997:e3f5:d0cd with SMTP id
 l126-20020a252584000000b00997e3f5d0cdmr24068583ybl.45.1680271271596; 
 Fri, 31 Mar 2023 07:01:11 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.84])
 by smtp.gmail.com with ESMTPSA id
 cj9-20020a056902188900b00b7b0aba5cccsm582057ybb.22.2023.03.31.07.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:01:11 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:4b5:7e28:63da:3be])
 by serve.minyard.net (Postfix) with ESMTPSA id 67D081800BB;
 Fri, 31 Mar 2023 14:01:10 +0000 (UTC)
Date: Fri, 31 Mar 2023 09:01:09 -0500
From: Corey Minyard <minyard@acm.org>
To: Titus Rwantare <titusr@google.com>
Cc: philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 7/7] tests/qtest: add tests for ADM1266
Message-ID: <ZCbnpcnaj2dnfYXV@minyard.net>
References: <20230331000756.1712787-1-titusr@google.com>
 <20230331000756.1712787-8-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331000756.1712787-8-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=tcminyard@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 31, 2023 at 12:07:56AM +0000, Titus Rwantare wrote:
>   The ADM1266 can have string fields written by the driver, so
>   it's worth specifically testing.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Acked-by: Corey Minyard <cminyard@mvista.com>

> ---
>  tests/qtest/adm1266-test.c | 123 +++++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build    |   1 +
>  2 files changed, 124 insertions(+)
>  create mode 100644 tests/qtest/adm1266-test.c
> 
> diff --git a/tests/qtest/adm1266-test.c b/tests/qtest/adm1266-test.c
> new file mode 100644
> index 0000000000..6431a21de6
> --- /dev/null
> +++ b/tests/qtest/adm1266-test.c
> @@ -0,0 +1,123 @@
> +/*
> + * Analog Devices ADM1266 Cascadable Super Sequencer with Margin Control and
> + * Fault Recording with PMBus
> + *
> + * Copyright 2022 Google LLC
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include <math.h>
> +#include "hw/i2c/pmbus_device.h"
> +#include "libqtest-single.h"
> +#include "libqos/qgraph.h"
> +#include "libqos/i2c.h"
> +#include "qapi/qmp/qdict.h"
> +#include "qapi/qmp/qnum.h"
> +#include "qemu/bitops.h"
> +
> +#define TEST_ID "adm1266-test"
> +#define TEST_ADDR (0x12)
> +
> +#define ADM1266_BLACKBOX_CONFIG                 0xD3
> +#define ADM1266_PDIO_CONFIG                     0xD4
> +#define ADM1266_READ_STATE                      0xD9
> +#define ADM1266_READ_BLACKBOX                   0xDE
> +#define ADM1266_SET_RTC                         0xDF
> +#define ADM1266_GPIO_SYNC_CONFIGURATION         0xE1
> +#define ADM1266_BLACKBOX_INFORMATION            0xE6
> +#define ADM1266_PDIO_STATUS                     0xE9
> +#define ADM1266_GPIO_STATUS                     0xEA
> +
> +/* Defaults */
> +#define ADM1266_OPERATION_DEFAULT               0x80
> +#define ADM1266_CAPABILITY_DEFAULT              0xA0
> +#define ADM1266_CAPABILITY_NO_PEC               0x20
> +#define ADM1266_PMBUS_REVISION_DEFAULT          0x22
> +#define ADM1266_MFR_ID_DEFAULT                  "ADI"
> +#define ADM1266_MFR_ID_DEFAULT_LEN              32
> +#define ADM1266_MFR_MODEL_DEFAULT               "ADM1266-A1"
> +#define ADM1266_MFR_MODEL_DEFAULT_LEN           32
> +#define ADM1266_MFR_REVISION_DEFAULT            "25"
> +#define ADM1266_MFR_REVISION_DEFAULT_LEN        8
> +#define TEST_STRING_A                           "a sample"
> +#define TEST_STRING_B                           "b sample"
> +#define TEST_STRING_C                           "rev c"
> +
> +static void compare_string(QI2CDevice *i2cdev, uint8_t reg,
> +                           const char *test_str)
> +{
> +    uint8_t len = i2c_get8(i2cdev, reg);
> +    char i2c_str[SMBUS_DATA_MAX_LEN] = {0};
> +
> +    i2c_read_block(i2cdev, reg, (uint8_t *)i2c_str, len);
> +    g_assert_cmpstr(i2c_str, ==, test_str);
> +}
> +
> +static void write_and_compare_string(QI2CDevice *i2cdev, uint8_t reg,
> +                                     const char *test_str, uint8_t len)
> +{
> +    char buf[SMBUS_DATA_MAX_LEN] = {0};
> +    buf[0] = len;
> +    strncpy(buf + 1, test_str, len);
> +    i2c_write_block(i2cdev, reg, (uint8_t *)buf, len + 1);
> +    compare_string(i2cdev, reg, test_str);
> +}
> +
> +static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
> +{
> +    uint16_t i2c_value;
> +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
> +
> +    i2c_value = i2c_get8(i2cdev, PMBUS_OPERATION);
> +    g_assert_cmphex(i2c_value, ==, ADM1266_OPERATION_DEFAULT);
> +
> +    i2c_value = i2c_get8(i2cdev, PMBUS_REVISION);
> +    g_assert_cmphex(i2c_value, ==, ADM1266_PMBUS_REVISION_DEFAULT);
> +
> +    compare_string(i2cdev, PMBUS_MFR_ID, ADM1266_MFR_ID_DEFAULT);
> +    compare_string(i2cdev, PMBUS_MFR_MODEL, ADM1266_MFR_MODEL_DEFAULT);
> +    compare_string(i2cdev, PMBUS_MFR_REVISION, ADM1266_MFR_REVISION_DEFAULT);
> +}
> +
> +/* test r/w registers */
> +static void test_rw_regs(void *obj, void *data, QGuestAllocator *alloc)
> +{
> +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
> +
> +    /* empty strings */
> +    i2c_set8(i2cdev, PMBUS_MFR_ID, 0);
> +    compare_string(i2cdev, PMBUS_MFR_ID, "");
> +
> +    i2c_set8(i2cdev, PMBUS_MFR_MODEL, 0);
> +    compare_string(i2cdev, PMBUS_MFR_MODEL, "");
> +
> +    i2c_set8(i2cdev, PMBUS_MFR_REVISION, 0);
> +    compare_string(i2cdev, PMBUS_MFR_REVISION, "");
> +
> +    /* test strings */
> +    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_A,
> +                             sizeof(TEST_STRING_A));
> +    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_B,
> +                             sizeof(TEST_STRING_B));
> +    write_and_compare_string(i2cdev, PMBUS_MFR_ID, TEST_STRING_C,
> +                             sizeof(TEST_STRING_C));
> +}
> +
> +static void adm1266_register_nodes(void)
> +{
> +    QOSGraphEdgeOptions opts = {
> +        .extra_device_opts = "id=" TEST_ID ",address=0x12"
> +    };
> +    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
> +
> +    qos_node_create_driver("adm1266", i2c_device_create);
> +    qos_node_consumes("adm1266", "i2c-bus", &opts);
> +
> +    qos_add_test("test_defaults", "adm1266", test_defaults, NULL);
> +    qos_add_test("test_rw_regs", "adm1266", test_rw_regs, NULL);
> +}
> +
> +libqos_init(adm1266_register_nodes);
> +
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 85ea4e8d99..d3cf7b2287 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -232,6 +232,7 @@ qos_test_ss = ss.source_set()
>  qos_test_ss.add(
>    'ac97-test.c',
>    'adm1272-test.c',
> +  'adm1266-test.c',
>    'ds1338-test.c',
>    'e1000-test.c',
>    'eepro100-test.c',
> -- 
> 2.40.0.423.gd6c402a77b-goog
> 

