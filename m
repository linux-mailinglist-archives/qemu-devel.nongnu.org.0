Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B593C673845
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:23:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pITwH-00017J-GZ; Thu, 19 Jan 2023 07:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITwF-00016p-48
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:22:39 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pITwD-0005hS-1x
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:22:38 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so1150670wmq.0
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hHr68YNLjgrtVPNFsAmzWVYBfNgozAi0f+DBujXAI4Q=;
 b=L8EWq2e3aFm1O8HNSjDsk7BBQDLi6vvVAXhLY5Yqv5ZD+slaDci9KNU1OndqCt5eNU
 R2s5bcUEbSW3o1YdNpiuFS6OzZUk3lVcBK/iHU46dZgA5Iyz+LmKtA+79i/BTMlhjUAe
 Nn133UhHuHxXdZSF17ww7DVnaudqaxC25zRfgBn8rXAM1oDC1L18EmW5mnevLLY0PQyY
 ocKzyZcRDrTUmNVjsgNBfVLnKSDsSo1eHPp6WxL1cRiN1Sgjyop/zxGVqkmBLj3uI1Iq
 9rcAiPXNA0fYAHp7d4AY35yjysyeF76GOM8dhrGSPz/woQWWFp/5UvvuQersRlZ0jGLj
 Xe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hHr68YNLjgrtVPNFsAmzWVYBfNgozAi0f+DBujXAI4Q=;
 b=7mHpJdKf6VgD5k2CKIE2N3A34rAdXDDj+zVBdKvxZWBsdxSvUdb1W/1RM93VHEjAB3
 504UuFvjeNSESv0LUzRiNlhtDUt72g43awA2UXfOXsGaiorjq3JHACe9GKQSgTl8ZWDu
 y/7rMdARJZjMx0ndTxNzMzbB/aUd2Ao2dvmnd7Q7bne8icVnH8W2Qb1F9TWnjCEAXXvs
 IL1IUooOQKxm3CfJL4nKBJOX9Z5tpVry/pYrsaSbDlqFr/PBcLvlPVGqIJOM62C4hj+b
 3UpFCq3KEJDQj4mhFyziPTQnuu1XsK8YBMSWQWofL8dNAGWb7jEdTma4JxsszmT/ARTc
 lj6g==
X-Gm-Message-State: AFqh2kq7IgV4bptvNH2MxRHhrbsC1HoAWNT+qfPwbKBizyVK6Awn2vVY
 2AjCsDNtiC3CAM+X2rHY5OC0+Q==
X-Google-Smtp-Source: AMrXdXsyWFJO3483+d56KHH3FUH+83DYcst8R4lL17U4hgXmogN+U+wWudDdIGQ9Q5yO6MuFQ0DYNw==
X-Received: by 2002:a05:600c:314b:b0:3d2:3ca2:2d4f with SMTP id
 h11-20020a05600c314b00b003d23ca22d4fmr10379663wmo.36.1674130954807; 
 Thu, 19 Jan 2023 04:22:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b003c65c9a36dfsm4861626wmb.48.2023.01.19.04.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 04:22:34 -0800 (PST)
Message-ID: <3a96fae2-8734-b55d-748a-27b08bed35c0@linaro.org>
Date: Thu, 19 Jan 2023 13:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Language: en-US
In-Reply-To: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 19/1/23 08:41, Philippe Mathieu-Daudé wrote:
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>
>> For the build _with_ TCG, this should behave the same as master.

> Testing on Darwin:

> 17/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test         
> qemu-system-aarch64: unknown type 'arm-gicv3'

> Reproducers:

> $ ./qemu-system-aarch64 -display none -machine sbsa-ref -accel qtest
> qemu-system-aarch64: unknown type 'arm-gicv3'
> Abort trap: 6
> 
>      frame #2: 0x00000001958522c8 libsystem_c.dylib`abort + 180
>      frame #3: 0x00000001003d32e8 
> qemu-system-aarch64`qdev_new(name="arm-gicv3") at qdev.c:164:9
>      frame #4: 0x00000001002f30d4 qemu-system-aarch64`sbsa_ref_init 
> [inlined] create_gic(sms=0x0000000103ff0d10) at sbsa-ref.c:405:16
>      frame #5: 0x00000001002f30a0 
> qemu-system-aarch64`sbsa_ref_init(machine=0x0000000103ff0d10) at 
> sbsa-ref.c:773:5
>      frame #6: 0x00000001000905c0 
> qemu-system-aarch64`machine_run_board_init(machine=0x0000000103ff0d10, 
> mem_path=<unavailable>, errp=<unavailable>) at machine.c:1404:5

For this one, I *think* the sbsa-ref create_gic() should follow
what the virt machine does to select the gic, generalizing Alex's
changes from
https://lore.kernel.org/qemu-devel/20221223090107.98888-1-agraf@csgraf.de/

