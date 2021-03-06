Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D149732FB4D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:15:33 +0100 (CET)
Received: from localhost ([::1]:52742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIYeS-00017f-DJ
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:15:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYcV-0000We-6T; Sat, 06 Mar 2021 10:13:31 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYcT-00069i-NY; Sat, 06 Mar 2021 10:13:30 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1116201wmy.5; 
 Sat, 06 Mar 2021 07:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OJuwS4Hwo13e8pnkY53y37SZr0CE0KOdhyjcc+C1xd4=;
 b=UMhoYdsViN3kvo0qN/nPcSkrCeud8030XBNrG6JmzgyGa3fsjjkU+Yj8CZUlyUiz0G
 nbHn968pHMHEMH7l/PG6VUsx14w3obw9Bc9PKAKb78SU7KhJ1/2EuJ0G3vjvtsdxIIlu
 mIl1ZY6JRlSKB8BbMgAEkrc44iPSN1PPAZYXDdDx4P/rfsvsPKmON1LkOUbOsExmjT4b
 o1YXP8CtZzhh18ptS5xaPGtSNKCLi7d8iqYbPIdeydNAYyVLh5KGvIRfNTzIxpY7AdiJ
 KjLK/aAl9yFNYRm+NOxB7r8sxJmKQyFBBPHTgrCtFsRtkE1zkg/58Dt3bXc82bhZL9uR
 xAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OJuwS4Hwo13e8pnkY53y37SZr0CE0KOdhyjcc+C1xd4=;
 b=d1uEEYMNrRM0V1wd87MkEMgOqOgHGIM6g8f88BEMOgq/wqKAqQI0H9rIh/CySnXIlP
 JA/DT83EfVubRGRbwrDxa08eZjHizROeo4/PW8ejKUdZjRqwu98VKC0eS3iNPoF0dygx
 hczYUde+FvR/0qDnNs73Q64XaezHO7kcc8ajsUJ9zIymWIVGlsmOLHW6dI1wsmXJAZqB
 d43FpCdAGOgF68ja6N4nilx82IxxoGwOlyLB3YgopoKL6RuxjRSYBxsdoVCfRkyuypLE
 nsDOIdThno8n05Nwecyqi2TPlM3oeXMNI+KmKLBOQ7ptbjyvbDDzW47fckebmVAordwJ
 kCbQ==
X-Gm-Message-State: AOAM530+wquSoKlWpwH72t0E6vI5WFLwjj/kM8xP3JtFketXwmn0lRmn
 ag2AHHbU8RZ6RbIuJ32XcVij415Fy5I=
X-Google-Smtp-Source: ABdhPJyDbKC0soc/VfyeekTKMlwmdgNB1x2LXGv+W4/3or7dvr+0sEMBbfjYYHXo8YV6vOF3AM528w==
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr7712521wme.39.1615043607891; 
 Sat, 06 Mar 2021 07:13:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z1sm9486539wru.95.2021.03.06.07.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 07:13:27 -0800 (PST)
Subject: Re: [PATCH v2 0/3] target/arm: Restrict v7A TCG cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
 <CAFEAcA9ZJA3hQq65Rg_bxty0_xcgqnErj41mOcfOtkw8uqFc9Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <79aaea62-4c85-7fb5-23f7-bd0143ceec13@amsat.org>
Date: Sat, 6 Mar 2021 16:13:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ZJA3hQq65Rg_bxty0_xcgqnErj41mOcfOtkw8uqFc9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 3:38 PM, Peter Maydell wrote:
> On Sun, 21 Feb 2021 at 22:26, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> KVM requires the target cpu to be at least ARMv8 architecture.
>>
>> Restrict the last ARMv7 CPUs (A-profile) to TCG.
>>
>> Series almost fully reviewed (missing review is trivial code style).
>>
>> Since v1: Only include patches which don't depends on  previous series
>>
>> Philippe Mathieu-Daudé (3):
>>   target/arm: Restrict v8M IDAU to TCG
>>   target/arm/cpu: Update coding style to make checkpatch.pl happy
>>   target/arm: Restrict v7A TCG cpus to TCG accel
> 
> I've applied patches 1 and 2 to target-arm.next, but patch 3 doesn't
> apply (maybe a conflict with something else I've already queued in
> target-arm.next). Could you rebase patch 3 once I've sent out/merged the
> next arm pullreq and resend, please?

This is because of:

commit ed84a60ca80c403749c1fc1bab27c85d8edba39d
Author: Rebecca Cran <rebecca@nuviainc.com>
Date:   Tue Feb 16 15:45:43 2021 -0700

    target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU

    Enable FEAT_SSBS for the "max" 32-bit CPU.

    Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
    Message-id: 20210216224543.16142-4-rebecca@nuviainc.com
    [PMM: fix typo causing compilation failure]
    Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b8bc89e71fc..058672c9776 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2217,6 +2217,10 @@ static void arm_max_initfn(Object *obj)
         t = cpu->isar.id_pfr0;
         t = FIELD_DP32(t, ID_PFR0, DIT, 1);
         cpu->isar.id_pfr0 = t;
+
+        t = cpu->isar.id_pfr2;
+        t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+        cpu->isar.id_pfr2 = t;
     }
 #endif
 }

Note this series' patch #3 was following #2. With #2 alone we get:

commit dddc200dcddd1a4e44c32e2b0f5a3cb248c506a6
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Sun Feb 21 23:26:16 2021 +0100

    target/arm/cpu: Update coding style to make checkpatch.pl happy

    We will move this code in the next commit. Clean it up
    first to avoid checkpatch.pl errors.

With next commit:

commit 9aee50eefba8c39d17759c7def3ba5a899c86271
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Mon Feb 15 10:32:07 2021 +0000

    hw/arm/musicpal: Remove dead code for non-32-bit-RGB surfaces

You might want to remove it, or take this series respin, or ignore
this discrepancy in description :)

Thanks,

Phil.

