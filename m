Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7743B3E9739
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 20:03:12 +0200 (CEST)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDsZL-0002y8-7L
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 14:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDsXc-00025y-E8
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 14:01:24 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDsXb-0004Yn-2d
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 14:01:24 -0400
Received: by mail-pj1-x1035.google.com with SMTP id nt11so4790195pjb.2
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A0RNL3HRRjud3Y+DX1SeogZjbb8DnZj3RGRkcKqaJI4=;
 b=RwD7D4+42VwIbAzOH7VbA5GWHJUv7ofgvqsU1tQ2y8v6jVqSgHg0lxCFhXvLNxgxW8
 GI53bgG0DXmQ8YImQMqxupQp2QsaBhlzH/sG+lGXGTQ9ekw2KfdkkSwktoOdmZ65/78V
 BbnmUAeB9lv5L6UUifw9fvUWH89+ix4Z0buYFmasReVVDKflGAZwpGrq2jL7QuRVDGhU
 lXw7WW/CKwg8YGcjlckqGJLSEoBcOcz9rYa9et7Ls7YGFdg1piYVNDiQcxERjuRyW5Jz
 za/o4VwGT1gdfrOeoH4RD4mGeNdfN3rq0yHpV8xkP7uFbHJQ/vCDr/tlKt7OXt0Ye+GU
 X3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A0RNL3HRRjud3Y+DX1SeogZjbb8DnZj3RGRkcKqaJI4=;
 b=s3hTn4EWb05Yxo11VC7GO3atFCBvsXyRTRS/f6BUFOe9AvxVeMQomkWGvmuS8b4xJT
 2XKXr+IKV10nAgPCuGu/fkN8bDuEVghs2wMKz1S91Pup7sLnmxH3+kOVi0vA1FnmMQux
 npCjVKrQy0aHmMIOqHzqILvaBI2PedHIIP9R3USk6u+8d+kjo4ULSYXne7Q5pQlYNTUf
 pBaPzTdDUh0pw6lU/Ys5QpME2h56JUOe/rOvZIFobK6AKrzAUdz1Ow/hqoafc4PzcwtY
 2IVq0e27I8P3Tblz0CNdVje88m4D+NKCd40DdWzSDko6iDxk/SoKLH3s95pHS1s0/UKD
 9keg==
X-Gm-Message-State: AOAM5338Ym8saMgCDpLuknCgM4XSckeMQ2fY0lUDUEHz0M3phUipb0of
 hN4URKDBrFX+7MhS2F8qBJE+SQ==
X-Google-Smtp-Source: ABdhPJzIYL4NcRIpx25AK0YO22EtunpTMY9wgPuwxrFPZOlWdHGNqQCDsZDT5y89r+3/WBPjSMIhJA==
X-Received: by 2002:a05:6a00:2411:b029:3b6:2acf:6d16 with SMTP id
 z17-20020a056a002411b02903b62acf6d16mr35636pfh.44.1628704881352; 
 Wed, 11 Aug 2021 11:01:21 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z24sm150004pfn.150.2021.08.11.11.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 11:01:19 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: remove redundant TCG_KICK_PERIOD define
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20210811141229.12470-1-lmichel@kalray.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72a05969-2859-1c4c-3a6c-4d0fa322a1dd@linaro.org>
Date: Wed, 11 Aug 2021 08:01:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811141229.12470-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 4:12 AM, Luc Michel wrote:
> The TCG_KICK_PERIOD macro is already defined in tcg-accel-ops-rr.h.
> Remove it from tcg-accel-ops-rr.c.
> 
> Signed-off-by: Luc Michel<lmichel@kalray.eu>
> ---
>   accel/tcg/tcg-accel-ops-rr.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

