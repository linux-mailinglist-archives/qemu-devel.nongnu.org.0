Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA53A1DB6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 21:31:14 +0200 (CEST)
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3uz-0003mf-PS
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 15:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3tp-0002sr-86
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:30:01 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3tm-0004YN-JG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:30:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id j12so20447327pgh.7
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 12:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yP4DVEcItaeDrrHGxmyJMLboKhuhWbkjnVOyHY5sdI4=;
 b=ePlA9xCVZESSMFotnvGr77J818TjIQ8l50oABFjgdv8X0jWXmFMA0cgTyo34hvpyXK
 4HOemf5joZYyTeG3M8pKlTH4Jwp1FFfLbU6pmR3oTQo4084P2dILwIsCGaYrHk9wSXmX
 r1X/yJTcWycwi0WepcWHj9UwvZh40JFo+5rEgBYGxnfrHtpJUbcRmHokelbsRcXK+WoN
 DYOBKvEfUkIyj33PViKBjpBsY6vMLlEK7rugfX6DpcwooSdDbPZPy0S08trl5KYQkGBG
 Z72XfP4ab/b7Le4Mf3owtuezpvlOabvXFpVkaj4kTNFhrnNjww+JyfqqJCdtXDXxgJp5
 tlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yP4DVEcItaeDrrHGxmyJMLboKhuhWbkjnVOyHY5sdI4=;
 b=FLGYDyLDodvD5+JUljkcCteg/YvLdHHJW73tJqPzVzNmu2hAKV5bCr5hzrtQcoAEgd
 /NZqcyHjRNe9VDi4kL8iLWaNXvI68BLRwNZDxW+gUmh4fAdH0ZmcjU0kqtl7l0/jMCT0
 MEUZF0Kzu4iu7jAz+jQOQhVYtrcz3bdiXAfH9sHt4dQWu9XPcmFLiVXoxhSknQ/E6E/N
 XKO/3kvhC9ggzOerx9VXM9rg+d+7zAYsNR3Ih7C2ocSLN4rKo0WVcDkt7B6k2lP6X9oQ
 8RuDu1cK1GNJ9w4wgCTGcyo3mrGAVJIN8Au5096Ug3CpfNtdVpqkxUVkk7n0n14Z7xFa
 dtrA==
X-Gm-Message-State: AOAM5337kOi42Ugjfp/Xqp/XSMA2PLCCX0FFGBoxRop3c04dVHTrjCNb
 0TBgAGck4UWF4Yf2bZOFB5jnPITiJb/vpQ==
X-Google-Smtp-Source: ABdhPJw9osr+pzp4f+R4cTtZDcExeKcnBprvmLRguQtHtuyG/kfvACUJXZiocG4PN4qI4GAzurNSmA==
X-Received: by 2002:aa7:808c:0:b029:2ee:2ceb:6bdc with SMTP id
 v12-20020aa7808c0000b02902ee2ceb6bdcmr1374103pff.42.1623266996939; 
 Wed, 09 Jun 2021 12:29:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z28sm322868pfr.76.2021.06.09.12.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:29:56 -0700 (PDT)
Subject: Re: [PATCH 44/55] target/arm: Implement MVE VQRSHL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-45-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c62424c-070c-78af-a956-234b62593138@linaro.org>
Date: Wed, 9 Jun 2021 12:29:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-45-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the MV VQRSHL (vector) insn.  Again, the code to perform
> the actual shifts is borrowed from neon_helper.c.

Again, there are helpers in vec_internal.h now.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

