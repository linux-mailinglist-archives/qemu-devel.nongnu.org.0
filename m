Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EF0562FD4
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:22:45 +0200 (CEST)
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7CrM-0003JZ-Al
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o7CpW-0002bS-Qu
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:20:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o7CpQ-0000dG-1h
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656667242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//n/6MI5sox6Xb45vx1JT6w76nyLUM1pjIQRSp1tqoI=;
 b=eiZ1/4XptqHLzdKVQXxFhKyJ9+r10gz3oXn7MwDIHBlr5oE/lZQbJUq2DKBTxCbCW1neX5
 JzBudgfkkmBiZxGA3Y6aWLcfTWO+DaiGo5mtXZME4QXS6nDKWlyV5KLY/fO2uyPbN9vbt6
 gJP0LfczjdQAF6SnKV3Tf7rsgozaum8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-3gahzynvO02TABMYfd6AWA-1; Fri, 01 Jul 2022 05:20:41 -0400
X-MC-Unique: 3gahzynvO02TABMYfd6AWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso780691wma.1
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 02:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=//n/6MI5sox6Xb45vx1JT6w76nyLUM1pjIQRSp1tqoI=;
 b=QJPmKxWBwPHHN/l8mTOaf2jyMrfyqZRvRKLGLowPeYD9+qPueCA89WzGdGiWBOqySY
 +UUbWPCbiwc33jdDvI5jyRWyg23OBb3eulGfm6GtHkcMx0iPr2FG5E186XOUbjuG+Mon
 +meg6/+LcEZCDHwsdv9xN8uXCencDcryeT4QqOQYfUa++ry0vvQ4EwCn0LhzQ/nWXM6h
 nH64hWjN8/pweY9nk6JQ3zshOgQ67NhIh05bHeBi+zuapfMUDNOOZQhjBm8gZ2ledeii
 b/9w8nHJ/Z8kK6YkUrzAzKgdi9PS+OP5kx+aoTL18Ak4BdL/TX4G/gaj9MbUoFB12nd/
 9TNw==
X-Gm-Message-State: AJIora+bj+N8auQlCP8DgcQiKe+/Rf4P5RFPYUmpN9CCRixyZO1EH6/M
 5bwz0Kf9T9BdfgA9HyTkKxqQ7KUQf1Pwll6wV8l+Qn2Ng8DqG9wbhQJFgsWVP3CchrAA8DFbQJq
 ihcx9mEnPF4MnIWY=
X-Received: by 2002:a05:6000:5c5:b0:21b:9b11:9128 with SMTP id
 bh5-20020a05600005c500b0021b9b119128mr12832628wrb.492.1656667240505; 
 Fri, 01 Jul 2022 02:20:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfY1LHlLoCy9Ll1zWAbJD22b6zimr26p9QTBEt2oKL4OAReWrnYJOf7GiXyE+5x/80xHu4GA==
X-Received: by 2002:a05:6000:5c5:b0:21b:9b11:9128 with SMTP id
 bh5-20020a05600005c500b0021b9b119128mr12832607wrb.492.1656667240249; 
 Fri, 01 Jul 2022 02:20:40 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 ay14-20020a5d6f0e000000b0021b91ec8f6esm21900807wrb.67.2022.07.01.02.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 02:20:39 -0700 (PDT)
Message-ID: <aaefd067-6d82-e125-6285-86b2c38e6706@redhat.com>
Date: Fri, 1 Jul 2022 11:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 07/12] net: stream: add unix socket
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
References: <20220627154749.871943-1-lvivier@redhat.com>
 <20220627154749.871943-8-lvivier@redhat.com> <Yr1swVqjE2mMoFZe@work-vm>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <Yr1swVqjE2mMoFZe@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30/06/2022 11:28, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>> ---
>>   net/stream.c    | 106 +++++++++++++++++++++++++++++++++++++++++++++---
>>   qemu-options.hx |   1 +
>>   2 files changed, 102 insertions(+), 5 deletions(-)
>>
>> diff --git a/net/stream.c b/net/stream.c
>> index e8afbaca50b6..1a2bc237707e 100644
>> --- a/net/stream.c
>> +++ b/net/stream.c
>> @@ -235,7 +235,7 @@ static NetStreamState *net_stream_fd_init_stream(NetClientState *peer,
>>   static void net_stream_accept(void *opaque)
>>   {
>>       NetStreamState *s = opaque;
>> -    struct sockaddr_in saddr;
>> +    struct sockaddr_storage saddr;
>>       socklen_t len;
>>       int fd;
>>   
>> @@ -253,9 +253,27 @@ static void net_stream_accept(void *opaque)
>>       s->fd = fd;
>>       s->nc.link_down = false;
>>       net_stream_connect(s);
>> -    snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>> -             "connection from %s:%d",
>> -             inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
>> +    switch (saddr.ss_family) {
>> +    case AF_INET: {
>> +        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
>> +
>> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>> +                 "connection from %s:%d",
>> +                 inet_ntoa(saddr_in->sin_addr), ntohs(saddr_in->sin_port));
>> +        break;
>> +    }
>> +    case AF_UNIX: {
>> +        struct sockaddr_un saddr_un;
>> +
>> +        len = sizeof(saddr_un);
>> +        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
>> +        snprintf(s->nc.info_str, sizeof(s->nc.info_str),
>> +                 "connect from %s", saddr_un.sun_path);
>> +        break;
>> +    }
>> +    default:
>> +        g_assert_not_reached();
>> +    }
>>   }
>>   
>>   static int net_stream_server_init(NetClientState *peer,
>> @@ -295,6 +313,42 @@ static int net_stream_server_init(NetClientState *peer,
>>           }
>>           break;
>>       }
>> +    case SOCKET_ADDRESS_TYPE_UNIX: {
>> +        struct sockaddr_un saddr_un;
>> +
>> +        ret = unlink(addr->u.q_unix.path);
>> +        if (ret < 0 && errno != ENOENT) {
>> +            error_setg_errno(errp, errno, "failed to unlink socket %s",
>> +                             addr->u.q_unix.path);
>> +            return -1;
>> +        }
>> +
>> +        saddr_un.sun_family = PF_UNIX;
>> +        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
>> +                       addr->u.q_unix.path);
>> +        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
>> +            error_setg(errp, "UNIX socket path '%s' is too long",
>> +                       addr->u.q_unix.path);
>> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
>> +                              sizeof(saddr_un.sun_path));
> 
> return here?
>> +
>> +        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>> +        if (fd < 0) {
>> +            error_setg_errno(errp, errno, "can't create stream socket");
>> +            return -1;
>> +        }
>> +        qemu_socket_set_nonblock(fd);
>> +
>> +        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
>> +        if (ret < 0) {
>> +            error_setg_errno(errp, errno, "can't create socket with path: %s",
>> +                             saddr_un.sun_path);
>> +            closesocket(fd);
>> +            return -1;
>> +        }
>> +        break;
>> +    }
>>       case SOCKET_ADDRESS_TYPE_FD:
>>           fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>>           if (fd == -1) {
>> @@ -380,6 +434,48 @@ static int net_stream_client_init(NetClientState *peer,
>>                                      ntohs(saddr_in.sin_port));
>>           break;
>>       }
>> +    case SOCKET_ADDRESS_TYPE_UNIX: {
>> +        struct sockaddr_un saddr_un;
>> +
>> +        saddr_un.sun_family = PF_UNIX;
>> +        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
>> +                       addr->u.q_unix.path);
>> +        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
>> +            error_setg(errp, "UNIX socket path '%s' is too long",
>> +                       addr->u.q_unix.path);
>> +            error_append_hint(errp, "Path must be less than %zu bytes\n",
>> +                              sizeof(saddr_un.sun_path));
> 
> and here
> 
> (Can you not do a lot of this just by calling util/qemu-sockets.c
> unix_connect?)

Thank you for your comments.

In fact, in the last patch, I replace all this code by QIO functions.

I keep all the intermediate patches to be sure I don't break anything from the original 
behaviour of -netdev socket and to ease debugging by allowing to bisect between the 
different steps in the change.

Thanks,
Laurent


