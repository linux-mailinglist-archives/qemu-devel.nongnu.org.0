Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF26A65D76A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 16:43:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD5tk-00026J-0D; Wed, 04 Jan 2023 10:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5tg-00025q-Q6
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:41:45 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD5te-0000Mh-QE
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 10:41:44 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so29827335wma.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eMoXveFguVZpgHC4LvYzLBOPpEPLS3xQxWNrPAfxLVk=;
 b=FzlLgAMrMbaieh7Tswv4955BXy8LhpTpr61oMu0Ha9h7JkosFqxqC6fWlE0h/NImVR
 hetlmZMfCys8Xln2C6WBsWjDHRBXksI8C4raIH3ggZCxCwJpKpcUiBhWpTpurjVqQOeA
 e1Fswo9QI1RPuxedFusHueIBN52q2y0CbCKALS7JgUSxvtRh9ltH34a21Sn1V1PvKo0F
 dB4u9gN3j0OHXLyGfdrU4UMR5cBumxQTsUmHHIhE4Bl2Rdnw58s66q+VlTCSgUMvw3bU
 vPPln3e/TRgeh6CKCWKLwvXvWUmskDOo5Iu2PG4Zr54wdoRUajKEK25l/XKqLcY2SFfZ
 8wZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eMoXveFguVZpgHC4LvYzLBOPpEPLS3xQxWNrPAfxLVk=;
 b=otQR1E5Ev1OGtJdkLslw+x8vFKfdeKeUZsc6/7HYcrWTcdwOt0hchZCJ0gRLJEy+wo
 v5zb+I/WqFfIzHBpM8+5HFGzOjKgZz0GzBojqdAI/l+65l1NUhS0qKnFz8txXij699T2
 6N2dkDflidVlZKT1bYhdpl0Flw60ZMWISM81yyHj3qDK+HXx2PE9F0+jRFp2W0fvG+8w
 fjST8TOYX7Bq71TNwcc7OPs3/GjI6HFTGqJ+5LKYDxPyFf86Z0dNw9hS+4KBlrEMboG9
 6LxR8iNGb4RiDgdEPnNm7AtI/W78UvIdZ9jDr/yOhIUSiuM5v/C/rIhpIRgTzf5+4cUW
 uKXA==
X-Gm-Message-State: AFqh2kpOe6lO2jdPD2N+sf6dylY51zg6kg9Z/zeCjCCrVdHd3Fhds0jE
 uM5JNryjCVeP0+sBFnTqk1iWqA==
X-Google-Smtp-Source: AMrXdXuYQMAHWREGwMXwXKsgTrNuRSNqWT4f1YMXZI+tTaqDpUsqXScbDSTRtHhuqJ/GoQj2BJVskw==
X-Received: by 2002:a7b:c38e:0:b0:3d3:4ca9:240 with SMTP id
 s14-20020a7bc38e000000b003d34ca90240mr38245037wmj.33.1672846900383; 
 Wed, 04 Jan 2023 07:41:40 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i18-20020adff312000000b0024274a5db0asm34721172wro.2.2023.01.04.07.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:41:39 -0800 (PST)
Message-ID: <71ecaaa7-b931-618c-4fc8-b6939c2cbdd3@linaro.org>
Date: Wed, 4 Jan 2023 16:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20230103110049.120340-1-lvivier@redhat.com>
 <410624e6-7547-8d38-9c05-dc2b51d29221@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <410624e6-7547-8d38-9c05-dc2b51d29221@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 4/1/23 15:38, Thomas Huth wrote:
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
>>      v1: compared to v14 of "qapi: net: add unix socket type support 
>> to netdev backend":
>>      - use IP addresses 127.0.0.1 and ::1 rather than localhost
>>
>>   tests/qtest/meson.build     |   2 +
>>   tests/qtest/netdev-socket.c | 434 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 436 insertions(+)
>>   create mode 100644 tests/qtest/netdev-socket.c
> [...]
>> +static void test_stream_fd(void)
>> +{
>> +    QTestState *qts0, *qts1;
>> +    int sock[2];
>> +    int ret;
>> +
>> +    ret = socketpair(AF_LOCAL, SOCK_STREAM, 0, sock);
> 
> I've put your patch into my queue, but this seems to fail on Windows:
> 
>   https://cirrus-ci.com/task/4869069434781696?logs=main#L6562
> 
> Seems like socketpair() does not exist there?

There is qemu_socketpair() and since yesterday available
on win32:
https://lore.kernel.org/qemu-devel/20230103110814.3726795-7-marcandre.lureau@redhat.com/


