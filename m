Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA06010DA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 16:13:57 +0200 (CEST)
Received: from localhost ([::1]:39998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okQsO-0007tr-CA
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 10:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1okQif-0003Bt-DY
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1okQid-0000Zl-BD
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 10:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666015425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wsrYdoZKYaMd0e3vhZfGJW60dLJna9JuS/wPJsmy1U=;
 b=PFfAh7ybP8tqHoiDoumCFci6AR/IsrURi07SvvQtpuW3PC9coL1Oa26rQI7e3F6mYyZ6D7
 9YkwKsoxUbP3qRGiS2xy9POf4DcKJl5UV+QC6M0+VPdMgeTUoLhi5rKwQ/3+O01QDMEd8p
 jlQ902K17UU7oOfUm2Qr440opKuk9eA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-316-SB8qqISFONeOxGfv9SUnKA-1; Mon, 17 Oct 2022 10:03:43 -0400
X-MC-Unique: SB8qqISFONeOxGfv9SUnKA-1
Received: by mail-qk1-f198.google.com with SMTP id
 v1-20020a05620a440100b006eee30cb799so2812921qkp.23
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 07:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1wsrYdoZKYaMd0e3vhZfGJW60dLJna9JuS/wPJsmy1U=;
 b=e+Z8CqcHZXqTOHP4tYuM+2qUdXaZW8/62zyNkjeRoaq075VQrAqqKRovYDG0W2VNct
 STY3JiodsSms0mRViKB28WBuMOLl73cmBW/AvQnRY/nORsAO2EhTtceW+dbSYr0tnm96
 AMpEGXjNDRV1M2v+rkf5fG6GCeiO5kf88RAQFT/rK4rUukDZP3UH+YM7WTqsvK02jYx7
 6EhR//5WIYvCTreYvEDJta8m/t9e9HGlvkg+Tf0Xnval55X1zDef0qr3q15o/zbFN8Z2
 PiJjwAxQ6B+LUtPsjRLRO1FtI+WC45Y35cCZqi63a2w/z6bSDwwEzE1Ih5QgtigANHAK
 hqzw==
X-Gm-Message-State: ACrzQf2fkX4NUEUgXSI8scD3Pl5jxLbeqEZ8+jl7bfA84Igbz74Mt+hL
 t+lOdjvEgVSYGCsEnzbgqzK+KGD/x2bdaTc/s0AbXSUOe87BvyE5qPIed+hYwellFSbhrCgxfTv
 330pbqZO4tBt5Ax4=
X-Received: by 2002:a37:f50b:0:b0:6cb:be4d:6ce8 with SMTP id
 l11-20020a37f50b000000b006cbbe4d6ce8mr7686456qkk.135.1666015421468; 
 Mon, 17 Oct 2022 07:03:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4u/YeakeV18+4BITTwq9fc/lh0NkQ58t6fwHnLwPvtzPwpZEHppmatLFZkzJtc37r2pYbT0Q==
X-Received: by 2002:a37:f50b:0:b0:6cb:be4d:6ce8 with SMTP id
 l11-20020a37f50b000000b006cbbe4d6ce8mr7686418qkk.135.1666015421085; 
 Mon, 17 Oct 2022 07:03:41 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a05620a40c300b006eed14045f4sm8067755qko.48.2022.10.17.07.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 07:03:40 -0700 (PDT)
Message-ID: <7eaa3255-7580-7e06-8b28-ae60ed5e1be6@redhat.com>
Date: Mon, 17 Oct 2022 16:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v11 17/17] net: stream: add QAPI events to report
 connection state
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Greg Kurz <groug@kaod.org>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Paul Durrant <paul@xen.org>,
 David Gibson <david@gibson.dropbear.id.au>, xen-devel@lists.xenproject.org
References: <20221011200539.1486809-1-lvivier@redhat.com>
 <20221011200539.1486809-18-lvivier@redhat.com> <87mt9u4m9d.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87mt9u4m9d.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/22 15:23, Markus Armbruster wrote:
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>> is connected, and NETDEV_STREAM_EOC when it is disconnected.
>>
>> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
>> address.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   net/stream.c  | 11 +++++++++--
>>   qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/stream.c b/net/stream.c
>> index 0293e38e5b57..821ae3265356 100644
>> --- a/net/stream.c
>> +++ b/net/stream.c
>> @@ -38,6 +38,7 @@
>>   #include "io/channel.h"
>>   #include "io/channel-socket.h"
>>   #include "io/net-listener.h"
>> +#include "qapi/qapi-events-net.h"
>>   
>>   typedef struct NetStreamState {
>>       NetClientState nc;
>> @@ -168,6 +169,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
>>           s->nc.link_down = true;
>>           qemu_set_info_str(&s->nc, "");
>>   
>> +        qapi_event_send_netdev_stream_eoc(s->nc.name);
>> +
>>           return G_SOURCE_REMOVE;
>>       }
>>       buf = buf1;
>> @@ -243,9 +246,10 @@ static void net_stream_listen(QIONetListener *listener,
>>       g_assert(addr != NULL);
>>       uri = socket_uri(addr);
>>       qemu_set_info_str(&s->nc, uri);
>> -    g_free(uri);
>>       qapi_free_SocketAddress(addr);
>>   
>> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
>> +    g_free(uri);
>>   }
>>   
>>   static void net_stream_server_listening(QIOTask *task, gpointer opaque)
>> @@ -317,12 +321,12 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>>       g_assert(addr != NULL);
>>       uri = socket_uri(addr);
>>       qemu_set_info_str(&s->nc, uri);
>> -    g_free(uri);
>>   
>>       ret = qemu_socket_try_set_nonblock(sioc->fd);
>>       if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
>>           qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
>>                             addr->u.fd.str, -ret);
>> +        g_free(uri);
>>           qapi_free_SocketAddress(addr);
>>           goto error;
>>       }
>> @@ -338,6 +342,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>>                                               s, NULL);
>>       s->nc.link_down = false;
>>   
>> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
>> +    g_free(uri);
>> +
>>       return;
>>   error:
>>       object_unref(OBJECT(s->ioc));
>> diff --git a/qapi/net.json b/qapi/net.json
>> index 6a1a49749294..69f83bceff3f 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -895,3 +895,49 @@
>>   ##
>>   { 'event': 'FAILOVER_NEGOTIATED',
>>     'data': {'device-id': 'str'} }
>> +
>> +##
>> +# @NETDEV_STREAM_CONNECTED:
>> +#
>> +# Emitted when the netdev stream backend is connected
>> +#
>> +# @netdev-id: QEMU netdev id that is connected
>> +# @uri: The Uniform Resource Identifier identifying the destination address
> 
> Is an URI the appropriate representation here?  It's not how we specify
> such addresses elsewhere in QAPI/QMP...

I put in the event the same information we have in info_str and displayed by the HMP 
command 'info network'. What would be a more appropriate reprensation?

> 
>> +#
>> +# Since: 7.2
>> +#
>> +# Example:
>> +#
>> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
>> +#      'data': {'uri': 'tcp:::1:1234', 'netdev-id': 'netdev0'},
>> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
>> +#
>> +# or
>> +#
>> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
>> +#      'data': {'uri': ''unix:/tmp/qemu0', 'netdev-id': 'netdev0'},
>> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
>> +#
>> +##
>> +{ 'event': 'NETDEV_STREAM_CONNECTED',
>> +  'data': { 'netdev-id': 'str',
>> +            'uri': 'str' } }
>> +
>> +##
>> +# @NETDEV_STREAM_EOC:
> 
> What does "EOC" mean?

End-Of-Connection, this is the nomenclature used in the code when the socket is disconnected.
> 
> Could this be named NETDEV_STREAM_DISCONNECTED, for symmetry with
> NETDEV_STREAM_CONNECTED?

Yes, it can. EOC is shorter, it's why I used it, but if you prefer "disconnected"...

Thanks,
Laurent

> 
>> +#
>> +# Emitted when the netdev stream backend is disconnected
>> +#
>> +# @netdev-id: QEMU netdev id that is disconnected
>> +#
>> +# Since: 7.2
>> +#
>> +# Example:
>> +#
>> +# <- { 'event': 'NETDEV_STREAM_EOC',
>> +#      'data': {'netdev-id': 'netdev0'},
>> +#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
>> +#
>> +##
>> +{ 'event': 'NETDEV_STREAM_EOC',
>> +  'data': { 'netdev-id': 'str' } }
> 


