Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639365E59A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 07:26:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDJgH-00034U-GL; Thu, 05 Jan 2023 01:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDJgF-00033x-KQ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 01:24:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDJgD-0003R9-MX
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 01:24:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672899884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8jQ+i5bvVJtErnFHO9UyMTDzuaN/g5ovkJILbezz4c=;
 b=ArCi73lTI+TvQ9YuOGNolFy7a6EXCaYKt6GHg9PGjfIF0+Mp+TqAuqRxccEl49KzmG3muQ
 NV04F7q/9s3AAX888YLbC/5nkrJ1rDQ+S/bRBCK9trXNIWVN8khtWh+kr8rXxhU8rC0WO8
 l0pvYnRNyFfebGm5eAOhU+mJ7/pTzls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-532-r4EbScNYMkm2QjRKdr2roA-1; Thu, 05 Jan 2023 01:24:42 -0500
X-MC-Unique: r4EbScNYMkm2QjRKdr2roA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso531894wms.7
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 22:24:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K8jQ+i5bvVJtErnFHO9UyMTDzuaN/g5ovkJILbezz4c=;
 b=OsHEtGcOwvwswzaTEoUY3RhTaccBw8pMKY/s80bC8cFcEtcdlXgSzUomDO5uBrqAmg
 sZSx4YkinMZgiTaz+3MJq9xHZ9BPJzyP50bdodV+PgE88F7+ndChN4W4qED000aeg+kb
 /SaUEtkW1z3yR6mAvubDazmr3EC+gu9oh6DefiZCusiHBlekafoxcdEYxRJbJsqwQp3B
 ygTO2AxjwHt5mnavRwigQuSyxP+w4P/Y53D9l8VlmK13PqQ0/IgV6jQVKK+oMxjPMf49
 AHD92Z0+Y+BgAQhpF7+k2M6oPN5HJbQtf2YIdyfdhy5C1Sda10Nb4zxaxYCYQ5fCatn7
 RDsQ==
X-Gm-Message-State: AFqh2kqqqpQLuELSz14yEBOvimkZyhs9A9zgFydnMdIn2DPwhbUjGFIX
 UE5JwRNIX8WZsL46+ItyVuPtvkjhFp5IaOuIl9pFC6GZFa1aB/PxilF1Oxk6E/pGO92u5lOnq02
 /IWc30li+RP5ZjjU=
X-Received: by 2002:adf:ec04:0:b0:28b:3e32:8293 with SMTP id
 x4-20020adfec04000000b0028b3e328293mr15790361wrn.12.1672899881381; 
 Wed, 04 Jan 2023 22:24:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsHKXQ9dpW7P1m3HhIPRahii/9cf+Rgdce7Wg5HKSG3fm3SXXXLvdiG3qLK4sls/3hOAmNMxA==
X-Received: by 2002:adf:ec04:0:b0:28b:3e32:8293 with SMTP id
 x4-20020adfec04000000b0028b3e328293mr15790349wrn.12.1672899881124; 
 Wed, 04 Jan 2023 22:24:41 -0800 (PST)
Received: from [192.168.8.105] (tmo-097-240.customers.d1-online.com.
 [80.187.97.240]) by smtp.gmail.com with ESMTPSA id
 v3-20020a5d4a43000000b0026fc5694a60sm35132395wrs.26.2023.01.04.22.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 22:24:39 -0800 (PST)
Message-ID: <1a92d1b1-3ab1-eace-794a-51e9c87d4d7a@redhat.com>
Date: Thu, 5 Jan 2023 07:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230103110049.120340-1-lvivier@redhat.com>
 <ebe2ba95-ef47-0506-d264-303b5a75f58b@redhat.com>
 <7d93db4d-5273-e015-7321-821730ef5232@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4] tests/qtest: netdev: test stream and dgram backends
In-Reply-To: <7d93db4d-5273-e015-7321-821730ef5232@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 04/01/2023 21.10, Laurent Vivier wrote:
> On 1/4/23 19:37, Thomas Huth wrote:
>> On 03/01/2023 12.00, Laurent Vivier wrote:
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>
>>> Notes:
>>>      v4:
>>>        - rework EXPECT_STATE()
>>>        - use g_dir_make_tmp()
>>>      v3:
>>>      - Add "-M none" to avoid error:
>>>        "No machine specified, and there is no default"
>>>      v2:
>>>      - Fix ipv6 free port allocation
>>>      - Check for IPv4, IPv6, AF_UNIX
>>>      - Use g_mkdtemp() rather than g_file_open_tmp()
>>>      - Use socketpair() in test_stream_fd()
>>>      v1: compared to v14 of "qapi: net: add unix socket type support to 
>>> netdev backend":
>>>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
>>>
>>>   tests/qtest/meson.build     |   2 +
>>>   tests/qtest/netdev-socket.c | 434 ++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 436 insertions(+)
>>>   create mode 100644 tests/qtest/netdev-socket.c
>>
>> FYI, the test also does not work on FreeBSD. It hangs on both, FreeBSD 12 
>> and 13:
>>
>>   https://cirrus-ci.com/task/5024964768694272?logs=build#L6937
>>
>>   https://cirrus-ci.com/task/5379344567107584?logs=build#L6938
> 
> Thanks.
> 
> Are you sure it's this test?

Since it's hanging at the same spot in both jobs, I'm pretty sure, yes.

> The "/netdev/stream/inet/ipv6" seems to be the last one of the series (if I 
> compare with previous machines) and it is OK in the logs.
> 
> I don't understand where it can hang as we have an internal 5 seconds 
> timeout (in EXPECT_STATE()).
> 
> And I don't understand why we have only /netdev/stream tests and no 
> /netdev/dgram tests.
> 
> Is it possible to have more details?

You can reproduce the issue locally on a KVM-enabled Linux box by running:

  make vm-build-freebsd J=4 TARGET_LIST=loongarch64-softmmu \
   BUILD_TARGET=check-qtest EXTRA_CONFIGURE_OPTS=--enable-werror \
   DEBUG=1

And if I'm running the test manually there, I get this error message:

qemu-system-loongarch64: -netdev 
stream,id=st0,server=true,addr.type=unix,addr.path=/tmp/netdev-socket.8JXDY1/stream_unix_abstract,addr.abstract=on: 
Parameter 'addr.abstract' is unexpected

Looking at qapi/sockets.json, the "abstract" parameter is only available 
with CONFIG_LINUX, so this cannot work on FreeBSD, indeed. Maybe it should 
be switched to CONFIG_POSIX? Otherwise you need to check for Linux in your 
qtest, I think.

  HTH,
   Thomas


