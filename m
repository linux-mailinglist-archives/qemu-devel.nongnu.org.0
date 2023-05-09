Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0B6FCA8F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:55:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPfl-0004pv-62; Tue, 09 May 2023 11:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwPfj-0004pV-8G
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:54:39 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwPfg-0007nj-NT
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:54:39 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f4000ec71dso41133235e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683647675; x=1686239675;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zmAUQjwJipc3mizLsZdlli0Tus1iOD3CndWqOPP88rY=;
 b=gjzEm3j09VCklo5gMEhc+x46wuz/s1dWN3PMG/RbCZ+7HvzwNgb30xI1qORrRJh2g/
 5jTlgpjvQjsbli0H95HX1842l2CP8EWTrQm1E4WDEbnX8Kzgohlp3DLFOpUYXNR7/3Ih
 +VwPLCglPZCHGnCVDASjNpWRqniyzSEmUkFA1MrauIP0KWu0xVUnJVmfhs4wvqvC4pcJ
 63vM8lYPwqITk46YZUAYp7c7YKzAbZEHt8sLYqm2nVXOhxYPsGDOohso60L85HX169e+
 Q58np5YjmQry36J+DTqLCd2aez16JVVWY8c+ZZhF89pC2LIOOHYXkx8JOUi7jAdpxloE
 Hd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683647675; x=1686239675;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zmAUQjwJipc3mizLsZdlli0Tus1iOD3CndWqOPP88rY=;
 b=EB46C3htc9+Gc8bbVECRu4o62sCHn8Hha8WzrRdrsrma4JHyKv2Crng88+T5CELyYH
 JBPhqb9cYZNufG7GjP85NaKu0RMPoOxwg3ZJ4q5R9olpFKS3s/VikiNZvlb2gopCvif7
 OWcchjH82U9RPM3eUm3ZXQBl9Ju/ieed7UaokeoPLNcagW9GwdzU702A7GQMsVlf6BwG
 RkzmfeCvwXnzoD7OLiKnYhZL6pxTfN/4XkWZsb8NoPfSozLQOKGJHByYOSAWa/7PDHJx
 G1zzntli5/z2wecHpd5aWiO6f2TfMzVyvHPBja6sUsTsRT2SlbECBI2UMk0uswjaA+iH
 8iBg==
X-Gm-Message-State: AC+VfDxHmEXW6slzby3prTJoV1vNo9mrD56JNA4jjTpGq6s+NemjFUZA
 5kFUr38t0XEHzAW+tTjHbkQepA==
X-Google-Smtp-Source: ACHHUZ7YuVCwUZbBfLs02ofPgKCs2xgBASHDKzDhD7coNdRKS5B3qKrM43zLAEEX9ng+PO/nNjMLdA==
X-Received: by 2002:a7b:cb8c:0:b0:3f4:2572:225f with SMTP id
 m12-20020a7bcb8c000000b003f42572225fmr4689340wmi.29.1683647675127; 
 Tue, 09 May 2023 08:54:35 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a1cf016000000b003f42d8dd7ffsm909055wmb.19.2023.05.09.08.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 08:54:34 -0700 (PDT)
Message-ID: <c9fd9714-ee8d-10d4-2592-eddfb4314d78@linaro.org>
Date: Tue, 9 May 2023 16:54:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/2] Make the core disassembler functions
 target-independent
From: Richard Henderson <richard.henderson@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
References: <20230508133745.109463-1-thuth@redhat.com>
 <5b21cdb6-fbc6-b9fd-edcc-6ca7e4c88885@linaro.org>
Content-Language: en-US
In-Reply-To: <5b21cdb6-fbc6-b9fd-edcc-6ca7e4c88885@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 5/8/23 15:04, Richard Henderson wrote:
> On 5/8/23 14:37, Thomas Huth wrote:
>> Move disas.c into the target-independent source set, so that we
>> only have to compile this code once instead multiple times (one
>> time for each target).
>>
>> Marked as RFC since we have to replace the target_ulongs here
>> with hwaddr, and the TARGET_FMT_lx with HWADDR_FMT_plx, which is
>> a little bit ugly ... what's your opinion?
>>
>> Thomas Huth (2):
>>    disas: Move softmmu specific code to separate file
>>    disas: Move disas.c into the target-independent source set
> 
> Patches 79-83 from
> 
> https://patchew.org/QEMU/20230503072331.1747057-1-richard.henderson@linaro.org/
> 
> do the same thing, using uint64_t instead of hwaddr (it's not).

I've just realized that only the choice of hwaddr/uint64_t overlap; I failed to take this 
all of the way to building disas once.

I will integrate our two sets.


r~


