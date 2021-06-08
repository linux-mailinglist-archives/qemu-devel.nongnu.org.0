Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCD439FB35
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:52:30 +0200 (CEST)
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqe1l-0005ra-AS
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqdvA-0000Sd-Nj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:45:41 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqdv8-0003rM-K1
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:45:40 -0400
Received: by mail-pj1-x102b.google.com with SMTP id g4so2688403pjk.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmYxLEFSTZs8BqUbO4fioujxRSd2T3wCqYh+KgxW0AU=;
 b=HNXcDguAft7m/mVz2FxhhVY5WL4JoNI0kHtAOTbSJq7W2DwXWRyf5cv4wX/EKfvQzE
 Q3s9n8Q9hjdbGBMK5HG03rFg8dW/V8WaU5dtP3p/4xK7F9JIw2Rrycbqz34tIURZnGy6
 yZcf1M4+9IefF32D7dceQhZA6JbytbZdit9IffcZXyKKKJgGJE4/Sx3A8WjMJJJgkY0X
 GV54UUaSCEo8/7ZrU+nV6uwnzeRivY3F23JhsPIkZ2Nyb6/gHG5WruMDhI9qEY+JXuup
 aKJ2+8IazBo6UAeUC/vzXKnCr2qXnGNkWb6g3OIS3YDNFhiFokvOHYvlDgAStiR9H3KB
 CpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmYxLEFSTZs8BqUbO4fioujxRSd2T3wCqYh+KgxW0AU=;
 b=mwwdsAWBkwdH6WKPgdi6XUkrKWEMna4hNr92s2KQIZM75KcyevJgYmDmw6yuRqRidH
 vyTeBece/wZQJ9tEkAnMxmQvuFMfxPvYHNzV0MxKTns5ssSpAUEFlzFgQ5nqmg72uclg
 vgaOUS8n68yhQGXKWwJKT6QaTE6nwxEnCCWkvU83hTM76NKOgJLbD1umumGqRnN6VfiI
 Ie64D5bdnHlBpdSuWTrNv7lpGHQDd4Ee7okItqsQtilbvUOMY0E/efOdVQNR3wlsLL7H
 cnnlNrImY0r63FoOq29plaLu5EADCPOD3ffqDl1z0Jd3VAPFXo/9InpBrH3PD0dRZb75
 f/7Q==
X-Gm-Message-State: AOAM530PfI40rgKwTde0F/jGuePwpBoUHombeVzTYVb7tXzzuku6GgyD
 A3nspvHMcOAaK/yfdTk6+S+ncWyaPvQ9Vw==
X-Google-Smtp-Source: ABdhPJw/xqqr9JLPpA9yBSm+8jgmmuNpQq3EnB8mJrh+aFpesoE0a4BBW76KBmqY7mtbnGSn2lnQSg==
X-Received: by 2002:a17:90a:c905:: with SMTP id
 v5mr5551182pjt.136.1623167137081; 
 Tue, 08 Jun 2021 08:45:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h6sm11205816pfk.40.2021.06.08.08.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 08:45:36 -0700 (PDT)
Subject: Re: [PATCH v3 12/28] accel/tcg: Merge tcg_exec_init into
 tcg_init_machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-13-richard.henderson@linaro.org>
 <87r1hclgbt.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <37f75da3-57e4-114d-fb14-bb118d1e7006@linaro.org>
Date: Tue, 8 Jun 2021 08:45:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87r1hclgbt.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 4:55 AM, Alex Bennée wrote:
>> +    tcg_init(s->tb_size * 1024 * 1024, s->splitwx_enabled);
>> +
> 
> nit: you could clean up to use unit.h definitions, i.e. tb->size * MiB
> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Amusingly, I cleaned that up this week while rebasing.


r~

