Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB632B07A0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:37:24 +0100 (CET)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDj1-00069a-Ps
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdDhn-0005ho-7S
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:36:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdDhk-0001x9-9Z
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605191763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GQ8xrIhKkdj5NghHUebZ1y7g7S0gfxVMmIoOvrjx9CY=;
 b=JnANrYWRmK3t7Oig9pKSxpHeZ4oqjrSiYZYwqQwV5n9JfD13/eteTBq1aLM7tqkoXt1B5a
 H70aWSvb2zcZvBkPBPzv8dZO+XuzkYWmPUOz5glmLHPjhUnK/MwcGbYTNEExbOMIFvwwzM
 IJhXADYnqq9nxth18wxsfVzau1s4Imk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-FVNBHBHzN6Kh6T2VM3lBtA-1; Thu, 12 Nov 2020 09:35:59 -0500
X-MC-Unique: FVNBHBHzN6Kh6T2VM3lBtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D41EF1017DD1;
 Thu, 12 Nov 2020 14:35:57 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9571C4;
 Thu, 12 Nov 2020 14:35:55 +0000 (UTC)
Date: Thu, 12 Nov 2020 14:35:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH] migration/multifd: fix hangup with TLS-Multifd due to
 blocking handshake
Message-ID: <20201112143548.GC13424@work-vm>
References: <1604643893-8223-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1604643893-8223-1-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> The qemu main loop could hang up forever when we enable TLS+Multifd.
> The Src multifd_send_0 invokes tls handshake, it sends hello to sever
> and wait response.
> However, the Dst main qemu loop has been waiting recvmsg() for multifd_recv_1.
> Both of Src and Dst main qemu loop are blocking and waiting for reponse which
> results in hanging up forever.
> 
> Src: (multifd_send_0)                                              Dst: (multifd_recv_1)
> multifd_channel_connect                                            migration_channel_process_incoming
>   multifd_tls_channel_connect                                        migration_tls_channel_process_incoming
>     multifd_tls_channel_connect                                        qio_channel_tls_handshake_task
>        qio_channel_tls_handshake                                         gnutls_handshake
>           qio_channel_tls_handshake_task                                       ...
>             qcrypto_tls_session_handshake                                      ...
>               gnutls_handshake                                                 ...
>                    ...                                                         ...
>                 recvmsg (Blocking I/O waiting for response)                recvmsg (Blocking I/O waiting for response)
> 
> Fix this by offloadinig handshake work to a background thread.
> 
> Reported-by: Yan Jin <jinyan12@huawei.com>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>

Queued

> ---
>  migration/multifd.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 68b171f..88486b9 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -739,6 +739,19 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
>      multifd_channel_connect(p, ioc, err);
>  }
>  
> +static void *multifd_tls_handshake_thread(void *opaque)
> +{
> +    MultiFDSendParams *p = opaque;
> +    QIOChannelTLS *tioc = QIO_CHANNEL_TLS(p->c);
> +
> +    qio_channel_tls_handshake(tioc,
> +                              multifd_tls_outgoing_handshake,
> +                              p,
> +                              NULL,
> +                              NULL);
> +    return NULL;
> +}
> +
>  static void multifd_tls_channel_connect(MultiFDSendParams *p,
>                                          QIOChannel *ioc,
>                                          Error **errp)
> @@ -754,12 +767,10 @@ static void multifd_tls_channel_connect(MultiFDSendParams *p,
>  
>      trace_multifd_tls_outgoing_handshake_start(ioc, tioc, hostname);
>      qio_channel_set_name(QIO_CHANNEL(tioc), "multifd-tls-outgoing");
> -    qio_channel_tls_handshake(tioc,
> -                              multifd_tls_outgoing_handshake,
> -                              p,
> -                              NULL,
> -                              NULL);
> -
> +    p->c = QIO_CHANNEL(tioc);
> +    qemu_thread_create(&p->thread, "multifd-tls-handshake-worker",
> +                       multifd_tls_handshake_thread, p,
> +                       QEMU_THREAD_JOINABLE);
>  }
>  
>  static bool multifd_channel_connect(MultiFDSendParams *p,
> -- 
> 1.8.3.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


