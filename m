Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0C33B3CB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:24:41 +0100 (CET)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnD6-0005Q3-K6
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLn8k-00035w-Sm
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:20:10 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:33525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLn8j-0008D8-1n
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:20:10 -0400
Received: by mail-qt1-x82d.google.com with SMTP id 94so8993085qtc.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 06:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iRYfTYILhaK9qnO2U9zfWYnxYILouukHsN71M5nWhzM=;
 b=q8J3Epv1rt/xOdQlMV99xdy0tQkEa2y5i7iXYChwMOwxSEV5TsVu0sYmanG4Qyzcd3
 XnBrgn+SZWGClqmeh3VI414iKUQd7N4JSXH6J9a36Ls5hPSgJODnUQPWixuoQPtyi6DV
 qeNOTmhjxaukbeHUWrhwRQhIBK/Fcp/nWcbPdfI8CAi+GH4+vljM3kjgaHW2j0qXFckl
 cI/rQjcPGfXiVV0p2DTCEGE2ry6Mh8bIt0cwQFGNrF7BfW3inlVs9sM9AoNe5Ng30Lg3
 atP91uJ/o6Otalp+CG5saG0gNYQZvJSxfjrNrMHRcilxpUMc4QOGH7kfl4pLci/oOcvJ
 zL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iRYfTYILhaK9qnO2U9zfWYnxYILouukHsN71M5nWhzM=;
 b=MIASgwr6k+2NjcZ6TvB2zaCON+NFOOpGYXSAB6LtItr/5LJRRVFJ41FL5kW7xahmz2
 P/ebKtMKDYy6kRuLzyordTRiytQx0kHsF3kWEaDEEx7AcnHpnFnZAW0y0PQ1QXEFRYr2
 5CncYrzf6M1xH1iFChpe8f5wwWl5ccHZIqbnO9owWoNK4q/hIVjvoU4KcKeVbsGqPVjd
 aN7dpuk6yh7ml9BYlDUC5LDNXcWL+hv7vIfJVvBEnZ8yCKP+ZLZXNwk6eXoDLKXhkxYx
 WDNTuNXZWUDr13DlRpHAKYfhKpWHinA+MWaF+QAyIhjri2lCpSvRwBR14qie+JUJiPt6
 ln2w==
X-Gm-Message-State: AOAM532JqO6lw62WH5loKxqGyIgmJHG1VbxR7CXNAUY9eoIdFLD/p6cp
 0Z9F3nnEpzy1bMun3gdoSPFufw==
X-Google-Smtp-Source: ABdhPJxVTcjxfEixnIwpCT978HdQ5XI2Lb7DC8maEw78b4y/OPydKxCXitGGLS3HyA+volFUTAVdpA==
X-Received: by 2002:ac8:698f:: with SMTP id o15mr23150093qtq.39.1615814407676; 
 Mon, 15 Mar 2021 06:20:07 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id f12sm10227664qti.63.2021.03.15.06.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 06:20:07 -0700 (PDT)
Subject: Re: [PATCH] utils: Use fma in qemu_strtosz
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210314234821.1954428-1-richard.henderson@linaro.org>
 <8422f58c-743b-e028-a116-b7c3b507e3c9@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <af27e76d-7ebc-c1cf-cad0-bdaf6850d47a@linaro.org>
Date: Mon, 15 Mar 2021 07:20:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8422f58c-743b-e028-a116-b7c3b507e3c9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 11:32 PM, Thomas Huth wrote:
> On 15/03/2021 00.48, Richard Henderson wrote:
>> Use fma to simulatneously scale and round up fraction.
>>
>> The libm function will always return a properly rounded double precision
>> value, which will eliminate any extra precision the x87 co-processor may
>> give us, which will keep the output predictable vs other hosts.
>>
>> Adding DBL_EPSILON while scaling should help with fractions like
>> 12.345, where the closest representable number is actually 12.3449*.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   util/cutils.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/cutils.c b/util/cutils.c
>> index d89a40a8c3..f7f8e48a68 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -342,7 +342,7 @@ static int do_strtosz(const char *nptr, const char **end,
>>           retval = -ERANGE;
>>           goto out;
>>       }
>> -    *result = val * mul + (uint64_t) (fraction * mul);
>> +    *result = val * mul + (uint64_t)fma(fraction, mul, DBL_EPSILON);
>>       retval = 0;
>>   out:
> 
> Will this fix the failure that we're currently seeing with 32-bit builds?

Yes.

https://gitlab.com/rth7680/qemu/-/pipelines/270311986

