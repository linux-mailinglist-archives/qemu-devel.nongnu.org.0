Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AEC619397
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:33:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqt3n-0005LI-Cu; Fri, 04 Nov 2022 05:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqt3l-0005Ks-3X
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:32:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqt3j-0004vS-Bx
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:32:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 h125-20020a1c2183000000b003cf9c3f3b80so66765wmh.0
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q5Ah71G+S/BzGs2ro9LqQS2XyggIleclMEHnuszJH/4=;
 b=Hk7FEL/9z5EBsCEaOQ/t88bM5I1XoSGT9uBwTKPhHQuhLij6xBD22AjFEqwTNi6XY6
 TB5EBXtu//cP/ifgm5n6fqyedngQS+frrxYyxIx5tZhjGlcn9zIXamopNHAGVnvo66ue
 rMXuM0/vY3PUIdQoac/WaEKYVdNV/1aJN3BoAkoc0ux0WserRc24VrzvZcHzj8XeFndv
 BMudDXWCQhz25ZQOTtqVmBfzX+6VPYBHsZs9w4xxwT/0pkBPzUswLPAnKDGXl+XRoMo6
 FDKQMd4CpF8bwRN5JVZkHbNIFB2Q68xpE9WPWbCLiBaqWqk5e2KLadPizfhZt2zvrJEi
 4U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q5Ah71G+S/BzGs2ro9LqQS2XyggIleclMEHnuszJH/4=;
 b=HEq0e6OL0/3f0nY1NaGXlVeRFgiXe9yq9tiSLw0OtriyYdufEkKSujyyiEXOWbhnlH
 hyfty2ZayjON1PxMrIatb5SJcHuFxpa/aW5i/v1+l8ZwxxhrZT4nXSwK5YTt1MqNcxYL
 nywuzMUa60/+Mm9+Ip5t3F1usvOorqhpIqGbG/cMXZGgzD806tv5qnmMkAjZMsi2myox
 J9o8uFLtcYQFZvS0jrkaxr7L8mks7prrnexfUdxNcFneoml6NQyCPfdMyJUKvwZsxKGd
 XlxfgJv/NKeUVueeQ+DYJ4qjQlhyuc6CvY3TjJZCgftW2YbOl5/Rw2MFphYi2jqY3fLS
 Ap7Q==
X-Gm-Message-State: ACrzQf2x1PVXddB+6Et3oHidJUwuSn6Sl8ASyVKBi3oeVnCX+v6WbClF
 bliuk/jCT2yJE1h1oQ8rPBHG2w==
X-Google-Smtp-Source: AMsMyM7+OQwyDoDi16VVQDbMHGveM0cUY3bs8zdVwj8MPjQgHGgfMf2IIUaeMhknLD+A5EIxyi7Srg==
X-Received: by 2002:a05:600c:2194:b0:3cf:758f:160e with SMTP id
 e20-20020a05600c219400b003cf758f160emr16194367wme.175.1667554337615; 
 Fri, 04 Nov 2022 02:32:17 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c2ca800b003b4a699ce8esm2525828wmc.6.2022.11.04.02.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 02:32:17 -0700 (PDT)
Message-ID: <7a67e04a-d723-95e6-0575-1a5a8786d54e@linaro.org>
Date: Fri, 4 Nov 2022 10:32:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] gitlab-ci: split clang-user to avoid timeout
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20221103212321.387738-1-stefanha@redhat.com>
 <599dd8d8-33d0-1bd7-dfe3-01bb2712f2bc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <599dd8d8-33d0-1bd7-dfe3-01bb2712f2bc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 07:27, Thomas Huth wrote:
> On 03/11/2022 22.23, Stefan Hajnoczi wrote:
>> GitLab CI times out when the clang-user job takes over 1 hour.
> 
> Oh, that's new to me ... is that a regression? Has something become 
> slower? Or did we just add more stuff to the user builds recently?

We added more TCG tests:

$ git diff --stat v7.1.0.. -- tests/tcg/
  tests/tcg/Makefile.target                              |   36 +-
  tests/tcg/aarch64/Makefile.softmmu-target              |   11 +-
  tests/tcg/aarch64/Makefile.target                      |   15 +-
  tests/tcg/arm/Makefile.target                          |    9 +-
  tests/tcg/cris/Makefile.target                         |    2 +-
  tests/tcg/hexagon/usr.c                                |   10 +
  tests/tcg/i386/Makefile.softmmu-target                 |    3 +-
  tests/tcg/i386/Makefile.target                         |   41 +-
  tests/tcg/i386/README                                  |    9 +
  tests/tcg/i386/test-3dnow.c                            |    3 +
  tests/tcg/i386/test-avx.c                              |  364 ++++++++++
  tests/tcg/i386/test-avx.py                             |  375 ++++++++++
  tests/tcg/i386/test-i386-bmi2.c                        |  169 ++++-
  tests/tcg/i386/test-i386.c                             |  575 
+--------------
  tests/tcg/i386/test-mmx.c                              |  315 ++++++++
  tests/tcg/i386/test-mmx.py                             |  244 +++++++
  tests/tcg/i386/x86.csv                                 | 4658 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  tests/tcg/multiarch/Makefile.target                    |   21 +-
  tests/tcg/multiarch/linux/linux-madvise.c              |   70 ++
  tests/tcg/multiarch/munmap-pthread.c                   |   79 +++
  tests/tcg/multiarch/noexec.c.inc                       |  139 ++++
  tests/tcg/multiarch/system/Makefile.softmmu-target     |    2 +-
  tests/tcg/nios2/10m50-ghrd.ld                          |   14 +-
  tests/tcg/nios2/Makefile.softmmu-target                |    3 +-
  tests/tcg/ppc64/Makefile.target                        |    8 +-
  tests/tcg/ppc64le/Makefile.target                      |   26 +-
  tests/tcg/riscv64/Makefile.target                      |    1 +
  tests/tcg/riscv64/noexec.c                             |   79 +++
  tests/tcg/s390x/Makefile.target                        |   34 +-
  tests/tcg/s390x/noexec.c                               |  106 +++
  tests/tcg/s390x/vistr.c                                |   45 ++
  tests/tcg/sh4/Makefile.target                          |   12 -
  tests/tcg/x86_64/Makefile.softmmu-target               |    3 +-
  tests/tcg/x86_64/Makefile.target                       |    7 +-
  tests/tcg/x86_64/noexec.c                              |   75 ++
  42 files changed, 6877 insertions(+), 686 deletions(-)

Also more s390x tests are going to be merged soon.

> Anyway, if it's just taking a little bit longer than 1h, it's likely 
> better to bump the timeout by 10 minutes (to 70 minutes), I guess that 
> will still take less CI minutes to run than to have two jobs.
> 
>   Thomas
> 


