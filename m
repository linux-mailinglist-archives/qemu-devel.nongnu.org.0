Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4365DC45
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 19:37:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD8da-0000HT-K6; Wed, 04 Jan 2023 13:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD8dY-0000DX-Ez
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pD8dW-0002iW-1X
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 13:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672857433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5M7qrvKxfR1adQHKbRpDifP6Ir1l4/dEx8uOqEm3Ec=;
 b=A51aRHjKC2LgXpgnSFy20p0+e1m/LTq6ObGO7Q0i8XO2bE5GRaIDw+g/evU4IKwBz0wryz
 0mbnzcMHGWjJYWK0CBEta2lrzV6rAwAGz005wFs5Ug6j2swpkV0/ykrIsb0MBAvOmyk74e
 C7MRVRnAitiNsUukrkqq5EAXr0GTFBs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-fvmluxVPNuGMqWNTP6I6HA-1; Wed, 04 Jan 2023 13:37:11 -0500
X-MC-Unique: fvmluxVPNuGMqWNTP6I6HA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h24-20020adfaa98000000b0028abfe5b8d9so2319884wrc.2
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 10:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B5M7qrvKxfR1adQHKbRpDifP6Ir1l4/dEx8uOqEm3Ec=;
 b=Htu9cAGFcUZk8liCY+KVp6CPMU4nvRD/8FqpdBvj/IioUddl45Kcbbox4SQJysDPEz
 V7N/YG+oWJTPvfi4rwl/fAaXEoqsWGHwDdtUjN0EUuS9HeyWojAtzI/M0wRJQVYug/Fs
 X9TIpBP2Bhj/M8qew7PkIubd0WL3zjjIx5GQSOOI8bYr/iXpb1R0EuXe8Luj7loO/+aR
 nSOYbUmYyFsDz88mn5D/2vCybEAYgb9hGHJa2O1dt14eMWUlugullmfsEiBt7CNDq3+H
 iE5RCwa9x0xOOT8HBuI4ONId9/mnrsxZYHrvErZ+svBjGIjJkxLw4Rzq4uhnYp2Y4KKq
 ydSw==
X-Gm-Message-State: AFqh2ko720+kY/do4AMcu8eYazmqcskRvvtrIHnJcPWQ+ethUHX/D5/2
 mupL0E9T16UYPz2RglVVfsw5lUj9zugLOOAUeei5PQdhDlaPan7UkdunYFW5VYXzzN5E0/HPBW8
 uxZYUARecC3S6wWY=
X-Received: by 2002:a05:600c:1503:b0:3d0:8722:a145 with SMTP id
 b3-20020a05600c150300b003d08722a145mr33484974wmg.40.1672857430735; 
 Wed, 04 Jan 2023 10:37:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuYdGJFSibxTzmakg1riOpIseKZyz1NAe3dXilrHjKgzo+6A8rCZCxrOcGDdd9JpcoaS5u2MQ==
X-Received: by 2002:a05:600c:1503:b0:3d0:8722:a145 with SMTP id
 b3-20020a05600c150300b003d08722a145mr33484963wmg.40.1672857430534; 
 Wed, 04 Jan 2023 10:37:10 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-194.customers.d1-online.com.
 [80.187.99.194]) by smtp.gmail.com with ESMTPSA id
 i25-20020a1c5419000000b003c6c182bef9sm60616749wmb.36.2023.01.04.10.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 10:37:10 -0800 (PST)
Message-ID: <ebe2ba95-ef47-0506-d264-303b5a75f58b@redhat.com>
Date: Wed, 4 Jan 2023 19:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230103110049.120340-1-lvivier@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230103110049.120340-1-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 03/01/2023 12.00, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Notes:
>      v4:
>        - rework EXPECT_STATE()
>        - use g_dir_make_tmp()
>      
>      v3:
>      - Add "-M none" to avoid error:
>        "No machine specified, and there is no default"
>      
>      v2:
>      - Fix ipv6 free port allocation
>      - Check for IPv4, IPv6, AF_UNIX
>      - Use g_mkdtemp() rather than g_file_open_tmp()
>      - Use socketpair() in test_stream_fd()
>      
>      v1: compared to v14 of "qapi: net: add unix socket type support to netdev backend":
>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
> 
>   tests/qtest/meson.build     |   2 +
>   tests/qtest/netdev-socket.c | 434 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 436 insertions(+)
>   create mode 100644 tests/qtest/netdev-socket.c

FYI, the test also does not work on FreeBSD. It hangs on both, FreeBSD 12 
and 13:

  https://cirrus-ci.com/task/5024964768694272?logs=build#L6937

  https://cirrus-ci.com/task/5379344567107584?logs=build#L6938

   Thomas


