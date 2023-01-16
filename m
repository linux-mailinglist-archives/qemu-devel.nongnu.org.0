Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9999866C905
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:45:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSae-0002x3-Rj; Mon, 16 Jan 2023 11:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHSad-0002wh-3S; Mon, 16 Jan 2023 11:44:07 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHSaZ-0004Hm-MO; Mon, 16 Jan 2023 11:44:06 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Ml3ym-1osFdJ1jnY-00lTjE; Mon, 16 Jan 2023 17:43:41 +0100
Message-ID: <d0404ac2-08aa-407a-1faa-5974870ded31@vivier.eu>
Date: Mon, 16 Jan 2023 17:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Call qemu_socketpair() instead of socketpair() when possible
Content-Language: fr
To: Guoyi Tu <tugy@chinatelecom.cn>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <cd28916a-f1f3-b54e-6ade-8a3647c3a9a5@chinatelecom.cn>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <cd28916a-f1f3-b54e-6ade-8a3647c3a9a5@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s0VWY0FdsdgPSUClKHkl4MuGbYPK8DxhC5wokRzDykp/6J38D9e
 4sWHgy3SMlraUnoLKmFjEC8VKoSKQ3HzVc2+epa9PzXCjoUj3ricVCZJX/d8F4nTZ29Kj5h
 7OxAjFdhidio37iP1hgNpRyqhxQRaQqdkzFlfVsgpeUUhNK8VNU5FrWXoFyByOYoifIePLc
 tb6f1+0gj7BQb0KRksLeA==
UI-OutboundReport: notjunk:1;M01:P0:LlV3uA5VNl0=;eSAzWAmCUZvyTjWUjWoRWGmS/NN
 Jk4y7bkk6jLp1n8JxpFzG0h9qcBGQcqP6PGvpvI3LqBaKoC7kbjUpKKM3t+wmzm5+rlJcufMk
 J6NMeOb8aoEjcoyYrfWAdEe33p5w6nLn1xknLleX53qm56c1anXFdXLaNtcq9Y6dAAC98AsFj
 oLz2rSJkdWBUhOkfd+WFmD2Hq9qnKS7Obfh7gA56Emtzc65jRTWwczOUAg44Q7UV8zaJ+jmJt
 AQQLtvlJ3vKu3KiZOet2eLM9F3fBXw5rIvvJyqRku7VKrG8weMtJRh4WQMePtxyeN+4gf0K+b
 CN64wWyKB4z1WNou5F8fCmQMwq6HeHRmEvjg1KEMQQvXwdhlc7rGfACsJxY8zokfB7UH26tf2
 fB4Ne+nKFhioJY7+6IILtnUEzy1Xy0igd49SEKDJFPta1y1V5vQZQTFH3iTAY/QTNxa95nL/+
 8ob/eYmxMREc0cbnS3O69g2lLC9WzaTMRkZ3vNi9AZX4s9hKFulyoo2KL1Tfk/L7GvDiAx63B
 BX7aH/Sp06ZEN4+UeTqVdPrp4oxzeTOA6N9DxtQciCSsXIxm52v7TAKvhHm1W/m0nEecrvk0w
 bnWmJIl5DMXocB2FKCvaQePY9umPZBLmtjXTcjNpTtyHx8iISfZlAcNu+6bqLbNZSvnUrMxii
 x+CwRAJFGOxhMy83btn6jpGlq+3wRmrYzmrsh/IYFg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 16/01/2023 à 05:56, Guoyi Tu a écrit :
> As qemu_socketpair() was introduced in commit 3c63b4e9
> ("oslib-posix: Introduce qemu_socketpair()"), it's time
> to replace the other existing socketpair() calls with
> qemu_socketpair() if possible
> 
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>   backends/tpm/tpm_emulator.c         | 2 +-
>   tests/qtest/dbus-display-test.c     | 5 +++--
>   tests/qtest/migration-test.c        | 2 +-
>   tests/unit/test-crypto-tlssession.c | 4 ++--
>   tests/unit/test-io-channel-tls.c    | 2 +-
>   5 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
> index 49cc3d749d..67e7b212e3 100644
> --- a/backends/tpm/tpm_emulator.c
> +++ b/backends/tpm/tpm_emulator.c
> @@ -553,7 +553,7 @@ static int tpm_emulator_prepare_data_fd(TPMEmulator *tpm_emu)
>       Error *err = NULL;
>       int fds[2] = { -1, -1 };
> 
> -    if (socketpair(AF_UNIX, SOCK_STREAM, 0, fds) < 0) {
> +    if (qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, fds) < 0) {
>           error_report("tpm-emulator: Failed to create socketpair");
>           return -1;
>       }
> diff --git a/tests/qtest/dbus-display-test.c b/tests/qtest/dbus-display-test.c
> index cb1b62d1d1..fef025ac6f 100644
> --- a/tests/qtest/dbus-display-test.c
> +++ b/tests/qtest/dbus-display-test.c
> @@ -1,5 +1,6 @@
>   #include "qemu/osdep.h"
>   #include "qemu/dbus.h"
> +#include "qemu/sockets.h"
>   #include <gio/gio.h>
>   #include <gio/gunixfdlist.h>
>   #include "libqtest.h"
> @@ -36,7 +37,7 @@ test_setup(QTestState **qts, GDBusConnection **conn)
> 
>       *qts = qtest_init("-display dbus,p2p=yes -name dbus-test");
> 
> -    g_assert_cmpint(socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
> +    g_assert_cmpint(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
> 
>       qtest_qmp_add_client(*qts, "@dbus-display", pair[1]);
> 
> @@ -152,7 +153,7 @@ test_dbus_display_console(void)
> 
>       test_setup(&qts, &conn);
> 
> -    g_assert_cmpint(socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
> +    g_assert_cmpint(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, pair), ==, 0);
>       fd_list = g_unix_fd_list_new();
>       idx = g_unix_fd_list_append(fd_list, pair[1], NULL);
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index dbde726adf..1dd32c9506 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1661,7 +1661,7 @@ static void *test_migrate_fd_start_hook(QTestState *from,
>       int pair[2];
> 
>       /* Create two connected sockets for migration */
> -    ret = socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
> +    ret = qemu_socketpair(PF_LOCAL, SOCK_STREAM, 0, pair);
>       g_assert_cmpint(ret, ==, 0);
> 
>       /* Send the 1st socket to the target */
> diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
> index 615a1344b4..b12e7b6879 100644
> --- a/tests/unit/test-crypto-tlssession.c
> +++ b/tests/unit/test-crypto-tlssession.c
> @@ -82,7 +82,7 @@ static void test_crypto_tls_session_psk(void)
>       int ret;
> 
>       /* We'll use this for our fake client-server connection */
> -    ret = socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
> +    ret = qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
>       g_assert(ret == 0);
> 
>       /*
> @@ -236,7 +236,7 @@ static void test_crypto_tls_session_x509(const void *opaque)
>       int ret;
> 
>       /* We'll use this for our fake client-server connection */
> -    ret = socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
> +    ret = qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
>       g_assert(ret == 0);
> 
>       /*
> diff --git a/tests/unit/test-io-channel-tls.c b/tests/unit/test-io-channel-tls.c
> index cc39247556..e036ac5df4 100644
> --- a/tests/unit/test-io-channel-tls.c
> +++ b/tests/unit/test-io-channel-tls.c
> @@ -121,7 +121,7 @@ static void test_io_channel_tls(const void *opaque)
>       GMainContext *mainloop;
> 
>       /* We'll use this for our fake client-server connection */
> -    g_assert(socketpair(AF_UNIX, SOCK_STREAM, 0, channel) == 0);
> +    g_assert(qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel) == 0);
> 
>   #define CLIENT_CERT_DIR "tests/test-io-channel-tls-client/"
>   #define SERVER_CERT_DIR "tests/test-io-channel-tls-server/"

Applied to my trivial-patches branch.

Thanks,
Laurent


