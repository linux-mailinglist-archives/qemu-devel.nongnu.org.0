Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B475660868
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 21:44:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDtZD-0003tY-SW; Fri, 06 Jan 2023 15:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDtZC-0003tE-Lo
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 15:43:54 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDtZA-0004UJ-Tj
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 15:43:54 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 cp9-20020a17090afb8900b00226a934e0e5so6343403pjb.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uZ4SPjHK/wVTxDkeBED38bKKgTGkdHBN7N2JgptsvZ4=;
 b=HG2n0kud1EPFiFQARObGG6GrqqKtHX5JQ3eyRhTeRdodV6y2us5blkHKsYqYV8jWf8
 OQZec+5287cqsV6QKLKqNTWGH2ffNNaGIdpccw7kuL9J1RU2iQBUDUXAO9M+7PrAKDjs
 lHiGASb0NwEKCOSbXWTP55XGH7xB9qHsnKafyucz2yPKiBI6zXlpav1gQ0cUQvzFep60
 KkYBjVVL0sbIljO63BUYi4BgMXNL6Bpads8l368k4igdqysiv+snIbzaxw9tuqOIn/dn
 FFI+3MonbkI7JX4SD4ee548/STmG+VdmaFophompYEia81bxDndJZD/f6Xtemkgdp9Tb
 yXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uZ4SPjHK/wVTxDkeBED38bKKgTGkdHBN7N2JgptsvZ4=;
 b=TY4lBBk5PgRabQMPQ9ddrakEN9FLaZdzvQRVpXvfS9AuUxpM+S3g6KsI1WlsUMpHIj
 IsNkq0+pFOA3og1PALspXn2ZJSmiANEFOUiComFawsk+7yhMziEGR67D7gVQT5seL0v5
 Nn0AVjanYQEQfeaBjKwgqAqBBgPO7O5IIOixAoJw024BuuTXFON3FGjL5Yt8jtwRdn6p
 9mr30L+jIvP97Y66IWuK8wkD0PPvjZPVjRyUwEYvsWliy1Yt6Z3d8L/oy80GLwK1ggg/
 RHJp/MSVhWf/WucfetIjoPZFaRGUqjPXzV0dxOzJLO1d6VRVo9RGmlCkA2HpSYb0jVLd
 9Seg==
X-Gm-Message-State: AFqh2kqs/d7FlELuUS4pOwfXGx8pPT3RL3OWSxVrGdDpf9F/o2o1fACC
 /I0BnYfOS3nFieNu5YiT7ky+lw==
X-Google-Smtp-Source: AMrXdXtMad2x16ItEFCvC3jNPCqbQa7PUWNUfmbg4OE7WLERGbX+tf01AovneVeEceyqtrZ/ASjjhQ==
X-Received: by 2002:a05:6a20:1e55:b0:a2:a636:70c2 with SMTP id
 cy21-20020a056a201e5500b000a2a63670c2mr76741103pzb.24.1673037831434; 
 Fri, 06 Jan 2023 12:43:51 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 129-20020a630887000000b004777c56747csm1253274pgi.11.2023.01.06.12.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 12:43:50 -0800 (PST)
Message-ID: <86384620-23db-1bb4-bb9d-d8b11db17fdf@linaro.org>
Date: Fri, 6 Jan 2023 12:43:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/21] gdbstub: move fromhex/tohex routines to internals
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105164320.2164095-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/5/23 08:43, Alex Bennée wrote:
> These will be needed from multiple places in the code. They are
> declared as inline so move to the header and fix up to modern coding
> style.
> 
> The only other place that messes with hex stuff at the moment is the
> URI handling in utils but that would be more code churn so leave for
> now.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h | 27 +++++++++++++++++++++++++++
>   gdbstub/gdbstub.c   | 20 --------------------
>   2 files changed, 27 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

