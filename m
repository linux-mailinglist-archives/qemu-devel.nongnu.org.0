Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA16567B2E9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:03:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKeje-0006NF-2U; Wed, 25 Jan 2023 07:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKejc-0006Mt-JY
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:18:36 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKeja-00007x-KF
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:18:36 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so1146792wms.4
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 04:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3sEN5kbOw+2jZmdBXHhxE/xNu6E2VOYJgZaT+5A393Y=;
 b=PeEaBvn1A+CuZOOl384nszACPDSoESPoZNyEc3XHj2jPL9ksAdJ9NJZ7gyxtjLFxxP
 JoMEqQopYMPYXppJDiitUGoSUFsB+RMuQvWWk8XLmZnOB2N48eaVIkDhmrPRGhI5JmCz
 pjUjQw2XAvHy8UPCuBsGAQrWpVurk/Vs+Q5ZDJCThXkuefhKNthEjWlZz+vAMQV+KPlZ
 FPHDnv2R1YBJ0GgxcMKi82MMQxvG5Gd3MrhFRkwz/D4Zw5ls/JTbAD9Uz/cUmS7vYVeZ
 yi2R0V7YlAl0DWVEc8uwFtZvAYKTFaGurybkSQ042FdwZIUEQl/+1fRYLhHtJY6SXq6k
 quCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3sEN5kbOw+2jZmdBXHhxE/xNu6E2VOYJgZaT+5A393Y=;
 b=oJTQcJ7uL/OQdynXDiRfCuzXXNci52DjIRXG6EpLZ615Le8Onj7/Pe6VQ/8VaZY0By
 VPQ7NhQcN15ZpAoxpRb1aGDS45KNQERYYWbSHleaAIxsTnA+TOXBWVJ5xMkk3/e8IJ6r
 iqk/AgAktno9q38qcPH4QQslst7EiPy92dp1/ZcwYew8tvV4Qnax2B2qhTlUIseEUYMM
 DF3YeXs4Ql8ycw2MTYJDQQZZUA/3aBTq7EmzkrPG2uwmUWZ2aLrBpMpsQs8AILTWJ2AN
 4vIhKfzIbuStuD+ptYA3RRYIN4PBLYqOqZ0xc7MatVF2ZsN8AOvEvbCVD7qJgYW0/A9i
 p4Eg==
X-Gm-Message-State: AFqh2koc9+qHfkmz3YpaKa2McUTrVnP+Gu9OxqaMUuqH46H4VmyiYvdE
 3eiwzhnPhsHJjLce/V+c0J9giA==
X-Google-Smtp-Source: AMrXdXt7XkHFK1LEuV+HW/WcP62139yPIHwOM54QfkhWj0JHlHdg1E0en53gD9xbVxcOEu3MWDSEkQ==
X-Received: by 2002:a05:600c:4d98:b0:3d3:5c7d:a5f3 with SMTP id
 v24-20020a05600c4d9800b003d35c7da5f3mr39226897wmp.37.1674649112918; 
 Wed, 25 Jan 2023 04:18:32 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a05600c4c1800b003db0cab0844sm1603947wmp.40.2023.01.25.04.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 04:18:32 -0800 (PST)
Message-ID: <8c21fc0a-de49-60e3-60b1-bd9f805e3d5f@linaro.org>
Date: Wed, 25 Jan 2023 13:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 20/35] docs: add a new section to outline emulation
 support
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-21-alex.bennee@linaro.org>
 <f21ac8e6-911f-b156-18ff-3929d89ba3d1@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f21ac8e6-911f-b156-18ff-3929d89ba3d1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 25/1/23 08:58, Thomas Huth wrote:
> On 24/01/2023 19.01, Alex Bennée wrote:
>> This affects both system and user mode emulation so we should probably
>> list it up front.
>>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>    - HPs -> HP's
>>    - MIPs-like -> MIPS-like
>> ---
>>   docs/about/emulation.rst      | 103 ++++++++++++++++++++++++++++++++++
>>   docs/about/index.rst          |   1 +
>>   docs/devel/tcg-plugins.rst    |   2 +
>>   docs/system/arm/emulation.rst |   2 +
>>   4 files changed, 108 insertions(+)
>>   create mode 100644 docs/about/emulation.rst
>>
>> diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
>> new file mode 100644
>> index 0000000000..bdc0630b35
>> --- /dev/null
>> +++ b/docs/about/emulation.rst
>> @@ -0,0 +1,103 @@
>> +Emulation
>> +=========
>> +
>> +QEMU's Tiny Code Generator (TCG) gives it the ability to emulate a
> 
> I'd maybe rather say "provides" instead of "gives it".
> 
>> +number of CPU architectures on any supported platform. Both
> 
> I'd maybe add a "host" between "supported" and "platform.
> 
>> +:ref:`System Emulation` and :ref:`User Mode Emulation` are supported
>> +depending on the guest architecture.
>> +
>> +.. list-table:: Supported Guest Architectures for Emulation
>> +  :widths: 30 10 10 50
>> +  :header-rows: 1
>> +
>> +  * - Architecture (qemu name)
>> +    - System
>> +    - User-mode
> 
> Maybe just use "User" instead of "User-mode" to make the column smaller?
> 
>> +    - Notes
>> +  * - Alpha
>> +    - Yes
>> +    - Yes
>> +    - Legacy 64 bit RISC ISA developed by DEC
>> +  * - Arm (arm, aarch64)
>> +    - Yes
>> +    - Yes
>> +    - Wide range of features, see :ref:`Arm Emulation` for details
>> +  * - AVR
>> +    - Yes
>> +    - No
>> +    - 8 bit micro controller, often used in maker projects
>> +  * - Cris
>> +    - Yes
>> +    - Yes
>> +    - Embedded RISC chip developed by AXIS
>> +  * - Hexagon
>> +    - No
>> +    - Yes
>> +    - Family of DSPs by Qualcomm
>> +  * - PA-RISC (hppa)
>> +    - Yes
>> +    - Yes
>> +    - A legacy RISC system used in HP's old minicomputers
>> +  * - x86 (i386, x86_64)
>> +    - Yes
>> +    - Yes
>> +    - The ubiquitous desktop PC CPU architecture, 32 and 64 bit.
>> +  * - Loongarch
>> +    - Yes
>> +    - Yes
>> +    - A MIPS-like 64bit RISC architecture developed in China
>> +  * - m68k
>> +    - Yes
> 
> Would it be possible to link the "Yes" entries in the "System" column to 
> corresponding target-*.rst files? E.g. docs/system/target-m68k.rst for 
> the m68k entry?
> 
>> +    - Yes
>> +    - Motorola 68000 variants and ColdFire
>> +  * - Microblaze
>> +    - Yes
>> +    - Yes
>> +    - RISC based soft-core by Xilinx
>> +  * - MIPS (mips, mipsel, mips64, mips64el)
> 
> The table renders very badly for me, the last column is cut off and you 
> need to scroll to see its contents. This seems mainly to happen since 
> this MIPS entry is very long. Could the information in the parentheses 
> maybe be shortened to "(mips*)" or be dropped completely?

Or "32 and 64 bit".


