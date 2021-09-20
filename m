Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88473411825
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:24:53 +0200 (CEST)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLA4-0000xZ-Ao
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKiB-0000af-Qy
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:56:03 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:42797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSKi9-0005FX-CW
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:56:02 -0400
Received: by mail-pf1-x42d.google.com with SMTP id q23so14394576pfs.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NM2m28CpIuWiw4TYHnGltHo7bmYxQiGKEODl1fJivEE=;
 b=TdCY3W43NtzFN8K9fhDdSjjEgIZbkwEUWMYfXLno+qJ3XqSTOlJRaWA4oxHm+lBymk
 7OgtkATdzJ268PbBZ3VKwSzJ4gXnz2zD1kNjx8YPuiO9zuIMwNUjA2j3+5bOsr6XBp1L
 xleNBPw2Q+gTH8ac/840KO+nXtulC015NiJBlFh6db9o/gHo0hNQhfUZaYnsXVexTrMx
 DFqtpm9Lrx3dcGpC+fFojbk9rGX1HoWJSyYHHTqcR3oGomi0aoFspP4jyaHvfPSceEwp
 XupPc7BaO9RUD2EU8RfRlg+myQj3JOvWor2vAzkm2xISrNYQYyA8aHINw91+3HTt3wIa
 U7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NM2m28CpIuWiw4TYHnGltHo7bmYxQiGKEODl1fJivEE=;
 b=ysfuLt8/Ux7dQleWFdyEPwVdKm3wqlJU9pc7i75xEc9F6HrEUdGuXjvTpW3y+RFQL6
 l48tq41f4aDlDSwR+WsU3EweSGwc6ooMVB/nDcVup+o/7ymgxUb4v5p7qMmz4vFZIWBZ
 npDDH2FnI9/c/AeBxaDtJuBSoo96PZKBGwJILmJNcP/iG2q9UZx3FtoVGhjsNZGo4Zip
 Ng4MSDVEDfpq4EqBaKq/t3gBxpeNuJVmz9/VLwPkGduqWPONW4vyS05P2Az/WLoKo3M3
 SMmee9M6UfuYZcIhNuknUWXtVIcgTMOfA14SSNZVpQi4dkX8Ax9mwf/Ez7ZDXaIRWnW4
 qv4Q==
X-Gm-Message-State: AOAM5339BzLsqjZeUAgka+MkWAKi34MXPRCliYYS9o4fPZiR7yVJe3MS
 CEnqngiRNxJIiXr4YIT5A6Z7odqjImpPsw==
X-Google-Smtp-Source: ABdhPJyxJv+dRZwPDgQMvWRf00KnD3vrmLQAD9MBSTUW+gd+HY9NbaiYfD+18SMgyjdFfPlSA5F1qw==
X-Received: by 2002:a63:784d:: with SMTP id t74mr23964938pgc.112.1632149759470; 
 Mon, 20 Sep 2021 07:55:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i8sm14283410pfo.117.2021.09.20.07.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 07:55:59 -0700 (PDT)
Subject: Re: [PATCH 13/30] tcg/loongarch: Implement deposit/extract ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-14-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a77e577-afa1-d1ce-4b46-b74857195398@linaro.org>
Date: Mon, 20 Sep 2021 07:55:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-14-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch/tcg-target-con-set.h |  1 +
>   tcg/loongarch/tcg-target.c.inc     | 21 +++++++++++++++++++++
>   2 files changed, 22 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

