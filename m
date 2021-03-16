Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0533D7FA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:46:34 +0100 (CET)
Received: from localhost ([::1]:35794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBtx-0004rx-8N
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBrS-0003qo-Um
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:44:00 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:39746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBrQ-0007Si-Av
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:43:58 -0400
Received: by mail-qt1-x830.google.com with SMTP id g24so11957356qts.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FGfdu+qtv00J41gHVkdYK6qmI9p6QN8VLuudZd/Cznc=;
 b=y3stpF7k5uC2q8UkPU2lg+efBs1UI04tJBfzF9iso4GJx7YiD+s4elK447CZjlTb05
 Cul0RupJ/Vl4/u4s+NZDbOV4yUB0hwDOsrwXGuu1govYkKRgPvsCuahk0QXXa6pySPZJ
 Pf3TpmVhmDUndrA98fh1JTZQgRBUZxsXSqlNChT0wLI/oyfpiNG6fC6ZwelDOT6J7nAw
 Pi1w9D4FH3ArMOxeuFmQ/h4oItWIyR0B/sEwBZ2jSlN//ZizHo592ZtrIXZPCfPK9ymj
 gjUWdrlhkYbc1k0taaaqU+56b9QilwWTqSjqTKfP8loeBFJfv00TeFwLA6dzHq3MPMkR
 l5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FGfdu+qtv00J41gHVkdYK6qmI9p6QN8VLuudZd/Cznc=;
 b=XKywTS7mKvExsRHBpwWq4o7pGvWlN2Fr9afK87ugilIi47k5vHsJ3QYVS8ZgOhVFHr
 HbHAB2LzCI9/aFzHiSSRe+f+Kmb7dwmTRQj4ekUiw6jZr5Tvreg+Eazd+QWAoZf3i9sU
 9BydiRqPbNpk8K4ZvKVg3iS4cwwl1fO/EAt6pgMXIK+AOtrdu4lGpWidvcxQQ8a8H0pv
 ULYuChCreAGxk7In40AxCo0E3FrOoAC0Jf5gZCQdqQNQ/fDKq8ya5CHvCcul1LjRPI0k
 d/NImPNqPY6fVg+NH8UV6fVNOZY0A4keSmUGNhTbcePIu3kjzutObKs7H2nVyYOJb9dh
 ARDA==
X-Gm-Message-State: AOAM533eDEe/wqSGJKloQ1jTO0XYE3FcN2bzQFKCUiuGMZVMxbGx89ZG
 4TYn3LJg2nmHuB+QSMhK8VSETg==
X-Google-Smtp-Source: ABdhPJzs9+T39N5PQBnwDHSbp0SUFeXCgvjvlVmMijLylWkDdDpe9cRiE9XpYau7T7TgiZexQXkJjA==
X-Received: by 2002:aed:206b:: with SMTP id 98mr277376qta.77.1615909434813;
 Tue, 16 Mar 2021 08:43:54 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a2sm13548051qtj.76.2021.03.16.08.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:43:54 -0700 (PDT)
Subject: Re: [RFC PATCH 5/8] qtest/libqos: Restrict CPU I/O instructions
To: Laszlo Ersek <lersek@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org
References: <20210314232913.2607360-1-f4bug@amsat.org>
 <20210314232913.2607360-6-f4bug@amsat.org>
 <b1dc01eb-0090-e47e-2731-c1920d9cda42@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <66630c68-d8ff-45ca-24e6-bbef1fc566ee@linaro.org>
Date: Tue, 16 Mar 2021 09:43:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b1dc01eb-0090-e47e-2731-c1920d9cda42@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 9:37 AM, Laszlo Ersek wrote:
> (+Peter, comment below)
> 
> On 03/15/21 00:29, Philippe Mathieu-Daudé wrote:
>> Restrict CPU I/O instructions to architectures providing
>> I/O bus.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   tests/qtest/libqos/fw_cfg.h | 3 +++
>>   tests/qtest/libqos/fw_cfg.c | 2 ++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/tests/qtest/libqos/fw_cfg.h b/tests/qtest/libqos/fw_cfg.h
>> index c6a7cf8cf05..3bfb6d6d55b 100644
>> --- a/tests/qtest/libqos/fw_cfg.h
>> +++ b/tests/qtest/libqos/fw_cfg.h
>> @@ -36,6 +36,8 @@ size_t qfw_cfg_get_file(QFWCFG *fw_cfg, const char *filename,
>>   
>>   QFWCFG *mm_fw_cfg_init(QTestState *qts, uint64_t base);
>>   void mm_fw_cfg_uninit(QFWCFG *fw_cfg);
>> +
>> +#ifdef TARGET_HAS_IOPORT
>>   QFWCFG *io_fw_cfg_init(QTestState *qts, uint16_t base);
>>   void io_fw_cfg_uninit(QFWCFG *fw_cfg);
>>   
>> @@ -48,6 +50,7 @@ static inline void pc_fw_cfg_uninit(QFWCFG *fw_cfg)
>>   {
>>       io_fw_cfg_uninit(fw_cfg);
>>   }
>> +#endif /* TARGET_HAS_IOPORT */
>>   
>>   G_DEFINE_AUTOPTR_CLEANUP_FUNC(QFWCFG, mm_fw_cfg_uninit)
>>   
>> diff --git a/tests/qtest/libqos/fw_cfg.c b/tests/qtest/libqos/fw_cfg.c
>> index 6b8e1babe51..db2b83f5212 100644
>> --- a/tests/qtest/libqos/fw_cfg.c
>> +++ b/tests/qtest/libqos/fw_cfg.c
>> @@ -131,6 +131,7 @@ void mm_fw_cfg_uninit(QFWCFG *fw_cfg)
>>       g_free(fw_cfg);
>>   }
>>   
>> +#ifdef TARGET_HAS_IOPORT
>>   static void io_fw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
>>   {
>>       qtest_outw(fw_cfg->qts, fw_cfg->base, key);
>> @@ -162,3 +163,4 @@ void io_fw_cfg_uninit(QFWCFG *fw_cfg)
>>   {
>>       g_free(fw_cfg);
>>   }
>> +#endif /* TARGET_HAS_IOPORT */
>>
> 
> I'm not sure the macro name is ideal; the PCI host on aarch64/"virt"
> emulates IO Ports (it's possible to allocate PCI IO resources on
> "virt"). From patch#3, TARGET_HAS_IOPORT does not seem to extend to arm64.

Correct, aarch64 has memory-mapped pci io resources, they are not on a separate 
ioport address space as for x86 and avr.


r~

