Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B932052119F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 12:01:40 +0200 (CEST)
Received: from localhost ([::1]:37702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noMgV-0003iI-QV
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 06:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1noMSv-0000zR-TD
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1noMSt-0004Kh-3o
 for qemu-devel@nongnu.org; Tue, 10 May 2022 05:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652176053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSW1uFTLUm/A/HeSCj7R0iJNC/0qhJbMwpDLeW+cuqs=;
 b=FQNJmdCXNIhHPS2iyfB1lekZ6M1MzxD8YBzIhjmUkS4R9AOH2dfrYQwSHm+DTdV14y8jzI
 caIVnJ8U6bWUw+aNCCe8TS3WKthn8uaugGUVnOKebCBr6SOBxx+Fsq37NYiZukbfzdKGK8
 apTs6PvvnlyIxqbnpStgR8bovyMkzpc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-p18haOziPdGJgvJ3NweVuQ-1; Tue, 10 May 2022 05:47:32 -0400
X-MC-Unique: p18haOziPdGJgvJ3NweVuQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 r186-20020a1c44c3000000b00393f52ed5ceso1025080wma.7
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 02:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KSW1uFTLUm/A/HeSCj7R0iJNC/0qhJbMwpDLeW+cuqs=;
 b=xxjoJVuTDe9yFG0mZMXRnB+hr4A9kKL3I7bD232QAfKFHMCopxagvnFMGHFsSeGA8Y
 cbiOFdedhS0YfoZEXp21W6cq++00lKq/ZMNEBWRk6u/FZR/GB+EJZ+PR3phy9eHPlRqZ
 /94aDQ9fR62KXs1k2wmqLsYtI1EsQCI5tYGCy0D9wH0uebyWYesv5os4n0R/9Db5ygaR
 NzaWP4R4CnVO2CIS4Fu6eM09eH8+Ho+LY6STk1IYviXm4+GIHzAGJ7V04LXehsRHITY/
 +KWZF2yhX39AOgWXSvMcTOGgjPnolRy4t7ohAz+JduNzwdG849U+BtT+mjWtyaC8tYdE
 p2yA==
X-Gm-Message-State: AOAM531jVm3rZIoHxlNzZBSRwb3HV6SViWYKGiRqHqU8VwWGuSUVQWt8
 uwqJ4ANoeYvd6dYW7PIdqFnv90SRgukfipfTIgvWHD/8Lk1AlhTvlSRien93J8cmzxzj19K8kxi
 czmKy6B2mZTIbpjY=
X-Received: by 2002:a5d:6489:0:b0:20c:6c3b:d49e with SMTP id
 o9-20020a5d6489000000b0020c6c3bd49emr18249008wri.75.1652176051276; 
 Tue, 10 May 2022 02:47:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx98mzzuzPbRI97xqgKXYRL14yjdNranlcvs7w517sOHASSPumRXziuvR/oHuveRn5dT2Azzw==
X-Received: by 2002:a5d:6489:0:b0:20c:6c3b:d49e with SMTP id
 o9-20020a5d6489000000b0020c6c3bd49emr18248986wri.75.1652176051015; 
 Tue, 10 May 2022 02:47:31 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.186])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c3b0300b0039444973258sm2716755wms.0.2022.05.10.02.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 02:47:30 -0700 (PDT)
Message-ID: <66575668-2a1b-c8d5-57d3-8c427dd9237b@redhat.com>
Date: Tue, 10 May 2022 11:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 0/6] qapi: net: add unix socket type support to netdev
 backend
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20220509173618.467207-1-lvivier@redhat.com>
 <Ynohv8LzGG1vLy9N@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <Ynohv8LzGG1vLy9N@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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

On 10/05/2022 10:26, Daniel P. Berrangé wrote:
> On Mon, May 09, 2022 at 07:36:12PM +0200, Laurent Vivier wrote:
>> "-netdev socket" only supports inet sockets.
>>
>> It's not a complex task to add support for unix sockets, but
>> the socket netdev parameters are not defined to manage well unix
>> socket parameters.
>>
>> As discussed in:
>>
>>    "socket.c added support for unix domain socket datagram transport"
>>    https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
>>
>> This series adds support of unix socket type using SocketAddress QAPI structure.
>>
>> A new netdev backend "socket-ng" is added, that is barely a copy of "socket"
>> backend but it uses the SocketAddress QAPI to provide socket parameters.
>> And then it also implement unix sockets (TCP and UDP).
> 
> So pulling in the QAPI from patch 2
> 
>     { 'enum': 'NetdevSocketNGMode',
>       'data':  [ 'dgram', 'server', 'client' ] }
> 
>     { 'struct': 'NetdevSocketNGOptions',
>       'data': {
>         'mode':    'NetdevSocketNGMode',
>         '*addr':   'SocketAddress',
>         '*remote': 'SocketAddress',
>         '*local':  'SocketAddress' } }
> 
>> Some examples of CLI syntax:
>>
>>    for TCP:
>>
>>    -netdev socket-ng,id=socket0,mode=server,addr.type=inet,addr.host=localhost,addr.port=1234
>>    -netdev socket-ng,id=socket0,mode=client,addr.type=inet,addr.host=localhost,addr.port=1234
>>
>>    -netdev socket-ng,id=socket0,mode=dgram,\
>>            local.type=inet,local.host=localhost,local.port=1234,\
>>            remote.type=inet,remote.host=localhost,remote.port=1235
>>
>>    for UNIX:
>>
>>    -netdev socket-ng,id=socket0,mode=server,addr.type=unix,addr.path=/tmp/qemu0
>>    -netdev socket-ng,id=socket0,mode=client,addr.type=unix,addr.path=/tmp/qemu0
>>
>>    -netdev socket-ng,id=socket0,mode=dgram,\
>>            local.type=unix,local.path=/tmp/qemu0,\
>>            remote.type=unix,remote.path=/tmp/qemu1
>>
>>    for FD:
>>
>>    -netdev socket-ng,id=socket0,mode=server,addr.type=fd,addr.str=4
>>    -netdev socket-ng,id=socket0,mode=client,addr.type=fd,addr.str=5
>>
>>    -netdev socket-ng,id=socket0,mode=dgram,local.type=fd,addr.str=4
> 
>                                                            ^^^ local.str=4
> 
> I notice that in all these examples, mode=client/server always use
> the 'addr' field, and mode=dgram always uses the 'local'/'remote'
> fields. IOW, there is almost no commonality between the dgram scenario
> and the stream scenario, which feels sub-optimal.
> 
> Two alternatives come to mind
> 
>   - mode=client could use 'remote' and mode=server could use 'local',
>     removing the 'addr' field entirely
> 
>   - Have completely separate backends, ie '-netdev stream' for
>     client/server TCP/UNIX sockets, and '-netdev dgram' for UDP
>     sockets, removing 'mode' field.
> 
> I'd have a slight preference for the second, since I'm not thrilled
> by the 'socket-ng' name :-)

It seems reasonable, I'm going to update my series in this way:

    { 'struct': 'NetdevStreamOptions',
      'data': {
        'addr':   'SocketAddress' } }

    { 'struct': 'NetdevDgramOptions',
      'data': {
       '*local':   'SocketAddress',
       '*remote':   'SocketAddress' } }

Both parameters are optional because:
multicast needs 'remote' for the multicast address and optionally a local for source 
address or fd.
unicast needs both, except for fd where local provides fd and remote is needed only if 
local is not an fd.

    { 'union': 'Netdev',
      'base': { 'id': 'str', 'type': 'NetClientDriver' },
      'discriminator': 'type',
      'data': {
      ...
      'stream': 'NetdevStreamOptions',
      'dgram': 'NetdevDgramOptions' } }

Thanks,
Laurent


