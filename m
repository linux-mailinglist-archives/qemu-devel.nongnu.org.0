Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161FE6F25E7
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 20:46:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pspZM-0004Mk-3r; Sat, 29 Apr 2023 14:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pspZJ-0004MZ-OB
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 14:45:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pspZH-0002Fd-Tu
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 14:45:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f939bea9ebso979031f8f.0
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 11:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682793909; x=1685385909;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bx60JV3AroSlU7Dy2qU0mCqSRj2sYVx2FjelmHqlXxg=;
 b=xguXyy+I/v4ZsLGGha/1obgFp5SqlWHs3KVbkFBubQ7ne3Acq0MMsmwQTWKQCG6Kol
 T+SjRWwU9efwxkoAdM/cPaXQzvi7Um30MDtSBHs25qI1gql7QANgH7jKAkztVBRk/QIC
 tvu2/eDrwBuJPri9Oapb7l6jCuw/QKlk5kdUz6fIp8wx+WdFiQUcoV6DdP3ZNSdjfgDl
 pXTa7yCBqOeEprFyQf1xQvWLGJvIHhmGaiUT+fsDhF4lEB1n8QCapOdRCBmOowjaDKjs
 /WVh9RzGIMZwe9Zokv1XGgehrbl+AD8+sstfOq5rKJjHbG4c1TNT8Uon5/kn+rn/wpE8
 RUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682793909; x=1685385909;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bx60JV3AroSlU7Dy2qU0mCqSRj2sYVx2FjelmHqlXxg=;
 b=BrFhCz/ngaxxCuiJ4fNss0hluhfd5tKTE21jx96YVesGnHvlONYy5ISIS1deJPsKes
 xIrP0ecwaG+JpxSYZ7aaM0wTdWmp2IQV86UJkpvepnPh94Tq8k2Y5csh74TldyIivUTE
 wYu6g0AjlhOTV1OD1qAcIAk0xUvF835vHJRAP+dX1mcFwBDR/TIGXqPdkfMRZELY/MEN
 2pE71tuCL2bgMs51rxqJlHwJXd0QWchAjA+QHp1dynA7MPvQUxoQDKCpA6PkHAKPFqvs
 lRnfguWwYilD1gUO1hgKfJ4Jymwc1lF/kP0ZqPfhN6X2/Z3dxZ/a+tRfq4gpPhuHXANQ
 7vAA==
X-Gm-Message-State: AC+VfDxQWmUVTtaR4RiJF+/GEqjPSKjRVQWiVQVPysZ8WvwEINN2xDB+
 5XoPsF7EQCGho0uz4MrcJvbLLg==
X-Google-Smtp-Source: ACHHUZ59t/FMkw7eRB/YoPqhYK3n/rj4kBWnwZldSHc8oxGREN6/I/h72kECCk2ly5GazCTfyKcIXg==
X-Received: by 2002:a5d:534a:0:b0:301:2452:e53 with SMTP id
 t10-20020a5d534a000000b0030124520e53mr6656406wrv.67.1682793909478; 
 Sat, 29 Apr 2023 11:45:09 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a5d4c51000000b002d6f285c0a2sm24203622wrt.42.2023.04.29.11.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 11:45:09 -0700 (PDT)
Message-ID: <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
Date: Sat, 29 Apr 2023 19:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/21] Migration 20230428 patches
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20230428191203.39520-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428191203.39520-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
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

On 4/28/23 20:11, Juan Quintela wrote:
> The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b92646e6:
> 
>    Merge tag 'migration-20230427-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-04-28 08:35:06 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/juan.quintela/qemu.git tags/migration-20230428-pull-request
> 
> for you to fetch changes up to 05ecac612ec6a4bdb358e68554b4406ac2c8e25a:
> 
>    migration: Initialize and cleanup decompression in migration.c (2023-04-28 20:54:53 +0200)
> 
> ----------------------------------------------------------------
> Migration Pull request (20230429 vintage)
> 
> Hi
> 
> In this series:
> - compression code cleanup (lukas)
>    nice, nice, nice.
> - drop useless parameters from migration_tls* (juan)
> - first part of remove QEMUFileHooks series (juan)
> 
> Please apply.
> 
> ----------------------------------------------------------------
> 
> Juan Quintela (8):
>    multifd: We already account for this packet on the multifd thread
>    migration: Move ram_stats to its own file migration-stats.[ch]
>    migration: Rename ram_counters to mig_stats
>    migration: Rename RAMStats to MigrationAtomicStats
>    migration/rdma: Split the zero page case from acct_update_position
>    migration/rdma: Unfold last user of acct_update_position()
>    migration: Drop unused parameter for migration_tls_get_creds()
>    migration: Drop unused parameter for migration_tls_client_create()
> 
> Lukas Straub (13):
>    qtest/migration-test.c: Add tests with compress enabled
>    qtest/migration-test.c: Add postcopy tests with compress enabled
>    ram.c: Let the compress threads return a CompressResult enum
>    ram.c: Dont change param->block in the compress thread
>    ram.c: Reset result after sending queued data
>    ram.c: Do not call save_page_header() from compress threads
>    ram.c: Call update_compress_thread_counts from
>      compress_send_queued_data
>    ram.c: Remove last ram.c dependency from the core compress code
>    ram.c: Move core compression code into its own file
>    ram.c: Move core decompression code into its own file
>    ram compress: Assert that the file buffer matches the result
>    ram-compress.c: Make target independent
>    migration: Initialize and cleanup decompression in migration.c

There are a bunch of migration failures in CI:

https://gitlab.com/qemu-project/qemu/-/jobs/4201998343#L375
https://gitlab.com/qemu-project/qemu/-/jobs/4201998342#L428
https://gitlab.com/qemu-project/qemu/-/jobs/4201998340#L459
https://gitlab.com/qemu-project/qemu/-/jobs/4201998336#L4883


r~



