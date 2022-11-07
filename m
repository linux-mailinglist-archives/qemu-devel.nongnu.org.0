Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6AF61EB58
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 08:08:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orwEN-0004iC-8w; Mon, 07 Nov 2022 02:07:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1orwEL-0004hp-2R
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 02:07:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1orwEJ-00013X-5Z
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 02:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667804854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e5nrevsIC3aixJU4ji/Ornnkz5ZPYqYsKMrk+emcmw0=;
 b=eECAW5KidDkIv7Gj3DVGX9+636cWUOC9a//ldY1FNTcv2KnUVeTM7mQ47PKM1aVh3ZwHGm
 KpjnZm8iMVbs9a5FABgUsbwTmr8ZImOQo6Gjsp/NKEKL405wyVh82tREtk4zPbcqqPT0i5
 FT6o7Schv7Le1VWYO8ukm5CMz6AGMrE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-ud0QySZJOF63TrEgDj2gdA-1; Mon, 07 Nov 2022 02:07:31 -0500
X-MC-Unique: ud0QySZJOF63TrEgDj2gdA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13c6efaa955so5274699fac.11
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 23:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e5nrevsIC3aixJU4ji/Ornnkz5ZPYqYsKMrk+emcmw0=;
 b=1QrdthqvFvhfq9ggVNaGAkL9yFKJTpWXtHttcYeXkxUwdKaPNU80NO3L8g+EKHrzrm
 RwaWKOc8Vto95FdelOerm0PDMWdDxdjQlXgHox5mwOFWosS1/HZXyWiquOwcObrLJkhi
 z9CNbKmP+MJzojAAFb6Nqt5+eY00Z1zUAGROdTMDyo3mJdPi24x3tc2Mmz0157gKlgqS
 aiZSlQY2GiIyADycIvsZoHLuRpUIGzQuq39qoWb+bGQ/xspXeJ9c6BXTpWjICXj317rf
 injv8SdwFdQ8pQIF/65URlK9rvztynLuSEKCBmfI5vpHWcUpPxxtAnFYyV2fd3k0YfQ0
 QNdg==
X-Gm-Message-State: ACrzQf0rkAJHOB0QdVhSw+lCj2fNersCX20ap1t+1lKDAogVpteNs5Fw
 zOH49Q5q7RCyoaZHFfRCrVt6L2JNKOX4ncdAkKuK+em308psluk08cSP327YCbEd131Qf6G3ov1
 3UOlwoQBS5Jsiu/GAvIYRYDzFsOPiHBc=
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id
 bh30-20020a056808181e00b0035a59595909mr9406976oib.35.1667804850400; 
 Sun, 06 Nov 2022 23:07:30 -0800 (PST)
X-Google-Smtp-Source: AMsMyM79aGeFUJzcT0e02KDly7tmZDFSpopIHYOLG+Zz859IwFmd2HpY79AVAu1GIwUUpulqW55DswQZFXEYUFM5U24=
X-Received: by 2002:a05:6808:181e:b0:35a:5959:5909 with SMTP id
 bh30-20020a056808181e00b0035a59595909mr9406962oib.35.1667804850191; Sun, 06
 Nov 2022 23:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20221104150049.236667-1-lvivier@redhat.com>
 <CACGkMEs5Y5ED0tLy1-vK3cGRdRRLqTn6mPZPyrTnwbF6YKsxMQ@mail.gmail.com>
In-Reply-To: <CACGkMEs5Y5ED0tLy1-vK3cGRdRRLqTn6mPZPyrTnwbF6YKsxMQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 7 Nov 2022 15:07:18 +0800
Message-ID: <CACGkMEtr4yyhCZXAxxqG6Y0DBVnV+Edpnj64A6Gxkz-D0tgBqg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest: netdev: test stream and dgram backends
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 7, 2022 at 2:59 PM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Nov 4, 2022 at 11:01 PM Laurent Vivier <lvivier@redhat.com> wrote:
> >
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >
> > Notes:
> >     v2:
> >     - Fix ipv6 free port allocation
> >     - Check for IPv4, IPv6, AF_UNIX
> >     - Use g_mkdtemp() rather than g_file_open_tmp()
> >     - Use socketpair() in test_stream_fd()
> >
> >     v1: compared to v14 of "qapi: net: add unix socket type support to netdev backend":
> >     - use IP addresses 127.0.0.1 and ::1 rather than localhost
> >
> >  tests/qtest/meson.build     |   2 +
> >  tests/qtest/netdev-socket.c | 435 ++++++++++++++++++++++++++++++++++++
> >  2 files changed, 437 insertions(+)
> >  create mode 100644 tests/qtest/netdev-socket.c
> >
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index c07a5b1a5f43..43d075b76280 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -27,6 +27,7 @@ qtests_generic = [
> >    'test-hmp',
> >    'qos-test',
> >    'readconfig-test',
> > +  'netdev-socket',
> >  ]
> >  if config_host.has_key('CONFIG_MODULES')
> >    qtests_generic += [ 'modules-test' ]
> > @@ -304,6 +305,7 @@ qtests = {
> >    'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> >    'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> >    'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
> > +  'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
> >  }
> >
> >  gvnc = dependency('gvnc-1.0', required: false)
> > diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
> > new file mode 100644
> > index 000000000000..dd46214f69c7
> > --- /dev/null
> > +++ b/tests/qtest/netdev-socket.c
> > @@ -0,0 +1,435 @@
> > +/*
> > + * QTest testcase for netdev stream and dgram
> > + *
> > + * Copyright (c) 2022 Red Hat, Inc.
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include <glib/gstdio.h>
> > +#include "../unit/socket-helpers.h"
> > +#include "libqtest.h"
> > +
> > +#define CONNECTION_TIMEOUT    5
> > +
> > +#define EXPECT_STATE(q, e, t)                             \
> > +do {                                                      \
> > +    char *resp = qtest_hmp(q, "info network");            \
> > +    if (t) {                                              \
> > +        strrchr(resp, t)[0] = 0;                          \
> > +    }                                                     \
> > +    g_test_timer_start();                                 \
> > +    while (g_test_timer_elapsed() < CONNECTION_TIMEOUT) { \
> > +        if (strcmp(resp, e) == 0) {                       \
> > +            break;                                        \
> > +        }                                                 \
> > +        g_free(resp);                                     \
> > +        resp = qtest_hmp(q, "info network");              \
> > +        if (t) {                                          \
> > +            strrchr(resp, t)[0] = 0;                      \
> > +        }                                                 \
> > +    }                                                     \
> > +    g_assert_cmpstr(resp, ==, e);                         \
> > +    g_free(resp);                                         \
> > +} while (0)
> > +
> > +static char *tmpdir;
> > +
> > +static int inet_get_free_port_socket_ipv4(int sock)
> > +{
> > +    struct sockaddr_in addr;
> > +    socklen_t len;
> > +
> > +    memset(&addr, 0, sizeof(addr));
> > +    addr.sin_family = AF_INET;
> > +    addr.sin_addr.s_addr = INADDR_ANY;
> > +    addr.sin_port = 0;
> > +    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
> > +        return -1;
> > +    }
> > +
> > +    len = sizeof(addr);
> > +    if (getsockname(sock,  (struct sockaddr *)&addr, &len) < 0) {
> > +        return -1;
> > +    }
> > +
> > +    return ntohs(addr.sin_port);
> > +}
> > +
> > +static int inet_get_free_port_socket_ipv6(int sock)
> > +{
> > +    struct sockaddr_in6 addr;
> > +    socklen_t len;
> > +
> > +    memset(&addr, 0, sizeof(addr));
> > +    addr.sin6_family = AF_INET6;
> > +    addr.sin6_addr = in6addr_any;
> > +    addr.sin6_port = 0;
> > +    if (bind(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
> > +        return -1;
> > +    }
> > +
> > +    len = sizeof(addr);
> > +    if (getsockname(sock,  (struct sockaddr *)&addr, &len) < 0) {
> > +        return -1;
> > +    }
> > +
> > +    return ntohs(addr.sin6_port);
> > +}
> > +
> > +static int inet_get_free_port_multiple(int nb, int *port, bool ipv6)
> > +{
> > +    int sock[nb];
> > +    int i;
> > +
> > +    for (i = 0; i < nb; i++) {
> > +        sock[i] = socket(ipv6 ? AF_INET6 : AF_INET, SOCK_STREAM, 0);
> > +        if (sock[i] < 0) {
> > +            break;
> > +        }
> > +        port[i] = ipv6 ? inet_get_free_port_socket_ipv6(sock[i]) :
> > +                         inet_get_free_port_socket_ipv4(sock[i]);
> > +        if (port[i] == -1) {
> > +            break;
> > +        }
> > +    }
> > +
> > +    nb = i;
> > +    for (i = 0; i < nb; i++) {
> > +        closesocket(sock[i]);
> > +    }
> > +
> > +    return nb;
> > +}
> > +
> > +static int inet_get_free_port(bool ipv6)
> > +{
> > +    int nb, port;
> > +
> > +    nb = inet_get_free_port_multiple(1, &port, ipv6);
> > +    g_assert_cmpint(nb, ==, 1);
> > +
> > +    return port;
> > +}
> > +
> > +static void test_stream_inet_ipv4(void)
> > +{
> > +    QTestState *qts0, *qts1;
> > +    char *expect;
> > +    int port;
> > +
> > +    port = inet_get_free_port(false);
> > +    qts0 = qtest_initf("-nodefaults "
> > +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
> > +                       "addr.ipv4=on,addr.ipv6=off,"
> > +                       "addr.host=127.0.0.1,addr.port=%d", port);
> > +
> > +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> > +
> > +    qts1 = qtest_initf("-nodefaults "
> > +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> > +                       "addr.ipv4=on,addr.ipv6=off,"
> > +                       "addr.host=127.0.0.1,addr.port=%d", port);
> > +
> > +    expect = g_strdup_printf("st0: index=0,type=stream,tcp:127.0.0.1:%d\r\n",
> > +                             port);
> > +    EXPECT_STATE(qts1, expect, 0);
> > +    g_free(expect);
> > +
> > +    /* the port is unknown, check only the address */
> > +    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:127.0.0.1", ':');
> > +
> > +    qtest_quit(qts1);
> > +    qtest_quit(qts0);
> > +}
> > +
> > +static void test_stream_inet_ipv6(void)
> > +{
> > +    QTestState *qts0, *qts1;
> > +    char *expect;
> > +    int port;
> > +
> > +    port = inet_get_free_port(true);
> > +    qts0 = qtest_initf("-nodefaults "
> > +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
> > +                       "addr.ipv4=off,addr.ipv6=on,"
> > +                       "addr.host=::1,addr.port=%d", port);
> > +
> > +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> > +
> > +    qts1 = qtest_initf("-nodefaults "
> > +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> > +                       "addr.ipv4=off,addr.ipv6=on,"
> > +                       "addr.host=::1,addr.port=%d", port);
> > +
> > +    expect = g_strdup_printf("st0: index=0,type=stream,tcp:::1:%d\r\n",
> > +                             port);
> > +    EXPECT_STATE(qts1, expect, 0);
> > +    g_free(expect);
> > +
> > +    /* the port is unknown, check only the address */
> > +    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:::1", ':');
> > +
> > +    qtest_quit(qts1);
> > +    qtest_quit(qts0);
> > +}
> > +
> > +static void test_stream_unix(void)
> > +{
> > +    QTestState *qts0, *qts1;
> > +    char *expect;
> > +    gchar *path;
> > +
> > +    path = g_strconcat(tmpdir, "/stream_unix", NULL);
>
> Nit:  I wonder if socketpair() is better since we don't even need to
> care about path.
>
> Thanks

Speak too fast, I misread the code.

I've queued this.

Thanks


