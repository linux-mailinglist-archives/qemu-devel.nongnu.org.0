Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6558037C81B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:39:15 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrtC-0006AN-FO
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgrqB-0001J1-9k
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgrq8-0007SJ-0Y
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620837362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFRtA7sKjQYiC+4cIRQoBMx9EJjC5QqGcz3xM69S48M=;
 b=RFhiL+jMhflx/GVqFiLf11F6p7uZAiIUHsodqWozxiVNnB1KwBFhYjbQSHX7u5tKnOXrod
 4xEaAG5e5ythcDa01oejZMb8akEqJG6KBvMZvg+/EtloS0BTdyu1RxFdABfJZtgXdM1HML
 2cQpu3IQftg+vKWru5rXGixj8y5Grkk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-IZKEo2gmOkiVDW7tYnOm5Q-1; Wed, 12 May 2021 12:36:00 -0400
X-MC-Unique: IZKEo2gmOkiVDW7tYnOm5Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 1-20020adf93810000b029010fd5ac4ed7so789109wrp.15
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GFRtA7sKjQYiC+4cIRQoBMx9EJjC5QqGcz3xM69S48M=;
 b=I3C8sLXISlrqMgVJOlpLeYElOUqZwULQ2J2BUkbP3TZQdLRLIauXjQuzp59p9ikHWq
 33PcfZXpsiHfgqAMbj2OS9Kxv5fK90DAg07pGgJEwI441PsFyGc07CLFpzrGhrCT8o5d
 3fv9i3OrF6djXieIlJu6fTaD6ZSMH2uw/8imO2JDsg7hbU7dWfPtBwL8HaouY+4NEAQg
 tqGi0QLY46qKozVK9Krjcy8k2piY0/4RM7zBlv80Jw7xF5zZFjSLIcGp5AYhD/2R3jY/
 3cxh8Q4wGxQ9b2n8ARxFdVJB9ED1UdH58xlCsOiUuE6Z1QuiHX2GDk4W2z8iguDEXvrK
 WhMg==
X-Gm-Message-State: AOAM532mfYUff+EQNDv/5v5kqRtMwYBEoQ9Fss11jymkQR8wjg010ddO
 rUEUa6uP3uXH6J0FPTNvwLRSo/e97ale7EPb4ZzOc2KBw/8QjVqPSfCuTDHvr1e97PJ7Arbdhcz
 SWefPotnZFVBdI+Y=
X-Received: by 2002:a1c:750b:: with SMTP id o11mr12593760wmc.188.1620837358884; 
 Wed, 12 May 2021 09:35:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJw0YDlSe8uPBi9/8XchjTV0h5RG3UcuoyFtnw4iuipDFOq4fWfaYOYoJEUkzRA4p8rDm9fw==
X-Received: by 2002:a1c:750b:: with SMTP id o11mr12593742wmc.188.1620837358683; 
 Wed, 12 May 2021 09:35:58 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id d3sm178244wrs.41.2021.05.12.09.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:35:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] net/tap: fix FreeBSD portability problem receiving
 TAP FD
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210512153654.1178035-1-berrange@redhat.com>
 <20210512153654.1178035-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a647f9f7-05c7-4bcc-3b25-22e22f4727df@redhat.com>
Date: Wed, 12 May 2021 18:35:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512153654.1178035-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Connor Kuehl <ckuehl@redhat.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 5:36 PM, Daniel P. Berrangé wrote:
> The CMSG_LEN and CMSG_SPACE macros must not be assumed to return the
> same value. The msg_controllen field must be initialized using
> CMSG_SPACE when using SCM_RIGHTS.
> 
> This ought to fix any FD receive issues users might be hitting on
> 64-bit FeeBSD / NetBSD platforms. The flaw was noticed first in
> GNULIB
> 
>    https://lists.gnu.org/archive/html/bug-gnulib/2021-02/msg00066.html
> 
> and QEMU's code has the same logic bug.
> 
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  net/tap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/tap.c b/net/tap.c
> index bae895e287..276a9077fc 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -467,7 +467,7 @@ static int recv_fd(int c)
>      cmsg->cmsg_level = SOL_SOCKET;
>      cmsg->cmsg_type = SCM_RIGHTS;
>      cmsg->cmsg_len = CMSG_LEN(sizeof(fd));
> -    msg.msg_controllen = cmsg->cmsg_len;
> +    msg.msg_controllen = CMSG_SPACE(sizeof(fd));
>  
>      iov.iov_base = req;
>      iov.iov_len = sizeof(req);
> 

Possibly more:

-- >8 --
diff --git a/contrib/ivshmem-client/ivshmem-client.c
b/contrib/ivshmem-client/ivshmem-client.c
index 182c79d27cf..f4ee226deba 100644
--- a/contrib/ivshmem-client/ivshmem-client.c
+++ b/contrib/ivshmem-client/ivshmem-client.c
@@ -44 +44 @@ ivshmem_client_read_one_msg(IvshmemClient *client, int64_t
*index, int *fd)
-    msg.msg_controllen = sizeof(msg_control);
+    msg.msg_controllen = CMSG_SPACE(sizeof(msg_control));
diff --git a/contrib/ivshmem-server/ivshmem-server.c
b/contrib/ivshmem-server/ivshmem-server.c
index 39a6ffdb5df..209eb120716 100644
--- a/contrib/ivshmem-server/ivshmem-server.c
+++ b/contrib/ivshmem-server/ivshmem-server.c
@@ -55 +55 @@ ivshmem_server_send_one_msg(int sock_fd, int64_t peer_id,
int fd)
-        msg.msg_controllen = sizeof(msg_control);
+        msg.msg_controllen = CMSG_SPACE(sizeof(msg_control));
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c
b/contrib/vhost-user-gpu/vhost-user-gpu.c
index f73f292c9f7..e72a59b135a 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -161 +161 @@ vg_sock_fd_write(int sock, const void *buf, ssize_t
buflen, int fd)
-        msg.msg_controllen = sizeof(cmsgu.control);
+        msg.msg_controllen = CMSG_SPACE(sizeof(cmsgu.control));
diff --git a/io/channel-socket.c b/io/channel-socket.c
index de259f7eed2..753d0d2f8ef 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -498 +498 @@ static ssize_t qio_channel_socket_readv(QIOChannel *ioc,
-        msg.msg_controllen = sizeof(control);
+        msg.msg_controllen = CMSG_SPACE(sizeof(control));
diff --git a/net/tap.c b/net/tap.c
index bae895e2874..05ab4c8a530 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -459 +459 @@ static int recv_fd(int c)
-        .msg_controllen = sizeof(msgbuf),
+        .msg_controllen = CMSG_SPACE(sizeof(msgbuf)),
diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
index a26e1663f02..983b4347523 100644
--- a/qemu-bridge-helper.c
+++ b/qemu-bridge-helper.c
@@ -189 +189 @@ static int send_fd(int c, int fd)
-        .msg_controllen = sizeof(msgbuf),
+        .msg_controllen = CMSG_SPACE(sizeof(msgbuf)),
@@ -199 +199 @@ static int send_fd(int c, int fd)
-    msg.msg_controllen = cmsg->cmsg_len;
+    msg.msg_controllen = CMSG_SPACE(sizeof(fd));
diff --git a/subprojects/libvhost-user/libvhost-user.c
b/subprojects/libvhost-user/libvhost-user.c
index fab7ca17ee1..f083db4ea16 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -281 +281 @@ vu_message_read_default(VuDev *dev, int conn_fd,
VhostUserMsg *vmsg)
-        .msg_controllen = sizeof(control),
+        .msg_controllen = CMSG_SPACE(sizeof(control)),
diff --git a/tests/qemu-iotests/socket_scm_helper.c
b/tests/qemu-iotests/socket_scm_helper.c
index eb76d31aa94..aeba41edea0 100644
--- a/tests/qemu-iotests/socket_scm_helper.c
+++ b/tests/qemu-iotests/socket_scm_helper.c
@@ -42 +42 @@ static int send_fd(int fd, int fd_to_send)
-    msg.msg_controllen = sizeof(control);
+    msg.msg_controllen = CMSG_SPACE(sizeof(control));
---


