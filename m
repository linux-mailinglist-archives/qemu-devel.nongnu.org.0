Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C865D381A19
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:14:37 +0200 (CEST)
Received: from localhost ([::1]:37122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhxs4-0001eq-UI
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxrE-0000t9-HZ
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:13:44 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:43681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxrA-0007Yh-Jz
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:13:44 -0400
Received: by mail-qt1-x82b.google.com with SMTP id c10so1922724qtx.10
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V14QlN7L7aPdMVOnjzXsYjen88GCTGQIJIrsqNL3mVo=;
 b=ZeWMgAhIjcIozfWnGinExI/cQXeV5BLz1Omz0Gv1I8jAVUWkFlC0ScGqlcu1y7exZ4
 0FMy0cPAY8LJIi992ucg0B4LNuntQQSp3Z8SMMU9JfZETwzNEzkNcRsLR/CrXzRhcVVB
 xoAzTWjmR3uYt0bNgs4wROV0yVV/7cDryaHB7VgS7smQN82h5aZdXDwJa75woJFpwcMH
 RCjSknWbIUBEUPvh75biVi0shcYi+RgR/H06+EqwPBfD0xoAsWDfBFa+s4eWD/4CJIJL
 dB61MWW2ks0w8EdRp1pL+l0MtBg+frheF02QKoDysSUzhdVa465bfv4zrrFX/4bbeJyf
 8UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V14QlN7L7aPdMVOnjzXsYjen88GCTGQIJIrsqNL3mVo=;
 b=cdwTYGszFo7WLmeQ8lzPC8f9T703KaSfQ6sj3WN7aV3bywL8dJV3zDn2Zvi0BuFkSH
 /dMoGBEHtaKxViE2cYfXaViFXbqYSuegSOi7H86SGfQKdou1HM6xEUfJj0nkN6H54pEU
 dEhLDIbrzpWTbsym6a6QDhSK5z9UcN8nYcUVwvAjhIzq8yzIMc7cLg6fnxKOXzEAzUqj
 LMYnlXlH5VnIkvSUhcKdJ9VqG3WbpFL6aCF9wJqUU8he3wXx7JHgw3cahihBfMSWvRvW
 4Li2OwYP+uYeV8nKIZkc8ais8YwVv045Mzalj6V1KgJk7FW1khPqvGU++zJfL/8LUZVc
 sC+w==
X-Gm-Message-State: AOAM530j++JJSvKk74KKvSZfoVAL/A1o533IEqTuYv03J7DToLbgkdgB
 lfyKc+IWhsv2zQXQpkbY4q73rw==
X-Google-Smtp-Source: ABdhPJy4GZ4smeunolrz2qompHAk8lsl25oVF0uGhWG7hU70X+aJcuxPlBSGXUJO5oURvcVrEBC7kA==
X-Received: by 2002:a05:622a:40b:: with SMTP id
 n11mr47957916qtx.167.1621098819616; 
 Sat, 15 May 2021 10:13:39 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id t139sm7161011qka.85.2021.05.15.10.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:13:39 -0700 (PDT)
Subject: Re: [PATCH v6 77/82] target/arm: Fix decode for VDOT (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-78-richard.henderson@linaro.org>
 <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <47db40f0-52c4-f282-ecf9-eab2bdb7f1d1@linaro.org>
Date: Sat, 15 May 2021 12:13:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CA-NXEqVrT_VJJmYHDOcCZJUtQWL=qv8g052cVtEh5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 2:25 PM, Peter Maydell wrote:
>> -VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 rm:4 \
>> -               vm=%vm_dp vn=%vn_dp vd=%vd_dp
>> +VDOT_scalar    1111 1110 0 . 10 .... .... 1101 . q:1 index:1 u:1 vm:4 \
>> +               vn=%vn_dp vd=%vd_dp
> 
> Is it possible to make this kind of bug a decodetree error?
> It seems unlikely that there's a use for having a bit which is
> decoded both by a %foo field specification and also in some
> other way...

That's not what's happening here.  This has separate fields "rm" and "vm" 
decoded in different ways.


r~

