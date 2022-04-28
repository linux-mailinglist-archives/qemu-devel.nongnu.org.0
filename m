Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F6B5139B3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 18:23:48 +0200 (CEST)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6vk-0005kW-1W
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 12:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk69f-0003LG-Qf
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:34:07 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:34787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk69d-0006v2-Ot
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:34:07 -0400
Received: by mail-pg1-x532.google.com with SMTP id z21so4283984pgj.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=TPT6UJt0kMGiI+tV4JF6rVDSF2RRIQKdzp7bT2YkECc=;
 b=ZE4FP5imqF2QKFYXSKfw5creVzVF2q/U8Xpmih6kL7uwdXISdmYQ6spjR7ptVASmAM
 1+X8o6TbnlHdIVy661WtoWzTy2HnQHbuSY0fSwNi0PrOax3jVegWUwA8c/aIobtueVrs
 atItnC9wynOlB9lAZ5w7lX7CPLjjfDAQk4YnvmctEG6K59Qv+X9wx1chZkZ+ScmizvCS
 p0bumOh6CK81fCkqYxTVmEIeejhTBfAGG83xrc7V4ani43vpoM97Eqvv1E+ng9Fz7Ez4
 IUUY85TKdYb0oQjLzjLvIwHgZcrMIMsSApaMLk6mel2VB7UmTLsLFeY1LBbK7oW1qYcw
 UG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TPT6UJt0kMGiI+tV4JF6rVDSF2RRIQKdzp7bT2YkECc=;
 b=XZ+NJHFsciyu5u0uJG3b4mbDzY7QzxDcNdjB18n4yUaCTTTi2aoBPFYVsc4GHFamXG
 0uTjmrgrg4D/ZMZWjH+x7dI8cLFhH0kGs9x/6WPr2yGM+wDt5kkrE2lUNXM4V7ZEDA1S
 Y4dEdoLJIxcUv5bmYC2JiaPC6vhsI74sYG1AV2QAyjUG0U3dbcoJbolmqbJvfa8tmnQv
 UlyWBrCGvKZEflnOmU5xJIcn4I1BooyWBQ3lHUqd478NpV4tHbPtXqiusajBs0XFXqhD
 VsQ5K/pzVoRZLWPnO9djRVKDKWGI8xNDhvIXYgV8bxI8tY6Kjl51NJk1NdIyZnj0/us0
 KJkQ==
X-Gm-Message-State: AOAM532v/ubqJpsqi88SS6WGBfSGpbyEHk7Wa4zXIhXW/f+NbTfDzDzu
 rsRyq25emdr8qcpHVYRQW1j7VhS6jhqYLA==
X-Google-Smtp-Source: ABdhPJzptTyOieC6UM9qrcZkEv1AjGSPqlXlc3qiV0jxcSiZIavBHY3f+GQSKEL6wN7wyyKnf0RcNw==
X-Received: by 2002:a05:6a00:23d2:b0:4fa:f262:719 with SMTP id
 g18-20020a056a0023d200b004faf2620719mr35704129pfc.4.1651160040127; 
 Thu, 28 Apr 2022 08:34:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a62f94c000000b0050b7a347e4csm216031pfm.96.2022.04.28.08.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 08:33:59 -0700 (PDT)
Message-ID: <16d09b9e-adfd-b706-f1b5-08c552224700@linaro.org>
Date: Thu, 28 Apr 2022 08:33:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/18] Misc QEMU patches for 2022-04-28
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220428065335.189795-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220428065335.189795-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

On 4/27/22 23:53, Paolo Bonzini wrote:
> The following changes since commit cf6f26d6f9b2015ee12b4604b79359e76784163a:
> 
>    Merge tag 'kraxel-20220427-pull-request' of git://git.kraxel.org/qemu into staging (2022-04-27 10:49:28 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to 21abf010bb28f0c98db4ee66a990065062c62126:
> 
>    qemu-options: Limit the -enable-kvm option to the targets that support it (2022-04-28 08:52:22 +0200)
> 
> ----------------------------------------------------------------
> * Bugfixes
> * Meson conversions

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Haiyue Wang (1):
>        error-report: fix g_date_time_format assertion
> 
> Michael Tokarev (1):
>        configure: make fortify_source=yes by default
> 
> Paolo Bonzini (14):
>        remove -writeconfig
>        meson: show final set of compiler flags
>        configure: remove dead code
>        qga: wixl: get path to sysroot from pkg-config as intended
>        configure: pc-bios/qemu-icon.bmp does not exist
>        configure: gcov should not exclude fortify-source
>        configure: move --enable/--disable-debug-info to second option parsing pass
>        configure, meson: move OpenGL check to meson
>        meson, configure: move RDMA options to meson
>        meson, configure: move keyctl test to meson
>        meson, configure: move usbfs test to meson
>        meson, configure: move libgio test to meson
>        meson: remove CONFIG_XEN_PCI_PASSTHROUGH from config-target.h
>        meson, configure: move --enable-module-upgrades to meson
> 
> Paul Brook (1):
>        i386: pcmpestr 64-bit sign extension bug
> 
> Thomas Huth (1):
>        qemu-options: Limit the -enable-kvm option to the targets that support it
> 
>   backends/meson.build            |   2 +-
>   configure                       | 348 ++--------------------------------------
>   contrib/rdmacm-mux/meson.build  |   4 +-
>   crypto/meson.build              |   4 +-
>   docs/about/deprecated.rst       |   7 -
>   docs/about/removed-features.rst |   7 +
>   hw/xen/meson.build              |  20 ++-
>   include/qemu/config-file.h      |   1 -
>   meson.build                     | 149 ++++++++++++++---
>   meson_options.txt               |  12 ++
>   migration/meson.build           |   2 +-
>   qemu-options.hx                 |  12 +-
>   qga/meson.build                 |   2 +-
>   scripts/meson-buildoptions.sh   |  19 +++
>   softmmu/vl.c                    |  20 ---
>   target/i386/ops_sse.h           |  20 ++-
>   tests/qtest/meson.build         |   5 +-
>   ui/meson.build                  |  24 +--
>   util/error-report.c             |   2 +-
>   util/meson.build                |   2 +-
>   util/qemu-config.c              |  42 -----
>   21 files changed, 221 insertions(+), 483 deletions(-)


