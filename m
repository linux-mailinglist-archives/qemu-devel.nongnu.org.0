Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9203D4134
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:57:55 +0200 (CEST)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m71Iw-0000Ym-CL
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m71Hx-0008JX-Nr
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:56:53 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m71Hv-0008Ux-So
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:56:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 o3-20020a05600c5103b029024c0f9e1a5fso3907497wms.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VQA4URetmQTSj/Nr4O9p/6jfDy4G/LCOMPoDIWTHlhs=;
 b=WGEy8zf6BKdgfF7mDKzp0UDKJbEE0OJA+w0E+18BjQh+Yz4lRcL91vQcv65u5oUIAl
 46A6FX/IVc1AJ8+CLs3+QZ63kShV0sDXpNfhz/XjjonJT/e1ta/LyWyXQlpF7Lp3hEkT
 T0bDWMpgbxVUzyAjiuU0eR1hKBiU/kfTWEC6j1zLLCfv1xC97Qi7Bl6RIQLn+r0uy7k9
 UZvLNcNuc8fZ0XZsip3Wmi0worxKFhfsM3gjV1QLe5w8otoQlLrWepYCv+K0SLj+BRGi
 tuguiRhA9nW1canChlLtvUeNB+qDsfD+EEUQ6+w4C1X1PS0C8DDTo7K/rMOT+/P9BeK0
 hrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VQA4URetmQTSj/Nr4O9p/6jfDy4G/LCOMPoDIWTHlhs=;
 b=K6FSvyyTQIs0RyHfY+kfhg7ATq1Ws8ODK8e/SlC18TZgQQtbzZbRkPrvqetJssqYQ2
 YgaksP+7EgmhJ/XYMWiGozWAEWxiFo0ePVGRem/yWZuek+jduH5M1iSNMTJUNRBraZtB
 gF2CO5ao0phXryQ0JAZJFoq8gD70i/rwRym7bmLAG50RSBG4maTNw68wpMoEvMCgit2V
 Oz8k3BGJF+lBYgFyfUm6W4lnj57l9G2rzdezy9aF5rEANl/RKCSaqCBoo76uVWwkHDyG
 CV/BLOzSEZjiPWyZO2Y3CYnFK0qYYInvCbD9KTNzYw2fZWdjiwEFGGM/vgf8hSFMTFFh
 8r9Q==
X-Gm-Message-State: AOAM532W2ay1651bGAJNqUfXQ9tHTjyibKvr+monYJyjD98hN0mMbIw5
 sJinWCreQXCqRIiz4WLulqs=
X-Google-Smtp-Source: ABdhPJypSnr5oNfOAfxj2msbjZn18CziGyFqc8YQpr9rLnBgMeCxdXM2OmVev9MMdr09vAmkcDwOzg==
X-Received: by 2002:a7b:c150:: with SMTP id z16mr15599337wmi.104.1627070209894; 
 Fri, 23 Jul 2021 12:56:49 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id u16sm40611535wrw.36.2021.07.23.12.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 12:56:48 -0700 (PDT)
Subject: Re: [PULL 0/3] SIGSEGV fixes
To: Richard Henderson <richard.henderson@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1626902375-7002-1-git-send-email-tsimpson@quicinc.com>
 <CAFEAcA9y4THJBm8QM8F5a7ttDzvJQgS+Wp+Bhp3zCZTqVaJvNA@mail.gmail.com>
 <BYAPR02MB48869717A65C396835F5BDD3DEE59@BYAPR02MB4886.namprd02.prod.outlook.com>
 <2ea78953-b060-cbf2-2dd2-11b200dab77e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b2fe6e7a-5ed0-c19b-c01f-e53d4637d32f@amsat.org>
Date: Fri, 23 Jul 2021 21:56:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2ea78953-b060-cbf2-2dd2-11b200dab77e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.203,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 9:10 PM, Richard Henderson wrote:
> On 7/23/21 8:48 AM, Taylor Simpson wrote:
>> I've added the riscv maintainers and Laurent and Alex to the CC list.
>>
>> Please advise on how to proceed.  Is this a known issue with riscv? 
>> Should I try to debug the riscv target or remove the change to
>> linux-test.c from the pull request?
> 
> Remove the linux-test.c from the pull request.
> 
> Someone will need to debug riscv, but I don't think you want that to
> block the bug fix for hexagon.
> 
> 
> r~
> 
> 
> PS: Please use some subject-line indicator for what component you're
> patching.  "SIGSEGV fixes" is impossibly generic.

Although more generic is possible: "fixes"

