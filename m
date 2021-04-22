Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B786367EDC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:41:47 +0200 (CEST)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZWmI-00030C-CS
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWkM-00025E-VU; Thu, 22 Apr 2021 06:39:46 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWkL-0000IN-BX; Thu, 22 Apr 2021 06:39:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2956066wmy.5; 
 Thu, 22 Apr 2021 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gzyYZtefvvTPc+fAp1xGWLBqADRa8++7G8JBTKn3uQk=;
 b=YRn0LnF3seW3Hl/LeWmeHswr5BqFkIeefun2Um+XN/8kkz7PvFJ6IMPIsAavF5ECux
 /cWtNV4RoVPZCTESi6udUG6FhG4yb2Bwpb5niq11a0Tl4FS9QaU2k75TIcufHqB+VBAa
 8ICA6mPUbTt7+5MqmeJDDxLEYRLTzuFyNTX/wLRRTDYb6VmTMYF0k2HqVYA6kE5HOmhV
 SQLHlkOBKF/avFdzxu+oD7BhPgNHY0lAEUVwIFqzUiJV/+ZojuAcVM4DPhEJz8KtM3yn
 UWlAkGbkBl6K8169lCuL1PQPmv2zzowv7Oka7Wo+vDv4laK0U9IltDiHY+GZ1KYNaBMW
 FVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gzyYZtefvvTPc+fAp1xGWLBqADRa8++7G8JBTKn3uQk=;
 b=h6SM/ZY+80YVBfDHnsqQ4JdgtYWGW6pvvMDfcPJO5enf5mLFQTdviqtm6yHXmtgTdv
 OiR3Ton9bZcmpfnOXwnIojfrPVMFZAjoAVSOLmPnq0z3jP+ZwRURochnCobqqtp2objg
 YOQc0QEr9sGcvPE30NVjcgvMa/yPCzxwJqbmkG0cy6OagOVw+RDZKLHA8hL3cc2aVx/X
 V+pWSHff+AgdPmONfa8NoS6P4rLS1V60f3rgk/JYJ1S+DEGSUTmv8Ki6lwdxy5JVKyVj
 Om+kjA9wTpydHIyvDohR7vLLzBxOh+U+J04i+e2krsc1hdwS3Y8eefM16f0MdvtcZCPj
 zC8A==
X-Gm-Message-State: AOAM532O/ISsCojHK1bRi4fRMnW5ebMWv9Vv4AoqelXI8b6A47WlQ6Vy
 a1kDSHz++4SWKNBdNB4ZqQM=
X-Google-Smtp-Source: ABdhPJyoLi+ly6QCf6s73iV5a5m2cgYpKmmSAFdzHW2KsXQYErdi+FUsK1uT3LHqcweH8+oP3Od0VQ==
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr14814626wmk.104.1619087982771; 
 Thu, 22 Apr 2021 03:39:42 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g132sm2761819wmg.42.2021.04.22.03.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 03:39:41 -0700 (PDT)
Subject: Re: [PATCH v4 00/28] cpu: Introduce SysemuCPUOps structure, remove
 watchpoints from usermode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <dacf368e-aef4-cccf-1abe-3b9f496442fb@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ef24f9f9-b962-43ea-e311-5b6592d0f826@amsat.org>
Date: Thu, 22 Apr 2021 12:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dacf368e-aef4-cccf-1abe-3b9f496442fb@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 2:52 AM, Richard Henderson wrote:
> On 3/3/21 1:46 PM, Philippe Mathieu-Daudé wrote:
>> Patches 1-6 are generic cleanups.
>> Patches 7-15 move from CPUClass to SysemuCPUOps
>> Patch   16 restricts SysemuCPUOps to sysemu
>> Patches 17-26 remove watchpoint code from user emulation
>> Patches 27-28 remove USER_ONLY #ifdef'ry from "cpu.h"
> 
> Patches 1-18:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> While mst has asked for a name change vs patch 4, I think that if we do
> that it should be separate, because it would involve a rename through
> hw/ as well.
> 
> The watchpoint patches that follow need some more careful thought.

OK. I'll respin without the watchpoint part (first half).

Thanks,

Phil.

