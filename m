Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A05E6EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 23:51:57 +0200 (CEST)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obU6u-0003PR-G2
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 17:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obU4d-000191-H1
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:49:35 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obU4b-0006g5-KN
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:49:34 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c24so10064820plo.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=T+XRKCpg1B8aNlOY2e7DDXmhWthkytg/B3UerbZ/WHY=;
 b=MCWtKqspaNTzGw+DT/lAlTleDInBacSryLNglbVSklIFit2L30MvgTWXsOEsH/WpWA
 nE9grFkPrpbtlFX//l8VTg2QJzxuTFz9pCW8bSQkc66MqiOP/Dc8TkM+PDYrm2oca4GT
 zK++mgLEp8I+fTElnZhl3mMIp17FG1ren6Kl6xjz14bVNVq2U7MD8sSdZIUARRFBuG8Q
 x90RKBtimFYLtWUNxjz89CNpBgQSfWu/Yod6+JsHdTqYlSF8atW1wpfqgCAAjVYZnWqm
 lp0sYrmuXc9AKhtbAXoJPo6A1papse/Z2c1U4j0k13ldRIbLonUmFSdMzAVNkwoNjKVw
 qsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=T+XRKCpg1B8aNlOY2e7DDXmhWthkytg/B3UerbZ/WHY=;
 b=YxAxiawN6I4dgyVFUkqnL5K/M/C+kgsq2rHa4iPMupwpEH6WT806nYiBkkCLZrAxjN
 W8iUt23tXhb4JnRRl/6i409T24iM+tDAQU2do25z5cR6W+BMwwy4lGxnyA1eztANgT83
 QL/6dHP34d9J2I4G/uddSHhf1TS5D5unyeGGrlmDf8MokSbyAobTtXGozOeAyk0cjI7S
 72BRuNvL+bVmdYr1cZBo0mnEEIRpsFMY/mx7e1Z4sYAHexgLD2Jbo2eMW39Qzd1Uxgzd
 Z5P9mNQ2RH2ATWX5lxv7/v1AEg/VpUjaTS94UusmoasFFMM+1jPRVGVxDLOZ4s2pClq8
 xfJw==
X-Gm-Message-State: ACrzQf0yNkUOZAY7AZNaf/Vk7pz8t9RdQz9EKMk72YEUpYCswHgCziE0
 LT/1+QvteeeXz5sJ7v+gTwc=
X-Google-Smtp-Source: AMsMyM6PaI2xUaEhg4auT3D+s+S09Pb742J+KSzZgLMnvTGQ4OFt0InBpoQ+5wG0tu0dxSZPV85lAQ==
X-Received: by 2002:a17:90b:17cd:b0:202:ee1c:9578 with SMTP id
 me13-20020a17090b17cd00b00202ee1c9578mr17652739pjb.87.1663883372199; 
 Thu, 22 Sep 2022 14:49:32 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b00203a4f70b90sm233145pjb.45.2022.09.22.14.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:49:31 -0700 (PDT)
Message-ID: <e970fc04-600e-469d-e130-9f41fe87851f@amsat.org>
Date: Thu, 22 Sep 2022 23:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v1 7/9] gdbstub: move sstep flags probing into AccelClass
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: mads@ynddal.dk, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-8-alex.bennee@linaro.org>
In-Reply-To: <20220922145832.1934429-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/9/22 16:58, Alex Bennée wrote:
> The support of single-stepping is very much dependent on support from
> the accelerator we are using. To avoid special casing in gdbstub move
> the probing out to an AccelClass function so future accelerators can
> put their code there.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> ---
>   include/qemu/accel.h | 12 ++++++++++++
>   include/sysemu/kvm.h |  8 --------
>   accel/accel-common.c | 10 ++++++++++
>   accel/kvm/kvm-all.c  | 14 +++++++++++++-
>   accel/tcg/tcg-all.c  | 17 +++++++++++++++++
>   gdbstub/gdbstub.c    | 22 ++++------------------
>   6 files changed, 56 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

