Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA9A31EC90
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:54:35 +0100 (CET)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCmZU-0000nB-VF
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmWq-0008Gz-0w; Thu, 18 Feb 2021 11:51:49 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCmWi-0001OZ-AF; Thu, 18 Feb 2021 11:51:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id f7so2571710wrt.12;
 Thu, 18 Feb 2021 08:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P3M4esfQe1OAjriR6H8qdtTh2z1RwW3YdiFEkPYKkDE=;
 b=NpQmPXrunGhtG1Mkq45c7RR5qSZ0NplJa3Ie6L4qEX4swJFqLV3fCMcetVifl5+bLb
 WI44AOP+xgZOh/pWW1Ovlgl2Q992QtzvFphh9mNRApDgzgpSbWW7kyxrmzHr3p4NU1OC
 ODHcvhm9Ef5Wt1f5hLlVkg+5E3XZ6M05HFPcNkVtXVY+wLA8u01cVo4niiJC4ZA1A6Vt
 HyjTErptoXcizjjYF5NhcMdpe3z0d6j2SwkiuP02QbOE8CSllCMR03hx2SMjDTXLBYF7
 rFUaTVvVjbqaSoemX7PiES8eyA2Sc8jnmeoENz0W2ax+L8zGUGCCtFAdp5nXaOV7d/K0
 8kHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P3M4esfQe1OAjriR6H8qdtTh2z1RwW3YdiFEkPYKkDE=;
 b=uVqpVNKMhYX/JFc9ckiPRQhCjH7MUXcOk61WuYP4Vfw8Vl1rccY+2V53vLeaqVj9T1
 anJxYIHUQyz6yvW6ZA2crnR3NjbKrhzQmhWwEIuKcRQBRkUZxt14R9/4VJcJOk28LfW+
 aT45vg65EXyQZikah1IMbZ7hcyGlQmd5jIjGINu0V8rL/oyBH/Obs35tf2ZuiVLsIlmt
 I4zvt7RV2XociWRQwuB/JJNx+t3sd9/k+2yrd+SBERifNV6w2JDUdiC+W8ahrHlrg6l1
 WEjb7lV51+1kBRz2jPuXDsJLyqK3ukmhm99fTou0NL/Hrv31eFEVvim6b8Z9aNrDK8oZ
 KCZg==
X-Gm-Message-State: AOAM5333zFpoxSoYnpbx/5qiDsOYwWWLb+tE1OsqUitMtuIULBwFjSZg
 wppJEmLhTsiFCNSCOk2peMVQKbslIF0=
X-Google-Smtp-Source: ABdhPJzSHY/iZQ8MZQ692dntqLlSS2ZLLpwUYmpshU9HpTZnAHjIVDF33F8lD2E2qABf79wbLolhDg==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr3215123wrn.167.1613667095380; 
 Thu, 18 Feb 2021 08:51:35 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u6sm10724316wmg.41.2021.02.18.08.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 08:51:34 -0800 (PST)
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
Message-ID: <ff858c8a-f760-3458-4e02-79a5268e0ab6@amsat.org>
Date: Thu, 18 Feb 2021 17:51:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

