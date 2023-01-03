Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B865C232
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 15:48:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCiZa-0004sb-91; Tue, 03 Jan 2023 09:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pCiZF-0004q2-Dm
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pCiZ9-0003Af-TE
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672757219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjB109TMCAKNrl0ugk0DuVn+T0Npf6q472zTyEumHR8=;
 b=dny1/37flm/jLGQB5NjyxNul+BBQv39l3qpoPL6cxvZ1HDp9372chsxh0JlN7MuJLIKTuG
 jjKHWiabfyRRvwnsLex059Ce2B6fLFujQkMO226lOc1XQIwFcwZQrB5ZCtr8AAl9PCBKVW
 lEvDORcL5uQV79YGpir2RteN4X7OmxI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-90tsffETM5uHNTDkYOTSAg-1; Tue, 03 Jan 2023 09:46:57 -0500
X-MC-Unique: 90tsffETM5uHNTDkYOTSAg-1
Received: by mail-wm1-f71.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so20155233wmq.5
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 06:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xjB109TMCAKNrl0ugk0DuVn+T0Npf6q472zTyEumHR8=;
 b=XUndOV5CQoyXHWCiYLccCWa+hOu1Mm89CTo2kwGVshOd8clTyPS0mqBosQTD+jXvYo
 V13RyXXGO4sy643rSGtUV9PI3D1LrlIX649oJCjf9jV0GuOeww6e06/6SfHe4dGv78YZ
 4GpzIuyYRjUQFA3yS29LFcAW1/lHWapZ26Xayu0tZqm3h94JHOuVeuW3KjM+x8gwycXY
 3uSqkCT5KElYoHjfQTvwXAYCfgj/kWu1iedhU0EbSp3pbRcKRM941DG8tCavUWeGfjpe
 xpxAwu/cP9Y5I1iHLGXnSkroYKl+qi/8Z8AnWSnrhXK0/TfOGsnBVOoeTpncfRLnWh5q
 ArNA==
X-Gm-Message-State: AFqh2kqeWUmc3WkVIG0TXxW7iWsfhCF/J06cqaT/DxHFgk58pIVpTt9D
 MVZUIRb0IYVj7NCAcYK4LbfpKo9/apWQ4GWwDy8SYlQ2dnC2d/n9jgHkjLmJcz7OonKJq90CHPL
 l7LYVXjmrItjKVSI=
X-Received: by 2002:a5d:6283:0:b0:278:806e:e8f8 with SMTP id
 k3-20020a5d6283000000b00278806ee8f8mr20194085wru.42.1672757216738; 
 Tue, 03 Jan 2023 06:46:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuS5DoKZXbM8Cl6qS8UJ4SrGdtNLbJ/rdZwyBwEI6+PTl5WP90c0wucw2vKMxeWkM7JwvY0tA==
X-Received: by 2002:a5d:6283:0:b0:278:806e:e8f8 with SMTP id
 k3-20020a5d6283000000b00278806ee8f8mr20194073wru.42.1672757216528; 
 Tue, 03 Jan 2023 06:46:56 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a5d4148000000b002428c4fb16asm31430922wrq.10.2023.01.03.06.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jan 2023 06:46:56 -0800 (PST)
Message-ID: <f59bd50b-abf7-88ae-7c09-e5c204e08e9a@redhat.com>
Date: Tue, 3 Jan 2023 15:46:55 +0100
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
 <b9ebccdf-5cea-a051-46e9-f88a8c59a6ef@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <b9ebccdf-5cea-a051-46e9-f88a8c59a6ef@redhat.com>
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

On 1/3/23 15:08, Thomas Huth wrote:
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
> [...]
>> +int main(int argc, char **argv)
>> +{
>> +    int ret;
>> +    bool has_ipv4, has_ipv6, has_afunix;
>> +    g_autoptr(GError) err = NULL;
>> +
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    if (socket_check_protocol_support(&has_ipv4, &has_ipv6) < 0) {
>> +        g_printerr("socket_check_protocol_support() failed\n");
>> +        goto end;
>> +    }
>> +
>> +    tmpdir = g_dir_make_tmp("netdev-socket.XXXXXX", &err);
>> +    if (tmpdir == NULL) {
>> +        g_error("Can't create temporary directory in %s: %s",
>> +                g_get_tmp_dir(), err->message);
> 
> Should there also be a "goto end" here?

No, g_error() is fatal.

https://docs.gtk.org/glib/func.error.html

> 
> Apart from that:
> Acked-by: Thomas Huth <thuth@redhat.com>
> 

Thanks,
Laurent

>> +    }
>> +
>> +    if (has_ipv4) {
>> +        qtest_add_func("/netdev/stream/inet/ipv4", test_stream_inet_ipv4);
>> +        qtest_add_func("/netdev/dgram/inet", test_dgram_inet);
>> +        qtest_add_func("/netdev/dgram/mcast", test_dgram_mcast);
>> +    }
>> +    if (has_ipv6) {
>> +        qtest_add_func("/netdev/stream/inet/ipv6", test_stream_inet_ipv6);
>> +    }
>> +
>> +    socket_check_afunix_support(&has_afunix);
>> +    if (has_afunix) {
>> +        qtest_add_func("/netdev/dgram/unix", test_dgram_unix);
>> +        qtest_add_func("/netdev/stream/unix", test_stream_unix);
>> +        qtest_add_func("/netdev/stream/unix/abstract",
>> +                       test_stream_unix_abstract);
>> +        qtest_add_func("/netdev/stream/fd", test_stream_fd);
>> +        qtest_add_func("/netdev/dgram/fd", test_dgram_fd);
>> +    }
>> +
>> +end:
>> +    ret = g_test_run();
>> +
>> +    g_rmdir(tmpdir);
>> +    g_free(tmpdir);
>> +
>> +    return ret;
>> +}
> 


