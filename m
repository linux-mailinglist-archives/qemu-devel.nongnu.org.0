Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D9A5915AC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 20:53:30 +0200 (CEST)
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMZmj-0005B8-PW
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 14:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZB0-0003Zn-Tg
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:14:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:44574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMZAy-0007HZ-Nf
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 14:14:30 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso1601135pjd.3
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 11:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=gTqMZbvThYf+YZ8rZTncJub37ToENrJ/c+STF8b9lyU=;
 b=YSNkC6Y4lrG6oOWpZrc3ZbrUPYlspKbsgnBnDdopJtAFYN89tFn1NyjrwxkUB3j/uG
 GiN75U1vZxaCdMZYgOEAfNo9yKdahkuD3Vy6aftuKvpz/Sjj2+VnLR8ZEPjaMUcrrrE7
 /+LNZdH6pRLSZxpdH37rS9XuqxBR/bkfVRF6oCW99fKsYxF2J4PKTtQuyXxSME6vz0Nu
 o6MiyiuFsHGEQsb9vk55jAe3KN6h45hn8LUuSdluATyzOnvTNPN8xMr6cVl1ruJhkGxl
 WsBn/xesY3S05cAwJ8H+bapbxeYmM2EOXA1EHrXY03kGuM0AiJGcwytvdiDP8GQqoLsO
 /5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=gTqMZbvThYf+YZ8rZTncJub37ToENrJ/c+STF8b9lyU=;
 b=BYhgJq8S/SJeVFe/VY4v7FOHvq0RyupimVco/QHx1y2VyCpawMvk9BaFZG5gHdlO3M
 030BiGsQ6C62603ySeirvaQLJAblFlvgO1jQG/1w+v494woPnHSkAxi8DqKox6AER42e
 RKc7u51+JU3uSRmubrfAVOAzt48MFc9mDV7JhAMQLpvdNe4KxzPiP3UkhP5QsqCS7s2n
 JAvsoYvaAGnsLm0tmwkaRsz9sYB0ODGqcdf1B6pMnIK7EZaqr+NYDzhlpi1SXqnFMrkw
 bUA2mkjhiW2pwYlICvaJfCk7N3pOEmF261FLF/vXu1ue2Dvb6lKtpJPf9Fkbxtlkb0lV
 mPZw==
X-Gm-Message-State: ACgBeo1ZPokHu3+xODwCJbulfte+tw9yudx14JIyHfwhZR1EYKDSnDcQ
 crJ7GM0nnchhONth17f0QU92ow==
X-Google-Smtp-Source: AA6agR4YI8R/y4HxBj1FsdPFEZZ6dFz8BPB7mAH3OA08zlGDYihN/ugwFFO0Xl4bIK7s/dghMOHNtw==
X-Received: by 2002:a17:90a:9b85:b0:1fa:5d22:c92 with SMTP id
 g5-20020a17090a9b8500b001fa5d220c92mr77002pjp.51.1660328067085; 
 Fri, 12 Aug 2022 11:14:27 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a656091000000b00415d873b7a2sm1625154pgu.11.2022.08.12.11.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 11:14:25 -0700 (PDT)
Message-ID: <6bf620cd-6601-e624-ac4b-9d2f5f4a11d0@linaro.org>
Date: Fri, 12 Aug 2022 11:14:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: Rearrange cpu64.c so all the CPU initfns are
 together
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220812174156.1460714-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220812174156.1460714-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/22 10:41, Peter Maydell wrote:
> cpu64.c has ended up in a slightly odd order -- it starts with the
> initfns for most of the models-real-hardware CPUs; after that comes a
> bunch of support code for SVE, SME, pauth and LPA2 properties.  Then
> come the initfns for the 'host' and 'max' CPU types, and then after
> that one more models-real-hardware CPU initfn, for a64fx.  (This
> ordering is partly historical and partly required because a64fx needs
> the SVE properties.)
> 
> Reorder the file into:
>   * CPU property support functions
>   * initfns for real hardware CPUs
>   * initfns for host and max
>   * class boilerplate
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I started off thinking this would be a relatively simple "move the
> a64fx initfn up to live with the others", but because we effectively
> have to move all the cpu initfns the diffstat has ended up quite big.
> On the other hand this patch is purely code motion, and the resulting
> order in the file does seem to me to be more sensible.
> ---
>   target/arm/cpu64.c | 712 ++++++++++++++++++++++-----------------------
>   1 file changed, 356 insertions(+), 356 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

