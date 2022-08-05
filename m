Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32758A49F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 04:04:25 +0200 (CEST)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJmhL-00037K-U7
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 22:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJmeL-0000zd-6l
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 22:01:17 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJmeJ-0004RJ-Eg
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 22:01:16 -0400
Received: by mail-pg1-x534.google.com with SMTP id 12so1485497pga.1
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 19:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Pqu47x7W4wexSp4qZ2CrcNr+QUzLwDDGCE74dZ0b1IE=;
 b=wWsaMxY2WdWH+Ch+J+GrcRsffHGdXg4hwN+YRdWDy3SQXI3aQiSZHaYAqBcwQFA3Hn
 Z/yRVRLD3ur8HbuHv/uQJpRducoYyAF4K2BmzeM+LxBpjYKhpg+IAvsPns6lq28ZeRm1
 x06teWIGbGalJrOtOnJnvYe1XzO00TxTmKsGJdOAOvKvbuho3+s0LxheQWJq1EvLMT/F
 TNk2dmiDVx0gmjeZ9wwr86cIuGGK00h7JR5t6kahYg/TBP9TNrOgEols5obtze+lovZo
 /l+VROrHH046LJI6jhIGtiZ1YYWKYllvddvkm8t5nhvgzV3Qkfud1qo+v7xpkeKRB7OD
 MgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pqu47x7W4wexSp4qZ2CrcNr+QUzLwDDGCE74dZ0b1IE=;
 b=tK2RBdeyRQVbTp2sPYA9InBhPNs4Sne/VLbZK3KrasrjOMcDNaPPUZ7XW9/6A0MCaF
 c+zgD3nXQf2lqBhJ4/UObSintBwsbcveO/tUO2k9rfIxjqjsfvc7Q/50n1khMXZ1ibJ3
 uRCj3O4+st29RrnhjYSylTHF159ecKEiVBkO8KYh/jv/j9Ff9+jJBLvPuyIBUFD35kDg
 /SRnvjfA16/uFS6s/GSONtTunbRYK5SSds+r+o1sugX9Y8YPKKjnxG+nvORFtBnrGjKJ
 s8FZW+ZdK5v5F+UP1iWLY+db/BudWGFAnW9ETlG772YGM7Ypae1N0nQFUODF4TtMPD/r
 sLMA==
X-Gm-Message-State: ACgBeo1xtZ3kaxv+iN1dlMwfq4blY6MYBpljasiDmJ6cmN3qYcyPZL4/
 0eLWHrL2thdx9yula5yjijVv8A==
X-Google-Smtp-Source: AA6agR5M5uxh/JcLv/RJWS7LrqdVACeslUz+239A9z0MYwgbCzlPQRYaJE+9EsnSZi+xIPaH6gWXlw==
X-Received: by 2002:a63:1361:0:b0:41a:861c:f870 with SMTP id
 33-20020a631361000000b0041a861cf870mr3883889pgt.463.1659664870429; 
 Thu, 04 Aug 2022 19:01:10 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:7f4d:e9ce:ef99:81bf?
 ([2602:ae:154e:e201:7f4d:e9ce:ef99:81bf])
 by smtp.gmail.com with ESMTPSA id
 b76-20020a63344f000000b0040caab35e5bsm477073pga.89.2022.08.04.19.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 19:01:09 -0700 (PDT)
Message-ID: <b8c9f6ad-9a4a-6bf1-5b82-cbf19085fffb@linaro.org>
Date: Thu, 4 Aug 2022 19:01:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/5] Trivial branch for 7.1 patches
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220804192216.1958922-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804192216.1958922-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/4/22 12:22, Laurent Vivier wrote:
> The following changes since commit 2480f3bbd03814b0651a1f74959f5c6631ee5819:
> 
>    Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-03 08:32:44 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.1-pull-request
> 
> for you to fetch changes up to 21d4e557e2fd0cb7f10b632b35f51146a1b6d892:
> 
>    include/qemu/host-utils.h: Simplify the compiler check in mulu128() (2022-08-04 13:49:47 +0200)
> 
> ----------------------------------------------------------------
> Pull request trivial branch 20220804

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Cornelia Huck (1):
>    README.rst: fix link formatting
> 
> Eugenio Pérez (1):
>    vdpa: Fix file descriptor leak on get features error
> 
> Thomas Huth (2):
>    docs/about/removed-features: Move the -soundhw into the right section
>    include/qemu/host-utils.h: Simplify the compiler check in mulu128()
> 
> Yonggang Luo (1):
>    ppc: Remove redundant macro MSR_BOOK3S_MASK.
> 
>   README.rst                      |  4 ++--
>   docs/about/removed-features.rst | 14 +++++++-------
>   include/qemu/host-utils.h       |  3 +--
>   net/vhost-vdpa.c                |  4 ++--
>   target/ppc/excp_helper.c        |  1 -
>   5 files changed, 12 insertions(+), 14 deletions(-)
> 


