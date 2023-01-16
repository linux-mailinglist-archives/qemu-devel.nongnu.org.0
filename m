Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF366B83B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 08:35:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHK0a-0007QT-3p; Mon, 16 Jan 2023 02:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHK0M-0007Pq-PR
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:34:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHK0L-0006Ht-4u
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673854442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NV0pppOAzVzVaClvcdHFO+fCIMRHZ1mZd2hFzGqc5wM=;
 b=YAfLViqvY/6y5IYecvIBNSqDTxhVyYl92yooFFhfSYrSp8rCB2O8+DCZ71co7GS8Dpy6Cl
 rkyrCwrlRbuYh704WSAreAjL6ADVENZEEKTs3/vJk9QHt3Hh4XwHG6HsZq4bzoMeH/kbZy
 D4MwAfFA5igkez9Ir7KpXLHSBx6KuSM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-jkpfc9GhPl2tPMhf0T9j8Q-1; Mon, 16 Jan 2023 02:34:00 -0500
X-MC-Unique: jkpfc9GhPl2tPMhf0T9j8Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 m10-20020a05600c3b0a00b003dafe7451deso569019wms.4
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 23:34:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NV0pppOAzVzVaClvcdHFO+fCIMRHZ1mZd2hFzGqc5wM=;
 b=dZnRUUS3TJOvIi8jC1cGwkUCNrNttzjBWkDai0aZTxnIr6efp8y7YPymChDIPB3K57
 YwNeKAYoDjzDNpkj1pCfXRuJWKNpRzl7KOqaPvnrbKhNcbwFbfYZ7SDJO8rROaKjL7fW
 +ut5spz31SDI/KPsF4JMFqAj47YDbukIuPXz1aYOEYfMTvC+H/nCZW75jOFbJbRDVwCV
 PpJVsvBQ/b5Q8yHXlS2GHoN6Cb5ahkHDwh/ADQkSrg0gGSPuMI6WK94tJZ0GeUXUp3XG
 6KGb4+wpWPrnt1hU14hFCoSnQyJuAAavdS6ej6zcikyJXnw3yNg22d9cF8kIvabkLrvV
 Euow==
X-Gm-Message-State: AFqh2kok1no0BczDhSynJjqW0Kjv5WOWjvg8vNKKRKegvlc+iH1tT3Pl
 G4WUzKwzergd45HsNHVe+xr3hoo1eqfANmxSx4l/OzdxbxGNI4Ue/onnk98L2lXUfXtEBRekmiv
 TodYy2EbhEYrp9lg=
X-Received: by 2002:a5d:5484:0:b0:2bd:e150:bf54 with SMTP id
 h4-20020a5d5484000000b002bde150bf54mr6875124wrv.60.1673854439282; 
 Sun, 15 Jan 2023 23:33:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuxJvMDFDkMjKqZuyP9E6NRlPK76TZXD6Koc0gRLkRyhDTiY80stciW78WUoCbQTrj5Y4cIxA==
X-Received: by 2002:a5d:5484:0:b0:2bd:e150:bf54 with SMTP id
 h4-20020a5d5484000000b002bde150bf54mr6875102wrv.60.1673854439024; 
 Sun, 15 Jan 2023 23:33:59 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-109.web.vodafone.de.
 [109.43.177.109]) by smtp.gmail.com with ESMTPSA id
 l1-20020adfe9c1000000b00289bdda07b7sm24903761wrn.92.2023.01.15.23.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 23:33:56 -0800 (PST)
Message-ID: <400cebe9-96ef-1877-a07c-63e78fa12099@redhat.com>
Date: Mon, 16 Jan 2023 08:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Call qemu_socketpair() instead of socketpair() when possible
Content-Language: en-US
To: Guoyi Tu <tugy@chinatelecom.cn>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <cd28916a-f1f3-b54e-6ade-8a3647c3a9a5@chinatelecom.cn>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <cd28916a-f1f3-b54e-6ade-8a3647c3a9a5@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 16/01/2023 05.56, Guoyi Tu wrote:
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
> @@ -553,7 +553,7 @@ static int tpm_emulator_prepare_data_fd(TPMEmulator 
> *tpm_emu)
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
> diff --git a/tests/unit/test-crypto-tlssession.c 
> b/tests/unit/test-crypto-tlssession.c
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
> @@ -236,7 +236,7 @@ static void test_crypto_tls_session_x509(const void 
> *opaque)
>       int ret;
> 
>       /* We'll use this for our fake client-server connection */
> -    ret = socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
> +    ret = qemu_socketpair(AF_UNIX, SOCK_STREAM, 0, channel);
>       g_assert(ret == 0);
> 
>       /*
> diff --git a/tests/unit/test-io-channel-tls.c 
> b/tests/unit/test-io-channel-tls.c
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

Acked-by: Thomas Huth <thuth@redhat.com>


