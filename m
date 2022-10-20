Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACB8606514
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:51:22 +0200 (CEST)
Received: from localhost ([::1]:43586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXpH-0006Db-L7
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:51:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXol-0000Qv-Pj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olVIa-0001S9-Kd
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:09:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olVIT-00057Z-IS
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:09:22 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w18so34346772wro.7
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Bez4xHPLn5WJXFJpVVxEq/3R2QKdu15flkO5zJuSQQ=;
 b=UPV+tG5TN89IiZQTX27CRyuSxeiBlHBQ4M9T0jaBt9sde1MF/DOSyQXwQFM1fjeNa7
 cSgueIHiXCPdBbgD5Eg/ZnphcP3YqTEMpL04F50bmGswWw4kNng6t7pZwuWYOOc55SXe
 pFylqz2nckdvR1inQi8Jla/2pH0zbVGr8kwY7iDl3Ee4PrWzBjtqH2SazjVVULyaXJ5f
 Tj/lzFHa4iPg1zogcxTpQFEX30FypzusBg531rO9i+8A+VDc7OTFhwUowJi7JVwDK7pc
 1X+VRTn/jiTWIO8k7di1o503+E4KCmStOeSUPlqOV6kTlzkdkQv6JFy+7quUwy0d3keN
 ZV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Bez4xHPLn5WJXFJpVVxEq/3R2QKdu15flkO5zJuSQQ=;
 b=BlTvCqsrfsvVtAzyO/TZcIrmR/UB8MI4ASu+kzvIBS4D0Jz0zYtGlQjc464rNIPSM/
 Vm6uhIVsqEFYVV0rXZOdjP4cM04RFjR/cgIKZeBE/cQI2Ymifkzw6ce6bCNlb44ZK6GT
 tF1RrViKvjC/NGrGsFOFKbBAWJARxRUhbWFF6RaffNJnRjiemcfJk+HpDsTxniK+AWoh
 2wCUyx/nnkZ/hR8rnDN7s/ehPpobspph02wPmi++HMfsyjzlnqfaficlFVFcpCzHiyaA
 l425XpIyxWXRNKOZiMLMTjztmy7Za0D6JEGJQuzQn8b12zkJ9jq+5NDWhLLAxebyghQJ
 xJJg==
X-Gm-Message-State: ACrzQf0V7iuz6Gz5KRY9RjdK7YYAL1t6ByXtbMz2K4OKX4Fm7br+Ht26
 Cy7cIKnypnRNyTMztkLqVr9sAA==
X-Google-Smtp-Source: AMsMyM6bxol5Wjw2EkMMl4l4bD0Uf/WT/FO43/pKMSEiqPzDXKsP9zdewTz1MhzdWAaTwFhBdeAK+w==
X-Received: by 2002:a5d:6301:0:b0:226:d87b:b55c with SMTP id
 i1-20020a5d6301000000b00226d87bb55cmr8083437wru.560.1666271354690; 
 Thu, 20 Oct 2022 06:09:14 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16623532wrs.53.2022.10.20.06.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:09:13 -0700 (PDT)
Message-ID: <6fa6b9e5-fede-0f68-752f-0c0d8fa3494f@linaro.org>
Date: Thu, 20 Oct 2022 15:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-16-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-16-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 20/10/22 11:16, Laurent Vivier wrote:
> Use QIOChannel, QIOChannelSocket and QIONetListener.
> This allows net/stream to use all the available parameters provided by
> SocketAddress.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   meson           |   2 +-
>   net/stream.c    | 493 +++++++++++++++++-------------------------------
>   qemu-options.hx |   4 +-
>   3 files changed, 180 insertions(+), 319 deletions(-)

>   static int net_stream_server_init(NetClientState *peer,
> @@ -283,105 +287,61 @@ static int net_stream_server_init(NetClientState *peer,
>   {
>       NetClientState *nc;
>       NetStreamState *s;
> -    int fd, ret;
> -
> -    switch (addr->type) {
> -    case SOCKET_ADDRESS_TYPE_INET: {
> -        struct sockaddr_in saddr_in;
> -
> -        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
> -                              errp) < 0) {
> -            return -1;
> -        }
> +    QIOChannelSocket *listen_sioc = qio_channel_socket_new();
>   
> -        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
> -        if (fd < 0) {
> -            error_setg_errno(errp, errno, "can't create stream socket");
> -            return -1;
> -        }
> -        qemu_socket_set_nonblock(fd);
> +    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
> +    s = DO_UPCAST(NetStreamState, nc, nc);
>   
> -        socket_set_fast_reuse(fd);
> +    s->listen_ioc = QIO_CHANNEL(listen_sioc);
> +    qio_channel_socket_listen_async(listen_sioc, addr, 0,
> +                                    net_stream_server_listening, s,
> +                                    NULL, NULL);
>   
> -        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
> -        if (ret < 0) {
> -            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
> -                             inet_ntoa(saddr_in.sin_addr));
> -            closesocket(fd);
> -            return -1;
> -        }
> -        break;
> -    }
> -    case SOCKET_ADDRESS_TYPE_UNIX: {
> -        struct sockaddr_un saddr_un;
> -
> -        ret = unlink(addr->u.q_unix.path);
> -        if (ret < 0 && errno != ENOENT) {
> -            error_setg_errno(errp, errno, "failed to unlink socket %s",
> -                             addr->u.q_unix.path);
> -            return -1;
> -        }
> +    return 0;
> +}
>   
> -        saddr_un.sun_family = PF_UNIX;
> -        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
> -                       addr->u.q_unix.path);
> -        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
> -            error_setg(errp, "UNIX socket path '%s' is too long",
> -                       addr->u.q_unix.path);
> -            error_append_hint(errp, "Path must be less than %zu bytes\n",
> -                              sizeof(saddr_un.sun_path));
> -            return -1;
> -        }
> +static void net_stream_client_connected(QIOTask *task, gpointer opaque)
> +{
> +    NetStreamState *s = opaque;
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(s->ioc);
> +    SocketAddress *addr;
> +    gchar *uri;
> +    int ret;
>   
> -        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
> -        if (fd < 0) {
> -            error_setg_errno(errp, errno, "can't create stream socket");
> -            return -1;
> -        }
> -        qemu_socket_set_nonblock(fd);
> -
> -        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
> -        if (ret < 0) {
> -            error_setg_errno(errp, errno, "can't create socket with path: %s",
> -                             saddr_un.sun_path);
> -            closesocket(fd);
> -            return -1;
> -        }
> -        break;
> -    }
> -    case SOCKET_ADDRESS_TYPE_FD:
> -        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
> -        if (fd == -1) {
> -            return -1;
> -        }
> -        ret = qemu_socket_try_set_nonblock(fd);
> -        if (ret < 0) {
> -            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
> -                             name, fd);
> -            return -1;
> -        }
> -        break;
> -    default:
> -        error_setg(errp, "only support inet or fd type");
> -        return -1;
> +    if (sioc->fd < 0) {
> +        qemu_set_info_str(&s->nc, "connection error");
> +        goto error;
>       }
>   
> -    ret = listen(fd, 0);
> -    if (ret < 0) {
> -        error_setg_errno(errp, errno, "can't listen on socket");
> -        closesocket(fd);
> -        return -1;
> +    addr = qio_channel_socket_get_remote_address(sioc, NULL);
> +    g_assert(addr != NULL);

Please use:

        addr = qio_channel_socket_get_remote_address(sioc, &error_fatal);

Which is more verbose in case of error, i.e.:

   qemu-system-x86_64: socket family 0 unsupported

Instead of:

   ERROR:../../net/stream.c:321:net_stream_client_connected: assertion 
failed: (addr != NULL)

> +    uri = socket_uri(addr);
> +    qemu_set_info_str(&s->nc, uri);
> +    g_free(uri);
> +
> +    ret = qemu_socket_try_set_nonblock(sioc->fd);
> +    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
> +        qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
> +                          addr->u.fd.str, -ret);
> +        qapi_free_SocketAddress(addr);
> +        goto error;
>       }
> +    g_assert(ret == 0);
> +    qapi_free_SocketAddress(addr);
>   
> -    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
> -    s = DO_UPCAST(NetStreamState, nc, nc);
> -    s->fd = -1;
> -    s->listen_fd = fd;
> -    s->nc.link_down = true;
>       net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
>   
> -    qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s);
> -    return 0;
> +    /* Disable Nagle algorithm on TCP sockets to reduce latency */
> +    qio_channel_set_delay(s->ioc, false);
> +
> +    s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
> +                                            s, NULL);
> +    s->nc.link_down = false;
> +
> +    return;
> +error:
> +    object_unref(OBJECT(s->ioc));
> +    s->ioc = NULL;
>   }


