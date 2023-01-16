Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96466B92E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:41:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHL2o-00021q-7F; Mon, 16 Jan 2023 03:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHL2j-00021X-OA
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:40:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHL2h-0003kv-HI
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:40:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673858434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lPUcFxWlI8PaS+H/ENPKq/hTsNCdgHYq545jWP5Wj1w=;
 b=cGnCL1GGANUKEff4DC2ZmvPJvdkOFezEX9kQqnXrYW5PR0tWK/7XM7U4glj7Ul/TMWOBKv
 3DZYXKBA5nMPwtF8MTF6W3WaKNLGx6duGoPFcaCPKriKtzrhNlc+NA8a0T+wRQqx/7h8hr
 Wvfq4HMtY1a7Zeb7Tb1iMtBipXCvpWU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-88-4oWRjQkkPfa4InK1OCXD1w-1; Mon, 16 Jan 2023 03:40:28 -0500
X-MC-Unique: 4oWRjQkkPfa4InK1OCXD1w-1
Received: by mail-wm1-f69.google.com with SMTP id
 q19-20020a1cf313000000b003d96c95e2f9so5780190wmq.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lPUcFxWlI8PaS+H/ENPKq/hTsNCdgHYq545jWP5Wj1w=;
 b=U3GID1f0yaUBU944Ceku2Q0nOfXP+HlHRNDD5UGE8Fxh1gsWotAC+HPzMKvWqqtDJn
 YVlHpV2Q7EMvTU5PFibi5cWCMmHGSlewL9vkDj3tw8+WNXdRP1WmyKOEF4EuTsVO+eID
 mgTpdqpT/VVIF+8ly/KC802FBvVvBQB88J0kCZuuwaz4O9kioJZZUIoH7e8i5kvR2/nU
 NFTyM5Nxl1lh9JoijtrP5GU6WWlFy8eL3LaR11ZlAfxOty01gkY+iA2gRIeO00hcK47y
 POIPrBiUvmUhSb9jNfyt+6CJbAhoBlRKdzYvtuVCn5Eja4rBK0il9tg/ufXJpO0XrX2e
 wcIg==
X-Gm-Message-State: AFqh2koplGzLuXhXkOEJS1lL3NK1tEnVLUyAUjs7OE9iShG+7T6q80SS
 zDsfjtUaSYZdeLLzXUGVgyvsGRPALxUpATgoYKGpQY3ygWRj3c0+BDTkotNo/KZYvYZj9lpJinM
 G5DX6EyLp0CL6GBg=
X-Received: by 2002:a7b:c7c8:0:b0:3d7:889:7496 with SMTP id
 z8-20020a7bc7c8000000b003d708897496mr66121830wmk.17.1673858427136; 
 Mon, 16 Jan 2023 00:40:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtecehXSbObH2zihdcExN86HMiviIyqqa+NfKLMnAP4ZgYWWayYC3iwK+5Fss8W9p+aoYmoxw==
X-Received: by 2002:a7b:c7c8:0:b0:3d7:889:7496 with SMTP id
 z8-20020a7bc7c8000000b003d708897496mr66121811wmk.17.1673858426911; 
 Mon, 16 Jan 2023 00:40:26 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-109.web.vodafone.de.
 [109.43.177.109]) by smtp.gmail.com with ESMTPSA id
 he5-20020a05600c540500b003d9ed40a512sm32135636wmb.45.2023.01.16.00.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:40:26 -0800 (PST)
Message-ID: <0b29c231-da85-5302-31bc-b2e420c2b394@redhat.com>
Date: Mon, 16 Jan 2023 09:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
References: <20230105093751.416666-1-lvivier@redhat.com>
 <3d55b710-4601-4f8b-5289-72997ea09e5a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <3d55b710-4601-4f8b-5289-72997ea09e5a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/01/2023 09.29, Laurent Vivier wrote:
> ping
> 
> On 1/5/23 10:37, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>
>> Notes:
>>      v5:
>>        - disable test_stream_fd and  test_dgram_fd on windows as socketpair()
>>          is not defined.
>>        - enable test_stream_unix_abstract only on linux as "abstract"
>>          unix socket parameter is only defined on linux.
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
>>      v1: compared to v14 of "qapi: net: add unix socket type support to 
>> netdev backend":
>>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
>>
>>   tests/qtest/meson.build     |   2 +
>>   tests/qtest/netdev-socket.c | 444 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 446 insertions(+)
>>   create mode 100644 tests/qtest/netdev-socket.c

Acked-by: Thomas Huth <thuth@redhat.com>

I'll queue it for my next pull request (unless someone else wants to take 
this first)


