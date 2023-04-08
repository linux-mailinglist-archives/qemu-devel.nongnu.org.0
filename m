Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C296DBC8F
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:10:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plDxC-0004SB-0B; Sat, 08 Apr 2023 15:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDx9-0004Rv-M6
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:10:23 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plDx8-0003Tf-25
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:10:23 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 c10-20020a17090abf0a00b0023d1bbd9f9eso4054992pjs.0
 for <qemu-devel@nongnu.org>; Sat, 08 Apr 2023 12:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680981020;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SVaE0yqBwkIqIo6KEtf75NqijuaTzVu+4BUp1edf/zg=;
 b=mNiczi+rOUKdyvRl7nGwmLiuCba29tKz5dZOY8gOZl6OFoaK1DRTaYMj0W8peqEP+X
 PRUsf7ks60+F7AbbqiRDBoXted3jgJIfQzuV1S/IC3m7UVbehyfTup/GmX4iEBXMSzUK
 ihG1tpeoiZeNOhC/XRPRb+TvdFuzM8hqI35S/ReIVyqFLnPO0KKtOwDo4lZ8yV1goMlo
 KYIIoHWNsWRqcO7F5LdVfObTyfLjNe3yZsBD57OTfNxvtC66SizeT2J4IbaLPve13aT7
 TlaTtgCVUs21WzEX6U+vzBFRyX+4LmrNHOiWzHR017xbkzaj3wdOQHTKBXX5UUxZqy+l
 LEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680981020;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SVaE0yqBwkIqIo6KEtf75NqijuaTzVu+4BUp1edf/zg=;
 b=4+E001EQ3NcdU/7qSGqCwN9TDhRkGTzGHteWl1k5fQUFrtJCEqqquwvEZCj7ZJ69AN
 TBn53OFXkVbSK/MPBEWE6Q1D9qPt8Wx7RqElPpJr2HS6k7znnVJbCUl6LfVbDhiFPbU8
 Lu49jkqqjqD0n6uJQTl3nE/M7GbQp/BM8dZ9rA1broWsizucTDt3MHUv6y/LsOSRc8fT
 5NTcB69jJjAJOIPYS8Z0YcU72fTsoC1/LeJess/heRjhmwAkFsJ4MhxWnyjzamEPWKne
 lPvmySUhnA9kSfCd88wXmXGybUohPMcrWJdHhqqId5vtkEaMkUyYAWNS2/Ey4x3vQzTR
 x9Yg==
X-Gm-Message-State: AAQBX9eb8KmVAtCnTuvNKIUd2qNaalVBWJ70y6zm+qsZrlJSQcWoP+Og
 ve6c/t8Ni2Syt+UF1NW5x30eeg==
X-Google-Smtp-Source: AKy350b3+WNe3rmrNYhwghP0If01NwjxBM37t+79caPCyOyQTDGDe7c3SehJg3O2TCGVK3ovPVlvWg==
X-Received: by 2002:a05:6a20:bca4:b0:de:4f40:e226 with SMTP id
 fx36-20020a056a20bca400b000de4f40e226mr6472951pzb.52.1680981020635; 
 Sat, 08 Apr 2023 12:10:20 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:fcd:4458:21c7:367e?
 ([2602:ae:1541:f901:fcd:4458:21c7:367e])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a63234b000000b00513b40f2c89sm4453748pgm.43.2023.04.08.12.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 12:10:20 -0700 (PDT)
Message-ID: <24e4eb15-f068-e9b7-290b-c2d11d5b7f52@linaro.org>
Date: Sat, 8 Apr 2023 12:10:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 09/16] bsd-user: h2g_rusage
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, kevans@freebsd.org, Brad Smith <brad@comstyle.com>,
 Stacey Son <sson@FreeBSD.org>
References: <20230405213612.15942-1-imp@bsdimp.com>
 <20230405213612.15942-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405213612.15942-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
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

On 4/5/23 14:36, Warner Losh wrote:
> From: Stacey Son<sson@FreeBSD.org>
> 
> Converts host's rusage to the guest's rusage.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-proc.c  | 48 ++++++++++++++++++++++++++++++++++++++++++++
>   bsd-user/meson.build |  1 +
>   bsd-user/qemu-bsd.h  | 30 +++++++++++++++++++++++++++
>   3 files changed, 79 insertions(+)
>   create mode 100644 bsd-user/bsd-proc.c
>   create mode 100644 bsd-user/qemu-bsd.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

