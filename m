Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD9850AF51
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 07:04:35 +0200 (CEST)
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhlT7-0003MJ-ML
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 01:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhlRA-0001bZ-GM
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 01:02:32 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhlR8-0008V3-Ih
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 01:02:32 -0400
Received: by mail-pl1-x636.google.com with SMTP id u15so4985983ple.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 22:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=q1KuasRaRy//Cz+DcpR1VpAv9HOMFe4CPCDotDl2ZL0=;
 b=P/QqUabZyT6vTlqdT7hy+OAmpIGBVlQhPPT4o8hauN+RAard3RuhjVaUdijJnsPtB5
 8wqCjxCmZ5NNJLhEIh+rVMR4GPpJbpaQCMk3AoLTUVJrgid+K6I0Ullz5uTq9euDkE/G
 52CyDZn/duwNCCH+b/2zdTu4jk0twQB0fXXt70ri/7v4NnA1rPfCUNQDgstA/jg+d7U0
 s6r4OAy5oPqltTbkYd2ot0+bRKUszwCOt9h+OdRjvSRT9qFZ1eMK6XGEGHCnUF4r7Svj
 lMhArAZGNNxWmfEaN9ZzEsEUYZhjkwTkvY1ZnxMqTnLjX5VUS/nDNeybujwqp8Fvmkav
 C/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q1KuasRaRy//Cz+DcpR1VpAv9HOMFe4CPCDotDl2ZL0=;
 b=qbl6tAEDLaaHF7JOr3oFg7VptEr4M3568UUtPJgEKWEJGnWZUWgJ6quJDl7Vraavwa
 8f3UxgXL+oQkgdFIISRwvwzrHUYZrryN+CJwKp3PD8fR4ygcXCo3Gj64dUW9HHdAR4Gq
 Am3i42N6dBh0sbdfuHknaUAxg9ykB/vhL6AoxAFr6zJ3WpQVddZj13oRfKPlpebCQlvS
 p/KY7vTEIDUFDjh0S651lQ2M+3F47/4YDLm+y7b3xdvvSc5S1N/G9YBPNsF28cjQnDRF
 uoS2WJpzqkr/Ag2uhJxMR8iQz1YREzPvqJwodZTZajyQgzyNpw6X+lCyK9hpHAj/mOmS
 IBsw==
X-Gm-Message-State: AOAM531awHNeSB8zX0szm78V9qXGWcomBIuYPkqM7ZLS5p31z4QI0L9r
 rsuUoI0QZuEa/NnmDkN/KrphbQ==
X-Google-Smtp-Source: ABdhPJxNYx1VsoMhPYIQAP75CgPeUCw8AYiyUT6ytO7DoUucvQ7JRVdRd6/2RZEKaGt4PZqGBNvhpQ==
X-Received: by 2002:a17:90a:2b09:b0:1d6:c17a:fe2f with SMTP id
 x9-20020a17090a2b0900b001d6c17afe2fmr6020636pjc.16.1650603748624; 
 Thu, 21 Apr 2022 22:02:28 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d3:7d7b:c271:af64:c16d:2453?
 ([2607:fb90:27d3:7d7b:c271:af64:c16d:2453])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a17090a710900b001cd4989fecdsm4473960pjk.25.2022.04.21.22.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 22:02:27 -0700 (PDT)
Message-ID: <ce65683e-143c-45fe-8f60-7668aabcf15c@linaro.org>
Date: Thu, 21 Apr 2022 22:02:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/18] migration queue
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, peterx@redhat.com, berrange@redhat.com
References: <20220421184052.306581-1-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220421184052.306581-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 11:40, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit 28298069afff3eb696e4995e63b2579b27adf378:
> 
>    Merge tag 'misc-pull-request' of gitlab.com:marcandre.lureau/qemu into staging (2022-04-21 09:27:54 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220421a
> 
> for you to fetch changes up to 552de79bfdd5e9e53847eb3c6d6e4cd898a4370e:
> 
>    migration: Read state once (2022-04-21 19:36:46 +0100)
> 
> ----------------------------------------------------------------
> V2: Migration pull 2022-04-21
> 
>    Dan: Test fixes and improvements (TLS mostly)
>    Peter: Postcopy improvements
>    Me: Race fix for info migrate, and compilation fix
> 
> V2:
>    Fixed checkpatch nit of unneeded NULL check
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> Daniel P. Berrangé (9):
>        tests: improve error message when saving TLS PSK file fails
>        tests: support QTEST_TRACE env variable
>        tests: print newline after QMP response in qtest logs
>        migration: fix use of TLS PSK credentials with a UNIX socket
>        tests: switch MigrateStart struct to be stack allocated
>        tests: merge code for UNIX and TCP migration pre-copy tests
>        tests: introduce ability to provide hooks for migration precopy test
>        tests: switch migration FD passing test to use common precopy helper
>        tests: expand the migration precopy helper to support failures
> 
> Dr. David Alan Gilbert (2):
>        migration: Fix operator type
>        migration: Read state once
> 
> Peter Xu (7):
>        migration: Postpone releasing MigrationState.hostname
>        migration: Drop multifd tls_hostname cache
>        migration: Add pss.postcopy_requested status
>        migration: Move migrate_allow_multifd and helpers into migration.c
>        migration: Export ram_load_postcopy()
>        migration: Move channel setup out of postcopy_try_recover()
>        migration: Allow migrate-recover to run multiple times
> 
>   migration/channel.c                 |   1 -
>   migration/migration.c               |  66 ++++---
>   migration/migration.h               |   4 +-
>   migration/multifd.c                 |  29 +--
>   migration/multifd.h                 |   4 -
>   migration/ram.c                     |  10 +-
>   migration/ram.h                     |   1 +
>   migration/savevm.c                  |   3 -
>   migration/tls.c                     |   4 -
>   tests/qtest/libqtest.c              |  13 +-
>   tests/qtest/migration-test.c        | 368 ++++++++++++++++++++----------------
>   tests/unit/crypto-tls-psk-helpers.c |   2 +-
>   12 files changed, 267 insertions(+), 238 deletions(-)
> 
> 


