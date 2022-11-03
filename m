Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA593617BC0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:39:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqYIt-0001MC-21; Thu, 03 Nov 2022 07:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oqYIS-0001IR-25
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oqYIP-0004Rh-TO
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:22:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667474524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ux3m9Pk64tq6UdkJ4I6mb58Aa13yWuk+ekJZSNfZ/b4=;
 b=P1fTbKrNz7LT/pAy2yXin2E+x3+gtt8D1ZWwyt3OldcF5shlDUczY2msADKcEK+ljJhV9K
 9dPVFSqjMKAtTZOafzegkU/0wS1DZiCLmsAPUbPaqoL4ePQeztuGZBHvVgV28mWgvUZVgO
 X/CgBu+9n4DZJUhzp+JZN0MhT7YcJ1c=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-313-lgL-0anYPzmOkTmKDYVvYQ-1; Thu, 03 Nov 2022 07:22:00 -0400
X-MC-Unique: lgL-0anYPzmOkTmKDYVvYQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 j13-20020a05620a288d00b006be7b2a758fso1718966qkp.1
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 04:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ux3m9Pk64tq6UdkJ4I6mb58Aa13yWuk+ekJZSNfZ/b4=;
 b=B8R1w9JwK2znoM1PMHKdu7H/HWp0I7fwc/Iyx+Te0qd1Le7DTYUQJ0Ddw/EAmmGdTQ
 e9i6fHzGn4vu8n292Tos+3aDG/fOlR/ppcmwd+4hDnzrUyhkOMx/SNsRoWNXe/pt66Ma
 VKnG089JTeP2TKozmSsZlbvPMk7mGQaubd0reJXq7z4cYREuTvZAlvcoA0CqzwUiTwFE
 WEJ5jkTnRZYs9hclZEML9bhU9h2/qUzXlTkQJMAB4gb1Fp1R0wvz5DtIRTY/sntVUvVR
 xt2l5XzXJuOIXv51LwnRvHsf6kVWZ4ub2u9zU22QrqaFr24ZXYQvX6CA5f82yNOR8PYp
 WUZw==
X-Gm-Message-State: ACrzQf2tUIgMQTQmJkWtOyhTTqVtLnsgCYyKmxN3K1Ltfdcl7+5loftE
 r9wnVtFFEHH5iGkevihg4FPnGCVUClHNUG0OWNQKyUCPzjMvUk92ocheekSePqA1WopOcPil0i/
 UpDbQ6lMGdec9Dwc=
X-Received: by 2002:a05:620a:414d:b0:6ee:e31f:6253 with SMTP id
 k13-20020a05620a414d00b006eee31f6253mr21624288qko.350.1667474519858; 
 Thu, 03 Nov 2022 04:21:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4gKGp5Esn4q08oqlevXnjWnv1AM/gAdKIVaBYMoJfq1kW9W2Rn8Rhkj6rgw0J/XOHyiE3bVw==
X-Received: by 2002:a05:620a:414d:b0:6ee:e31f:6253 with SMTP id
 k13-20020a05620a414d00b006eee31f6253mr21624267qko.350.1667474519626; 
 Thu, 03 Nov 2022 04:21:59 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac85192000000b0035bafecff78sm327917qtn.74.2022.11.03.04.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:21:59 -0700 (PDT)
Message-ID: <bdd5dcce-10df-6f08-8ed4-b4e994fdc336@redhat.com>
Date: Thu, 3 Nov 2022 12:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v14 16/17] tests/qtest: netdev: test stream and dgram
 backends
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-17-lvivier@redhat.com>
 <700ef645-6cb6-66e6-00a9-3db187be0c43@redhat.com>
 <0fd82709-7612-25e0-66c0-d9494931d8c4@redhat.com>
 <e6aa73fb-f5e3-b24c-b963-b66849c9925f@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <e6aa73fb-f5e3-b24c-b963-b66849c9925f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 12:07, Philippe Mathieu-Daudé wrote:
> On 3/11/22 10:33, Laurent Vivier wrote:
>> On 10/28/22 07:04, Jason Wang wrote:
>>>
>>> 在 2022/10/21 17:09, Laurent Vivier 写道:
>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>
>>>
>>> I got this:
>>>
>>> 63/63 ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: assertion failed 
>>> (resp == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: 
>>> index=0,type=stream,tcp:::1:40389\r\n") ERROR
>>> 63/63 qemu:qtest+qtest-x86_64 / qtest-x86_64/netdev-socket                  ERROR 5.29s 
>>> killed by signal 6 SIGABRT
>>>  >>> QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-x86_64 
>>> MALLOC_PERTURB_=96 
>>> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
>>> G_TEST_DBUS_DAEMON=/home/devel/git/qemu/tests/dbus-vmstate-daemon.sh 
>>> /home/devel/git/qemu/build/tests/qtest/netdev-socket --tap -k
>>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀ 
>>> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>> stderr:
>>> **
>>> ERROR:../tests/qtest/netdev-socket.c:139:test_stream_inet_ipv6: assertion failed (resp 
>>> == expect): ("st0: index=0,type=stream,connection error\r\n" == "st0: 
>>> index=0,type=stream,tcp:::1:40389\r\n")
>>>
>>> (test program exited with status code -6)
>>
>> I'm not able to reproduce the problem.
>>
>> Is this 100% reproducible?
>> Is IPv6 enabled on your test machine?
> 
> If IPv6 is not available, this test should be skipped, not failing.

I agree.
But I'm not sure it's the real cause of the problem (perhaps a firewall problem?).

I think I should update my inet_get_free_port_socket() to get a free port from AF_INET6 
and not only from AF_INET.

Thanks,
Laurent


