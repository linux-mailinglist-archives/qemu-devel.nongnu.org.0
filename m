Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F8551293
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:23:17 +0200 (CEST)
Received: from localhost ([::1]:54034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Cgm-0006g0-Cy
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o3CUl-0002vZ-DI
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:10:51 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:42882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1o3CUh-0008SA-Q7
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:10:51 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 73-20020a17090a0fcf00b001eaee69f600so9568706pjz.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E/ShmGAN+AMnZcCeCFVSsxJ7h7cecqFvnyFCW7ZHSBs=;
 b=oeqQlYxI4m1KLnLRS/WtqcqHTF0KYST7ki1QrvUgyXxfddKPUHT6yS7uMYplcYHgV1
 mA/cHyh2WIMj4H3OcaCoVXw6pLC+q/w+gPcLSdzwzaI5gsR/PBI500tuSWXhSrgySkvz
 i8q4gPGcM+33fm2F2oB55oO81z9oGjH+/1m6+uZZ+tGC58mvW3RV1/2Rwz2X/eaM7aOg
 SGdcNXJcKYIOhiqDlYHIWxJ4x+nk/LS7cqXGQtpTNH9rUtez67zP+BCwCe7DIajtA0zC
 wMnrjFxjn+O/hW9KE30/39HvD0uNKEOdifk3Ryb+pny2nkUY+/YYpUY2bacIruM/rQ1a
 dOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E/ShmGAN+AMnZcCeCFVSsxJ7h7cecqFvnyFCW7ZHSBs=;
 b=H4h7IK/y7tXINHkVunQz2F/zYVfS2rpJOa4i/L4b1TUjtIAAG6sOlsYDn97i+Yh1A/
 J6tmq5Lesi1L1RanYS7nDM48r0yXOweo5pM/7RiR6z9f9LyHfUr40fdp8T3cskD7+FzX
 J5D7wvGsVM9yqaBlNvtPnVCiT1yNZMW8yh/7Bs95jN7R8S3jMRLzQhz0HPlI//jvXWi5
 FR5vShozXtqjcXMcyCVWkjVVBqXL9+vysom8723+bQCFph3lOLojRVcltfnnne5SySWN
 /SepxqGTkeTBWBDQ9OmR2uG7mPxPPWvYX5Ywe6TjDIgMdyUj/j7sJbeWvlOde8b24KGO
 HRug==
X-Gm-Message-State: AJIora+I7evmSUNHgzGIOEg95qpK8/lzCtoKSJckODmfqR/nX+r4EC8d
 YvBVhZGVA/5kT1DeUUAPYmgmCw==
X-Google-Smtp-Source: AGRyM1sMoYcGRj0V6Y9Glio7bfHJcRj94VgU8YnuLSItejI0l1U6Q9gu+YWCg+QC33aX5uSAyRYU4w==
X-Received: by 2002:a17:90a:5911:b0:1ec:9e24:c671 with SMTP id
 k17-20020a17090a591100b001ec9e24c671mr6665231pji.173.1655712646110; 
 Mon, 20 Jun 2022 01:10:46 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 y4-20020a17090a600400b001dfffd861cbsm2598305pji.21.2022.06.20.01.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 01:10:45 -0700 (PDT)
Message-ID: <025178e9-6d32-3551-0d2b-73f27ef7ffc3@ozlabs.ru>
Date: Mon, 20 Jun 2022 18:10:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH qemu v2 1/2] ppc: Define SETFIELD for the ppc target
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220617060703.951747-1-aik@ozlabs.ru>
 <20220617060703.951747-2-aik@ozlabs.ru>
 <14983389-aace-f030-65a8-2234b94952bd@gmail.com>
 <efa3a569-2533-0156-2dbb-c4ffd21c3b38@ozlabs.ru>
 <b6d8b097-118e-7f44-d546-b7326e7cb4c6@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <b6d8b097-118e-7f44-d546-b7326e7cb4c6@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/20/22 16:17, Cédric Le Goater wrote:
> On 6/20/22 05:37, Alexey Kardashevskiy wrote:
>>
>>
>> On 6/18/22 02:50, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 6/17/22 03:07, Alexey Kardashevskiy wrote:
>>>> It keeps repeating, move it to the header. This uses 
>>>> __builtin_ctzl() to
>>>> allow using the macros in #define.
>>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>
>>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>>
>>
>> soooo I do not need to repost it, right?
>>
>>
> 
> The watchdog patch depends on the availability of these macros.
> Doesn't it ?

yes but this one could go in now and I will repost 2/2 a little later on 
top.


-- 
Alexey

