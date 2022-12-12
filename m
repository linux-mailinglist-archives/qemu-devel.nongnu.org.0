Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4264A042
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4ijL-0000LR-BM; Mon, 12 Dec 2022 08:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4ijD-0000HA-3y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:20:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4ijA-0004pF-Oz
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670851215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WY0ScnDu/xcb85VE9hHWcy9XK85qZ39bWI8Y2Qo/jkI=;
 b=VPPe0jJwZHFMzOA5j+HzEBsUsmBB4Yl0fQZwpqNqUSVU20ZlEYMf7UbW7W3rpN0L3Y+qzm
 +lXkTldBqno0Y8oYhWLfCuzvYpmeOj7jAo1CZbg5oc1z4V/nuxWKWeaZE5rVxHCmuz8d6B
 ZwiaJF5P9WxSWlWlh+VDQ/4ZtlCOTB0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-E9qsFP9XMHGESfdK66h58Q-1; Mon, 12 Dec 2022 08:20:12 -0500
X-MC-Unique: E9qsFP9XMHGESfdK66h58Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 r67-20020a1c4446000000b003d09b0fbf54so4169642wma.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WY0ScnDu/xcb85VE9hHWcy9XK85qZ39bWI8Y2Qo/jkI=;
 b=R7HB8KejmvsTsMbB4buHGK/j0tlZA1OycY/h1fui7ZFTta0pfD7UDvj6/9URnIVKIc
 soy2eGPQ9lWf9pqDMQy8Ehi88vR7DI20YczQFVb/ZBmrdkRrgmXFy9EmoWt6UgpG/u5q
 PnoqpePxvBdIn0Tkgiky/eYX9BEiuY1w8fneOm5IYr9YuIxAukytOVSvcsAZTlxEzBb+
 GNZ7P75e8YCgmw81mG5TQ1TZ1Nzi2e73sW8PetkQDf5DHdwMBeZXgw/tfP/uX4nW5d3n
 SUdIHtutPbXnOrjx2B+jv7dbmcOGWwTnANMFlgEK74QnqvHd/DSFSnddOnGc8evGxaJE
 oCog==
X-Gm-Message-State: ANoB5pm8na39kZAB3IEF4ELojZXWIZy5Xlk5ZIDknoc9KGyXazm/maq4
 sCkoDGMeYpCt/QEVRHRgU6NUcx5v0MlBU2dMJ1Lm+fa7tuvY5e17ShqyT/YJLAdUhn4WW20UXEH
 orZd34haaRDCHqsU=
X-Received: by 2002:a05:600c:6025:b0:3cf:7624:5f9d with SMTP id
 az37-20020a05600c602500b003cf76245f9dmr12975698wmb.41.1670851210841; 
 Mon, 12 Dec 2022 05:20:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6PNZ102bVAkBX1KftY99VGJyXG6zxoZlJrtDECu8R5kXyFHp/4P8RrYq6osSrxg6IZnK6qtg==
X-Received: by 2002:a05:600c:6025:b0:3cf:7624:5f9d with SMTP id
 az37-20020a05600c602500b003cf76245f9dmr12975683wmb.41.1670851210630; 
 Mon, 12 Dec 2022 05:20:10 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 n3-20020a7bc5c3000000b003cfd4e6400csm9282724wmk.19.2022.12.12.05.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:20:10 -0800 (PST)
Message-ID: <1ef14f94-92f2-17ee-1517-517c7acbd512@redhat.com>
Date: Mon, 12 Dec 2022 14:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20221109130301.790679-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] tests/qtest: netdev: test stream and dgram backends
In-Reply-To: <20221109130301.790679-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/11/2022 14.03, Laurent Vivier wrote:
[...]
> diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> new file mode 100644
> index 000000000000..b6b59244a282
> --- /dev/null
> +++ b/tests/qtest/netdev-socket.c
> @@ -0,0 +1,435 @@
> +/*
> + * QTest testcase for netdev stream and dgram
> + *
> + * Copyright (c) 2022 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include <glib/gstdio.h>
> +#include "../unit/socket-helpers.h"
> +#include "libqtest.h"
> +
> +#define CONNECTION_TIMEOUT    5
> +
> +#define EXPECT_STATE(q, e, t)                             \
> +do {                                                      \
> +    char *resp = qtest_hmp(q, "info network");            \
> +    if (t) {                                              \
> +        strrchr(resp, t)[0] = 0;                          \
> +    }                                                     \
> +    g_test_timer_start();                                 \
> +    while (g_test_timer_elapsed() < CONNECTION_TIMEOUT) { \
> +        if (strcmp(resp, e) == 0) {                       \
> +            break;                                        \
> +        }                                                 \
> +        g_free(resp);                                     \
> +        resp = qtest_hmp(q, "info network");              \
> +        if (t) {                                          \
> +            strrchr(resp, t)[0] = 0;                      \
> +        }                                                 \
> +    }                                                     \
> +    g_assert_cmpstr(resp, ==, e);                         \
> +    g_free(resp);                                         \
> +} while (0)

Wouldn't it be possible to write this without the duplicated qtest_hmp() ? 
Something like this:

#define EXPECT_STATE(q, e, t)                             \
do {                                                      \
     char *resp = NULL;                                    \
     g_test_timer_start();                                 \
     do {                                                  \
         g_free(resp);                                     \
         resp = qtest_hmp(q, "info network");              \
         if (t) {                                          \
             strrchr(resp, t)[0] = 0;                      \
         }                                                 \
         if (g_strequal(resp, e)) {                        \
             break;                                        \
         }                                                 \
     } while (g_test_timer_elapsed() < CONNECTION_TIMEOUT); \
     g_assert_cmpstr(resp, ==, e);                         \
     g_free(resp);                                         \
} while (0)

?

Also matching strings against the output of a HMP command sound very fragile 
- isn't there a way to do this with QMP instead?

[...]
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +    bool has_ipv4, has_ipv6, has_afunix;
> +    gchar dir[] = "/tmp/netdev-socket.XXXXXX";

No more hard-coded /tmp/ paths, please. We're currently in progress of 
enabling the qtests on Windows, too. Please use g_dir_make_tmp() or 
something similar instead.

> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
> +        g_printerr("socket_check_protocol_support() failed\n");
> +        goto end;
> +    }
> +
> +    if (g_mkdtemp(dir) == NULL) {
> +        g_error("g_mkdtemp: %s", g_strerror(errno));
> +    }
> +    tmpdir = dir;
> +
> +    if (has_ipv4) {
> +        qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
> +        qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
> +        qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
> +    }
> +    if (has_ipv6) {
> +        qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
> +    }
> +
> +    socket_check_afunix_support(&has_afunix);
> +    if (has_afunix) {
> +        qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
> +        qtest_add_func("/netdev/stream/unix", test_stream_unix);
> +        qtest_add_func("/netdev/stream/unix/abstract",
> +                       test_stream_unix_abstract);
> +        qtest_add_func("/netdev/stream/fd", test_stream_fd);
> +        qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
> +    }
> +
> +end:
> +    ret = g_test_run();
> +
> +    g_rmdir(dir);

Maybe check the return code of g_rmdir(), to make sure that all temporary 
files in the directory have indeed been cleaned up successfully?

> +    return ret;
> +}

  Thomas


