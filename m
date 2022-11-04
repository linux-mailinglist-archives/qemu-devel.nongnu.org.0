Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7AE6193BC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:42:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtCd-00077A-J1; Fri, 04 Nov 2022 05:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqtCZ-000770-FU
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:41:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqtCW-00065Q-7w
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:41:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667554881;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lrMqwBuqdqBBZcj9Z8kHkDy1aCoUOG21cHemusURrAQ=;
 b=GK3vw9QWIwEjS1m7NJUVdTcS0nA65s/M7mkEyhMHDpw0T+rjEAkEUtqxFhW45ADobrT5/y
 B11CtFOivJ63zrxlZx71tZ/GrLHcQVw6nnpJbn/mHNkDs5rnqs4YtraGsti2Whc+eYC9SA
 3xTj/jDNSWlhMkLVu9OPlk6uX9OjjEA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-t2jYqzJqP9SNrVt5aAOlOw-1; Fri, 04 Nov 2022 05:41:18 -0400
X-MC-Unique: t2jYqzJqP9SNrVt5aAOlOw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36AF62999B26;
 Fri,  4 Nov 2022 09:41:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9657549BB9A;
 Fri,  4 Nov 2022 09:41:11 +0000 (UTC)
Date: Fri, 4 Nov 2022 09:41:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] tests/qtest: netdev: test stream and dgram backends
Message-ID: <Y2TeNFBUnwW9XZBk@redhat.com>
References: <20221104092236.184792-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221104092236.184792-1-lvivier@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 04, 2022 at 10:22:36AM +0100, Laurent Vivier wrote:

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
> +        if (port[i] == -1) {
> +            break;
> +        }
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
> +                       "addr.host=127.0.0.1,addr.port=%d", port);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> +                       "addr.ipv4=on,addr.ipv6=off,"
> +                       "addr.host=127.0.0.1,addr.port=%d", port);
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

This is getting a free port in the IPv4 range, but then going on
to use that to open an IPv6 socket. This is unsafe, because there
can be programs listening on IPv6 but not IPv4 and vica-verca. It
needs to check the actual protocol that will be used.

> +    qts0 = qtest_initf("-nodefaults "
> +                       "-netdev stream,id=st0,server=true,addr.type=inet,"
> +                       "addr.ipv4=off,addr.ipv6=on,"
> +                       "addr.host=::1,addr.port=%d", port);
> +
> +    EXPECT_STATE(qts0, "st0: index=0,type=stream,\r\n", 0);
> +
> +    qts1 = qtest_initf("-nodefaults "
> +                       "-netdev stream,server=false,id=st0,addr.type=inet,"
> +                       "addr.ipv4=off,addr.ipv6=on,"
> +                       "addr.host=::1,addr.port=%d", port);
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

This is creating a zero length plain file, and then paassing
that as a path for the UNIX socket.

This is pretty dubious and only works because the code will
be doing 'unlink' on the path. Just delete this as there's
no reason to pre-create anything on disk for UNIX sockets.

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

Huh ? With abstract UNIX sockets, the path does not exist on
the filesystem at all, so this creating a file on disk that
will never be touched.

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

Or skip all this logic and just call 'socketpair()'

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
> +                       "local.type=inet,local.host=127.0.0.1,local.port=%d,"
> +                       "remote.type=inet,remote.host=127.0.0.1,remote.port=%d",
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
> +                       "local.type=inet,local.host=127.0.0.1,local.port=%d,"
> +                       "remote.type=inet,remote.host=127.0.0.1,remote.port=%d",
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

Likewise.

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

We shouldn't assume that the platforms we're testing on have all
network protocols available, especially not IPv6. With container
environments there is non-negligble chance one or more can be
missing / unconfigured.

We have helpers are tests/unit/socket-helpers.{c,h} which provide
APIs to check whether IPv4, IPV6 and UNIX sockets protocols are
available. Tests should be conditionally added based on those results.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


