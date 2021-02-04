Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625530EAA3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:07:11 +0100 (CET)
Received: from localhost ([::1]:58490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uz8-0000ht-1k
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UfD-0000be-7R
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:46:35 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UfB-0005co-M5
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:46:34 -0500
Received: by mail-pf1-x435.google.com with SMTP id e19so1155080pfh.6
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U8q7VP8TB1Sq558SZFo2tUZ50Np62CASROy83OgGfnE=;
 b=Iri/OwSVrUkvYI4Ix/bh95lkzlGa+osrGIaXOd/4Ynoex2X/WLH0huSzf1LjG5toLh
 macx6hAAnQ3teAWSgaQiMqzP6jgS8qoKnOd6tEmKmvdJ1/i+UoowDTi/FyhLMt8UER7d
 VAznF9fX2E8AeXp/igPj5oOsPx6/eT1JiY8Er0A+mkitttnNPjYbQYDJJqQJOtBnNKEv
 e0cwOR1WRg2lyZjbk7SlqmSPUzx0E2m2PAOzBLrRj3rgUESs/oPf8p5aThlso9O02Z1J
 3wNqDE+JdMOno3y3yGhIaZVPSn8dg88T8FxQ8bB+O3wa9HH/kH0LmrrCLiE9uuZxwKr1
 3AKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U8q7VP8TB1Sq558SZFo2tUZ50Np62CASROy83OgGfnE=;
 b=UtHtsKX0Y2KLc2s9V9dNuavaUA8t6szHpH3trzUAS7qiDo3RRqIe4XTgmOluO4dCW5
 24P0k8Kwefq8nIXW91Cq5/ZPKhcoEG7WEpkIwMfwxWt65FjD7FiYEHEFmIoagUL0aRfG
 Patckmo8oPfdTglp0z+5YssqjBS/4EqteQEOCi+4kzdWzS+JGSx3Quyo4f15CPqvma6r
 jJBenbR2zMkDSLsmQAMIt/3PgoV1yF7G9I4qJZULCPUx7tQItqqJ3Yr02zoqSJAV8mp9
 BrE4LVOJx41skt1Zckts5UTfgFVIKW/bMESFrdjxpqB832G2B2tSCwiBbW/SA5bV09ZH
 L5Ng==
X-Gm-Message-State: AOAM533bHzadTndC5b1mWjEGvnp5gUXnE7WL8PP2SpLQ/KsrFgkAfEtS
 MRY2G61VsBA7/F6nBFFcQPYxSQ==
X-Google-Smtp-Source: ABdhPJzwH7liLSSqOTQVV8aDA51+P9bPzc2FtKR0CeRO0Puq85OfLgxEQZ2y4Cz703JScXNOyV5gAg==
X-Received: by 2002:a63:e343:: with SMTP id o3mr6616384pgj.317.1612406792451; 
 Wed, 03 Feb 2021 18:46:32 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id y22sm3561788pfb.132.2021.02.03.18.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:46:31 -0800 (PST)
Subject: Re: [PATCH 2/2] target/cris: Let cris_mmu_translate() use
 MMUAccessType access_type
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128003223.3561108-1-f4bug@amsat.org>
 <20210128003223.3561108-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08f1efab-91c8-a7e7-98ee-6d73d5ccfad8@linaro.org>
Date: Wed, 3 Feb 2021 16:46:28 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128003223.3561108-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 2:32 PM, Philippe Mathieu-Daudé wrote:
> All callers of cris_mmu_translate() provide a MMUAccessType
> type. Let the prototype use it as argument, as it is stricter
> than an integer. We can remove the documentation as enum
> names are self explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/cris/mmu.h |  2 +-
>  target/cris/mmu.c | 24 ++++++++++++------------
>  2 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


