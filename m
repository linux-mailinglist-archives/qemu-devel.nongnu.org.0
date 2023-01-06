Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F634660906
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 22:57:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDuhr-0002Ad-5Z; Fri, 06 Jan 2023 16:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDuhp-0002AQ-4R
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:56:53 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDuhc-00062K-51
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:56:41 -0500
Received: by mail-pj1-x1035.google.com with SMTP id n12so2824574pjp.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 13:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1BkNa6Pc7lGRopSOm8XIBiM/1lYTF0tzIjP0Ul1SmCw=;
 b=N6jP7O6Sgs1TvGg10XMc+n3qv3MtbVmb3WDZ0aKNSND07FwRXZP7WNHieifNH4UFET
 qYA2Ijv2Jatc5x9ocKFaHSsFfgaA2sc62HSKiuBWwNLyst8yv0VuARJGgaKO0zqpb1xm
 oRr9QFbo/BJr8/DrqCRrNUcxsrXccpQwxV9JVMVE6nt7q5gvcJCAeuif2f7qbsXTVH62
 z/X1/BW9IvF7ccU06PmE6EE3NGy1oManf8r1TtMPY7/US2pbgL9JsukeGccikegVMYT4
 OnqI7RI1Md2J37wi16D2Nng3fNeixYro2RGAP5bycQZFO5nxqcrZvzRhIBOg2CW3oi58
 yUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1BkNa6Pc7lGRopSOm8XIBiM/1lYTF0tzIjP0Ul1SmCw=;
 b=fsfAMCRuRq9TjsuJLqe4Dj35mwoAmKl8JJCzm7STDz1HorM+O0xVaGtGHOn0ywoyZI
 R4/mnxnkclRmDlXjVbuwHD5AXGLqq1aMb2GblHV4sgQZbuGh5EQdnxcSLvY/BtI7RlJJ
 hUCfRsmB9+cc5/SyOAdjMxadIcIgI/m3Casvw7uT4gKnyNNasrIwvC1CX+U6qISFznMQ
 gNWDdONm5eF1zzZs+BrZWifg6vo98asBZd/eSuzWcifUI7yDbCbuh0O+/Lx02dOULeCd
 5dEuUCcalCZlrgJAI4eCKJhZ2kjF/8HQjaBiIrfiLIJufcC/Waj/mpuY5UJX9D3iU9Fb
 73Yw==
X-Gm-Message-State: AFqh2kr3lLb/YmB92L1gvoqIpyYz3tybNVpvcIEN5ckRIN9BW/t+cEFa
 InqO2mPj/2nhLkvNphEugIw3Eg==
X-Google-Smtp-Source: AMrXdXsSj2usEA2Y1+WkCdv5jRirPJE4wTezwwjuvM2X+4PitKJZZj6wd7/510cMjhjb0XZTKGny8Q==
X-Received: by 2002:a05:6a21:3d0d:b0:a3:8d47:6aa9 with SMTP id
 bi13-20020a056a213d0d00b000a38d476aa9mr77329376pzc.34.1673042198285; 
 Fri, 06 Jan 2023 13:56:38 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 7-20020a17090a034700b00212e5fe09d7sm1337446pjf.10.2023.01.06.13.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 13:56:37 -0800 (PST)
Message-ID: <47e84908-9102-9c73-6366-022e2a04d5fd@linaro.org>
Date: Fri, 6 Jan 2023 13:56:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 11/21] gdbstub: move chunks of user code into own files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 08:43, Alex Bennée wrote:
> +static int gdb_signal_table[] = {
> +    -1,
> +    -1,
> +    TARGET_SIGINT,
> +    -1,
> +    -1,
> +    TARGET_SIGTRAP
> +};
> +
> +int gdb_signal_to_target (int sig)
> +{
> +    if (sig < ARRAY_SIZE (gdb_signal_table))
> +        return gdb_signal_table[sig];
> +    else
> +        return -1;
> +}

Code movement, but usually we fix the style issues first.
Also, considering the number of array entries, I'd suggest

     switch (sig) {
     case 2:
         return TARGET_SIGINT;
     case 5:
         return TARGET_SIGTRAP;
     default:
         return -1;
     }


r~

