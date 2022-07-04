Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B6564D6B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:45:42 +0200 (CEST)
Received: from localhost ([::1]:57056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Etx-0007g3-2R
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Ept-0006Rj-3l
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:41:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Epq-0004r4-M0
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:41:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b12-20020a17090a6acc00b001ec2b181c98so12539735pjm.4
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DrPPTshJngbCquMxIk2VzlmioRdFXmrMRuecHhxMhvw=;
 b=WXKdbQlTQYaSJMgseT78jAVK4p5IKQiX26TFozNBSYkuJqez3CyazC8BmTWtbtah9b
 v2a6AFux1CL1fP9nLBF2FL9sU2nLkiXkPrRI5cljkDNDluhNpBS5BhCBLGl6NeTp5pCZ
 lUdhIMCPUNCi+DhLMHHaZu2B8QxooBMcHWxrKSDQyEtAsI0d5NT0fjtwAhWBscmQ4niQ
 EHFNnY6zRNc6DLGJiscxUwM2dMiOCL/ZVZVh9CuTEntqcjsR6s8wJK/5t5EUJ6Vwmq2N
 yTenTRpWjOOVjQ2wgyl46/GQviu0T1lF091Nb0Jhv8Z8UdAPCowO+DCsa6+POGgLFx3T
 k6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DrPPTshJngbCquMxIk2VzlmioRdFXmrMRuecHhxMhvw=;
 b=J0NR7f11ay5mb9LXFLkqHkLClr+JOKu9zI0p/BkCMz12wBKb++WDBOTMSit1mUSgxV
 y3JECg39lxATkW2M36abYt2uFAgdAY0uZDU1NSvZgpMpVbzanbmQmbJb0K3IB0119Utb
 Hn35/SEqXqlM8ono78LWDiiSG1c3LoaIK8M8l/zk8XhewVRKQx1CAjKqZj1JT+plkCPb
 CAZyaRKjrhjG8WyAVNHe4nz0ZdnzU8U5l3b0bWLiASIjsgPM7wBpfPhWEvHnzq6dirmk
 23JWC3P5YZAqO7s0lO2BxT0rlUecnM+MMAFW7IhjUeyJo5hE+nVZkY4xGqCAoTJXNbUB
 1wzg==
X-Gm-Message-State: AJIora+lZcLDcYO8xTUm9Tm2cOdJGbDqJ5Kik9uTcwf+teucOKcKbRXt
 o6OJT/66Y5rLY3ceB744ZewCwQ==
X-Google-Smtp-Source: AGRyM1tB5AaE3f7HGrkzygUdzDsmcJZlaAQeKDRYLgfh0JGQDWYaqaQQBjwkuJqXE0kCnVCXZ/akww==
X-Received: by 2002:a17:90b:2384:b0:1ef:8506:374e with SMTP id
 mr4-20020a17090b238400b001ef8506374emr5879616pjb.99.1656913283714; 
 Sun, 03 Jul 2022 22:41:23 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170902c10c00b0016be6e954e8sm570488pli.68.2022.07.03.22.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:41:23 -0700 (PDT)
Message-ID: <a6010724-1016-4d49-4d24-16373ca2877d@linaro.org>
Date: Mon, 4 Jul 2022 11:11:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 00/11] Fix bugs for LoongArch virt machine
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/22 15:03, Xiaojuan Yang wrote:
> This series fix some bugs for LoongArch virt machine. Including
> RTC device emulation, ECFG reg emulation, timer clear function,
> and IPI device function, etc.
> 
> Xiaojuan Yang (11):
>    hw/rtc/ls7a_rtc: Fix uninitialied bugs and toymatch writing function
>    hw/rtc/ls7a_rtc: Fix timer call back function
>    hw/rtc/ls7a_rtc: Remove unimplemented device in realized function
>    hw/rtc/ls7a_rtc: Add reset function
>    hw/rtc/ls7a_rtc: Fix rtc enable and disable function
>    hw/rtc/ls7a_rtc: Use tm struct pointer as arguments in
>      toy_time_to_val()
>    hw/rtc/ls7a_rtc: Fix 'calculate' spelling errors
>    target/loongarch: Fix the meaning of ECFG reg's VS field
>    target/loongarch: Add lock when writing timer clear reg

I'm queueing the first 9 patches.


r~


