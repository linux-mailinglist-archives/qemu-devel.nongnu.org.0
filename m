Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF85EBF63
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:12:30 +0200 (CEST)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7Zl-0000Dl-UP
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od7PT-00023T-Qk
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od7PQ-0000b5-Ih
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664272907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmVULjwc6M1JraVFLKRIkxkVtdkp2kaY0M7tE83451g=;
 b=AeucgAsivc08jUgUPGM2jXO24Nnr5OkQHEkeCUWxnW8qeYw6QMyl2+Dd/yhV75PifSY+bj
 sWn0Pdn3ORyb6gYnAZqO9yCbboHL7YfgzmJx5naH/JRRihojjLsN63nN14Tg4xxcLjFEwf
 BJUMyoD/yQ1bCAXVyKTc3Iv9tw2naA0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-30-MCFW7liwMNeA4MQq_Ue8Yw-1; Tue, 27 Sep 2022 06:01:46 -0400
X-MC-Unique: MCFW7liwMNeA4MQq_Ue8Yw-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay21-20020a05600c1e1500b003b45fd14b53so436849wmb.1
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=bmVULjwc6M1JraVFLKRIkxkVtdkp2kaY0M7tE83451g=;
 b=R7X4lat+VoRkK1E5+PULqBBfgViN8iyFTvdaymvmHlQU/vFNam1jaTdMAJdJ99kd+C
 YpeNSK/vakVr81ifKaoIHG/hV8eNBvjf+Y4ECWfHnmCl5tohz0y3+77pwKFlLC20gM4Q
 7eq7NRyRx667qUpoX281axAUZCGlio7OkKQNQT76weleUqxu7KYpDQg0nJsG4Juh+nYe
 PQ9q+lGqTLi8iJWdU3y+Ya1TkP6G+Wszb1wgqGEpHBpq1+5kCJsqJKwkFydkVfoBKieY
 fcIX3Yghc4M9ZxebCnTpdT0ysNXLQYfff5ghczVnw8CdKET5KzpcaFXqa50cR5+P7UvC
 qEig==
X-Gm-Message-State: ACrzQf1DQGvxUyL7SG1WYNV2WfzXaPend6bZ7F/fU/BRE/AvrL0zJaGS
 j71d/Divqv8l+nyjKg82kLs58+KGEpQt19icpIbr1L/JWXimgwDfh0gCpQlGUpWt1lZhoA7Je4Q
 32qk+HXX1w+MszlI=
X-Received: by 2002:a1c:6a17:0:b0:3b4:84af:8f75 with SMTP id
 f23-20020a1c6a17000000b003b484af8f75mr1981231wmc.53.1664272905413; 
 Tue, 27 Sep 2022 03:01:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7jcCS7hyjgs6ikhedaKkfCbwZc5SE+3RZ3ke4kU5S3347nIwrqUtawZH61GIEEckPc+x0BmA==
X-Received: by 2002:a1c:6a17:0:b0:3b4:84af:8f75 with SMTP id
 f23-20020a1c6a17000000b003b484af8f75mr1981195wmc.53.1664272905112; 
 Tue, 27 Sep 2022 03:01:45 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003b4868eb71bsm15370043wmq.25.2022.09.27.03.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 03:01:44 -0700 (PDT)
Message-ID: <3bbd4122-4004-a351-bcaf-badb841c1121@redhat.com>
Date: Tue, 27 Sep 2022 12:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220926195048.487915-1-lvivier@redhat.com>
 <20220926195048.487915-16-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v9 15/16] tests/qtest: netdev: test stream and dgram
 backends
In-Reply-To: <20220926195048.487915-16-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/09/2022 21.50, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   tests/qtest/meson.build     |   1 +
>   tests/qtest/netdev-socket.c | 391 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 392 insertions(+)
>   create mode 100644 tests/qtest/netdev-socket.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e910cb32ca15..38ee8b7a2d56 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -27,6 +27,7 @@ qtests_generic = [
>     'test-hmp',
>     'qos-test',
>     'readconfig-test',
> +  'netdev-socket',
>   ]
>   if config_host.has_key('CONFIG_MODULES')
>     qtests_generic += [ 'modules-test' ]
> diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> new file mode 100644
> index 000000000000..55e0c07f18ec
> --- /dev/null
> +++ b/tests/qtest/netdev-socket.c
> @@ -0,0 +1,391 @@
> +/*
> + * QTest testcase for netdev stream and dgram
> + *
> + * Copyright (c) 2022 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include <glib.h>

glib.h is already included via osdep.h, so you don't need to include it here 
again.

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
> +
> +static int inet_get_free_port(void)
> +{
> +    int sock;
> +    struct sockaddr_in addr;
> +    socklen_t len;
> +    int port;
> +
> +    sock = socket(AF_INET, SOCK_STREAM, 0);
> +    if (sock < 0) {
> +        return -1;
> +    }
> +
> +    memset(&addr, 0, sizeof(addr));
> +    addr.sin_family = AF_INET;
> +    addr.sin_addr.s_addr = INADDR_ANY;
> +    addr.sin_port = 0;
> +    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {

close(sock) ?

> +        return -1;
> +    }
> +
> +    len = sizeof(addr);
> +    if (getsockname(sock,  (struct sockaddr *)&addr, &len) < 0) {
> +        return -1;
> +    }
> +
> +    port = ntohs(addr.sin_port);
> +
> +    close(sock);
> +
> +    return port;
> +}
> +
> +static void test_stream_inet_ipv4(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int port;
> +
> +    port = inet_get_free_port();
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,addr.type=inet,"
> +                       "addr.ipv4=on,addr.ipv6=off,"
> +                       "addr.host=localhost,addr.port=%d", port);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> +                       "addr.ipv4=on,addr.ipv6=off,"
> +                       "addr.host=localhost,addr.port=%d", port);
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,tcp:127.0.0.1:%d\r\n",
> +                             port);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    /* the port is unknown, check only the address */
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:127.0.0.1", ':');
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_stream_inet_ipv6(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int port;
> +
> +    port = inet_get_free_port();
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,addr.type=inet,"
> +                       "addr.ipv4=off,addr.ipv6=on,"
> +                       "addr.host=localhost,addr.port=%d", port);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> +                       "addr.ipv4=off,addr.ipv6=on,"
> +                       "addr.host=localhost,addr.port=%d", port);
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,tcp:::1:%d\r\n",
> +                             port);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    /* the port is unknown, check only the address */
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:::1", ':');
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_stream_unix(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    gchar *path;
> +    int ret;
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,addr.type=unix,addr.path=%s,",
> +                       path);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=false,"
> +                       "addr.type=unix,addr.path=%s",
> +                       path);
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,unix:%s\r\n", path);
> +    EXPECT_STATE(qts1, expect, 0);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);

Do you have to unlink(path) here?

> +    g_free(path);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_stream_unix_abstract(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    gchar *path;
> +    int ret;
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,addr.type=unix,addr.path=%s,"
> +                       "addr.abstract=on",
> +                       path);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=false,"
> +                       "addr.type=unix,addr.path=%s,addr.abstract=on",
> +                       path);
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,unix:%s\r\n", path);
> +    EXPECT_STATE(qts1, expect, 0);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);

unlink(path) ?

> +    g_free(path);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_stream_fd(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int ret, sock0, sock1;
> +    struct sockaddr_un addr;
> +    gchar *path;
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +    addr.sun_family = AF_UNIX;
> +    strcpy(addr.sun_path, path);
> +
> +    unlink(addr.sun_path);
> +    sock0 = socket(AF_LOCAL, SOCK_STREAM, 0);
> +    g_assert_cmpint(sock0, !=, -1);
> +
> +    ret = bind(sock0, (struct sockaddr *)&addr, sizeof(addr));
> +    g_assert_cmpint(ret, !=, -1);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,addr.type=fd,addr.str=%d",
> +                       sock0);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    sock1 = socket(AF_LOCAL, SOCK_STREAM, 0);
> +    g_assert_cmpint(sock1, !=, -1);
> +
> +    ret = connect(sock1, (struct sockaddr *)&addr, sizeof(addr));
> +    g_assert_cmpint(ret, !=, -1);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=off,addr.type=fd,addr.str=%d",
> +                       sock1);
> +
> +
> +    expect = g_strdup_printf("st0: index=0,type=stream,unix:%s\r\n", path);
> +    EXPECT_STATE(qts1, expect, 0);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +
> +    closesocket(sock0);
> +    closesocket(sock1);
> +
> +    g_free(path);
> +}
> +
> +static void test_dgram_inet(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int port0, port1;
> +
> +    port0 = inet_get_free_port();
> +    port1 = inet_get_free_port();

Could it happen that port0 is the same as port1 ? Would it be a problem?

> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,"
> +                       "local.type=inet,local.host=localhost,local.port=%d,"
> +                       "remote.type=inet,remote.host=localhost,remote.port=%d",
> +                        port0, port1);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,"
> +                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n", port0, port1);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,"
> +                       "local.type=inet,local.host=localhost,local.port=%d,"
> +                       "remote.type=inet,remote.host=localhost,remote.port=%d",
> +                        port1, port0);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,"
> +                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n", port1, port0);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_dgram_mcast(void)
> +{
> +    QTestState *qts;
> +
> +    qts = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,"
> +                       "remote.type=inet,remote.host=230.0.0.1,remote.port=1234");
> +
> +    EXPECT_STATE(qts, "st0: index=0,type=dgram,mcast=230.0.0.1:1234\r\n", 0);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_dgram_unix(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    gchar *path0, *path1;
> +    int ret;
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path0, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +
> +    ret = g_file_open_tmp("netdev-XXXXXX", &path1, NULL);
> +    g_assert_true(ret >= 0);
> +    close(ret);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,local.type=unix,local.path=%s,"
> +                       "remote.type=unix,remote.path=%s",
> +                       path0, path1);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,udp=%s:%s\r\n",
> +                             path0, path1);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,local.type=unix,local.path=%s,"
> +                       "remote.type=unix,remote.path=%s",
> +                       path1, path0);
> +
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,udp=%s:%s\r\n",
> +                             path1, path0);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);

unlink ?

> +    g_free(path0);
> +    g_free(path1);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}

  Thomas


