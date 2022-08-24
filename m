Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAF559FF8E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 18:34:39 +0200 (CEST)
Received: from localhost ([::1]:40846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQtKv-00036Q-57
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 12:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQtFh-0005ld-6A
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 12:29:13 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQtFc-0001Ml-E3
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 12:29:12 -0400
Received: by mail-pf1-x433.google.com with SMTP id x15so16085574pfp.4
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=TU/IHOBJoXxOFu9ZIp4EZjr5QoJqjfjcWprh73+lHtg=;
 b=HhUt7d2KqSeFD/1TBu6F4kdZq7TBOuKkWWElJ4rdCAV6G3VlFQWgp/C4rXe3rjvUBk
 /ioRvN1PNueMXjnzLZlJqOXTIafHzyhtiETDHe729sJVMjQqY7reoxJlOb/P4715RjFn
 zFVXRPjZSCQzhSbUwDPrxz10ou7cFNPI75zhlxvRkBfLIl/0bN2Iwfgvfe82kyBmuq08
 ap0nBiWYT/KHIWaEp9truW9INbtTHdJUYUqX6L/GNClzGYLVT1UWNv3c2yEiB9CXgIRG
 dXHlbQqs7C2+BHTWDFe+ls8JhRmJPLF6ug8tfwouIxWlOGgGgCgAXLA4jKpxOllVIcIQ
 vsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=TU/IHOBJoXxOFu9ZIp4EZjr5QoJqjfjcWprh73+lHtg=;
 b=PcgfC+PBf0JytmTs99Y+26MsARF/GdTKuHOHe92Cp7OU/BM0Jh3GFYz2j+YqiiwMxr
 nD45IU50AH1iyDu5yLkVpaJZb38OiA36x3qpBr/3R8fYSDnN4HA8353fG18HKEDLHf+c
 eMV2nMSvEliYaJr9NI7pvv/eFPqGWPSaIgXvZX8EEiQreU3vsLu2a975wGu4wTOky2Bw
 A32wDL/c3/JEAQ8AS4Bk8hfzTg5OFBHFfqDqZOMoDdDJGRtnpsKpAwjC07Cw5qCyd4PO
 IKecO1zICNZV/bRXYzHq9yuKqaEHdhvqVmfvRHKWRGOLl/jgxZzlm9qQmUg6/zk7i98j
 Sk/A==
X-Gm-Message-State: ACgBeo1pxyi0UHrC+5em2AiJ89a5dGA80Q2LFFWMJHp7TwHiRijjcoGi
 /Jb6gu8jhnhWYOgdNcdydcpqfg==
X-Google-Smtp-Source: AA6agR48b1Sawq0yuSt1rP6tGP2wY8fa6DcgEiSjSsmINGuYba4/IfAddbjL1BFZEFCUQBfYOF7S2Q==
X-Received: by 2002:a05:6a00:1492:b0:536:74b1:101d with SMTP id
 v18-20020a056a00149200b0053674b1101dmr17189042pfu.31.1661358543723; 
 Wed, 24 Aug 2022 09:29:03 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a056a0000cd00b00535faa9d6f2sm11730927pfj.53.2022.08.24.09.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 09:29:03 -0700 (PDT)
Message-ID: <856910ae-7704-7ddf-c242-387c0135b517@linaro.org>
Date: Wed, 24 Aug 2022 09:29:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL v2 for 7.1 0/6] testing and doc updates
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
References: <20220824091920.1248422-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824091920.1248422-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 8/24/22 02:19, Alex Bennée wrote:
> The following changes since commit a8cc5842b5cb863e46a2d009151c6ccbdecadaba:
> 
>    Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-08-23 10:37:21 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-for-7.1-fixes-240822-3
> 
> for you to fetch changes up to 5af2b0f6eace7b368ed5cad9677e3bc995b6a7e3:
> 
>    qemu-options: try and clarify preferred block semantics (2022-08-24 10:14:49 +0100)
> 
> ----------------------------------------------------------------
> Testing and doc updates:
> 
>    - move default timeout to QemuBaseTests
>    - optimise migration tests to run faster
>    - removed duplicate migration test
>    - add some clarifying language to block options in manual

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alex Bennée (2):
>        tests/avocado: push default timeout to QemuBaseTest
>        qemu-options: try and clarify preferred block semantics
> 
> Thomas Huth (4):
>        tests/qtest/migration-test: Only wait for serial output where migration succeeds
>        tests/migration/aarch64: Speed up the aarch64 migration test
>        tests/migration/i386: Speed up the i386 migration test (when using TCG)
>        tests/qtest/migration-test: Remove duplicated test_postcopy from the test plan
> 
>   tests/migration/aarch64/a-b-kernel.h   | 10 +++++-----
>   tests/migration/i386/a-b-bootblock.h   | 12 ++++++------
>   tests/qtest/migration-test.c           |  5 +++--
>   qemu-options.hx                        | 13 +++++++++++++
>   tests/avocado/avocado_qemu/__init__.py |  5 ++++-
>   tests/migration/aarch64/a-b-kernel.S   |  3 +--
>   tests/migration/i386/a-b-bootblock.S   |  1 +
>   7 files changed, 33 insertions(+), 16 deletions(-)
> 


