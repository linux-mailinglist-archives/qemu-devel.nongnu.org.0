Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C964F25B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 21:27:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6HIc-0004wP-A9; Fri, 16 Dec 2022 15:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6HIW-0004vt-3H
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:27:13 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6HIT-00082S-ID
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:27:11 -0500
Received: by mail-pl1-x630.google.com with SMTP id d3so3389178plr.10
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1fDYIxFfcQR3MGvt8lJvtLwGjRidoBOWYk+1jZ9Q0YM=;
 b=bgEIZH7LO0Hip8kRsNVkTHUYs95AaWl9F2wAsdNGBKCSuFOnEAb6nmSMQWSXRUbiI5
 WvoF3ABmcEkCbGyotvUWMjOAvu/PWPMPCUasclr6w9fwb6ai0y5PuIWyG69UcOe+h4pz
 zoRrbI1Yp5C73m6MwuglVFjO7qEmLs82Fco/Dl0Pt8y1ambCXX9950dl3H+81FaQfpOO
 ldiHnKWT/+DJ8SvPxUeiorJis7pcRB4LA/o0ytNuoLihavoCbHqZ4XDuRCd86pXbid/e
 gQsrk6kgnSh8GGhZy+4GkaZNihjEzUgDLpGFuV2rdhQttOjOKp30scdYUGrz+0s8eFQb
 oo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1fDYIxFfcQR3MGvt8lJvtLwGjRidoBOWYk+1jZ9Q0YM=;
 b=pUWl51YyMEq2ShKVGadgwsMikvD4u//0XbqgCLC0oWxo1YRk3PMZe0cAsrHnmurUyr
 s8T5z17EsfddYo7WJ5DyjurUmS3y5iPPO1JyBRH8HFRTn27s3E1hBBZStEWKgvu3uNDN
 vnTV8ZzCQ4rLHGPvOg99OFCIWS3u23udBgbnpYzZrC7bLudKbQP58eq9AHgd7daVa3Bu
 kAwNWW/U3FYFb9/GZ7YzgEVHF7sml3bxtJFSzVDZh528Hg6gzBvFSA7Q/0OqKC3q0R/1
 tiDApBiBMilAWu9slzrwN+/1kZQoToknQscQHok/AnHef4b9779wTtmZ56xH88hTid0T
 UK1A==
X-Gm-Message-State: ANoB5plNwsfnnDEvp1OfrRMpZc8WG69hoxTHvKad/0AG5l4UyPwWYPMb
 VRZS8WVDtqgpShhqGijOcd7jIg==
X-Google-Smtp-Source: AA0mqf43JgjP6PCcABg87d2mAtaI+SChg7lJhKGRRndBXmNn/c+y2/K6f9ATK8Xmc/bvvafIT8Ii0w==
X-Received: by 2002:a17:902:e84a:b0:189:feee:4926 with SMTP id
 t10-20020a170902e84a00b00189feee4926mr45079044plg.16.1671222428082; 
 Fri, 16 Dec 2022 12:27:08 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a17090332c700b001897de9bae3sm2033884plr.204.2022.12.16.12.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 12:27:07 -0800 (PST)
Message-ID: <953a1a28-c68d-e79c-7c32-87c5220f4efa@linaro.org>
Date: Fri, 16 Dec 2022 12:27:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 08/10] gdbstub: move chunk of softmmu functionality to
 own file
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
 <20221216112206.3171578-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216112206.3171578-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 03:22, Alex Bennée wrote:
> This is mostly code motion but a number of things needed to be done
> for this minimal patch set:
> 
>    - move shared structures to internals.h
>    - convert some helpers to public gdb_ functions (via internals.h)
>    - splitting some functions into user and softmmu versions
>    - fixing a few casting issues to keep softmmu common
> 
> More CONFIG_USER_ONLY stuff will be handled in a following patches.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h  |  60 +++++
>   gdbstub/gdbstub.c    | 618 ++++++++-----------------------------------
>   gdbstub/softmmu.c    | 420 +++++++++++++++++++++++++++++
>   gdbstub/trace-events |   4 +-
>   4 files changed, 595 insertions(+), 507 deletions(-)

I think the last 3 patches all try to do too much at once.
I think each of the bullet points above could be done separately.


r~

