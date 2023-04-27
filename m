Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF1F6F0225
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:51:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwPG-0004fu-Gz; Thu, 27 Apr 2023 03:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwPE-0004fX-Bk
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:51:08 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prwPC-0003Vj-Jf
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:51:08 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-95f4c5cb755so293242166b.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 00:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682581865; x=1685173865;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7SoBLSU1NKPjmgGZq2oT8C0coJ+RNLsFETGwt1pETWw=;
 b=xvKcvWaJVJxxI63dNy/Fcc4XKHl7A4oiVfsYPNS24uIFmXe3b2ulfwJ1Jqbmuco9aA
 NO9jpCKwhIEOD+0gN9+HYfc/6y53Rg1IuaHRtkvK275zohj9lfzRWRr3nxchETpSJPsB
 +w3Eck/B8ZAMP8wgBvR9CLHI7hdLq4NtedMpaFt5ZTf19OX8ohUOOqi9oYfA8JRnndDE
 fWXNOgSAxorWpfypptM4QJQ7YdHrr2kR6SVnEWgLGD1crGDqpfn12f7p55vbTzZS9LKz
 QBJMiIqOtrW+N14Og5RDwP+zcnjjLtJx2jC8nqWtQYog1myS/BFpSjRZozHNG1B8roHJ
 uKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682581865; x=1685173865;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7SoBLSU1NKPjmgGZq2oT8C0coJ+RNLsFETGwt1pETWw=;
 b=i374THtvER0y/Wgg3KNzexGEdcIFK0EKLs9Ce6vJ58J2IKhz9rjMkhp5D2vbHcF2Tn
 ipKRS/5v6aWXfa5OK6gIv3JBSNaNxvQBSkE/vcZO50mOMfF4I+qIfrbkeJioIfNjUfbZ
 a5othE7FK7F0wVn5S1RT32AadRisWTDeejP4HDy68G/E7UOpJ4toUXnELc0EqznuXl/d
 ZRWqGuzjofQoUy88uY8IPu4cYMEKrro6ZdUuYcEHk53YbMV2syx1v4VQhRRLgE4ghcL2
 NDGPshQCrbh7mFoZcHzobFPrv5d1Ab8aDdRCtU9ty+2SNNZgX8NA5KFCNlNo+m7X3LPp
 68PQ==
X-Gm-Message-State: AC+VfDwUTGH6JvqJaK3lG0z0OAwTR9M3Qa9a9+ikpuG6fEQhYLBknpa0
 AZJRElUeM095t0RTWCX9MIAPfQ==
X-Google-Smtp-Source: ACHHUZ4GFgrHNNz0nSgIADtMQLojhpkDwrJssBslJyXwgb3J2OP5Csvw9XoIsu5BhzlDj5EP481AkA==
X-Received: by 2002:a17:907:16a9:b0:94a:549c:4731 with SMTP id
 hc41-20020a17090716a900b0094a549c4731mr827284ejc.57.1682581864783; 
 Thu, 27 Apr 2023 00:51:04 -0700 (PDT)
Received: from [172.23.3.19] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 re4-20020a170906d8c400b0094a82a236cbsm9125869ejb.129.2023.04.27.00.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:51:04 -0700 (PDT)
Message-ID: <5db4affa-d831-2ba1-7175-c5ba32182ef1@linaro.org>
Date: Thu, 27 Apr 2023 08:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/7] Migration 20230426 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Leonardo Bras <leobras@redhat.com>
References: <20230426181253.13286-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426181253.13286-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x635.google.com
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

On 4/26/23 19:12, Juan Quintela wrote:
> The following changes since commit 9c894df3a37d675652390f7dbbe2f65b7bad7efa:
> 
>    migration: Create migrate_max_bandwidth() function (2023-04-24 15:01:47 +0200)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git tags/migration-20230426-pull-request
> 
> for you to fetch changes up to 7b5cd8ff519e9fe3df6cda65428a6f1aa28a6ced:
> 
>    vmstate-static-checker: Recognize "num" field (2023-04-26 19:17:55 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> Hi
> 
> This PULL request is on top of migration-20230424 already queued by
> Richard.
> 
> It contains:
> - MAINTAINERS: make peter and leo reviewers for migration (juan)
> - Disable postcopy + multifd together. It needs at least to call
>    send_sync before it will work. (juan)
> - Improve postcopy error messages (peter)
> - vmstate checker: Compare sizes of arrays correctly (peter)
> - Move more capability functions to options.c (juan)
> 
> Please, apply.

Build failures:

https://gitlab.com/qemu-project/qemu/-/jobs/4187732684#L2303

../migration/postcopy-ram.c:1368:6: error: conflicting types for 
'postcopy_ram_supported_by_host'; have '_Bool(MigrationIncomingState *)'
  1368 | bool postcopy_ram_supported_by_host(MigrationIncomingState *mis)
       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from ../migration/migration.h:27,
                  from ../migration/postcopy-ram.c:22:
../migration/postcopy-ram.h:17:6: note: previous declaration of 
'postcopy_ram_supported_by_host' with type '_Bool(MigrationIncomingState *, Error **)'
    17 | bool postcopy_ram_supported_by_host(MigrationIncomingState *mis,
       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


r~

