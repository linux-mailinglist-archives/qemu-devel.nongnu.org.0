Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4D3474C99
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 21:25:38 +0100 (CET)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxEMj-0001Wd-Ab
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 15:25:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxELO-0000qO-Ns
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:24:14 -0500
Received: from [2607:f8b0:4864:20::429] (port=47002
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxELM-000440-PT
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:24:14 -0500
Received: by mail-pf1-x429.google.com with SMTP id o4so18739681pfp.13
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 12:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m9VUrcZQDIkykIDFIgGSIVGx3SJanN/2GT1+CSYPqaQ=;
 b=wcd/8jJUOWsfQkpULAfOsux87RUn3YZeychvnQZJcMHJpOs4T6TCEh0xgysdCTTdFI
 VqfHGziZ2keNefIh8Y6jRdPouP7LZT1Xpb1YZS/Ppev/BnbZmTeAbCPYYKdpKy+FCj+z
 Am2Mj/VO6ok6hNl069pj3KQwlHoONgeHIWR/z1d/QAYaveqjKQal2QsyYYNJ7XkkstRj
 70BmHGp3pjyjr8r913OWoLPG14Hceyfh5HK8/QfTEY138jujF/1KIrMggHVmFb5hnsHN
 GRerIg+B9yrFmngye0R3vqhOGpPCATE5MS+Ng00ROp4YK3LAYc2WuWPn8Ld3hPVDq5cZ
 DCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m9VUrcZQDIkykIDFIgGSIVGx3SJanN/2GT1+CSYPqaQ=;
 b=qOiWaf9HOfYw7YmfSqJaip5qZ8p1tarIF2H8l+Jg/Dv7Yp/bjJFr+OcRSQNONO3ORY
 oXvm+ImobiOTnduLw/0Se240ryH8aJ+fkNAhu55bEWea7LwAiS5xSvWLk1NHroyygb8k
 fm3UjYfbBxS3xMjLJULgsFODw3Vzb1N+YyBNyKD8rFrqcxqesFg3hgv5EZO5zy6J0C5u
 3pT6txgbP7DpeQYT9OQvjgg0KEJaNwX8CKSYMjhuGQb/LSYMe02xLEciiO8C8wahqALz
 yS+s3DNLJiGjBVdkbssHzilIHDsXURaZCsSsAVOr0Z+WaGh9ePexg0mWKal4m5wQ7LfB
 RWjw==
X-Gm-Message-State: AOAM533cQc0AzPmhP15dfsTGY06OMOljrM47ghI73XzVJy7/0yK7W8Pb
 O6lplZUrvR1+y+8hTZ9Ucvq2psND+hbntQ==
X-Google-Smtp-Source: ABdhPJw77UNPoxRIVkZL2sSjP+iqSy+i/S5qvc4L50P7kAcOlq5y4ZQWaRhXjMlIhq/V0cQ/PNYQ5A==
X-Received: by 2002:a63:5a18:: with SMTP id o24mr5077780pgb.459.1639513449579; 
 Tue, 14 Dec 2021 12:24:09 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q17sm709552pfu.117.2021.12.14.12.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 12:24:09 -0800 (PST)
Subject: Re: [PATCH 6/6] target/arm: Implement FEAT_LPA2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-7-richard.henderson@linaro.org>
 <87y24ngn2s.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdfbf7d8-48a5-92c3-8908-f46d151dedae@linaro.org>
Date: Tue, 14 Dec 2021 12:24:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87y24ngn2s.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 6:57 AM, Alex Bennée wrote:
>> +static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
>> +{
>> +    return sextract64(id->id_aa64mmfr0,
>> +                      R_ID_AA64MMFR0_TGRAN4_SHIFT,
>> +                      R_ID_AA64MMFR0_TGRAN4_LENGTH) >= 1;
> 
> Is this correct - it shows:
> 
>    0b1111 4KB granule not supported.

Yes, that's why the signed extract, so not supported comes out as -1.
See D13.1.3 "Principles of the ID scheme for fields in ID registers".


> (a little more reading later)
> 
>    The ID_AA64MMFR0_EL1.TGran4_2, ID_AA64MMFR0_EL1.TGran16_2 and
>    ID_AA64MMFR0_EL1.TGran64_2 fields that identify the memory translation stage 2 granule size, do not follow
>    the standard ID scheme. Software must treat these fields as follows:

Note that we're not testing the *_2 fields, which are *stage2* support, not stage1.  I did 
add a comment about assuming stage2 encodes the same value as stage1 (which is true for 
all supported cpus).



r~

