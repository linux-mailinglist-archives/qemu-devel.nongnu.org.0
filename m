Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446346EF31A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:08:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prczy-0007GK-76; Wed, 26 Apr 2023 07:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prczw-0007Fw-JI
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:07:44 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prczu-00008K-TF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:07:44 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so1307895866b.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 04:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682507261; x=1685099261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7RvOjDI4ikkgEsv+KfKCdbiN/OJFPRmkbjUmEEt0JMA=;
 b=q60mzNOsdbsuDUBqTxvpppjiil3JEvuBDmuy1kWxE5F9jzxxDKKy0hAlRUxY6OJfWu
 7qiiOgij6iOIOGpUr6FLpNL5CP7QF3x0YRjrJ9qb1CG7WTVeshCv9OVqEZ+TyQHzUjuP
 GADYDqD7LtLDgJySZY0qeWj2lZc2hA8ef1BLfipCNAA1ltfe026708CnxU5skhnsN1dw
 PfOCDU28HqubbDgLtc1F2hZZaNU+i+qSh4IcAmo2/uyGKpi3IkkXhZLEzvki1o+P6Ctt
 OYeQqgWhAe7Gw/R5RAoio3ZSRJ/vJMG+4ktpUgxi51PZV9BBE49tozYptH0B5tdNJlcR
 aWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682507261; x=1685099261;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7RvOjDI4ikkgEsv+KfKCdbiN/OJFPRmkbjUmEEt0JMA=;
 b=I7T3gkd8nYcvFYvn4bfzFyp1fKBdL0T5KMrXhckpWZuIJAfrBUbgfe5GItw6Kc3y9o
 I0tRsaTZvfZIQ6Mha5GjCnM3yWHjYK8VzMywDgCN98KQ8A3z9mzixon1j6LmmHiXDov0
 4p+MRvUXiv2//WTFHOBPz8rjDJac5o0iqm/rw+iKH2f5GaYvl2DGuX8oXan3TLhVL3eZ
 uXAIFPnv7cazk1iKM+NB8JDgCQVjh1NZUOU+66aaepzU6Y1DMpBwyNUOqqOI7sd7FqQT
 1nC47Rx6HZL+QifUwNQIf3ouQRHrogv0G/pINZRI+o7s6kt03It1qusvogyruztvt5dT
 FWpw==
X-Gm-Message-State: AAQBX9c3gKRsR7dFoqnzsmbuMueLvwUV/aLG/8aHxHnmyQjoRf01lHmd
 1OFYnUsJp5cL6u5aiBhgpECI/w==
X-Google-Smtp-Source: AKy350YPY7LX6vvtDj1gO+Ny7WQKDha0A+M9v/3mCPTZcnmb5ivH0BGJb7dbXPgCUPXAx+1Eeg4DDA==
X-Received: by 2002:a17:906:f2d0:b0:94e:c6ad:1119 with SMTP id
 gz16-20020a170906f2d000b0094ec6ad1119mr15870363ejb.13.1682507261134; 
 Wed, 26 Apr 2023 04:07:41 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 bv7-20020a170907934700b00959c6cb82basm3115949ejc.105.2023.04.26.04.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 04:07:40 -0700 (PDT)
Message-ID: <2c7ba429-92ec-33e8-f4fb-6d427b9a618d@linaro.org>
Date: Wed, 26 Apr 2023 12:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/25] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20230425131359.259007-1-kwolf@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/25/23 14:13, Kevin Wolf wrote:
> The following changes since commit ac5f7bf8e208cd7893dbb1a9520559e569a4677c:
> 
>    Merge tag 'migration-20230424-pull-request' ofhttps://gitlab.com/juan.quintela/qemu  into staging (2023-04-24 15:00:39 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/kevin.git  tags/for-upstream
> 
> for you to fetch changes up to 8c1e8fb2e7fc2cbeb57703e143965a4cd3ad301a:
> 
>    block/monitor: Fix crash when executing HMP commit (2023-04-25 15:11:57 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Protect BlockBackend.queued_requests with its own lock
> - Switch to AIO_WAIT_WHILE_UNLOCKED() where possible
> - AioContext removal: LinuxAioState/LuringState/ThreadPool
> - Add more coroutine_fn annotations, use bdrv/blk_co_*
> - Fix crash when execute hmp_commit

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


