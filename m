Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855DB201B77
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 21:41:16 +0200 (CEST)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmMt1-0002mg-3X
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 15:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmMsC-0002Ey-Dh
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 15:40:24 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:39572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmMs9-00058L-TX
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 15:40:24 -0400
Received: by mail-pj1-x1041.google.com with SMTP id h95so4698346pje.4
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AwaDilnOJfQ9zPJlgT5+oqiT0zhl4P+ZEZjGiVPxoUQ=;
 b=G0JBfI0U1KFDlR/ppoQl7700gBSeGeX0SVp/RIO6Ag+GqfFkwlkach5cnhL9EcNI67
 zFIGdikbCJT5sMZZq6b+hAHJKWUpHLlYsPN/WllrOTZe5hulTwPoH3B9/+DLjuwXFB5G
 afWcOw0d/0VtsnqGT6rQl3JJjSZjZfyPtjtpFrYsVfJgtlGAB4E116ACOTzOwOtHhuWq
 ib5vAginYI1zNMfciq3Y4ii+vdjvj3E6lJ5lRg19nPAQ1Cvb+7uy/XPLIlkjhc8CPg1U
 iNb3fI7odGQhy18LxAJqJDYT2+Hb1z4kc/kffhnIGDJ/zeEWF+ZGCqtMIkMihXBxHlvS
 A8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AwaDilnOJfQ9zPJlgT5+oqiT0zhl4P+ZEZjGiVPxoUQ=;
 b=AUHKN6+ZdIzPPLoMKBRR661e89Z9bbqnQwq2deWgBE67R9Riqt7ICgnEaw6lCR5ELR
 NF8vfs78J0fN2Z50RR3vWEQ9I9osWn9X3jJV79qGF8mthR7LuE4+spcCjCdAIuiF7GNb
 DlsEBKyPWdzpfwOglrklHXX0OQ02qGF7EqqRhOHJQSrJGTvcQO3ns36MXSRBjhdf+C01
 Bc0nnrAM9sPxaqLvz9s3EvT2E3Sb9nAYsiW31+Ov7OsGh/Dx8B/9Ae8I8HnmUouiHh1T
 ravsn7a9ecVxedWF8/Wra7lYTd1hwZQQjAUtPhuT6gKQBsBoScmA0d5TCfSOgc7VA4Ae
 E1KA==
X-Gm-Message-State: AOAM533wfrvMQnpKdg4GnA+b4D9+C/tA9megENfDiZnoqx1/rjxuf7mW
 0QmulFTgFUXm1vrzju69MwAsDw==
X-Google-Smtp-Source: ABdhPJwaBOb82vfDvvSHTgs+wureIlxXFOAx7B+uTosgUU+wTAhBIUBLhOpFE6hpu6mBtqmk4NffJg==
X-Received: by 2002:a17:902:c40c:: with SMTP id
 k12mr9202501plk.11.1592595620349; 
 Fri, 19 Jun 2020 12:40:20 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id a17sm5763284pjh.31.2020.06.19.12.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 12:40:19 -0700 (PDT)
Subject: Re: [PATCH v7 30/42] target/arm: Use mte_check1 for sve LD1R
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-31-richard.henderson@linaro.org>
 <CAFEAcA8SgB6j3F6-HEZot_u13WAgu__W77vJq6FakGMGWzGLEw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e079b2e-15aa-cfed-4ab2-e0a1ec91b068@linaro.org>
Date: Fri, 19 Jun 2020 12:40:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8SgB6j3F6-HEZot_u13WAgu__W77vJq6FakGMGWzGLEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/20 7:03 AM, Peter Maydell wrote:
>>  static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
>>  {
>> -    if (!sve_access_check(s)) {
>> -        return true;
>> -    }
>> -
>>      unsigned vsz = vec_full_reg_size(s);
>>      unsigned psz = pred_full_reg_size(s);
>>      unsigned esz = dtype_esz[a->dtype];
>>      unsigned msz = dtype_msz(a->dtype);
>>      TCGLabel *over = gen_new_label();
>> -    TCGv_i64 temp;
>> +    TCGv_i64 temp, clean_addr;
>> +
>> +    if (!sve_access_check(s)) {
>> +        return true;
>> +    }
> 
> This cleanup should really be its own patch.
> 
> We should probably not call gen_new_label() until after
> the sve_access_check() ?


Done.


r~

