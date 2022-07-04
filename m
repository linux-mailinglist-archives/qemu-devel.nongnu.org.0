Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8CA564CE4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:14:46 +0200 (CEST)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EQ0-00044V-UG
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8ENc-0002Qt-VZ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o8ENZ-0000rf-Jt
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656911532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ouZoEoQcqmrree17jrTRcv8CMzXgFfKXXnIDqEBoxqI=;
 b=YswIa4J1O3yooJNRnCU1M3oIS6szj8V/pXFZdsi6k5YmPcXw8epPN1AkA+g94rvK5PwwTH
 jzdQC2jT28bWTA0+mJEmhOQMY00GNWsU35WTKxKL/YNYvQs0/AbE5P/Gp5gq8sSv3uGxue
 jL2W/6wYML9Ni4344YRS1biF/NJJ/iQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-eLZVs2ITNbiqlu2eyLpNdw-1; Mon, 04 Jul 2022 01:12:07 -0400
X-MC-Unique: eLZVs2ITNbiqlu2eyLpNdw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 968A2811E76
 for <qemu-devel@nongnu.org>; Mon,  4 Jul 2022 05:12:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 573001410F3C;
 Mon,  4 Jul 2022 05:12:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4A84121E690D; Mon,  4 Jul 2022 07:12:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v5 07/12] net: stream: add unix socket
References: <20220627154749.871943-1-lvivier@redhat.com>
 <20220627154749.871943-8-lvivier@redhat.com>
 <Yr1swVqjE2mMoFZe@work-vm>
 <aaefd067-6d82-e125-6285-86b2c38e6706@redhat.com>
Date: Mon, 04 Jul 2022 07:12:06 +0200
In-Reply-To: <aaefd067-6d82-e125-6285-86b2c38e6706@redhat.com> (Laurent
 Vivier's message of "Fri, 1 Jul 2022 11:20:38 +0200")
Message-ID: <87let9zck9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Laurent Vivier <lvivier@redhat.com> writes:

> On 30/06/2022 11:28, Dr. David Alan Gilbert wrote:
>> * Laurent Vivier (lvivier@redhat.com) wrote:
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>>> ---
>>>   net/stream.c    | 106 +++++++++++++++++++++++++++++++++++++++++++++---
>>>   qemu-options.hx |   1 +
>>>   2 files changed, 102 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/net/stream.c b/net/stream.c
>>> index e8afbaca50b6..1a2bc237707e 100644
>>> --- a/net/stream.c
>>> +++ b/net/stream.c
>>> @@ -235,7 +235,7 @@ static NetStreamState *net_stream_fd_init_stream(NetClientState *peer,
>>>   static void net_stream_accept(void *opaque)
>>>   {
>>>       NetStreamState *s = opaque;
>>> -    struct sockaddr_in saddr;
>>> +    struct sockaddr_storage saddr;
>>>       socklen_t len;
>>>       int fd;
>>>   
>>> @@ -253,9 +253,27 @@ static void net_stream_accept(void *opaque)
>>>       s->fd = fd;
>>>       s->nc.link_down = false;
>>>       net_stream_connect(s);
>>> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>>> -             "connection from %s:%d",
>>> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
>>> +    switch (saddr.ss_family) {
>>> +    case AF_INET: {
>>> +        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
>>> +
>>> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>>> +                 "connection from %s:%d",
>>> +                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port));
>>> +        break;
>>> +    }
>>> +    case AF_UNIX: {
>>> +        struct sockaddr_un saddr_un;
>>> +
>>> +        len = sizeof(saddr_un);
>>> +        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
>>> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>>> +                 "connect from %s", saddr_un.sun_path);
>>> +        break;
>>> +    }
>>> +    default:
>>> +        g_assert_not_reached();
>>> +    }
>>>   }
>>>   
>>>   static int net_stream_server_init(NetClientState *peer,
>>> @@ -295,6 +313,42 @@ static int net_stream_server_init(NetClientState *peer,
>>>           }
>>>           break;
>>>       }
>>> +    case SOCKET_ADDRESS_TYPE_UNIX: {
>>> +        struct sockaddr_un saddr_un;
>>> +
>>> +        ret = unlink(addr->u.q_unix.path);
>>> +        if (ret < 0 && errno != ENOENT) {
>>> +            error_setg_errno(errp, errno, "failed to unlink socket %s",
>>> +                             addr->u.q_unix.path);
>>> +            return -1;
>>> +        }
>>> +
>>> +        saddr_un.sun_family = PF_UNIX;
>>> +        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
>>> +                       addr->u.q_unix.path);
>>> +        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
>>> +            error_setg(errp, "UNIX socket path '%s' is too long",
>>> +                       addr->u.q_unix.path);
>>> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
>>> +                              sizeof(saddr_un.sun_path));
>> 
>> return here?

If you don't, and ...

>>> +
>>> +        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>>> +        if (fd < 0) {

... we then get here, we trip error_setv()'s assertion "no error has
been set".

>>> +            error_setg_errno(errp, errno, "can't create stream socket");
>>> +            return -1;
>>> +        }
>>> +        qemu_socket_set_nonblock(fd);
>>> +
>>> +        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
>>> +        if (ret < 0) {
>>> +            error_setg_errno(errp, errno, "can't create socket with path: %s",
>>> +                             saddr_un.sun_path);
>>> +            closesocket(fd);
>>> +            return -1;
>>> +        }
>>> +        break;
>>> +    }
>>>       case SOCKET_ADDRESS_TYPE_FD:
>>>           fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>>>           if (fd == -1) {
>>> @@ -380,6 +434,48 @@ static int net_stream_client_init(NetClientState *peer,
>>>                                      ntohs(saddr_in.sin_port));
>>>           break;
>>>       }
>>> +    case SOCKET_ADDRESS_TYPE_UNIX: {
>>> +        struct sockaddr_un saddr_un;
>>> +
>>> +        saddr_un.sun_family = PF_UNIX;
>>> +        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
>>> +                       addr->u.q_unix.path);
>>> +        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
>>> +            error_setg(errp, "UNIX socket path '%s' is too long",
>>> +                       addr->u.q_unix.path);
>>> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
>>> +                              sizeof(saddr_un.sun_path));
>> 
>> and here

Likewise.

[...]


