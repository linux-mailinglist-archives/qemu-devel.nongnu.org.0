Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279C65EA600
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:27:01 +0200 (CEST)
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnCN-0000Kc-Hy
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocn13-0008Rm-Hb
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1ocn0z-0000kX-TX
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664194510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeSBnUdsayoeIP4a6y8ExXNhR8+XRAtSmmDICg50b54=;
 b=EOH5rF7ZRWdTOTQV11HS4A6ATfUbDlFB0K+QbsGhZ9CEmOESIiIs/q2GiNKhc8oEufr9i4
 5e4pk2JZM6FqPexr+/a+3AaU5fQLMeRHjceD6X25JCsxs5VB3kDINmZptUYXB5O4/FSkly
 tg+/a+SZ8ladmAnqr2U9uQeEzEXjqSE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-r0vkDnjTNauWemRPBJlFXw-1; Mon, 26 Sep 2022 08:15:09 -0400
X-MC-Unique: r0vkDnjTNauWemRPBJlFXw-1
Received: by mail-qt1-f199.google.com with SMTP id
 ew15-20020a05622a514f00b0035cb76e35e5so4571322qtb.7
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 05:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ZeSBnUdsayoeIP4a6y8ExXNhR8+XRAtSmmDICg50b54=;
 b=4BjTD8czI8wlFPYGYoQ84vtTWpadrUOO5usPkSilhk2pZP+jSFXVLMVyad8gh8qZwm
 PeKqCrtbzS7bcOJBqaaAbXKvkP2U1MuSs9smA1HwpygKC+KrtXLf88nrYqJPwwdntSTZ
 nqRuwz+y2YIO0t8X/BwvBumDn8A/y+JvPECCbi4lqu/HH9e+CtIDZnIANij6yAFh4E/b
 7F6aty6ylgriEfsWGEumttUQP9Od0wvyQCHepxmVaFAeKNZMKo6rGxAa+DsueRZYrXHX
 pJfmYccM5YCSv3eymLiCKkkFMy89Z1GGMgI2SO5QJjN8KiMRrXrfcw9vaZaXPVMpwwHq
 mkyw==
X-Gm-Message-State: ACrzQf2HDUbQc5qpq3VPfer/G9z6PUFSkq3tzl8C+VkZld5j+M042SpK
 wfAV6nzI2Uq/i3jj4IwsOsuXzVlFKjIH3ZDUySNqx8AR+nAz3IfFPveoQrnB0okR8QeLaIVfxXM
 P8dOjoHGojYv4ttY=
X-Received: by 2002:ad4:5bc1:0:b0:4ad:34b2:d29c with SMTP id
 t1-20020ad45bc1000000b004ad34b2d29cmr16770381qvt.21.1664194509151; 
 Mon, 26 Sep 2022 05:15:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4GbiebAtCEHq3iCDR1TdV3cYgY5e9yBcGP/cJjxS1Ly9OvZAE5HDHtAMYXveWT5tF5rMDEAw==
X-Received: by 2002:ad4:5bc1:0:b0:4ad:34b2:d29c with SMTP id
 t1-20020ad45bc1000000b004ad34b2d29cmr16770359qvt.21.1664194508914; 
 Mon, 26 Sep 2022 05:15:08 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05620a444c00b006af1f0af045sm11791598qkp.107.2022.09.26.05.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 05:15:08 -0700 (PDT)
Message-ID: <7d2124a0-af80-c3e0-8e74-206507cd69ce@redhat.com>
Date: Mon, 26 Sep 2022 14:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 07/14] net: stream: add unix socket
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gregory Kurz <gregory.kurz@free.fr>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Stefano Brivio <sbrivio@redhat.com>
References: <20220913064000.79353-1-lvivier@redhat.com>
 <20220913064000.79353-8-lvivier@redhat.com> <YyFjmtyNd5mAlm9b@yekko>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <YyFjmtyNd5mAlm9b@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/22 07:16, David Gibson wrote:
> On Tue, Sep 13, 2022 at 08:39:53AM +0200, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
>> ---
>>   net/stream.c    | 108 +++++++++++++++++++++++++++++++++++++++++++++---
>>   qapi/net.json   |   2 +-
>>   qemu-options.hx |   1 +
>>   3 files changed, 105 insertions(+), 6 deletions(-)
>>
>> diff --git a/net/stream.c b/net/stream.c
>> index e8afbaca50b6..0f91ff20df61 100644
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
> 
> It seems like there's an asymmetry here in that we've gotten the
> connection address outside the switch for inet sockets, but we need an
> additional getsockname() for unix sockets.  Am I missing something?
> 

This is because unix socket are not symmetric.

connect() returns the peer socket address.

With inet, server is waiting on, for instance, 127.0.0.1:1234 and peer address will appear 
to be something like 127.0.0.1:33946. So info_str will be set with "127.0.0.1:33946".

In case of unix, server is waiting on, for instance, /tmp/qemu0 and there is no peer 
address as the client connect to this same file. So the sun_path is empty when it returns 
from accept(). So to set the path of the socket (sun_path) in info_str I use the 
getsockname() to retrieve the server sun_path.

Thanks,
Laurent




