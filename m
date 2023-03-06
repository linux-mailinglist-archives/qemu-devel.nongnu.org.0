Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FAE6AC98C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:14:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEPW-00009e-F2; Mon, 06 Mar 2023 12:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pZEPQ-0008V6-Bm
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:14:02 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pZEPO-0004xS-NP
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:14:00 -0500
Received: by mail-lf1-x12f.google.com with SMTP id g17so13732522lfv.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 09:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678122837;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AFiIub8XE/3t+YIcf9GDFhgI+Gh55WxmhVjHooAGFXQ=;
 b=mJCAHhWRZKmPh493Sl1ZEWwidUEevb8hiyjWvY8OSzNLa2yP4cO14I7CrN1RPsGKzl
 yZyvjx59V+JO3wA++zn8NBZLWQ8nVsysoNhtxFdvbZAl1Ebun4UzaSPvWRNJeOU69clQ
 lYe5mhULCb5mymWFDidZ3zyNhdzNA1Gqv8EvVP6AH6Mwfizd20UA1ZEzwMUhv5mipLti
 wrT7KyicfmEaprx2eZ54fnUne/bU3IpK5tkROX+19naTuFVvT1XaGLh8i2+VMgqGE/TR
 2ayiqTvIwk7I0sg1aGZ2gli29+vTJHuzE2JhTPn0J67JjZc6ZZEw3UBl2wLFBZYZW9eC
 kfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678122837;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AFiIub8XE/3t+YIcf9GDFhgI+Gh55WxmhVjHooAGFXQ=;
 b=FH2FVv7rRIFwRq5nAz/XrBB6ZL4Nh+Wp/C3prPb6vl5717MCE8tcnzp7hImqlPYsQ6
 LHVsF/saRiFfVrPKuvxwnnTwBASAcElpfH+mNsRJHPDSM4xaeybfm0vPj7qSfUA0+sps
 GhixDTjjfghzpHyXhsi2/j2/x8bufKIF1KDBlwUb9oAtxeQFg+cbRTzadiAKCPQcQAg2
 /TKkt6LzDiTyEAkl9d5ttNH60t4d93UC6+SpEpWzqqwLWgDB/QazknzQmWDWKkSp+gCi
 n81ncatG4OweC2Z6KLWL5vXJJqCbjnSTmsB2sC7lY/E6J71f9Bz1zUGHmIBYiCrOxEBt
 Fu2A==
X-Gm-Message-State: AO0yUKXLzcdAcgHboKqn1pzVgAuojdzqDEhFXiaDRa1RLTaabSIwzxIU
 E2mNN0dcoYdRee8LL/MVJ4UEjQ==
X-Google-Smtp-Source: AK7set9isyzIUK1LZ2NCprp7pwgUPqxJaMVBuJ0phlDakmJzsDodoJm+GGt6Mc8+8H3KG/Ttl54yiA==
X-Received: by 2002:ac2:46f8:0:b0:4e0:a7cb:33fd with SMTP id
 q24-20020ac246f8000000b004e0a7cb33fdmr2710445lfo.27.1678122836696; 
 Mon, 06 Mar 2023 09:13:56 -0800 (PST)
Received: from [192.168.200.206] (83.11.36.13.ipv4.supernova.orange.pl.
 [83.11.36.13]) by smtp.gmail.com with ESMTPSA id
 a11-20020a05651c030b00b002959aecb63bsm1793544ljp.53.2023.03.06.09.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:13:56 -0800 (PST)
Message-ID: <5f8a1a7a-2971-029e-adc2-eef8a3c121ab@linaro.org>
Date: Mon, 6 Mar 2023 18:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] target/arm: Add Neoverse-N1 registers
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>,
 Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230306151243.3877250-1-chenbaozi@phytium.com.cn>
 <CAFEAcA8BJO2iVG_KQaFBV0hvAmWn4cV-vC8QA5CC+iChMuHyXA@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA8BJO2iVG_KQaFBV0hvAmWn4cV-vC8QA5CC+iChMuHyXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x12f.google.com
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

W dniu 6.03.2023 o 16:37, Peter Maydell pisze:
 > On Mon, 6 Mar 2023 at 15:12, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
 >>
 >> Add implementation defined registers for neoverse-n1 which
 >> would be accessed by TF-A. Since there is no DSU in Qemu,
 >> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
 >>
 >> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
 >> Tested-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
 >
 > Did Marcin test this version of the patch ?

Hard to test it without updating TF-A first to not use DSU. Older TF-A 
starts and then hangs.

Waiting for Chen to provide patch to TF-A and will test.


