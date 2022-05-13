Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2312452699E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:55:18 +0200 (CEST)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npaRY-0002T1-Bl
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npaPd-0001gA-Ea
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:53:17 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npaPa-0005aG-Sf
 for qemu-devel@nongnu.org; Fri, 13 May 2022 14:53:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so11575073pjb.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 11:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PEC7Mb1sm3LkygP04r0DC3vOa2FFPaIeWYqrJCp1vMU=;
 b=gO5vR4bPTIj+/Zgz0Cky7lKYE4YkypoTFIdKMsgIKLllCMu/JI3HE6h6c9NCcIPjIR
 CqnFUapNpbaZ3IvsTOjQryeVpYFw78+G9uHizbMqEYSUdqYuAzjRWCuiVSmCGOshomy+
 dghYHZD5nAtMDKzs6KlZLne+RIspzrodEfCaxXMHmSQcBchWjt/QfcmXdDTzlPehvwjA
 xjV7WJwGTPhdWX73O1wowZMCQQ3gg4HbaAUfBJ8KZHYMob3h16QzU+nurj/GKRMpEVE+
 gqlAIM5Jnw0Qjtx+mUHpQPmP7ss5Ciz0sXkdCUnfWU5ZFDBdkVCvBt7URwIFPk61uQv2
 i82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PEC7Mb1sm3LkygP04r0DC3vOa2FFPaIeWYqrJCp1vMU=;
 b=zIlpwGYBEyaXd2DHTxn/fn0fNTQZrdXHRnUFSL+yYtyXWZDDMcQE3q4upSY0wTy9iF
 RlbES1dzvMiiuB08eAuDHnMRBTqw2o+zoZavL3/2n8/sBTtvh7nWojcyX5c5zbmysF1H
 UU860C7gtP0NJY+dvqDI6N6TLFoh4P/80jeQnbR1o/pVx+BZ7rcDtBQisS6dhxVXGaVt
 pHEaCy//Acyjhzyv7sXVznK8rZtw5kgTzCqtJbk2o9eX92yMwuHQezW8cxW/PhnqZeJB
 pRVro9ahRvjm0+uBGNjMDn3XSV0DtBD7378dD2OQpO2dCmUrR7nAhFC9JLRp5ECbdiCg
 pPpw==
X-Gm-Message-State: AOAM532PwlAdR16DeCJ5bQUksMlxDlBvz6egCpH9VzKwjbNKJs0/7nsM
 hzNvd5Vq6KYTsJZ3f3bqskBl0w==
X-Google-Smtp-Source: ABdhPJw/VsQE/yRNSJfD2S+26nUvh4RExeEJZUxSyQ8py7ckzXVt+eEudltl6FC7BRyfgl4o+92GeA==
X-Received: by 2002:a17:90b:4d0c:b0:1dc:d293:148c with SMTP id
 mw12-20020a17090b4d0c00b001dcd293148cmr17523289pjb.75.1652467984563; 
 Fri, 13 May 2022 11:53:04 -0700 (PDT)
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5?
 ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a170902d19300b00160f4b0e60esm1841278plb.294.2022.05.13.11.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 11:53:03 -0700 (PDT)
Message-ID: <8594e114-1bde-c84d-9c5e-7c60e1035359@linaro.org>
Date: Fri, 13 May 2022 11:53:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/1] Linux header update to v5.18-rc6
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, mjrosato@linux.ibm.com, avihaih@nvidia.com,
 cohuck@redhat.com
References: <165245750487.2018734.15148993038263758584.stgit@omen>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165245750487.2018734.15148993038263758584.stgit@omen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 5/13/22 08:59, Alex Williamson wrote:
> The following changes since commit 9de5f2b40860c5f8295e73fea9922df6f0b8d89a:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-05-12 10:52:15 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/alex.williamson/qemu.git tags/linux-headers-v5.18-rc6
> 
> for you to fetch changes up to e4082063e47e9731dbeb1c26174c17f6038f577f:
> 
>    linux-headers: Update to v5.18-rc6 (2022-05-13 08:20:11 -0600)
> 
> ----------------------------------------------------------------
>   * Linux header update to v5.18-rc6 and vfio file massaging (Alex Williamson)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alex Williamson (1):
>        linux-headers: Update to v5.18-rc6
> 
>   hw/vfio/common.c                                   |   6 +-
>   hw/vfio/migration.c                                |  27 +-
>   include/standard-headers/linux/input-event-codes.h |  25 +-
>   include/standard-headers/linux/virtio_config.h     |   6 +
>   include/standard-headers/linux/virtio_crypto.h     |  82 ++++-
>   linux-headers/asm-arm64/kvm.h                      |  16 +
>   linux-headers/asm-generic/mman-common.h            |   2 +
>   linux-headers/asm-mips/mman.h                      |   2 +
>   linux-headers/linux/kvm.h                          |  27 +-
>   linux-headers/linux/psci.h                         |   4 +
>   linux-headers/linux/userfaultfd.h                  |   8 +-
>   linux-headers/linux/vfio.h                         | 406 ++++++++++-----------
>   linux-headers/linux/vhost.h                        |   7 +
>   13 files changed, 383 insertions(+), 235 deletions(-)
> 
> 


