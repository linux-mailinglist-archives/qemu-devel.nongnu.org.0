Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B653B611262
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:10:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooP6w-00080F-LA; Fri, 28 Oct 2022 09:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooP6p-0007vP-BN
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:09:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooP6m-000356-Tr
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666962551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdmjUOJsdfzjM+cmOtrrwlf0YQoPw/QoAAGf/wOMRVE=;
 b=IBpf6lBOaQrKZImOcprYGBgssajC+lprNPGKDGAWTpXf/g/rnBHlyCeMiwOnFq65McGvX0
 +EbF2WFoqH9Py+IlEQz2+QGX3s0w4wW7v+uyjVRpWt5Q63+7MVPYmk6jpNeE7qyF3cQ3eS
 xKY+dluXfXv425+KLh0Z14qmN3Z3PxU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-CXzdyhrcPIu9-HF3rmj7XA-1; Fri, 28 Oct 2022 09:09:10 -0400
X-MC-Unique: CXzdyhrcPIu9-HF3rmj7XA-1
Received: by mail-wm1-f69.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso2356502wms.1
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdmjUOJsdfzjM+cmOtrrwlf0YQoPw/QoAAGf/wOMRVE=;
 b=dXVY8cP/fJPiliU8d4bW9lfM47GDku79IPp+3yYO3LUI1RFPKCxl4+sPrp/76Jq4g4
 UFO6ubx2JOr4tUrfjmAU8NDsD2s2y/vf+Dlg+MAxp8DM5XodnC6JK+TPgmrdtfcBJxZX
 wJTlT5KMPi7Z2ES32naUrgkg9ZAS4EE0tlttQCfi/jJQZYE+q2ZE57njlJynCP6DSEZD
 xDpV9E2eXZm0jNWaLslB/WGXth0i1Etqnb1nF/5I1ZtD/lcvio6Hxupp8UWT3Y2QGSq+
 IMGpaD9BxvZ9vGTZ2p0QTbQJcqxGZTFCPOOSZF7EEACZxH3eVsXtchZQf6aywoVRSXG6
 jTFA==
X-Gm-Message-State: ACrzQf27McP/ugAWxFiMhhXN23FeovNTWCNkdTfC8/2eqW88kiaBKCP5
 CV003Png1LGQnk6x0D17gqJY5+ke7J/ZQVnNO7aoP24roCimY+VrP1jf+CgnC576SnnJAmfi5IT
 dRZfQlbft+c+8OzE=
X-Received: by 2002:a05:6000:1052:b0:236:6e8e:8403 with SMTP id
 c18-20020a056000105200b002366e8e8403mr18352004wrx.178.1666962549210; 
 Fri, 28 Oct 2022 06:09:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6MvKx2tmGN5q3Mkf+6W1egmGATQwCOMMwiA9W6Rlvv0UisTJGK/j+7EBwfkg8z3cYMeDccnA==
X-Received: by 2002:a05:6000:1052:b0:236:6e8e:8403 with SMTP id
 c18-20020a056000105200b002366e8e8403mr18351972wrx.178.1666962548836; 
 Fri, 28 Oct 2022 06:09:08 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d654e000000b00226dba960b4sm3643950wrv.3.2022.10.28.06.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 06:09:08 -0700 (PDT)
Message-ID: <552d9669-9db8-08e1-5931-644ec4c12c07@redhat.com>
Date: Fri, 28 Oct 2022 15:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 08/11] tests/qtest: libqos: Do not build virtio-9p
 unconditionally
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-9-bin.meng@windriver.com> <5007365.dktPthMeyv@silver>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <5007365.dktPthMeyv@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 14.59, Christian Schoenebeck wrote:
> On Friday, October 28, 2022 6:57:33 AM CEST Bin Meng wrote:
>> At present the virtio-9p related codes are built into libqos
>> unconditionally. Change to build them conditionally by testing
>> the 'virtfs' config option.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> ---
>>
>> Changes in v6:
>> - new patch: "test/qtest/libqos: meson.build: Do not build virtio-9p unconditionally"
>>
>>   tests/qtest/libqos/meson.build | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
>> index 113c80b4e4..32f028872c 100644
>> --- a/tests/qtest/libqos/meson.build
>> +++ b/tests/qtest/libqos/meson.build
>> @@ -33,8 +33,6 @@ libqos_srcs = files(
>>           'sdhci.c',
>>           'tpci200.c',
>>           'virtio.c',
>> -        'virtio-9p.c',
>> -        'virtio-9p-client.c',
>>           'virtio-balloon.c',
>>           'virtio-blk.c',
>>           'vhost-user-blk.c',
>> @@ -62,6 +60,10 @@ libqos_srcs = files(
>>           'x86_64_pc-machine.c',
>>   )
>>   
>> +if have_virtfs
>> +  libqos_srcs += files('virtio-9p.c', 'virtio-9p-client.c')
>> +endif
>> +
>>   libqos = static_library('qos', libqos_srcs + genh,
>>                           name_suffix: 'fa',
>>                           build_by_default: false)
>>
> 
> I wondered why this change would no longer execute the 9p tests here.
> Apparently because it changes the order of tests being executed, i.e. 9p tests
> would then be scheduled after:
> 
>    # Start of vhost-user-blk-pci tests
>    # Start of vhost-user-blk-pci-tests tests
>    Environment variable QTEST_QEMU_STORAGE_DAEMON_BINARY required
>    [EXIT]
> 
> and I never cared about QEMU storage binary. Can we make a hack like the
> following to not change the order of the tests?
> 
> diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
> index 32f028872c..389bca9804 100644
> --- a/tests/qtest/libqos/meson.build
> +++ b/tests/qtest/libqos/meson.build
> @@ -1,7 +1,13 @@
>   libqos_srcs = files(
>           '../libqtest.c',
>           '../libqmp.c',
> +)
>   
> +if have_virtfs
> +  libqos_srcs += files('virtio-9p.c', 'virtio-9p-client.c')
> +endif
> +
> +libqos_srcs += files(
>           'qgraph.c',
>           'qos_external.c',
>           'pci.c',
> @@ -60,10 +66,6 @@ libqos_srcs = files(
>           'x86_64_pc-machine.c',
>   )
>   
> -if have_virtfs
> -  libqos_srcs += files('virtio-9p.c', 'virtio-9p-client.c')
> -endif
> -
>   libqos = static_library('qos', libqos_srcs + genh,
>                           name_suffix: 'fa',
>                           build_by_default: false)
> 
> Too ugly?

Looks a little bit ugly, indeed. What about marking the vhost-user-blk-pci 
test as skipped instead of exiting? (i.e. use g_test_skip() instead of 
exit()). Would that work for you?

  Thomas


