Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD777610984
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:06:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooHYA-00018w-LY; Fri, 28 Oct 2022 01:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooHXk-00013J-Jy
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooHXh-00031a-Fj
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666933467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okMdc+KhJjKXcis0bcDj5EWl2UnVMQS0OzmNUP9xDbI=;
 b=FN1oK56umF6F/gA5ejdQPewR8WZSeLaMwD/DirCaOADVkAbP5CKeVNKrBS+ATvRsB5A8Jz
 lVFBaz1tyQL8xfp87HfXniuthou+nWtMfJalq2BgcL83WNKoSZgulbvF36A/fLKsbozMTw
 F9XEZ7remiI47CefLmfekXAEqpqVe5w=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-tndRzlqiPi-hw8fhBqltDA-1; Fri, 28 Oct 2022 01:04:26 -0400
X-MC-Unique: tndRzlqiPi-hw8fhBqltDA-1
Received: by mail-pl1-f199.google.com with SMTP id
 n1-20020a170902d2c100b00186e5cb9334so2568248plc.16
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 22:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=okMdc+KhJjKXcis0bcDj5EWl2UnVMQS0OzmNUP9xDbI=;
 b=B9+0NBsAlHjbLisXST2F3nTX/Zjfjf0i0ZD/tHYfHGcThaDi7FDf3Q0lJ2LRyvu92F
 TCdw+6FSlKn5U1e3+HcAdX0AO9lMe/XSUdyuR6IU6jqF88uIplqkqt64Lqh4gcPIH2yX
 6bx/RSDBfjxtU43143ZcD5w1uBtrvfGHoOrPbBtt1524mHPnES1NeILgMkuqyOJRKLft
 /0MpZzoYqrOLdbqp/3AoRfaanVKj9NMXRrx4J2vzr6UWnH95QiYw7lV2/OTshSdbYFMv
 cBz7pl3r6hyHKwtCcsPCqNDbIJ6i3jJCT8n5VLzRn7NrtkdoMeEfPgGHYmp6spM+lkNy
 VjDw==
X-Gm-Message-State: ACrzQf3AeNo+K0TPYqGAflg2VVypJNG4yq+l4r9uDyRlpbnLhdn4VTAw
 x0EvESs0xVGlsRXLkOHpa7I7QMA7jtSbGrVX8k69YAHIyda3/WHrvE+PE/WqFvuP1R/QknyoSx0
 uDQqhI4GgaBn23Fs=
X-Received: by 2002:a17:90b:1649:b0:20d:2d96:6b05 with SMTP id
 il9-20020a17090b164900b0020d2d966b05mr14284802pjb.9.1666933465297; 
 Thu, 27 Oct 2022 22:04:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM763cM40Ox4h2hsO44kzlRFkLDSF93C9SC1IIjEwDsaISVB67+Ka9W6ONBS2A+3fnGisQJaow==
X-Received: by 2002:a17:90b:1649:b0:20d:2d96:6b05 with SMTP id
 il9-20020a17090b164900b0020d2d966b05mr14284755pjb.9.1666933464749; 
 Thu, 27 Oct 2022 22:04:24 -0700 (PDT)
Received: from [10.72.13.50] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 e16-20020aa79810000000b0056b6c7a17c6sm2062169pfl.12.2022.10.27.22.04.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 22:04:23 -0700 (PDT)
Message-ID: <700ef645-6cb6-66e6-00a9-3db187be0c43@redhat.com>
Date: Fri, 28 Oct 2022 13:04:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-17-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20221021090922.170074-17-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2022/10/21 17:09, Laurent Vivier 写道:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---


I got this:

63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
assertion failed (resp == expect): ("st0: index=0,type=stream,connection 
error\r\n" == "st0: index=0,type=stream,tcp:::1:40389\r\n") ERROR
63/63 qemu:qtest+qtest-x86_64 / 
qtest-x86_64/netdev-socket                  ERROR 5.29s   killed by 
signal 6 SIGABRT
 >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 
MALLOC_PERTURB_=96 
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
/home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
✀ 
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
**
ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: 
assertion failed (resp == expect): ("st0: index=0,type=stream,connection 
error\r\n" == "st0: index=0,type=stream,tcp:::1:40389\r\n")

(test program exited with status code -6)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

The base is:

commit 344744e148e6e865f5a57e745b02a87e5ea534ad (HEAD -> master, 
origin/master, origin/HEAD)
Merge: 08a5d04606 e38c24cb58
Author: Stefan Hajnoczi <stefanha@redhat.com>
Date:   Wed Oct 26 10:53:48 2022 -0400

     Merge tag 'dump-pull-request' of 
https://gitlab.com/marcandre.lureau/qemu into staging

So I dropped this patch from the queue and we can add it back after 
soft-freeze.

Thanks


>   tests/qtest/meson.build     |   1 +
>   tests/qtest/netdev-socket.c | 420 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 421 insertions(+)
>   create mode 100644 tests/qtest/netdev-socket.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c07a5b1a5f43..6953797e4e3e 100644
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
> index 000000000000..b24c0819b9ac
> --- /dev/null
> +++ b/tests/qtest/netdev-socket.c
> @@ -0,0 +1,420 @@
> +/*
> + * QTest testcase for netdev stream and dgram
> + *
> + * Copyright (c) 2022 Red Hat, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
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
> +static int inet_get_free_port_socket(int sock)
> +{
> +    struct sockaddr_in addr;
> +    socklen_t len;
> +
> +    memset(&addr, 0, sizeof(addr));
> +    addr.sin_family = AF_INET;
> +    addr.sin_addr.s_addr = INADDR_ANY;
> +    addr.sin_port = 0;
> +    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
> +        return -1;
> +    }
> +
> +    len = sizeof(addr);
> +    if (getsockname(sock,  (struct sockaddr *)&addr, &len) < 0) {
> +        return -1;
> +    }
> +
> +    return ntohs(addr.sin_port);
> +}
> +
> +static int inet_get_free_port_multiple(int nb, int *port)
> +{
> +    int sock[nb];
> +    int i;
> +
> +    for (i = 0; i < nb; i++) {
> +        sock[i] = socket(AF_INET, SOCK_STREAM, 0);
> +        if (sock[i] < 0) {
> +            break;
> +        }
> +        port[i] = inet_get_free_port_socket(sock[i]);
> +    }
> +
> +    nb = i;
> +    for (i = 0; i < nb; i++) {
> +        closesocket(sock[i]);
> +    }
> +
> +    return nb;
> +}
> +
> +static int inet_get_free_port(void)
> +{
> +    int nb, port;
> +
> +    nb = inet_get_free_port_multiple(1, &port);
> +    g_assert_cmpint(nb, ==, 1);
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
> +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
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
> +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
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
> +                       "-netdev stream,id=st0,server=true,"
> +                       "addr.type=unix,addr.path=%s,",
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
> +    unlink(path);
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
> +                       "-netdev stream,id=st0,server=true,"
> +                       "addr.type=unix,addr.path=%s,"
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
> +    unlink(path);
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
> +                       "-netdev stream,id=st0,server=true,"
> +                       "addr.type=fd,addr.str=%d",
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
> +                       "-netdev stream,id=st0,server=false,addr.type=fd,addr.str=%d",
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
> +    int port[2];
> +    int nb;
> +
> +    nb = inet_get_free_port_multiple(2, port);
> +    g_assert_cmpint(nb, ==, 2);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,"
> +                       "local.type=inet,local.host=localhost,local.port=%d,"
> +                       "remote.type=inet,remote.host=localhost,remote.port=%d",
> +                        port[0], port[1]);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,"
> +                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n",
> +                             port[0], port[1]);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,"
> +                       "local.type=inet,local.host=localhost,local.port=%d,"
> +                       "remote.type=inet,remote.host=localhost,remote.port=%d",
> +                        port[1], port[0]);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,"
> +                             "udp=127.0.0.1:%d/127.0.0.1:%d\r\n",
> +                             port[1], port[0]);
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
> +
> +    unlink(path0);
> +    g_free(path0);
> +    unlink(path1);
> +    g_free(path1);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +}
> +
> +static void test_dgram_fd(void)
> +{
> +    QTestState *qts0, *qts1;
> +    char *expect;
> +    int ret;
> +    int sv[2];
> +
> +    ret = socketpair(PF_UNIX, SOCK_DGRAM, 0, sv);
> +    g_assert_cmpint(ret, !=, -1);
> +
> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,local.type=fd,local.str=%d",
> +                       sv[0]);
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,fd=%d unix\r\n", sv[0]);
> +    EXPECT_STATE(qts0, expect, 0);
> +    g_free(expect);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev dgram,id=st0,local.type=fd,local.str=%d",
> +                       sv[1]);
> +
> +
> +    expect = g_strdup_printf("st0: index=0,type=dgram,fd=%d unix\r\n", sv[1]);
> +    EXPECT_STATE(qts1, expect, 0);
> +    g_free(expect);
> +
> +    qtest_quit(qts1);
> +    qtest_quit(qts0);
> +
> +    closesocket(sv[0]);
> +    closesocket(sv[1]);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
> +    qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
> +    qtest_add_func("/netdev/stream/unix", test_stream_unix);
> +    qtest_add_func("/netdev/stream/unix/abstract", test_stream_unix_abstract);
> +    qtest_add_func("/netdev/stream/fd", test_stream_fd);
> +    qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
> +    qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
> +    qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
> +    qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
> +
> +    ret = g_test_run();
> +
> +    return ret;
> +}


