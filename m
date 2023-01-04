Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C9D65DD6E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 21:11:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDA5Y-00007N-IX; Wed, 04 Jan 2023 15:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pDA5W-00006m-88
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 15:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pDA5U-0005uX-DE
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 15:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672863011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0smZWp+SaaQ4kX9kqjY4qVqmHBaDEBb5lg6lMGdoIY=;
 b=PX8oo/GdIqufzoPYjns9hIpv0AUcW3Etj8pD52OhAY0+Ez7IEB78xGmLEftQ/08uJJzwE6
 aZqJKH6xTw2Lvm74CBMaXWJQl/Twh/bMsMBQBDt6vIfsMkUDjStA017EmKMvCR0DK7+8Y9
 a3I9wYuvGOO2pN4zQvJgcIzL0OL61WM=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-USfUnnMlNBmjv_xWhbm_gg-1; Wed, 04 Jan 2023 15:10:10 -0500
X-MC-Unique: USfUnnMlNBmjv_xWhbm_gg-1
Received: by mail-vs1-f72.google.com with SMTP id
 q10-20020a056102100a00b003cd745643d0so2303771vsp.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 12:10:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0smZWp+SaaQ4kX9kqjY4qVqmHBaDEBb5lg6lMGdoIY=;
 b=InTn0sb+ZriWo7tDBqQQiRBXuCkTx/Rz9nhopPedm+GOfLFHl7lXkjELQGGtRsGvRC
 JZXVc7vZIrN96Czp4IdL0Wb1g2GiIY+R9HBpmCaDgWRooq79ZfifheCUyKUW+YhEMrUP
 RLehQihES0EWxp6Of83iM3k5joO3XAPb+qvGu//0/GeLHbN2gkCqM6jB2/OvflCmKDav
 bgRFX6zaL8zaT99HpBqF9xVXBZMeXLBWok7ymonPH0xH2xPl6Xc5yK1fy7TNmVGEKftV
 0mRTZdNZJ7YwKdHcRoDac56JNglO1/PjBRkFYMN3Uk3AXcdSz/uO2jkKP2kMVo0Xc7m+
 plSw==
X-Gm-Message-State: AFqh2kpjREtnGoGdi5wnUExvLyqhKfIYca6E4LStBuxZpefOU9m+UHzn
 OfuqUcNHt29m+qNyvwrrvA+0Y8S2zPpuWaCLlykADvI1/FC1cBfiEQvOJ38LVVSa1WZAGosEgoF
 6Fz/1YFo+MPO7mhw=
X-Received: by 2002:a67:f1d6:0:b0:3cb:54f1:d813 with SMTP id
 v22-20020a67f1d6000000b003cb54f1d813mr11941786vsm.15.1672863009343; 
 Wed, 04 Jan 2023 12:10:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu5MQxph8EE/6+MFxv9Ae4JE3cTrcoVdAhpTNPiGc8H7KgtHmyx2hpguLQW32vCh6f/oitnWg==
X-Received: by 2002:a67:f1d6:0:b0:3cb:54f1:d813 with SMTP id
 v22-20020a67f1d6000000b003cb54f1d813mr11941761vsm.15.1672863009114; 
 Wed, 04 Jan 2023 12:10:09 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05620a0f0700b006faf76e7c9asm24497734qkl.115.2023.01.04.12.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 12:10:08 -0800 (PST)
Message-ID: <7d93db4d-5273-e015-7321-821730ef5232@redhat.com>
Date: Wed, 4 Jan 2023 21:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230103110049.120340-1-lvivier@redhat.com>
 <ebe2ba95-ef47-0506-d264-303b5a75f58b@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <ebe2ba95-ef47-0506-d264-303b5a75f58b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.708, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/4/23 19:37, Thomas Huth wrote:
> On 03/01/2023 12.00, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>
>> Notes:
>>      v4:
>>        - rework EXPECT_STATE()
>>        - use g_dir_make_tmp()
>>      v3:
>>      - Add "-M none" to avoid error:
>>        "No machine specified, and there is no default"
>>      v2:
>>      - Fix ipv6 free port allocation
>>      - Check for IPv4, IPv6, AF_UNIX
>>      - Use g_mkdtemp() rather than g_file_open_tmp()
>>      - Use socketpair() in test_stream_fd()
>>      v1: compared to v14 of "qapi: net: add unix socket type support to netdev backend":
>>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
>>
>>   tests/qtest/meson.build     |   2 +
>>   tests/qtest/netdev-socket.c | 434 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 436 insertions(+)
>>   create mode 100644 tests/qtest/netdev-socket.c
> 
> FYI, the test also does not work on FreeBSD. It hangs on both, FreeBSD 12 and 13:
> 
>   https://cirrus-ci.com/task/5024964768694272?logs=build#L6937
> 
>   https://cirrus-ci.com/task/5379344567107584?logs=build#L6938

Thanks.

Are you sure it's this test?

The "/netdev/stream/inet/ipv6" seems to be the last one of the series (if I compare with 
previous machines) and it is OK in the logs.

I don't understand where it can hang as we have an internal 5 seconds timeout (in 
EXPECT_STATE()).

And I don't understand why we have only /netdev/stream tests and no /netdev/dgram tests.

Is it possible to have more details?

Laurent


