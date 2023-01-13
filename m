Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E966A109
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:47:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNzv-0005Xq-41; Fri, 13 Jan 2023 12:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGNzh-0005Rd-Uo
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:37:43 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGNzf-0006Ce-DT
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:37:33 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so17896952wms.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sS5wOZzGGqVRGViyb2fr1sRCayFiTX99w33v51AHxcg=;
 b=i703UCg06KwuYVOsM25fqQ3yPWcH7wnPcHPyXSROTmnORO5bWgw4hKehjVhLKGExhI
 gQwUAU1Nyub3g1AYR7Q8GZJh4x8zBfTwCzbHXAMn7V2y2wfbXhMc7HvC5EigNxzMI3g+
 EVfRph5EDTkYhVefXx1SGvxKFGmmIggMx5LdlLWzw2Zki4Eqn9hS4oLQIalfyoZCBKDY
 mdKi0Up2NkgDx6ycvri14vCY8JTH/mTc/vzhDrd5WskuQ1Wgf8Vh2Y6ReNp0bQ0KHa2N
 MuD1qriCg7gYb8+4YK4lX8WPvmOGYhwhhkokPjf3dR0wFCJRAjYrTuD5EtySq5zOzng7
 Y7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sS5wOZzGGqVRGViyb2fr1sRCayFiTX99w33v51AHxcg=;
 b=0JG5QTA3Y8F0AVGsE7ahtYPFO7H8T5e29NB4Gqx5DsVwA7ZmglBNscqscnhS7sLPD7
 ou2bOpTvMCkjmCjeNO/aArBG8ww8qYbEiSzPNJhTZFLJFcapgw/1PUui9rTG9GBTJRlC
 j9MzHPliiB2c0eRWu8IxghqdXSGeO2XXmD/X6jtCbvGNB0XNwTujm5zQsQbKQdjvS8Wa
 +8+KnlPkf8xpjDnSAO2Erv+V/qkBVzWxTyOOfYysxUwYWhq4DqtLWXcu2HiW31R6boSF
 sslT7JnnkefJYDGL0i4jzqYITEv3y/Ns5ruAaESmgvfVJYrjFpMZvm8mWsFUCjqA2EBK
 +VmA==
X-Gm-Message-State: AFqh2krang3zThWe7wza1bThlzedUAXgM7420lx3GF+kQHetDE3tX6AP
 XUzCOcKS8U/XTiH9ZTiZd/CWow==
X-Google-Smtp-Source: AMrXdXvE+ucE7Fa/6tmBlVU/E0Ry7sGhEc2DoV6Pj5kv/C/2LPauqYT8X+otmMFnhELvIwczmZup4g==
X-Received: by 2002:a7b:c3c6:0:b0:3d2:3376:6f37 with SMTP id
 t6-20020a7bc3c6000000b003d233766f37mr58714022wmj.10.1673631449297; 
 Fri, 13 Jan 2023 09:37:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s23-20020a1cf217000000b003d1e3b1624dsm29940080wmc.2.2023.01.13.09.37.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 09:37:28 -0800 (PST)
Message-ID: <7d234180-3519-2dde-39f8-daf1f15bc4e2@linaro.org>
Date: Fri, 13 Jan 2023 18:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] qcow2: Fix theoretical corruption in store_bitmap()
 error path
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, aesteve@redhat.com,
 nsoffer@redhat.com, qemu-devel@nongnu.org
References: <20230112191454.169353-1-kwolf@redhat.com>
 <20230112191454.169353-2-kwolf@redhat.com>
 <d13c9ba1-84df-dbac-adc5-8ea8b4df2dbe@linaro.org>
 <Y8E2S0sQgEPkb0j3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8E2S0sQgEPkb0j3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 13/1/23 11:45, Kevin Wolf wrote:
> Am 13.01.2023 um 08:30 hat Philippe Mathieu-Daudé geschrieben:
>> On 12/1/23 20:14, Kevin Wolf wrote:
>>> In order to write the bitmap table to the image file, it is converted to
>>> big endian. If the write fails, it is passed to clear_bitmap_table() to
>>> free all of the clusters it had allocated before. However, if we don't
>>> convert it back to native endianness first, we'll free things at a wrong
>>> offset.
>>>
>>> In practical terms, the offsets will be so high that we won't actually
>>> free any allocated clusters, but just run into an error, but in theory
>>> this can cause image corruption.
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>>> ---
>>>    block/qcow2-bitmap.c | 5 +++--
>>>    1 file changed, 3 insertions(+), 2 deletions(-)

>> Maybe add a comment here remembering to bswap back to native endianness?
>>
>>> -static inline void bitmap_table_to_be(uint64_t *bitmap_table, size_t size)
>>> +static inline void bitmap_table_bswap_be(uint64_t *bitmap_table, size_t size)
>>>    {
>>
>> This function uses cpu_to_be64(), semantically we convert back calling
>> be64_to_cpu(), but technically both functions end up being the same.
> 
> Yes, but we don't seem to have any public "neutral" functions, it's
> always either from or to.
> 
>> Alternatively:
>>
>>       for (i = 0; i < size; ++i) {
>> -        bitmap_table[i] = cpu_to_be64(bitmap_table[i]);
>> +        bswap64s(&bitmap_table[i]);
>>       }
> 
> Doesn't that swap even on big endian hosts, resulting incorrectly in a
> little endian table?

Oops yes you are right... sorry!

> The closest thing we have that I can see is the be_bswap() macro in
> bswap.h, but it's undefined again at the end of the header.

Indeed.

Regards,

Phil.

