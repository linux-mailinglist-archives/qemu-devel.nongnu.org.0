Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8526E969E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:06:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUun-0004EE-5f; Thu, 20 Apr 2023 10:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUuk-0004Da-Vh
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:05:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUuj-0000Bf-G6
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:05:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f09b4a156eso4917925e9.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 07:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681999532; x=1684591532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iSlhcWQpD8KZspyan0BNZqLHDYECkZ3eI2E5DeY4MN0=;
 b=g5LxjoR3LD2/2eHZYm/R9qRsUwvVokiFi/FnBSGgv7eYV4ISYyS5+ulwrPEdwNySgn
 4HgSOIu82sFhvqfPi5m8rM9HPD4wO1znjjYTqnBpbKaz3T3zdS0pfDQnKklKmQGuF05q
 ARE5cDUvlBec9rv+ExTCdNG9UA0G1G0vBONE3Zp6tMkhZwwXRDMDc7NxwegPYIFpm7gB
 JyRc/kgegbfCv8yW68s8YjOvAf1St8zXOvuFttskr1a4+o0GOWm9Vvum9CjcGUACy4YB
 wqejAEloBPHvKaYk3Xq19qsg+bHKU9cKPeAGjov5tMSJ+nusGCxUELanpvLS/dkHn2s0
 q+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999532; x=1684591532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iSlhcWQpD8KZspyan0BNZqLHDYECkZ3eI2E5DeY4MN0=;
 b=XTc4VtUPFOx3isdspSrUIQKTQ0g8gCsWxuOm7C3gViFI3KxyrmHHOHvggaHXCcH1SP
 0cZVVXHEnFU7kUxedkAWT/bDtJbZBWEa2LXDpdR5LlO3TSuCWi8W9pnuFkLBwKY7t4uI
 t7c1rlDzbEFXui3vm3Eaq6/AVhFrr00UKi2dcM62QifhQs17958rh6XILQ04hBi0Jclq
 PGScAguSqdtvJyWJc4ewmFudL9nVqrLNczyDYtrDPIlVQaunYS9SlFzFGFEpCTkrW9G2
 D3bfKYT5hXLtSxcQPwmUhaLuO1J/qdG3pyc7PRp6sT+78Tfnq9J5fih4R17Nm8WC7zgp
 HWzQ==
X-Gm-Message-State: AAQBX9d3mS08DX9vtLIblExVXjZqm2VqZZm2F0bpLHj6bKnQcg6L+ZT2
 QFMO7c77cOMQzQOkzW1JG74O1Q==
X-Google-Smtp-Source: AKy350b1YTMJX65cOZigUDZKira6v3ZVPEZtwwnkeXQNWSevodRGR3IZWvpl7mMK22q8NkLz0mQ69A==
X-Received: by 2002:adf:f88a:0:b0:2f9:827a:e999 with SMTP id
 u10-20020adff88a000000b002f9827ae999mr1530019wrp.60.1681999531929; 
 Thu, 20 Apr 2023 07:05:31 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b002ff1751ec79sm2037741wrm.65.2023.04.20.07.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:05:31 -0700 (PDT)
Message-ID: <5f4f4342-b40d-321f-4b6b-421139e2e384@linaro.org>
Date: Thu, 20 Apr 2023 16:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 RESEND 3/7] gdbstub: add support for the qRegisterInfo
 query
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
 <6414ff4730fb53bd210cce947c201ca011135831.1681993775.git.quic_mathbern@quicinc.com>
 <158d8b35-cd5e-0a47-cfa8-d1889d3a696b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <158d8b35-cd5e-0a47-cfa8-d1889d3a696b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/4/23 16:04, Philippe Mathieu-Daudé wrote:
> On 20/4/23 14:31, Matheus Tavares Bernardino wrote:
>> From: Brian Cain <bcain@quicinc.com>
>>
>> Signed-off-by: Brian Cain <bcain@quicinc.com>
>> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
>> ---
>>   include/hw/core/cpu.h |  4 ++++
>>   gdbstub/gdbstub.c     | 27 +++++++++++++++++++++++++++
>>   2 files changed, 31 insertions(+)
> 
> 
>> @@ -159,6 +161,8 @@ struct CPUClass {
>>       vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>>       const char *gdb_core_xml_file;
>> +    const char **gdb_qreg_info_lines;
> 
> Shouldn't this be 'const char *const *gdb_qreg_info_lines;'?
> 
>> +    int gdb_qreg_info_line_count;

Also, unsigned or size_t?

>>       gchar * (*gdb_arch_name)(CPUState *cpu);
>>       const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char 
>> *xmlname);


