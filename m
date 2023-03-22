Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCE66C410D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 04:32:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pepCH-0006hQ-98; Tue, 21 Mar 2023 23:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepCG-0006h9-48
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:31:32 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pepCE-00027w-FG
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:31:31 -0400
Received: by mail-pl1-x633.google.com with SMTP id o11so18136685ple.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 20:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679455889;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/DlHIGHbyoVbfQdIjnIXckmQXEtypv34gUuI4kcbZpU=;
 b=YN7vDTJUOihCb/p8LipknEAHIz8HRa2ejigUvYf934931d/cSSarsXDK6tLaABa71E
 2v11GhWju3BP7Ql1p+rrrOl7Hl5rms/+ZHGWxvU3dCwM1ow3LL89CTVv44kiexRtXRY2
 wYxCHvzdeo5MzWr6wI56if0viCABs6hMUprZMLwisJFFuciZaHZMl8lXn9BtcTDSsWm1
 P7lwCT4AVzAyAl3VycliPL27WlHG21JllkDFqweT7c+vD3aieDrRlgKwOC7q6WwM/uNS
 0VzvaJ4b3wZkbm2bcdidefgPPwxglmMS9Z4R+5fP05O5p0doFcSLQ6E7FGIZ+BcHaP+U
 7+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679455889;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/DlHIGHbyoVbfQdIjnIXckmQXEtypv34gUuI4kcbZpU=;
 b=Xoi5ZnKG5uQynvEvcvkEkbPfwjm/70OgLZVXzD0wcL6G95bbFX3gI/NsukAIlgOqDx
 MAkh9tkJDHHDOlir2P/n7fzGv/VWLy3TKOoKb1VNTNJwxnh5LlXsCFXhVFmNcN0et8ZK
 WNBi2NxpzQnt2ucf5Dc/JycwOdyLbjmNUohyGEloQ5rGJae8CsVpVifSel+EtXZmUOZ3
 y6asdwWWq3OVWTlj5TVuIr1XzFn+eVCMRqUWHzn9O58cRDpJq5GEgFZxdkSoSLO/OAIC
 LbNkaQRos7tUsoRIXQI7gVY4gC7LK8Qmv5VfP6vAkaj0QThU24AoxaearvdoaZTNPsIK
 h78g==
X-Gm-Message-State: AO0yUKUbbydu+Omt5hpBPkAZ8n2IxCSZSHh4CMSadAhjU6rcFvbpXDit
 tSmAUMVsYQSvYDuM1O4E+/4rpA==
X-Google-Smtp-Source: AK7set8tMgT5heZ+XDE9QyF2X3fwehjH6Y4Ljie0NnjZkpR9ZlXvVRlb3RdXtALdL2mC+XRhaqIo9w==
X-Received: by 2002:a17:90a:195a:b0:237:373e:9dfa with SMTP id
 26-20020a17090a195a00b00237373e9dfamr2046922pjh.20.1679455888857; 
 Tue, 21 Mar 2023 20:31:28 -0700 (PDT)
Received: from [192.168.165.227] (24-113-166-229.wavecable.com.
 [24.113.166.229]) by smtp.gmail.com with ESMTPSA id
 fa22-20020a17090af0d600b0023d1976cd34sm8619931pjb.17.2023.03.21.20.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 20:31:28 -0700 (PDT)
Message-ID: <b48b2cb9-bf2c-f527-435d-df497ea4df76@linaro.org>
Date: Tue, 21 Mar 2023 20:31:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
To: "Wu, Fei" <fei2.wu@intel.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <609e4659-532f-0fe2-447a-f7deaa0824e5@linaro.org>
 <209d36a3-c136-5288-a842-3c0b5f1b5d0a@linux.alibaba.com>
 <4f63f756-55d1-70f6-10e1-875c1e515fdf@intel.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4f63f756-55d1-70f6-10e1-875c1e515fdf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

On 3/21/23 19:47, Wu, Fei wrote:
>>> You should be making use of different softmmu indexes, similar to how
>>> ARM uses a separate index for PAN (privileged access never) mode.  If
>>> I read the manual properly, PAN == !SUM.
>>>
>>> When you do this, you need no additional flushing.
>>
>> Hi Fei,
>>
>> Let's follow Richard's advice.
>> Yes, I'm thinking about how to do it, and thank Richard for the advice.
> 
> My question is:
> * If we ensure this separate index (S+SUM) has no overlapping tlb
> entries with S-mode (ignore M-mode so far), during SUM=1, we have to
> look into both (S+SUM) and S index for kernel address translation, that
> should be not desired.

This is an incorrect assumption.  S+SUM may very well have overlapping tlb entries with S.
With SUM=1, you *only* look in S+SUM index; with SUM=0, you *only* look in S index.

The only difference is a check in get_physical_address is no longer against MSTATUS_SUM 
directly, but against the mmu_index.

> * If all the tlb operations are against (S+SUM) during SUM=1, then
> (S+SUM) could contain some duplicated tlb entries of kernel address in S
> index, the duplication means extra tlb lookup and fill.

Yes, if the same address is probed via S and S+SUM, there is a duplicated lookup.  But 
this is harmless.


> Also if we want
> to flush tlb entry of specific addr0, we have to flush both index.

Yes, this is also true.  But so far target/riscv is making no use of per-mmuidx flushing. 
At the moment you're *only* using tlb_flush(cpu), which flushes every mmuidx.  Nor are you 
making use of per-page flushing.

So, really, no change required at all there.


r~

