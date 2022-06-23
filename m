Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD0557DC0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:28:16 +0200 (CEST)
Received: from localhost ([::1]:35218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Nod-0003Hi-J0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4NnA-00023A-G2
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:26:44 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:46732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4Nn8-0007U7-OA
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:26:44 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so2725865pjj.5
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+gOKOroTQdbOGmqPVZV6m/9V+F41gL/XjvE5Odui5H0=;
 b=I3IxialnKPEwttX+i6GkUcUIM4aAJkd1h4VtccQaGdo562FlTnwwNOU5fwkw27cPNc
 6nSL5UVaGNtZmnXJ/k7pxxQ4PA4edGKrvLqpeAHTCMAaV+fc5c3MbuG7eGs6byTo7O2p
 aSRtZL6p1LPXZdbGc7xmPWZgm/5GkTKQd7hjn5e+VfWAZo/xDmVuxtRvvo5oJiGwPCzp
 lyUdjsWomyzapjac6aAf7OVitgzltufLygMVX9dfbGAu1pRrBn40R/EAI7dW1kBxgG4s
 qGRNVy+7rRQk35jo+XWusK4pr+VUTD7n+2xkRrSTceSSV0wDXlLVeIbUIus9r3Evbih5
 +u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+gOKOroTQdbOGmqPVZV6m/9V+F41gL/XjvE5Odui5H0=;
 b=zrAFLYxYZX+YARxjto81YwVuzNCcrN6NzwDyNOC+qp6HXeDqWoTbemn4HFKB1loTp8
 KuG7bd9zj4pMUOz5r6lOcQl/dTwR98rCrr+gmvaH4pKtD9fswyqZ1Cs9ysKnxh9zWlUL
 y8p0u187w0ygo+fjer8XJ192b3fLW5J89Fpb7huSEOl36aBlH1zCnW0I82W/VnHj+J2u
 qK/km/sneiQb/3yf5rlJv7D7PccEEEDWDrAe1RMmAj5dHWxH3NpCTn03vpM+w6/uHHRt
 AU5pVi+CKsNV3F+dRWIwpUC2Rk2SJBcPsFjrDmzrseJVfEFmpKqfGuFd72e6VURNgAIT
 QAeQ==
X-Gm-Message-State: AJIora/eyDXi45GcW6oUF8lHRidgGP5KO40zjrgML8Txk/bhGVduTizA
 Fzl1u6qiTSN7HcPxsBLE6kZ8qA==
X-Google-Smtp-Source: AGRyM1uirB0a9keio+h2vOyqcyrebSZTi08kXcLDO6/d7UJpl/4GsOgGg1Z/y0/B0ejJkR3zROSChQ==
X-Received: by 2002:a17:902:e5c2:b0:16a:62c7:4190 with SMTP id
 u2-20020a170902e5c200b0016a62c74190mr830336plf.110.1655994400914; 
 Thu, 23 Jun 2022 07:26:40 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 k18-20020aa790d2000000b005256c9c3957sm92212pfk.108.2022.06.23.07.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 07:26:40 -0700 (PDT)
Message-ID: <9573d33b-5c08-a3f1-80a2-ab74bb055fc2@linaro.org>
Date: Thu, 23 Jun 2022 07:26:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/33] migration queue
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
References: <20220623092810.96234-1-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 6/23/22 02:27, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:
> 
>    Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220623a
> 
> for you to fetch changes up to 5df0eaff8e24223974bf2516e6dc773695603017:
> 
>    tests: Add dirty page rate limit test (2022-06-23 10:18:14 +0100)
> 
> ----------------------------------------------------------------
> Migration pull 2022-06-23
> 
> This replaces my pull from yesterday, and Juan's from the day before.
> 
> Compared to my pull eysterday:
>    A one character fix in get_buffer patch spotted by Peter Xu
> 
> Compared to Juan's pull:
>    a) Hopefully fixed non-Linux builds
>      (Local build test on mingw64 works
>      Note: the zero-copy capability is now
>      defined on non-Linux systems)
>    b) Added Hyman's series - it had been
>      on queue for a while (sorry for the delay)
> 
> In this today migration PULL request:
> - Dainiel Berrangé - qemufileops cleanup
> - Leonardo Bras  - cleanups for zero copy
> - Juan Quintela  - RDMA cleanups
> - Hyman Huang - per-vcpu dirty ring work

New build failure on all 32-bit hosts:

https://gitlab.com/qemu-project/qemu/-/jobs/2631167210

../softmmu/dirtylimit.c: In function ‘vcpu_dirty_rate_get’:
/builds/qemu-project/qemu/include/qemu/compiler.h:74:36: error: static assertion failed: 
"not expecting: sizeof(*&rates[cpu_index].dirty_rate) > ATOMIC_REG_SIZE"
    74 | #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x), msg)
       |                                    ^~~~~~~~~~~~~~
/builds/qemu-project/qemu/include/qemu/compiler.h:76:30: note: in expansion of macro 
‘QEMU_BUILD_BUG_MSG’
    76 | #define QEMU_BUILD_BUG_ON(x) QEMU_BUILD_BUG_MSG(x, "not expecting: " #x)
       |                              ^~~~~~~~~~~~~~~~~~
/builds/qemu-project/qemu/include/qemu/atomic.h:136:5: note: in expansion of macro 
‘QEMU_BUILD_BUG_ON’
   136 |     QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
       |     ^~~~~~~~~~~~~~~~~
../softmmu/dirtylimit.c:120:12: note: in expansion of macro ‘qatomic_read’
   120 |     return qatomic_read(&rates[cpu_index].dirty_rate);
       |            ^~~~~~~~~~~~

Still not fixed on non-linux:

https://gitlab.com/qemu-project/qemu/-/jobs/2631167373

../tests/qtest/migration-test.c:2294:34: error: use of undeclared identifier 
'DIRTYLIMIT_TOLERANCE_RANGE'
         if (rate < (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
                                  ^
../tests/qtest/migration-test.c:2316:34: error: use of undeclared identifier 
'DIRTYLIMIT_TOLERANCE_RANGE'
         if (rate > (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
                                  ^

r~

