Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11E63B1863
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:03:11 +0200 (CEST)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0f1-00016e-11
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw0db-00089G-RR; Wed, 23 Jun 2021 07:01:43 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw0dY-0005Wf-3O; Wed, 23 Jun 2021 07:01:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a13so2127150wrf.10;
 Wed, 23 Jun 2021 04:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dJv07MiajCnAGL1JGiQrwFe1u+P1jlRYxBF0PpNese8=;
 b=lJxEcPcpKCgWBWHT2nAe4ipc0stXCgBD8iAd2I79/e7+5rM6VvEqRkJLw0h9hYJ1e4
 PkvmuAhIagOdGMT4aG/5uBfb21K89jx9I/OKstsuTi4bS3RQXb7nDSI/oDSl40pHgOiF
 FRwFmlKQaWmO3tqz8Kv3MatlL9VS04HT991GrLRenCRhHjyjBbnWApqCiEP0DH3+WtxS
 YEOsLQjwABW9PUlCH/mt4iqvxBPJLnQ+jvMgcDcTagMUc33zpVp1ppWQ2/G8C9xt6t0G
 U8kNNiq+RtmW/Nz/aLOBQqtxxCjLub2f8O6WYOcaON1gOGuMC64LeplaFgrJyvsv3vHp
 /iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dJv07MiajCnAGL1JGiQrwFe1u+P1jlRYxBF0PpNese8=;
 b=JE2jr2WP9h/RdqsQ1OGJ/ctQJVfyipJ1LakkCgIwIzpCRXBo3SW6NSrMQ92ShlCbo2
 5cAoGj+dMNi+uiMfdtAzRovczeS1eoDOXsbN2q0ANiQz/9tBdMRjDqiX3fmISOtx0LZM
 Md7uut8uX6bZHFgV86ZrL3SanyW8PdF0hMjcVrLdWVRkkAF0TSvaEDe5vwSa8s39Z0Pl
 7KA7fzfgHz7RqU724aiESO0sR0qKpSabiNXc+bVDkYMHmIRhXWgme/QPs9A/CKTEunOr
 Vy8GSUG9RIA1dmQbXg7w2GOQ3aRXU/X6GMdszp9x1DCvGSdH0KJGZ9hnRfnlArgRE6NM
 q9ww==
X-Gm-Message-State: AOAM530ZDIvyM+n6V9VxfxR7rhcH9hWjH2czfArzCWZNpCCTpMIWf5qF
 DjQI6h475Z03KvgOnw5+HVdVVMmz0GvnXA==
X-Google-Smtp-Source: ABdhPJwGJkmEQ+hYPYDgFP9TUhll+svJLYBLqjnVhShTJ6FqdEYSDKRSSpr9hSxV3Q9KPGiBg1zGrA==
X-Received: by 2002:a5d:6441:: with SMTP id d1mr10881623wrw.93.1624446097158; 
 Wed, 23 Jun 2021 04:01:37 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c12sm2593413wrw.46.2021.06.23.04.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 04:01:35 -0700 (PDT)
Subject: Re: [PATCH] sd: mmc: Fix SET_BLOCK_COUNT command argument
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210623083004.245894-1-clg@kaod.org>
 <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
 <efa3958c-8a08-76f3-a963-8424c660e4e5@amsat.org>
 <CAEUhbmVO6Wo=JNDbqL0CqoP7kzZC1xmDsbHHTVywCmAMJ8ucjA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2419c660-1948-8d32-5bb9-82eedd0005f4@amsat.org>
Date: Wed, 23 Jun 2021 13:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVO6Wo=JNDbqL0CqoP7kzZC1xmDsbHHTVywCmAMJ8ucjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 11:11 AM, Bin Meng wrote:
> On Wed, Jun 23, 2021 at 4:52 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 6/23/21 10:39 AM, Bin Meng wrote:
>>> On Wed, Jun 23, 2021 at 4:30 PM Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> The number of blocks is defined in the lower bits [15:0]
>>>
>>> I checked the physical spec v8.00 and it says bits [31:0] for CMD23 argument.
>>
>> Watch out, we only support 1-3:
>>
> 
> Yes
> 
>> enum SDPhySpecificationVersion {
>>     SD_PHY_SPECv1_10_VERS     = 1,
>>     SD_PHY_SPECv2_00_VERS     = 2,
>>     SD_PHY_SPECv3_01_VERS     = 3,
>> };
>>
> 
> However the physical sepc v8.00 should document any difference between
> ver 3.0 and ver 8.0 if there are indeed any, but for CMD23 it does
> not. So it means it's 32-bit since day 1.
> 
> To double check, I just downloaded the spec 3.01 and confirmed it's
> still 32-bit.

OK, so patch is incorrect then.

Thanks,

Phil.

