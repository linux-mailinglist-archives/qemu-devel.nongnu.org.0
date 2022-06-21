Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C531C552F67
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 12:05:23 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3al8-0005Mq-1t
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 06:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3aYW-0005Ak-1y
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o3aYS-0000Cb-GY
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655805118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhaDqCjOjSmaSxnxRhfcfImVopn5Vx86/0lTDSnlyic=;
 b=c1o57iauc6pF3/egnhS9LUxzzqhdvvJaBUn17wADLXtaJALRT2zw+hIm2JP6tNbHuHKwa2
 1109j8WyyldU3a+94VODAUHFJDX7hB4BxpLzgAlZHedUr1r5mQnF2Cc2x9YDH/E9VugZdb
 AnTlngBlsk2uCInri0fKa5I7uxOCrgA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-H1h9poDyOte-73F8-QkX1Q-1; Tue, 21 Jun 2022 05:51:57 -0400
X-MC-Unique: H1h9poDyOte-73F8-QkX1Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so4093858wms.5
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 02:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OhaDqCjOjSmaSxnxRhfcfImVopn5Vx86/0lTDSnlyic=;
 b=m8A+lFpFKcrXFuuHfwpxlCdLXLWeVxxrgzX9F6CT4D20B7InlNW+cmHyNIMUFjn20O
 olBr1jK0Yp6lemTlGhFrrYTqlxptNniR/oTG5JPaAgcdkDjY0kvjQiFENke6mnQpnhyC
 Y5Ywfd/6aT5MPQcv8k64OxgzZWXFZx7WyAke4j5WQTJnhvCZ+qaV1clF+4Z86E4z2UvA
 YVGFmrcIvkXhl+V40eBifbykMJ5ShkH45qVvCHf3npjZ/3mR7hwnSbL/eFC/D4dIIqpg
 LOHd1BF6XxuYa36ucMVfqF1qZsCeyvAhNZaA8JG+m524rQR297cQs0hQHNJ0IANRfjZU
 wrNA==
X-Gm-Message-State: AJIora9LjlkZwZ2EHKa+9IgWEt41dbQVoWMwyCiaufCdRJujP+y5mXjT
 QGE1tHOr4HwN6oF7DVoPl/fMaMKlhdj92sOIeov6EUbdu0BLGTrjKg/cJQ3AZYq8yIvHQsIq/QP
 CgEsOzUaAkx5/YhM=
X-Received: by 2002:a05:6000:15ca:b0:218:48a7:a45f with SMTP id
 y10-20020a05600015ca00b0021848a7a45fmr27645571wry.591.1655805115849; 
 Tue, 21 Jun 2022 02:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpASSDW/j2n5LmBRgzWmv4JxqkpY4pkhIhgmYIK98M62NFPoCvUK7QIf5nesaaE8tybRXG+w==
X-Received: by 2002:a05:6000:15ca:b0:218:48a7:a45f with SMTP id
 y10-20020a05600015ca00b0021848a7a45fmr27645546wry.591.1655805115600; 
 Tue, 21 Jun 2022 02:51:55 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a1cf206000000b0039c975aa553sm17732089wmc.25.2022.06.21.02.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 02:51:54 -0700 (PDT)
Message-ID: <92fb6e19-342a-aab6-b610-79e755ac69d3@redhat.com>
Date: Tue, 21 Jun 2022 11:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH v3 00/11] qapi: net: add unix socket type support to
 netdev backend
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Ralph Schmieder
 <ralph.schmieder@gmail.com>, Stefano Brivio <sbrivio@redhat.com>
References: <20220620101828.518865-1-lvivier@redhat.com>
 <YrC7U1XH0pGsn5Df@work-vm>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <YrC7U1XH0pGsn5Df@work-vm>
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

On 20/06/2022 20:24, Dr. David Alan Gilbert wrote:
> * Laurent Vivier (lvivier@redhat.com) wrote:
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
>> Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
>> backend but they use the SocketAddress QAPI to provide socket parameters.
>> And then they also implement unix sockets (TCP and UDP).
> 
> Had you considered a -netdev chardev?
> 

I think by definition a "chardev" doesn't behave like a "netdev". Moreover "chardev" is 
already a frontend for several backends (socket, udp, ...), this would mean we use the 
frontend "chardev" as a backend of a "netdev". More and more layers...

And in the case of "-netdev dgram", we can use unix socket and sendto()/recv() while 
something like "-chardev udp,id=char0 -netdev chardev,chardev=char0,id=net0" doesn't 
support unix (see qio_channel_socket_dgram_sync()/socket_dgram()) and uses a 
"connect()/sendmsg()/recv()" (that really changes the behaviour of the backend)

The aim of this series is to add unix socket support.

Thanks,
Laurent


