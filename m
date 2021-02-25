Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254A8324881
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 02:25:01 +0100 (CET)
Received: from localhost ([::1]:33246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF5Ol-0000j4-IY
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 20:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5Nt-0000Ge-Cb
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:24:05 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lF5No-0007ef-Vp
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 20:24:05 -0500
Received: by mail-pl1-x630.google.com with SMTP id 17so2275829pli.10
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 17:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wQO/PqFEFaQI4VenUKecT8VDOx5/bbK7VtrM7Zm0/9s=;
 b=D5hg2U2B6t+rFDC7ZUjgLxPgoHayqppJki5zDzjg1PSVyiedlIoY0Al39FqGyRydoj
 Y+EjoV4zbfzHj50EJsH/UsoQYQTXpTw2ELUkJuG3D19FeIQ9faIfphN4rQiTGS91mJF5
 Da9/cU6NR5HpcZmMc3vxl7jcA3vMASVL37xsgyslSQbjr+CiQO5lh4wRHnJe+jjZ8HkE
 /fKx5UGBnoER2pnDlJcNhX6DIJEcwV4sXwS4VzgF4F5WgmVg81G+992BkbJ8zPpOEjmB
 khLSEAaO+177Un3zUnMTmU64qasdlh5fFmuU+aIAsVjBiwjNQEf4EszQTUfvk8y1LBti
 TI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wQO/PqFEFaQI4VenUKecT8VDOx5/bbK7VtrM7Zm0/9s=;
 b=WHD+W3OOfW07PlHTnCJ2qoxZZfZk25xooLASpWAC6bxysgqi/wv0C5Y370Hmk0TgAq
 BoWTzs2EsLl+hcJ6PY6BX5i5v+4Huujcl6HZVNv9Rj/N4Bw3f02pKLrQLWK+Ggqppqa/
 5Oigw9GUZWGLxoqkVwjdd1YrAyT/AMM/no4+e6Tx3dNrUk4EObS0iT+WL9qjp60reBv5
 A4yv/z4Ek5+lxU1YCH2bNHk6tn324xN7vTTIf9/hGYNb8ZmcD0qcdm1vVcR/2xN2BKp3
 jhRFUJtQh6v01NaR4d31bUEwHw0Lv53iCCw+qm697ycaL1CaO75UBIWYverC+F/UMOse
 8QyA==
X-Gm-Message-State: AOAM530ZzbfsD5rpJhuTTWCAwNbjGp9owHrW2rRVythAKxbBSazuL8CT
 R0e7GKjriDwkbCccQ9gIv9SbTrbJwg+Vtg==
X-Google-Smtp-Source: ABdhPJyERtTkJFClMCfkw0usrTEQqCBtxEhMgajkEBq9uMvJOAcw0VtxbVgJca0dYnfNMvChJivDNQ==
X-Received: by 2002:a17:90a:1f4c:: with SMTP id
 y12mr726676pjy.52.1614216238517; 
 Wed, 24 Feb 2021 17:23:58 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b15sm3782216pgj.84.2021.02.24.17.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 17:23:57 -0800 (PST)
Subject: Re: [PATCH v22 01/17] i386: split cpu accelerators from cpu.c, using
 AccelCPUClass
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-2-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1f76ea2-11e3-bd86-aebf-58061eba1262@linaro.org>
Date: Wed, 24 Feb 2021 17:23:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224133428.14071-2-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 5:34 AM, Claudio Fontana wrote:
> i386 is the first user of AccelCPUClass, allowing to split
> cpu.c into:
> 
> cpu.c            cpuid and common x86 cpu functionality
> host-cpu.c       host x86 cpu functions and "host" cpu type
> kvm/kvm-cpu.c    KVM x86 AccelCPUClass
> hvf/hvf-cpu.c    HVF x86 AccelCPUClass
> tcg/tcg-cpu.c    TCG x86 AccelCPUClass
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/i386/cpu.h           |  20 +-
>  target/i386/host-cpu.h      |  19 ++
>  target/i386/kvm/kvm-cpu.h   |  41 ++++
>  target/i386/tcg/tcg-cpu.h   |  15 --
>  hw/i386/pc_piix.c           |   1 +
>  target/i386/cpu.c           | 390 ++++--------------------------------
>  target/i386/host-cpu.c      | 201 +++++++++++++++++++
>  target/i386/hvf/hvf-cpu.c   |  68 +++++++
>  target/i386/kvm/kvm-cpu.c   | 151 ++++++++++++++
>  target/i386/kvm/kvm.c       |   3 +-
>  target/i386/tcg/tcg-cpu.c   | 113 ++++++++++-
>  MAINTAINERS                 |   2 +-
>  target/i386/hvf/meson.build |   1 +
>  target/i386/kvm/meson.build |   7 +-
>  target/i386/meson.build     |   6 +-
>  15 files changed, 651 insertions(+), 387 deletions(-)
>  create mode 100644 target/i386/host-cpu.h
>  create mode 100644 target/i386/kvm/kvm-cpu.h
>  delete mode 100644 target/i386/tcg/tcg-cpu.h
>  create mode 100644 target/i386/host-cpu.c
>  create mode 100644 target/i386/hvf/hvf-cpu.c
>  create mode 100644 target/i386/kvm/kvm-cpu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

