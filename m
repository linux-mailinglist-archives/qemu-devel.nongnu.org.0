Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC85526D5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 00:07:32 +0200 (CEST)
Received: from localhost ([::1]:46898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3PYQ-0005ZE-Ua
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 18:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3PVb-0004MZ-1K
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 18:04:35 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3PVZ-0005CU-1P
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 18:04:34 -0400
Received: by mail-pf1-x432.google.com with SMTP id d17so2401760pfq.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 15:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Bi9aVVkGNO0tgxpFfUOmcg8piMXM7nimjcWOJlG5W7k=;
 b=oywo5U5eQT1/iUuKk8MB8Ooh0L8G4y+8iI9/kFAAQaOtHef8ZHohDKd550nZbM6YSx
 HXf6xnzdM669iZkbZHy4YDMxUyTOeX+jDzgZ186lDPoKTFC0bINVMH0zhvmFXLkQIsjm
 dE5OkzBT3S1GRKB1Eb5LE6EJoT+l+ASKQzO37+ul4yOBBLBMx3rFn6gTvimmW8U4418I
 UrdloIAQY/WDaWASVYrRbfj7u/pAG6VmLX7VA1kklMF/ATNJUjz9gQwsX1pBNomEFVed
 3zg3Y2Z7clWlojbxEgaNhNPc7o5cOVj5Wfi7UpeYiqwa4LrOLfxK5fWR4vcSfsEZdojD
 B3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bi9aVVkGNO0tgxpFfUOmcg8piMXM7nimjcWOJlG5W7k=;
 b=HjZi9AqnvzFx8p2sUJqCphcY4uYYP3FlO+6wt4cK8Jamk9m7MnBVG13w0xu89SHE9u
 OQ1b4ySb7zfsDHtzGVNjAnbAW5yZlQogw96WIIxD0ZvkEbDWj6Bd+JdfgK7/dtAnqbxO
 wfn0dx6STMvJz2GqPIGm/2R2EHl70bPHewstvokBc4yXIDwZB0vDwn1Tox8WOzjvtA/O
 o4z3J4diyadgGGCmwcFCcj8QlJC6Q6+2R5PCkrCUZTQ5I9w8QLJOWnubFq9emVXXqk0q
 ajnTbf/bvtqyO7AYjl//oMa/SbICjzgHzhzBfEW5x7JSPm0KX+IqkZDluoATzuwOEuWb
 DhJA==
X-Gm-Message-State: AJIora/lu4kTJtwmElu3EnVMJPJ/lzQuLUMlOYmMsz14mOPHdNAZJR+m
 wLgYWaDx0E0fNicFsKk0UbP5bw==
X-Google-Smtp-Source: AGRyM1vNzEazJbFuPYx9h5l7gYCYL+XT4jlOjiMy4m5DO1GFE1pcK/C939565JT3tHk85rAU7uZ8bw==
X-Received: by 2002:a63:3444:0:b0:40c:f416:3dfd with SMTP id
 b65-20020a633444000000b0040cf4163dfdmr861363pga.614.1655762671324; 
 Mon, 20 Jun 2022 15:04:31 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 a9-20020aa780c9000000b005252ab25363sm1888055pfn.206.2022.06.20.15.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 15:04:30 -0700 (PDT)
Message-ID: <f098cca7-cea6-40e9-78b2-46dbf8c40a16@linaro.org>
Date: Mon, 20 Jun 2022 15:04:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 2/3] target/nios2: Move nios2-semi.c to nios2_softmmu_ss
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220608023816.759426-1-richard.henderson@linaro.org>
 <20220608023816.759426-3-richard.henderson@linaro.org>
 <CAFEAcA9q6fzATOqHZZ7PZDX_jLiYdc_EsvPEzMqnB+Ehz=uQuQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9q6fzATOqHZZ7PZDX_jLiYdc_EsvPEzMqnB+Ehz=uQuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/22 03:36, Peter Maydell wrote:
> On Wed, 8 Jun 2022 at 03:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Semihosting is not enabled for nios2-linux-user.
> 
> True, but maybe it ought to be (in an ideal world)?

No, I think ideally there'd be no semihosting for user-only.
If you can write to semihosting, you can write to regular syscalls.

Semihosting is good for when we want to do testing of system-mode stuff, and we don't want 
the complication of a full os getting in the way.


r~

