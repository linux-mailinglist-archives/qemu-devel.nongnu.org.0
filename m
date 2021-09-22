Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2451415039
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:54:20 +0200 (CEST)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT7Nr-0007YQ-MQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT6oG-0001JX-AI
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:17:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mT6oE-0005Gm-GC
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:17:31 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 nn5-20020a17090b38c500b0019af1c4b31fso2982673pjb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mksIt7IgFL4jU8JdOJhd/wd9CX/3SBkm4ZKbp2cPuD8=;
 b=y+2cKJBzyR+itfR6PvRZvhzIFadLMrHDJcRCAen2FBeForkPpBaz+2w53zYO3LW+2t
 kJHw+GKjG4qQFSFHt2maidlmnh4eSts6Pjzk+4ztCpUB0OQ31HD7znzAS/0mzpUL9ATo
 YwrhRI7P7fW2gvv1/oe1UjSFp6T/IL4GJuxz6FaZVRF5q/F9guWRcHN697KTbj70XNv2
 pwX7bUA1QDaVawuQan3IaOxvMaCr5PobvcLYbooqPbRCq0ZHIrv/4MBIdMJ1yG2gyaFq
 Ikwo3cazGohxlxmM0U2CXdtyWoXOC+k4op0zanWIpg7gAtKftUftORLUSOm3XM0O8mzW
 Cm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mksIt7IgFL4jU8JdOJhd/wd9CX/3SBkm4ZKbp2cPuD8=;
 b=A2Wq9/6GvLe3m42OQpa5AJvFXSCMLkwOB7k4+a6C1uBXltNkvS9ZddFDLou9UrYMd9
 cChVpGwp3g9aUo738NuaBolxVAwLqV6vS2c9N9uvA1bgmaQumDSlwFrxXkDKWyVYT8ZO
 3ZWSFcHbb4uSu1CQcufWvPrEg3KMLcca+QerMCkgp86sBWRrVR2+ATMzO80Mp0EEtZq8
 BhO9dYq4mFT33qL6FMUUvTasJhle3jyxPQ7TAW17nh19DHxgAY7FUNmKS40p+nIssxb1
 FsMlpbv6CUyx99yA+CST1aVM9FNH2mwpIaCsWXXBID/zB0V9zrV+Wd+JNU2tKLsKsR8m
 V6oA==
X-Gm-Message-State: AOAM532wG1BmviJphdE4cWDhXoBW+RzRLz4rkli0T3o/9m4IvHaAZui2
 fwia1sWS0JyFiGF4Y1Bh2xO5BA==
X-Google-Smtp-Source: ABdhPJxrlgdRYIEt56b/6fsJ+FR2TUBo1AEjDl0vPARvSLjX04VzVu63Hq6GVaaNRv2sJtr1ooulqQ==
X-Received: by 2002:a17:90b:80a:: with SMTP id
 bk10mr407448pjb.127.1632334648229; 
 Wed, 22 Sep 2021 11:17:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m20sm3585076pgc.25.2021.09.22.11.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 11:17:27 -0700 (PDT)
Subject: Re: [PATCH v3 01/30] elf: Add machine type value for LoongArch
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-2-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2cc2e563-b35d-8eab-b559-fb9bcf156af6@linaro.org>
Date: Wed, 22 Sep 2021 11:17:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922180927.666273-2-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 11:08 AM, WANG Xuerui wrote:
> This is already officially allocated as recorded in GNU binutils
> repo [1], and the description is updated in [2]. Add to enable further
> work.
> 
> [1]:https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=4cf2ad720078a9f490dd5b5bc8893a926479196e
> [2]:https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=01a8c731aacbdbed0eb5682d13cc074dc7e25fb3
> 
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   include/elf.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

