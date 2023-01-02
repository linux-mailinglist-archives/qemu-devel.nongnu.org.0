Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE465B774
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 22:48:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCSeM-0005TP-Dp; Mon, 02 Jan 2023 16:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pCSeI-0005TB-4d
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pCSeF-0006zn-JP
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672696029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13BrdIJM1hnZW2i/sq8KZGjZKegnHNsOme8O4a16/X8=;
 b=A/j79EP6aMJz6Z1iRJHE1sOEpnRmt3F9BKm4S/yFQx9ubbXQZvcr0h6KdWP6sJp5gVvaQx
 9kaggpFQWEHHyTM7jpZL2d1N3tXuh4tkrsUT2AzkWgHYeZ7VXFncbkIsLa5MFqG2LpPIuU
 5g8O7eMqZ6MCw8jPqNBf6KzaO2qDjBw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-571-KQqJeSvONHSY6Yyg01YO4A-1; Mon, 02 Jan 2023 16:46:02 -0500
X-MC-Unique: KQqJeSvONHSY6Yyg01YO4A-1
Received: by mail-wm1-f70.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so13503908wmq.3
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 13:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13BrdIJM1hnZW2i/sq8KZGjZKegnHNsOme8O4a16/X8=;
 b=4LZcSvWsnup4Z0msnbPXacUd7TJtBeC4fENGJsg1mrMIwX0y6MdtlZpXK3oTPQJndT
 +eyDnOAhPdxhPmwNJNhphIN/ttGSZt4hGonWCdX5e9D9HS/bdxyOJgRBesMZqftZXIZ4
 4Ju/I6/lzk4CgzA59Alnv4IwkwMz4ZFEVJfnzk6xXpvrHpKIDtKpxduaf6aFa5wCdx7/
 7IMB/cjyElvaGducNmNsjkqjYN02qpwJgFvMDDMG1uxWG9tvsT0VH1RKpF80mofAuLcQ
 QTApKIxOejSjw3+uC1eDTDU4YqQQzAh50e3pi3BxCyVkO+Xh7JkxeoVKroyl/6+QxBBe
 gpyA==
X-Gm-Message-State: AFqh2krcx+1GFGiVl7/0d7JLThIVBxx0Q4rsdCGiY3yGChygE+uUiMmG
 rE0/xw/YEH1Uv3gZswPYcRSADEI2Z6BQmWqMBQ3mZBGcr7pHkuK07GpQsFTcSmvFFopfhtdksvv
 YdPro8Y+CQ8XDcdY=
X-Received: by 2002:adf:eb89:0:b0:24f:a289:b422 with SMTP id
 t9-20020adfeb89000000b0024fa289b422mr23231061wrn.16.1672695961117; 
 Mon, 02 Jan 2023 13:46:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvF+4oFdbza22q1OMFn9+evbhtNv9nriXgjjkF6GS3vFcU/3I85DK9xF+MM0yIGAs/D53PzAQ==
X-Received: by 2002:adf:eb89:0:b0:24f:a289:b422 with SMTP id
 t9-20020adfeb89000000b0024fa289b422mr23231050wrn.16.1672695960834; 
 Mon, 02 Jan 2023 13:46:00 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adff909000000b00267bcb1bbe5sm29413462wrr.56.2023.01.02.13.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 13:46:00 -0800 (PST)
Message-ID: <60d0c186-0e60-3466-e576-da101f7edf7d@redhat.com>
Date: Mon, 2 Jan 2023 22:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20221109130301.790679-1-lvivier@redhat.com>
 <1ef14f94-92f2-17ee-1517-517c7acbd512@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <1ef14f94-92f2-17ee-1517-517c7acbd512@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 12/12/22 14:20, Thomas Huth wrote:
> On 09/11/2022 14.03, Laurent Vivier wrote:
> [...]
>> diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
>> new file mode 100644
>> index 000000000000..b6b59244a282
>> --- /dev/null
>> +++ b/tests/qtest/netdev-socket.c
>> @@ -0,0 +1,435 @@
>> +/*
>> + * QTest testcase for netdev stream and dgram
>> + *
>> + * Copyright (c) 2022 Red Hat, Inc.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include <glib/gstdio.h>
>> +#include "../unit/socket-helpers.h"
>> +#include "libqtest.h"
>> +
>> +#define CONNECTION_TIMEOUT    5
>> +
>> +#define EXPECT_STATE(q, e, t)                             \
>> +do {                                                      \
>> +    char *resp = qtest_hmp(q, "info network");            \
>> +    if (t) {                                              \
>> +        strrchr(resp, t)[0] = 0;                          \
>> +    }                                                     \
>> +    g_test_timer_start();                                 \
>> +    while (g_test_timer_elapsed() < CONNECTION_TIMEOUT) { \
>> +        if (strcmp(resp, e) == 0) {                       \
>> +            break;                                        \
>> +        }                                                 \
>> +        g_free(resp);                                     \
>> +        resp = qtest_hmp(q, "info network");              \
>> +        if (t) {                                          \
>> +            strrchr(resp, t)[0] = 0;                      \
>> +        }                                                 \
>> +    }                                                     \
>> +    g_assert_cmpstr(resp, ==, e);                         \
>> +    g_free(resp);                                         \
>> +} while (0)
> 
> Wouldn't it be possible to write this without the duplicated qtest_hmp() ? Something like 
> this:
> 
> #define EXPECT_STATE(q, e, t)                             \
> do {                                                      \
>      char *resp = NULL;                                    \
>      g_test_timer_start();                                 \
>      do {                                                  \
>          g_free(resp);                                     \
>          resp = qtest_hmp(q, "info network");              \
>          if (t) {                                          \
>              strrchr(resp, t)[0] = 0;                      \
>          }                                                 \
>          if (g_strequal(resp, e)) {                        \
>              break;                                        \
>          }                                                 \
>      } while (g_test_timer_elapsed() < CONNECTION_TIMEOUT); \
>      g_assert_cmpstr(resp, ==, e);                         \
>      g_free(resp);                                         \
> } while (0)
> 
> ?

OK

> 
> Also matching strings against the output of a HMP command sound very fragile - isn't there 
> a way to do this with QMP instead?

No, there is no similar command with QMP. There was a tentative in the past but it has 
never been merged.

https://wiki.qemu.org/Google_Summer_of_Code_2010/QMP#query-netdev

> 
> [...]
>> +int main(int argc, char **argv)
>> +{
>> +    int ret;
>> +    bool has_ipv4, has_ipv6, has_afunix;
>> +    gchar dir[] = "/tmp/netdev-socket.XXXXXX";
> 
> No more hard-coded /tmp/ paths, please. We're currently in progress of enabling the qtests 
> on Windows, too. Please use g_dir_make_tmp() or something similar instead.

ok

> 
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
>> +        g_printerr("socket_check_protocol_support() failed\n");
>> +        goto end;
>> +    }
>> +
>> +    if (g_mkdtemp(dir) == NULL) {
>> +        g_error("g_mkdtemp: %s", g_strerror(errno));
>> +    }
>> +    tmpdir = dir;
>> +
>> +    if (has_ipv4) {
>> +        qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
>> +        qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
>> +        qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
>> +    }
>> +    if (has_ipv6) {
>> +        qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
>> +    }
>> +
>> +    socket_check_afunix_support(&has_afunix);
>> +    if (has_afunix) {
>> +        qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
>> +        qtest_add_func("/netdev/stream/unix", test_stream_unix);
>> +        qtest_add_func("/netdev/stream/unix/abstract",
>> +                       test_stream_unix_abstract);
>> +        qtest_add_func("/netdev/stream/fd", test_stream_fd);
>> +        qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
>> +    }
>> +
>> +end:
>> +    ret = g_test_run();
>> +
>> +    g_rmdir(dir);
> 
> Maybe check the return code of g_rmdir(), to make sure that all temporary files in the 
> directory have indeed been cleaned up successfully?

If it fails there is nothing we can do, I think it's better to ignore the result.

> 
>> +    return ret;
>> +}
> 
>   Thomas
> 

Thanks,
Laurent


