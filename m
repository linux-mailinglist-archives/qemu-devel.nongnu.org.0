Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288DA3201A8
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 00:17:26 +0100 (CET)
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDF1Z-0004IE-45
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 18:17:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDF0H-0003VY-8q; Fri, 19 Feb 2021 18:16:05 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDF0F-0005QR-RL; Fri, 19 Feb 2021 18:16:05 -0500
Received: by mail-ed1-x531.google.com with SMTP id v22so12468844edx.13;
 Fri, 19 Feb 2021 15:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hsly/1WrHxVWrePerIzsC7Zn0INf0MzYk0hTcRepmnA=;
 b=Gv6FgNtLgs+Iys8TV7eQUIV39wOa+e+dW833bGxypXEfm3qR2PV3iN8bF4rXDAf2LM
 rURUxbhAw///9h6F8BNNZAUgHHHfV+ejb2Xlpcx8rBKh2qyflhxyscSozhUmGadIUZWR
 OXIQ9rrpyHl7bqQ0DR/Z7+BcQccR/FieZnpCelFDE9evj30Rs6FujUpL5AAhA3Vngk6S
 v3wGwznJuYngyuvH4+vuR2As2Jkk0xZY1a9e2m22QLJGnR9Df4UcGIBWmoOOYKqMgRAW
 FUoydyx5uRlVtH84pQL0G/P9+5HF84PKNrYnVqaNopH/TmkxuMJ16++X8UGyiW/MTlAw
 kclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hsly/1WrHxVWrePerIzsC7Zn0INf0MzYk0hTcRepmnA=;
 b=cDC7AouPMzNhFJjhQiNWDeKmRdeVgvLzNVVwPCuFRz32pFlNpVLWxdpGnBhXnP63M6
 7V/RfLrDuq58FSrIg9FrkFzHm68kqADRKo8AvZUwkqGf2UV1ECNeGFHLSbxCRL5ES8O/
 tIQ97BZUxEcJJOYD9eZda3drO7bwGvjarj02EgxNnMx/nLtcEah6558s4ZFm7OINQFnB
 T2G/tX4fFhKw3YPySa3WFg6421AByAukG/EuZHdl4X0wbXiz+L2C57lfUniNdBabZdnh
 JTk3yu1O1810J/yyksayj1+I+8kothgwuUxbIpAofzaz4x95jnykxUN9icXcNOEjpP3Y
 fqvA==
X-Gm-Message-State: AOAM530scDyg9uepNmtoI06gqVbmH5423T0N4ehqBfdHBCj7ao1AF034
 JZaWc+Me48eDLM5xOufJgoMByFLxvhs=
X-Google-Smtp-Source: ABdhPJyzgwr/mUNtiy7+fEpHGjq4vcDNuwEagD9RRFpgv3Nl/zmanak0NV5Bfx6UH9OGRKjSuI7N4Q==
X-Received: by 2002:a05:6402:26d3:: with SMTP id
 x19mr11537324edd.0.1613776561369; 
 Fri, 19 Feb 2021 15:16:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v1sm5510538ejd.3.2021.02.19.15.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 15:16:00 -0800 (PST)
Subject: Re: [PATCH v2 4/6] hw/sd: sdhci: Simplify updating s->prnsts in
 sdhci_sdma_transfer_multi_blocks()
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b99cacc7-5d3f-5298-1832-677dd7c01161@amsat.org>
Date: Sat, 20 Feb 2021 00:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:46 AM, Bin Meng wrote:
> s->prnsts is updated in both branches of the if () else () statement.
> Move the common bits outside so that it is cleaner.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
> (no changes since v1)
> 
>  hw/sd/sdhci.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

As there are some questions in this series and it makes sense to
merge all patches at once to help downstream distributions track
the CVE fixes, I'm queuing this single patch to sdmmc-next tree.

Thanks,

Phil.

