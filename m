Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E038FC0C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 09:56:53 +0200 (CEST)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llRvo-00006V-B8
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 03:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRul-0007pa-Mi
 for qemu-devel@nongnu.org; Tue, 25 May 2021 03:55:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRuk-0004je-6G
 for qemu-devel@nongnu.org; Tue, 25 May 2021 03:55:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id t206so16190159wmf.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 00:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CT1CWmJcZq9ZzubQTn1IYXn+8+QqLFfLfZD6bp3yYSc=;
 b=NAIKklojXVnnc8WMDUtpi8Qty9hUAtZmNdYqSDdjYrIcbIH7u12fZnYd/kMgLvg2gE
 WKM0aTprs9vJNToc2nNcwKFWkMPlj8awJj1jrzVNMzwxhxP0EC3WgOYrsORnVqSwVgsX
 FavbLb2HLrWG8VwQ8x6c0Fj1aQRCtO9jQkVAtXN6YcLwpuBu8IGLYJu514wS+ktgmGOT
 W9CMAgfsXym2rgGGdi5+5sBWDjoyNmVmA/NtC0Ah1RsNT4jgvrkTVNK7nmavTCfgM88x
 T4O0xFsEZxw0UbuJOlzM5iErCEYXGuWrCUTMBb/Gst6sx7YI/QUtKwxeYNdGjUpk5RwZ
 NvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CT1CWmJcZq9ZzubQTn1IYXn+8+QqLFfLfZD6bp3yYSc=;
 b=FYmytluA4gmKxoEQ/e5j9cjuDR2ErzrNqeukDBRqvBXgqvXrZesoMyb+mMPykM3jQR
 Sji9FrTMubqTp1AppVPQlxs9ryKnpckLD1b3AWia+yEjv3wBXk03CPGGOTp8ZxdKEkwI
 MrSzM7onD7ct/jhbGhhN1ypV4/Rh2JoeaxqaQbFH1D/ppT0GijIP54FAb+sMDd/8X1OI
 JyjzWeprc0EDVS9abCnGv+KDQww+s0xxYfv+kyJM2B1sx6ay3RWMwv3oj9Bdy/2AjcfJ
 7lns3Srlpihubs8anEXtvG62I7nsnlgbpOeU2C3dGihAMBEJpgVR2R5s2hZXnLfIIG1a
 o5qA==
X-Gm-Message-State: AOAM530eIR+ushEaII0XyTcBhpXyv0tUOadpwxd796vN30cyTLJkuvQD
 DoIGYyRTEZXJsFMNqqrO+Zo=
X-Google-Smtp-Source: ABdhPJxBnI86+mRBTUQs1BsCvlJlETYfwdLXqlos0ys1jw5TplV4VQuGAIEXK3zBTMyhgUL5anwNEw==
X-Received: by 2002:a1c:2985:: with SMTP id
 p127mr23044135wmp.165.1621929344708; 
 Tue, 25 May 2021 00:55:44 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n6sm9743823wmq.34.2021.05.25.00.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:55:43 -0700 (PDT)
Subject: Re: [PATCH v2 0/9] accel/tcg: Add tlb_flush interface for a range of
 pages
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <CAAdtpL6u_5AF=H7XaRwfWThTVxM3YvUjUktbmmEenbUL=r2nBQ@mail.gmail.com>
Message-ID: <820e64bb-8ba1-d56f-d42a-458940600ac7@amsat.org>
Date: Tue, 25 May 2021 09:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL6u_5AF=H7XaRwfWThTVxM3YvUjUktbmmEenbUL=r2nBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 5/9/21 5:18 PM, Philippe Mathieu-Daudé wrote:
> Oops, I forgot to add 'v2' in subject line :/
> 
> On Sun, May 9, 2021 at 5:16 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Richard,
>>
>> I tried to make sense of the multiple changes in your patch
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg805595.html
>> by splitting it in multiple trivial changes. At least this way
>> it is easier to me to follow / review what you did.
>>
>> The original patch description was:
>>
>>   Add tlb_flush interface for a range of pages.
>>   Call these tlb_flush_range_by_mmuidx*.
>>   Rewrite the_flush_page_bits_by_mmuidx* to use the new
>>   functions, passing in TARGET_PAGE_SIZE for length.
>>
>> If you find it useful, fill free to take / respin / reorder this
>> series, improving descriptions.  Last patch certainly deserves a
>> better description ;)
> 

