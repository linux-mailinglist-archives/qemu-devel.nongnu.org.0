Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506BC65C22C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 15:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCiWe-0003vY-6c; Tue, 03 Jan 2023 09:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pCiWc-0003vO-OO
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:44:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pCiWa-0002bN-Vn
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672757059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpQlnKHzMWw5okVslpKxsAizJ/vU51+J8Q76SHy6sO8=;
 b=aEzlbNHnj6OyLFd/ORwzttl2aq2HpE8IrywbQdUlN1OxelwQo4EJFjPrD/id3xpkfqCPJr
 WN2iyYbS/JZNay3C7uWJZcbykbFdytY0K0PCvzVyvqYJQpNP+iQ2rfcgS1KKlO5ydXhjlt
 fHrVzEgTgsZTj8NHfnXaxDGEOWCAP9c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-434-QGgshaaePPCo2LuyrTkWiw-1; Tue, 03 Jan 2023 09:44:18 -0500
X-MC-Unique: QGgshaaePPCo2LuyrTkWiw-1
Received: by mail-wr1-f70.google.com with SMTP id
 j18-20020adfb312000000b00293def622d1so1079738wrd.17
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 06:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LpQlnKHzMWw5okVslpKxsAizJ/vU51+J8Q76SHy6sO8=;
 b=MeGJGihykVkaxeLkiBbWqmp3AzBa5M4NxwNr1wpGTPwvC09TPgkOLWhdwhYNQnu/ra
 2EmGVHnWV3TSsrb56cqylzhHj7pGkRj3QJQuoiY8Y9RE4c/G8easHT/cUSyIm9ou8fur
 rEyxvtoFhcD0dsmjXGiUcUc/x6/lSNV0L4sPVXw7FKsnBWY5YHGXz0NkQ9bA5Z+xUAf2
 o0zu9cumk15mg217FhqzmIWMWaZ+6C0bevMwJYJiwVhdSlM3VMIVdlwyY4/15pF/C9yq
 mtK79EIW6AaPQAGWlWQto4wvI0k/ZC17MbKwwSxMgpQYi3YJ9NtlAyldeptecTCZoLgu
 kXPQ==
X-Gm-Message-State: AFqh2koYTjK8IpZBrI6AYgpRAlcO+O/+ygRGDJh7JsrM8fLl5sKv2NvB
 qmYr2IFLeUxRfNCJSMylpzyDkKmBZ5amhhhriJ6BxxnFDNVIhPgBjguRwHZfh8P+m6ivyyVJmVc
 2EErljnX8nuwLAg8=
X-Received: by 2002:a05:600c:3844:b0:3d3:4406:8a3a with SMTP id
 s4-20020a05600c384400b003d344068a3amr38411336wmr.30.1672757056927; 
 Tue, 03 Jan 2023 06:44:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtc7LfSnnQJ7beCSc2Ncrzsi8NgiicA8EX8rSlPWnxhLR/++dwBf5ZUa1KdlmbAjcTaqzNMrQ==
X-Received: by 2002:a05:600c:3844:b0:3d3:4406:8a3a with SMTP id
 s4-20020a05600c384400b003d344068a3amr38411322wmr.30.1672757056655; 
 Tue, 03 Jan 2023 06:44:16 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c080500b003d208eb17ecsm40110965wmp.26.2023.01.03.06.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 06:44:16 -0800 (PST)
Message-ID: <406394e8-ca16-34bb-f783-ba63bd80caa1@redhat.com>
Date: Tue, 3 Jan 2023 15:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] net: stream: add a new option to automatically
 reconnect
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230103142247.218039-1-lvivier@redhat.com>
 <00d66c54-0f12-0760-92ff-b10306f17849@redhat.com>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <00d66c54-0f12-0760-92ff-b10306f17849@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.103, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/3/23 15:28, Thomas Huth wrote:
> On 03/01/2023 15.22, Laurent Vivier wrote:
>> In stream mode, if the server shuts down there is currently
>> no way to reconnect the client to a new server without removing
>> the NIC device and the netdev backend (or to reboot).
>>
>> This patch introduces a reconnect option that specifies a delay
>> to try to reconnect with the same parameters.
>>
>> Add a new test in qtest to test the reconnect option and the
>> connect/disconnect events.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>> Based-on: <20230103110049.120340-1-lvivier@redhat.com>
>> v2:
>> - rebase
>>
>>   net/stream.c                |  53 ++++++++++++++++++-
>>   qapi/net.json               |   6 ++-
>>   qemu-options.hx             |   6 +--
>>   tests/qtest/netdev-socket.c | 100 ++++++++++++++++++++++++++++++++++++
>>   4 files changed, 160 insertions(+), 5 deletions(-)
> [...]
>> diff --git a/qapi/net.json b/qapi/net.json
>> index 522ac582edeb..5b72c936b3ac 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -585,6 +585,9 @@
>>   # @addr: socket address to listen on (server=true)
>>   #        or connect to (server=false)
>>   # @server: create server socket (default: false)
>> +# @reconnect: For a client socket, if a socket is disconnected,
>> +#             then attempt a reconnect after the given number of seconds.
>> +#             Setting this to zero disables this function. (default: 0)
> 
> I think this should get a "(since 8.0)" comment to make it clear when it has been introduced?
> 

Yes, you're right. It will be in the next patch version.

Thanks,
Laurent


