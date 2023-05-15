Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34199702EDC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:56:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYfd-0003UG-Er; Mon, 15 May 2023 09:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyYfa-0003Tr-NT
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:55:23 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyYfX-0005sS-Fw
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:55:22 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1aae46e62e9so91050165ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684158918; x=1686750918;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s2NnFN+RdS7Y5fSyCKVgAStf2E30uqZlDjlmyVdH9Ak=;
 b=YRFpusQBYrpneV2qUkN3eV8jx+7PdkJpQRmj3O9nDA4jUNautIylVQ6r/DFwMO+SKD
 X6+Ec/NR4lzsUt3VP/RWF/Ox9Jop7WrplC9WJWuH88jaPeGr4bo9jWzCblj9I5kbOFaO
 k5ArYLPzl/3spqbcdK87V/bvrhWyoMRiYuXxblea1ECkHecSLaKRS+ZWZOMxDQsWJDPC
 s964jeFgeNLkX6zux1N8r7gX10GW3FaoS3GdpY7ZgLHGd/gYB9SMfN32Lkub4cU+P21I
 JtM7L1bwrdUBUF41hOsUKUEGxYhZIDsdaZ8C0PBdT1VpHJk2X9CqFi9AE2CcYISIhiEl
 SSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684158918; x=1686750918;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s2NnFN+RdS7Y5fSyCKVgAStf2E30uqZlDjlmyVdH9Ak=;
 b=SYQOMrVwXXxkOlwhbhV5dT0hCDM+iOR0IiH6DdYOTJ7KVIlK5sbdyyk+D0anjLognb
 MudqiGvmiV0JCXc3AgaFiEM7IwXNkICHbX7i7J6RLrXKES+A83bIe9WcR2dhtZHNV4Tc
 wwwdi23+u+CfEQTD6TCX0lG16xo9OQ2wAJUFWFL/cPYfdOS4mHQCe7KEBLGGqa77lY9q
 aZEMI+UkZFc7x6KNYl6M7v3zx0C07x16qk/sioAlGbBeRSNjxO527Fy/4cDkiCVNwCfW
 VFE11eNaOODnR6JFDtoFND9gpomvMrVjbOkKwVBaWgxDW1hEbdf0AXPaWbxPg8Ihu5um
 Y5ow==
X-Gm-Message-State: AC+VfDzfzRMJi3+kxzoI9WuI6d02gl+tC7sClaJflu/XpW6fKjVR926A
 vopmsS7s1BuyvS1XiQ/AmRiiHaLCtfyd/sZhSrE=
X-Google-Smtp-Source: ACHHUZ7FmkD8HT4cVd8GVEZPpL4miwANZBdgvz3ut6DXVOJ1DW80QOgdpRFOkZ6UZxnOFUYMuzTDkg==
X-Received: by 2002:a17:902:e5c3:b0:1ad:fa2e:17fc with SMTP id
 u3-20020a170902e5c300b001adfa2e17fcmr11271520plf.2.1684158917885; 
 Mon, 15 May 2023 06:55:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9902:96ac:8d8c:4366?
 ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170902690600b001a072aedec7sm13493777plk.75.2023.05.15.06.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 06:55:17 -0700 (PDT)
Message-ID: <4a37146d-b3b7-206d-cc75-617dc2a3674a@linaro.org>
Date: Mon, 15 May 2023 06:55:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/9] Linux user for 8.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20230515083113.107056-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
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

On 5/15/23 01:31, Laurent Vivier wrote:
> The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/vivier/qemu.git tags/linux-user-for-8.1-pull-request
> 
> for you to fetch changes up to 015ebc4aaa47612514a5c846b9db0d76b653b75f:
> 
>    linux-user: fix getgroups/setgroups allocations (2023-05-14 18:08:04 +0200)
> 
> ----------------------------------------------------------------
> linux-user pull request 20230512-v2
> 
> add open_tree(), move_mount()
> add /proc/cpuinfo for riscv
> fixes and cleanup

The new test in patch 1 fails:

https://gitlab.com/qemu-project/qemu/-/jobs/4285710689#L4825

   TEST    cpuinfo on riscv64
cpuinfo: /builds/qemu-project/qemu/tests/tcg/riscv64/cpuinfo.c:20: main: Assertion 
`strcmp(buffer, "isa\t\t: rv64imafdc_zicsr_zifencei\n") == 0' failed.
timeout: the monitored command dumped core
Aborted
make[1]: *** [Makefile:174: run-cpuinfo] Error 134
make: *** [/builds/qemu-project/qemu/tests/Makefile.include:56: 
run-tcg-tests-riscv64-linux-user] Error 2
make: *** Waiting for unfinished jobs....


r~

