Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A391F3BC3B3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:37:22 +0200 (CEST)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0WHH-0006XZ-Ql
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0WGS-0005rf-F6
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:36:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0WGQ-0006K5-Pq
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:36:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id l5so6833944wrv.7
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/j0ceSmhmzRdbNotkGS3nTtTnISZSWqQBWtPbRttuKI=;
 b=CDy2t+NzPD4Zluypf9kykXtwPPcHimqo3VOD/1Hc4x9QprGXU4Kp1sUxkZ1SXCLAxk
 RAU5tv5A8pS1eMsM6MmApmYSOn8KmJ4/utor6wqTaK1UDoccFVABfMudTxH5OwUzoDy8
 tLtCUmUpRTnMlsAmRLepEjHtzVv0IxuYF6PntNp9MxC6cHcT5QnsiTZg/Hf5/YpJmakP
 w94gx5CmFXLTB8SLji9D1Qrrx4zRiFq8s+DdeVnl1D6vn21fdXfrEd03OtjbMde9ed/A
 CFLJcx7ZF3S+R810Qu2ZFfVj6GuVN02KTiXHL9x+3lfSE3irpAQ44DC+51w2YJDnxv4Y
 28bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/j0ceSmhmzRdbNotkGS3nTtTnISZSWqQBWtPbRttuKI=;
 b=YFP9yiukc8QwigtAXkjKQm+8SxcUiT8PYl03FEoZCMbJ3LtwNmoCwGYEsNRHIBIn4Y
 FO8PtsM2B3SNCyf6tGGKgtqZlmxZA/LRxOPUC/ynXERpmbV4d/c/XhxW/tbcQErQGnS5
 3zpPHZueEPoT4bNGd834DXOgGVgUhLLsiQG28Mbj0PJ97GRV52vqzM1Y9MeTCUJnbUjZ
 VssM+JDrwv6iAsVBOw/vYaITzDp557HHhFolBZQfsAWy4BzY7V22+1Pv41evzPjc+694
 euoLp08uSkPAmbKGgkZhSRxcHqOJTnBoA+WkJR4BeD7z2+wujJL1Jw1ZbmVpP0Q71LP2
 6Nzw==
X-Gm-Message-State: AOAM530op1hsA2PxmnH18W9RvyS3/KZkyvBySJCZHs0UI/QJTR52s1aL
 10FxNZXhJVVq8Im/7x+H4Xg=
X-Google-Smtp-Source: ABdhPJzlMmZrccbvpTvXdhGWzEIe/wUr5OxfKofmZsuvLiYz8qOAVzyx9KRRrUg7XLYxUM6hWK6weA==
X-Received: by 2002:adf:eece:: with SMTP id a14mr18009216wrp.313.1625520985249; 
 Mon, 05 Jul 2021 14:36:25 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f62sm13847216wmf.22.2021.07.05.14.36.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 14:36:24 -0700 (PDT)
Subject: Re: [PATCH v3] dp8393x: don't force 32-bit register access
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Finn Thain <fthain@linux-m68k.org>
References: <20210704152739.18213-1-mark.cave-ayland@ilande.co.uk>
 <4f4d1643-85f7-fbbc-3a22-fff086362c32@linux-m68k.org>
 <cf9f6c26-473a-20ed-bf0d-bac63114c60f@ilande.co.uk>
 <6f2a138a-aed4-530d-be6b-9ad1ad01c00b@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <850a5a48-48ff-f688-a421-de94cd088525@amsat.org>
Date: Mon, 5 Jul 2021 23:36:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6f2a138a-aed4-530d-be6b-9ad1ad01c00b@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 9:33 PM, Mark Cave-Ayland wrote:
> On 05/07/2021 08:52, Mark Cave-Ayland wrote:
> 
>> I think the problem is because of the interaction of
>> .impl.max_access_size = 2 and the it_shift property specifying a
>> stride of 4 bytes: when the 4 byte access is split into 2 x 2 byte
>> accesses then for a read reg = addr >> s->it_shift causes the second
>> access to be a duplicate of the first rather than containing zeros.

I believe this is something I tried to fix earlier, see:

"hw/misc: Add support for interleaved memory accesses"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg730721.html
(in particular:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg730725.html)

and

"hw/misc: Add memory_region_add_subregion_aliased() helper"
https://www.mail-archive.com/qemu-block@nongnu.org/msg83742.html

I plan to respin during next dev cycle...

> After some more experiments I'm fairly confident this is the issue: if
> you rely on applying it_shift within the MMIO access itself then you
> lose the zero extension of the result to the access size as done by the
> memory API.
> 
> I'll come up with a new version which I shall send as part of an updated
> and tested v2 of Phil's housekeeping patchset, since the endian changes
> were really helpful when studying the descriptors.
I'm fine if we take the patch Finn has tested (I'll amend a comment
explaining the limitations) and we fix the details in the next cycle.

