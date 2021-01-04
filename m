Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00C42E9E2E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 20:30:05 +0100 (CET)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwVYK-0003DQ-Es
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 14:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kwVSr-0001PK-7G
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 14:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kwVSk-0002FC-FA
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 14:24:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609788254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWSY3K8gDMz6iCqwBYRdvl7K/g5TPpYvk4psMpST2hE=;
 b=a7KAvN0BkYpYnHdbiTRhg0re280kjwOTpGdPUvkY6l4iUBupJmLd0gXQ6vDL1E32QxxUH/
 aV5Kb9y5XHBrJ1knofOVcP9BCIHJPRFMo1MMTU2r8GKGYbXVldfLmFongaOhC8ucSgLORL
 eIietkaFnKExoj1ck7eyjars8EQt9ZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-kWfmMCI6N9aqFxwUQfQ3yg-1; Mon, 04 Jan 2021 14:24:12 -0500
X-MC-Unique: kWfmMCI6N9aqFxwUQfQ3yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5046C801ADA;
 Mon,  4 Jan 2021 19:24:11 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-175.gru2.redhat.com
 [10.97.116.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD57608BA;
 Mon,  4 Jan 2021 19:23:57 +0000 (UTC)
Subject: Re: [PATCH v2 02/12] libqtest: add qtest_socket_server()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20201207172030.251905-3-stefanha@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <fdc3bcf7-6dd1-53ba-8dc8-6500e83704a2@redhat.com>
Date: Mon, 4 Jan 2021 16:23:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207172030.251905-3-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/7/20 2:20 PM, Stefan Hajnoczi wrote:
> Add an API that returns a new UNIX domain socket in the listen state.
> The code for this was already there but only used internally in
> init_socket().
>
> This new API will be used by vhost-user-blk-test.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   tests/qtest/libqos/libqtest.h |  8 +++++++
>   tests/qtest/libqtest.c        | 40 ++++++++++++++++++++---------------
>   2 files changed, 31 insertions(+), 17 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index 724f65aa94..e5f1ec590c 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -132,6 +132,14 @@ void qtest_qmp_send(QTestState *s, const char *fmt, ...)
>   void qtest_qmp_send_raw(QTestState *s, const char *fmt, ...)
>       GCC_FMT_ATTR(2, 3);
>   
> +/**
> + * qtest_socket_server:
> + * @socket_path: the UNIX domain socket path
> + *
> + * Create and return a listen socket file descriptor, or abort on failure.
> + */
> +int qtest_socket_server(const char *socket_path);
> +
>   /**
>    * qtest_vqmp_fds:
>    * @s: #QTestState instance to operate on.
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index e49f3a1e45..bc389d422b 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -81,24 +81,8 @@ static void qtest_client_set_rx_handler(QTestState *s, QTestRecvFn recv);
>   
>   static int init_socket(const char *socket_path)
>   {
> -    struct sockaddr_un addr;
> -    int sock;
> -    int ret;
> -
> -    sock = socket(PF_UNIX, SOCK_STREAM, 0);
> -    g_assert_cmpint(sock, !=, -1);
> -
> -    addr.sun_family = AF_UNIX;
> -    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
> +    int sock = qtest_socket_server(socket_path);
>       qemu_set_cloexec(sock);
> -
> -    do {
> -        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
> -    } while (ret == -1 && errno == EINTR);
> -    g_assert_cmpint(ret, !=, -1);
> -    ret = listen(sock, 1);
> -    g_assert_cmpint(ret, !=, -1);
> -
>       return sock;
>   }
>   
> @@ -636,6 +620,28 @@ QDict *qtest_qmp_receive_dict(QTestState *s)
>       return qmp_fd_receive(s->qmp_fd);
>   }
>   
> +int qtest_socket_server(const char *socket_path)
> +{
> +    struct sockaddr_un addr;
> +    int sock;
> +    int ret;
> +
> +    sock = socket(PF_UNIX, SOCK_STREAM, 0);
> +    g_assert_cmpint(sock, !=, -1);
> +
> +    addr.sun_family = AF_UNIX;
> +    snprintf(addr.sun_path, sizeof(addr.sun_path), "%s", socket_path);
> +
> +    do {
> +        ret = bind(sock, (struct sockaddr *)&addr, sizeof(addr));
> +    } while (ret == -1 && errno == EINTR);
> +    g_assert_cmpint(ret, !=, -1);
> +    ret = listen(sock, 1);
> +    g_assert_cmpint(ret, !=, -1);
> +
> +    return sock;
> +}
> +
>   /**
>    * Allow users to send a message without waiting for the reply,
>    * in the case that they choose to discard all replies up until


