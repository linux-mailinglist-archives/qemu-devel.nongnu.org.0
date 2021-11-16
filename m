Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F64538F5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:56:20 +0100 (CET)
Received: from localhost ([::1]:50742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn2gt-0007YO-3Q
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn2eE-0006VC-9a
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:53:35 -0500
Received: from [2a00:1450:4864:20::42b] (port=35679
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn2eB-0007vi-UY
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:53:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i5so39231820wrb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wXBecsVXAZAN4UHUljo5rFXbdw3Ghvlr3hNfuMgv3dA=;
 b=t29Tffgb0k6FRgXqmSHK+7NJFpS5WcwtviuEx3UGD8GYbK2bKPNFFxdmoY/qRw6Wtt
 8CJvkYUdt+iYAyf/jHPxFNCunRrDq9zUbXP3aIGcPaDhiaTwv3l/NT1o0tR5auRxfZUW
 w9Xgzopzn8S5zJ5sreY8SBwdLJceP7Md2qg+cSrp+x8gAYhUo3WxjdxFppdaA8z38BX2
 Hcm0rNpwkXe8i8uOg/7W+uiUZh99ZMqVhLNMW9yEabnP/9qX/Xmc56NjujkvhV6+rrik
 AHyCR6eLRPrWpmBsJGEwdpe775qzS+5EH2c+PHuJQXhVAZEW48ftHmq5H4ch//OCGRQm
 iLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wXBecsVXAZAN4UHUljo5rFXbdw3Ghvlr3hNfuMgv3dA=;
 b=Kvl6cznfUs1oEbPwINUd/HTfQXVp44Bj6AzN6PkswA8mvNoNyko85knDLzWVcrYWDo
 N57g8HKuMTJQsGwKzlRBFG0KmjEb2bEYnOjfsyYWG6TE8cvDm8L2pSXSPiXvbs0hyV0/
 Kr5qza62YsfPlI0X/cEroEq2uT0IWgknjt5c/o6o0xrkSUyghnv7QJ9uTxXQfLt5ymqj
 iTsmRCWycpSgK46k+vfe9tbSREwUKouF2REBEkS2TRHcyyaXybCtVCZSOhRjQR69JaPq
 FQgQonZAZNVE/1WreVztmeB8XfrnNvMnApPPNjH8DauXOSXBZ3khyyDp9nJHdxzB+J/U
 llCw==
X-Gm-Message-State: AOAM532/TDsV2kvPnrS1Y6qpvbP5rW2J6iLF+Ocu70vl+eQPjlrVyU23
 oWua3E3h0fxwDkwkUZu6hD7nTs0ZdCFt93K/4MA=
X-Google-Smtp-Source: ABdhPJx7uU46sNWb/Rk/xZw8HIeH7dXNBvhgmirINXP+71wOAifs9DI0jsXh24BGDyw9pA6MnPX12g==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr12122889wrr.143.1637085209948; 
 Tue, 16 Nov 2021 09:53:29 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id j8sm17508602wrh.16.2021.11.16.09.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:53:29 -0800 (PST)
Subject: Re: [PULL for 6.2 0/7] misc build and test fixes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211116162515.4100231-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55d9e901-5c24-78af-1ba5-3dbc4a35160e@linaro.org>
Date: Tue, 16 Nov 2021 18:53:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116162515.4100231-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 5:25 PM, Alex Bennée wrote:
> The following changes since commit 871c71b1bad2d2647641500603a2236869135c7f:
> 
>    Merge tag 'pull-block-2021-11-16' of https://gitlab.com/hreitz/qemu into staging (2021-11-16 14:20:39 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-for-6.2-161121-1
> 
> for you to fetch changes up to 9968de0a4a5470bd7b98dcd2fae5d5269908f16b:
> 
>    gitlab: skip cirrus jobs on master and stable branches (2021-11-16 16:19:53 +0000)
> 
> ----------------------------------------------------------------
> Misc build and test fixes:
> 
>    - force NOUSER for base docker images
>    - don't run TCG VM tests by default
>    - remove useless meson test
>    - add Centos 8 custom runner
>    - split up custom-runners to individual files
>    - skip cirrus checks on master/stable branches
> 
> ----------------------------------------------------------------
> Alex Bennée (3):
>        tests/docker: force NOUSER=1 for base images
>        tests/vm: sort the special variable list
>        tests/vm: don't build using TCG by default
> 
> Cleber Rosa (1):
>        Jobs based on custom runners: add CentOS Stream 8
> 
> Daniel P. Berrangé (1):
>        gitlab: skip cirrus jobs on master and stable branches
> 
> Paolo Bonzini (1):
>        meson: remove useless libdl test
> 
> Philippe Mathieu-Daudé (1):
>        gitlab-ci: Split custom-runners.yml in one file per runner
> 
>   docs/devel/ci-jobs.rst.inc                         |   7 +
>   meson.build                                        |   8 +-
>   .gitlab-ci.d/cirrus.yml                            |   3 +
>   .gitlab-ci.d/custom-runners.yml                    | 239 +--------------------
>   .../custom-runners/centos-stream-8-x86_64.yml      |  28 +++
>   .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml | 118 ++++++++++
>   .../custom-runners/ubuntu-20.04-aarch64.yml        | 118 ++++++++++
>   accel/tcg/meson.build                              |   2 +-
>   .../ci/org.centos/stream/8/build-environment.yml   |  51 +++++
>   scripts/ci/org.centos/stream/8/x86_64/configure    | 208 ++++++++++++++++++
>   scripts/ci/org.centos/stream/8/x86_64/test-avocado |  70 ++++++
>   scripts/ci/org.centos/stream/README                |  17 ++
>   scripts/ci/setup/build-environment.yml             |  38 ++++
>   tests/docker/Makefile.include                      |   3 +
>   tests/vm/Makefile.include                          |  29 ++-
>   15 files changed, 686 insertions(+), 253 deletions(-)
>   create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
>   create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
>   create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
>   create mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
>   create mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
>   create mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
>   create mode 100644 scripts/ci/org.centos/stream/README

Applied, thanks.

r~


