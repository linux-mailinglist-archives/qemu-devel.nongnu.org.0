Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38A4EAB9C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:47:30 +0200 (CEST)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9Np-0005BK-4L
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:47:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9G4-0006vb-04
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:39:33 -0400
Received: from [2a00:1450:4864:20::329] (port=52873
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9G2-0001WA-FT
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:39:27 -0400
Received: by mail-wm1-x329.google.com with SMTP id r7so10001403wmq.2
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mG9wvvi8BbT0OICDw4j/HuRjYeDCKXYF3J5LjIvbMRs=;
 b=VnmxY0MdfiePnrvgyicHpecpvhWw4xYbeWqLqMDkPoPbuSIMr/E1pN3/539YLH8AQl
 80EbKZmZzOPm8rtonFlipVdCZIfSeq7s0Mqqkt1H6wkr2CH5VLdEQnvKs4cm4jO7x59q
 27dmcCZbAkkPHkKNPPWFE3ue7kkbD9QLmeRwIgYK9CZ270U1ENJEzDCjmZy4JeYuu/7Y
 HiepyJ9RKeKKh98T+s5iNvF1vGWCp7LGybtWsb5Ms0lpfWWkXHes3o5CeCqou0/lIMlD
 cwFKciq4S1kA6C3pEdFoO21DRWa3FP5/syFKqQ65wwGXKepXLK2D5clWSZsQzdGOB2Uh
 qiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mG9wvvi8BbT0OICDw4j/HuRjYeDCKXYF3J5LjIvbMRs=;
 b=oJj8fIiIUFnRqEUJldhvldXzU/8mgw4kvauzz9CZonOdWUbYvJRQlr+XEVehHzjPwP
 zdFluf8/xpu2RCKzR5BMGXhO+hgbGY5xoLoO5YD6hyXOeu8NX9zyixPQv2PUvedSaobI
 b5d5N0lLCbIKckO3JcuuPr01gNoSMSJAreQmtbqBhE5R6EfDIDb3uni5rhbfih9rJHMN
 8DuxNFUK7WaBpkmFHtsgPK3u9IUUEKxFZr5/62cEirXmYqMjRbMxW+JDjqzFepZ3bQBX
 CmAS+OCs927R8GU9PxI3M2qrTmOERbaDt7TOuWpPE2GzTtgT9yQbbTV8v9mBlfGHGQts
 e1Xg==
X-Gm-Message-State: AOAM533VTe8YQ6QUEZoKEyCFw7cjMFLxAM+V/vtZV8uIwxXtHGTGrPas
 qttQjZ6PCGMnvA7qXo0vAOU=
X-Google-Smtp-Source: ABdhPJxlsMMkb+/7muH73n392Fj5dDu4HHuOT9MpcWhLo9ki7S2oQN/vJ9d6U9UmzIPp+odOmcLB+A==
X-Received: by 2002:a05:600c:1d88:b0:38c:b121:c669 with SMTP id
 p8-20020a05600c1d8800b0038cb121c669mr6044362wms.150.1648550365136; 
 Tue, 29 Mar 2022 03:39:25 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3?
 ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm14504327wrv.10.2022.03.29.03.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:39:24 -0700 (PDT)
Message-ID: <16923125-23a2-4ac0-3919-ac78f3d9ac7e@gmail.com>
Date: Tue, 29 Mar 2022 12:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1] tests: Drop perl-Test-Harness from the CI
 containers / VMs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220329102808.423681-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220329102808.423681-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/3/22 12:28, Thomas Huth wrote:
> The perl test harness is not necessary anymore since commit 3d2f73ef75
> ("build: use "meson test" as the test harness"). Thus remove it from
> tests/lcitool/projects/qemu.yml, run "make lcitool-refresh" and manually
> clean the remaining docker / vm files that are not managed by lcitool yet.

Preferably splitting automatic/manual:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Note: This triggers a rebuild of the Centos-stream 8 container when
>   pushed to gitlab.com - which is however currently failing due to a
>   completely unrelated problem in the distro. Thus I've marked this as
>   "for-7.1" for now to avoid disturbing up our 7.0 freeze phase.
> 
>   .gitlab-ci.d/cirrus/freebsd-12.vars                  | 2 +-
>   .gitlab-ci.d/cirrus/freebsd-13.vars                  | 2 +-
>   .gitlab-ci.d/cirrus/macos-11.vars                    | 4 ++--
>   tests/docker/dockerfiles/alpine.docker               | 1 -
>   tests/docker/dockerfiles/centos8.docker              | 1 -
>   tests/docker/dockerfiles/debian-arm64-cross.docker   | 1 -
>   tests/docker/dockerfiles/debian-s390x-cross.docker   | 1 -
>   tests/docker/dockerfiles/debian-tricore-cross.docker | 1 -
>   tests/docker/dockerfiles/fedora-i386-cross.docker    | 1 -
>   tests/docker/dockerfiles/fedora-win32-cross.docker   | 1 -
>   tests/docker/dockerfiles/fedora-win64-cross.docker   | 1 -
>   tests/docker/dockerfiles/fedora.docker               | 1 -
>   tests/docker/dockerfiles/opensuse-leap.docker        | 1 -
>   tests/docker/dockerfiles/ubuntu1804.docker           | 1 -
>   tests/docker/dockerfiles/ubuntu2004.docker           | 1 -
>   tests/lcitool/projects/qemu.yml                      | 1 -
>   tests/vm/centos.aarch64                              | 3 +--
>   tests/vm/fedora                                      | 2 +-
>   18 files changed, 6 insertions(+), 20 deletions(-)

