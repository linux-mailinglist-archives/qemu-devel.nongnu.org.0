Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D31A3D4096
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 21:12:51 +0200 (CEST)
Received: from localhost ([::1]:44966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70bK-00051z-7D
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 15:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m70Zh-0003Tq-2i
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:11:09 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m70Zc-0002y9-Qc
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 15:11:08 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t21so4012049plr.13
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 12:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9H8jag9EgParssqsNoowoA30ze1Z2XNg9MJVX1tyMEc=;
 b=PagBx0hfhtljPCGa0lnN3SdsxGt+6NBy1tkPBeaDtUBEb6sBjsbbjXExKlhJx6qw96
 shWk1JayIWVEjfFhiXIIfQl8KW7EN9r8F8nvk2QQ8A8UTwoL2Vj1SNod1mGSzuaxdq6n
 06v7z4Cdp9PBePQpGn2UqEbFIdGztEVTpCoRPrE6nmwUn90T9J4fyNlozpiNT3jBaIVi
 YZlTaf3qqjVkTJFjlXFeBMnq9czSOepe5yCt6dzDKf0eJR0KFArTKNkVx1jHlbNX16mc
 6q+gUxvrB/7odHdoTN2CE6jXUDceCGpBeVaPDQZJs0X8C9MhFPQH0qiSv/SkFJvXkwYo
 IPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9H8jag9EgParssqsNoowoA30ze1Z2XNg9MJVX1tyMEc=;
 b=GuTMyW0aX60mIbHhbnNriVxjYNXBW+RXvvORK0EmeZEVFsX7QbRsfTe27t0bxbIa/Y
 MOyEqdMD9qxr8w/D3TVyrskTUy/Z4a7E0KCA5+86FD+MgU75JzkubfuCUQCKVZqmkjp7
 DHSNCUyJJeaqrZXOx2H87Uvx297bzDUvokfACjWuo9fxiL9UUgGwi3pRIf+1EnF+nV/A
 nsgk/K3eX4OObWzlEajf2QyfAPcMFiPNdaRPaats0LpY5/7Z+8gp2H4ZXcKCujYxeGhk
 V7skp2u3AKks3Gwy1WwE5ifncsxK8cSGu94Vvmq/iYwMRp63AX4rb32EFlYkogYJ7v2K
 3+uQ==
X-Gm-Message-State: AOAM531rw9MUyh335cKjrKriZbZRNQU2MLsuVic0ijkdz5CQsMndQFc6
 WhWoDxoyRGS8FXSF3voK2YQaCQ==
X-Google-Smtp-Source: ABdhPJxT3umEhIdN1PyLnx7L30Tjbd1HfRa/Cb8Tl6eoiIPa1Om89yGfshhMbbmAnwVUpLctd6dGsg==
X-Received: by 2002:a17:90a:728d:: with SMTP id
 e13mr5937967pjg.181.1627067463152; 
 Fri, 23 Jul 2021 12:11:03 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id b9sm32823862pfm.124.2021.07.23.12.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 12:11:02 -0700 (PDT)
Subject: Re: [PULL 0/3] SIGSEGV fixes
To: Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <1626902375-7002-1-git-send-email-tsimpson@quicinc.com>
 <CAFEAcA9y4THJBm8QM8F5a7ttDzvJQgS+Wp+Bhp3zCZTqVaJvNA@mail.gmail.com>
 <BYAPR02MB48869717A65C396835F5BDD3DEE59@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2ea78953-b060-cbf2-2dd2-11b200dab77e@linaro.org>
Date: Fri, 23 Jul 2021 09:10:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48869717A65C396835F5BDD3DEE59@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 8:48 AM, Taylor Simpson wrote:
> I've added the riscv maintainers and Laurent and Alex to the CC list.
> 
> Please advise on how to proceed.  Is this a known issue with riscv?  Should I try to debug the riscv target or remove the change to linux-test.c from the pull request?

Remove the linux-test.c from the pull request.

Someone will need to debug riscv, but I don't think you want that to block the bug fix for 
hexagon.


r~


PS: Please use some subject-line indicator for what component you're patching.  "SIGSEGV 
fixes" is impossibly generic.

