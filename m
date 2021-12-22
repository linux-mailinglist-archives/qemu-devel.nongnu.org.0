Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD4047D660
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:17:03 +0100 (CET)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06Ag-0003EE-Lq
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:17:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n05uy-0002O1-3T
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 13:00:48 -0500
Received: from [2607:f8b0:4864:20::529] (port=40644
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n05ur-0002nU-Il
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 13:00:43 -0500
Received: by mail-pg1-x529.google.com with SMTP id l10so2735068pgm.7
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 10:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/CCbiRt+qsZicRJ7kbL0lylO2URGa+FxaA9esoze63E=;
 b=zZBYyFk49ENVnsI8VXrcKj5HxkKtyGmn910mSM3Wz3zfAlzQ7LTz1aB5pltZuNYgk4
 8/bLpXOgSxtbY8V2zQ445XI0BVG2uM40EBW3rsJ1TEiDAVIS6F/bkq8hZOsjS8eRsU3n
 L5Lxr1cx32SWX7U1kpVVmuzSmsSiS1OJPPEeP+MbMzVDh0xQJrUFHgDwamsu/3F6iM+P
 zvRWB401OVVe6GN8LmwPHKyGrzZNS20Xoes71gnPl4f62tzqg+vSP3BGsoWfvPbAItKo
 KalHmS/8jXDVdhdfyaQ6FUBUu3kFy0TSxZSPj1w3Cpoh+Pyag18KtTPFEpG4aocBCaWr
 MoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/CCbiRt+qsZicRJ7kbL0lylO2URGa+FxaA9esoze63E=;
 b=RTTQ1Uz1H5HurhJagExjaZ9KYqeyS64TTDvjUxBDz5ehfsE36XHuVUjjKlsETTv7U3
 66JE7l0PRMKJI/jfh4iEYZ6vxyOHD0PYOJABN6QRp/3iL0tkMmMSdWu1iyXOLK1/YRlC
 E1xBzlXk+paBVMgnKxb9HEdZQV+8DOlWUPVB2Sz2L7d7BnNiAnTjM0tfGFIVZyiTUYp3
 E5NAA1QJtaFYKt1Vlzram92fDWM/PnUjUtHyp+N8b+5G4ddVv4xVnjh288Sb1CxSL1Q3
 noCiit+Er618EFUGyNZUaxqpK5cjouPQC65FJN59kC8FmaXrxVtNvGGhr0Aim+pjBLg0
 ZeAQ==
X-Gm-Message-State: AOAM533s6WKalBfeuRhQtfqSkumNDppmAPn6JSMBheanq/XgxqYlm0rw
 TGkBt0awlZ7t9HdzNpdGFmAeFbZVEUFC+w==
X-Google-Smtp-Source: ABdhPJyU33lw/Wa8JoPgvr5C6MbxtNJiTlhYXe5i8tZ+ubIkUJFdfxzfqwWwghO6O4EBElj2s2jlbg==
X-Received: by 2002:a05:6a00:2290:b0:4bb:4b93:a82f with SMTP id
 f16-20020a056a00229000b004bb4b93a82fmr3935380pfe.22.1640196036422; 
 Wed, 22 Dec 2021 10:00:36 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id p2sm2755221pgn.73.2021.12.22.10.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:00:35 -0800 (PST)
Subject: Re: [PULL 0/9] qtest fixes and improvements
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211222113259.823203-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <760e3d2e-21ff-b530-61d5-2b2c7b54be30@linaro.org>
Date: Wed, 22 Dec 2021 10:00:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222113259.823203-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/22/21 3:32 AM, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit 8c5f94cd4182753959c8be8de415120dc879d8f0:
> 
>    Merge tag 'pull-loong-20211221-2' of https://gitlab.com/rth7680/qemu into staging (2021-12-21 13:30:35 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-12-22
> 
> for you to fetch changes up to e63ed64c6d10768b3a41c3337226372a9664ef6f:
> 
>    tests/qtest/virtio-net-failover: Use g_file_open_tmp() to create temporary file (2021-12-22 09:37:14 +0100)
> 
> ----------------------------------------------------------------
> * Fixes for the virtio-net-failover test
> * Silence warnings in the boot-serial-test
> * Make qtests more flexible wrt missing machines and devices
> 
> ----------------------------------------------------------------
> Laurent Vivier (1):
>        failover: Silence warning messages during qtest
> 
> Thomas Huth (7):
>        tests/qtest/boot-serial-test: Silence the warning about deprecated sga device
>        tests/qtest: Make the filter tests independent from a specific NIC
>        tests/qtest: Add a function that checks whether a device is available
>        tests/qtest: Improve endianness-test to work with missing machines and devices
>        tests/qtest/cdrom-test: Check whether devices are available before using them
>        tests/qtest/boot-order-test: Check whether machines are available
>        tests/qtest/virtio-net-failover: Use g_file_open_tmp() to create temporary file
> 
> Zhang Chen (1):
>        MAINTAINERS: Update COLO Proxy section
> 
>   MAINTAINERS                          |  1 +
>   hw/net/virtio-net.c                  |  7 ++++-
>   migration/migration.c                |  4 ++-
>   tests/qtest/boot-order-test.c        |  5 +++
>   tests/qtest/boot-serial-test.c       | 10 +++---
>   tests/qtest/cdrom-test.c             | 60 +++++++++++++++++++++++-------------
>   tests/qtest/endianness-test.c        |  5 ++-
>   tests/qtest/libqos/libqtest.h        |  8 +++++
>   tests/qtest/libqtest.c               | 44 ++++++++++++++++++++++++++
>   tests/qtest/meson.build              | 40 ++++++++++++++++++------
>   tests/qtest/test-filter-mirror.c     | 10 ++----
>   tests/qtest/test-filter-redirector.c | 20 +++---------
>   tests/qtest/test-netfilter.c         |  8 +----
>   tests/qtest/virtio-net-failover.c    |  8 +++--
>   14 files changed, 158 insertions(+), 72 deletions(-)

Applied, thanks.

r~


