Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA4E437A8E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:04:01 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdx1U-0006oL-0O
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdwxe-0003ut-VY
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:00:03 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdwxb-0001zq-DD
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:00:02 -0400
Received: by mail-pj1-x1032.google.com with SMTP id np13so3278712pjb.4
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D2HrNx6PoeRrrNE4aonbqT1oZEz+JaSt/XwvFjErvDM=;
 b=wTDkXpaGDvtxeFfKrSlxjBvuMdjqlhx8M1kLQPsbYCd+lr0lGOdRfslv6c9LKBeBTi
 j5TAjqxYPwbDjxFrY+9JzoUicW7Mu1Y+wQOtIMqkGm7kJ4W1PIh5/57zJVro6O9EJZMw
 5nC3BWht+oazDRs8vZqm7G3qzqKW01U71Fv2fKlMYlTPKbW4BIEjNQxdFTfn16IWad5/
 LsyAvD9y3CAIT+WoQ7Ojr8z5Av0gaz9dLYtwLbDVknA+SxUGU2VHxIGOBMvuWtZlkLwA
 xOCzF1joj40JA8apXS2naFi0BrQj0z5o4eOx4URQEzY1O/nW+jJbMCXp4kYhspRFoAop
 4jJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D2HrNx6PoeRrrNE4aonbqT1oZEz+JaSt/XwvFjErvDM=;
 b=ECllQNmw0uh0TLbunvR1o71GeWxNC8b63yKs/rsIlHlELckwcCc5NFsiXxSDiCda0/
 NW6trX/eP6ZedeVrVDt/+L67zlBYZCuqnG1vkLaWD5TMYHkUCdTcKmw87S9g/PlClfWD
 4dkeWVhqq8az9nagEecH8AEN8jmT1EgTaknLQxBllxEF37xnzqb5KaT/TJK+vFR0m9iM
 2hRbhKlO2ADcx5k2+bDjFEWcV2fA3zI8H8IYqAYG6ubZNYKhQvn0iYMTG8orYiCPNtzt
 Dpl+PeTPyOVAJf6FX5cae4pz7XUusBvS7JGspYKHgLIZhH8s5CHxqhtkmNYDDE1lmwQS
 ricw==
X-Gm-Message-State: AOAM53387Ozpl4jLfCCHwOUXglI4OAI8vRahvHZP3YtoSron6GZwVWRe
 Xx4mbjcjmWe2h3lZm+lJE+5Mgg==
X-Google-Smtp-Source: ABdhPJx5zR2mdchfFa/J8GGBAnrfm00k6eLxLt17Q7Pg2CDuSwYNJAA+XZjujZWlqIv68tg8iJ8bZA==
X-Received: by 2002:a17:902:868c:b0:140:f6f:8a10 with SMTP id
 g12-20020a170902868c00b001400f6f8a10mr744502plo.77.1634918397606; 
 Fri, 22 Oct 2021 08:59:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z4sm10590040pfz.99.2021.10.22.08.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 08:59:57 -0700 (PDT)
Subject: Re: [RFC PATCH v5 2/3] riscv: Introduce custom CSR hooks to
 riscv_csrrw()
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
References: <20211021150921.721630-1-ruinland@andestech.com>
 <20211021150921.721630-3-ruinland@andestech.com>
 <cdafb564-6ed8-c951-9381-3a90175abdde@linaro.org>
 <YXJ3lEChs9bSkqSZ@ruinland-x1c>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04cab623-4695-097f-28b2-96e80c7a5ad2@linaro.org>
Date: Fri, 22 Oct 2021 08:59:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXJ3lEChs9bSkqSZ@ruinland-x1c>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
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
Cc: ycliang@andestech.com, qemu-riscv@nongnu.org, alankao@andestech.com,
 wangjunqiang@iscas.ac.cn, dylan@andestech.com, qemu-devel@nongnu.org,
 alistair23@gmail.com, bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 1:34 AM, Ruinland ChuanTzu Tsai wrote:
>>> +    /* Custom CSR value holder per hart */
>>> +    void *custom_csr_val;
>>>    };
>>
>> Value singular?  Anyhow, I think that it's a mistake trying to hide the
>> value structure in another file.  It complicates allocation of the
>> CPURISCVState, and you have no mechanism by which to migrate the csr values.
> 
> What I'm trying to do here is to provide a hook for CSR value storage and let
> it being set during CPU initilization. We have heterogeneous harts which
> have different sets of CSRs.

I understand that, but the common CPURISCVState should contain the storage for all of the 
CSRs for every possible hart.

I might have made a different call if we had a more object-y language, but we have C.  The 
difference in size (here exactly one word) is not worth the complication of splitting 
structures apart.


r~

