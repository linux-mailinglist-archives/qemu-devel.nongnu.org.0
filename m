Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB9477965
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:39:44 +0100 (CET)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtnD-0005om-BB
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:39:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxtmD-00057y-N6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:38:41 -0500
Received: from [2607:f8b0:4864:20::102f] (port=38903
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxtmB-0005gA-U1
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:38:41 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 n15-20020a17090a394f00b001b0f6d6468eso3111351pjf.3
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TFwKTH4LtTpDuZl5ZgBUSTrQgVfxuVLAFgwDKvI0eoI=;
 b=nH38c/+z7mE0iRQUEXAbHIUWfpU2pn4YG/wEDCttxGAPoUUpR5CRNBBj8XALOBAatQ
 t2ZusLdeL3upKVP8DhVt+syx++WCbWZd6hlttXVXtz0ddSG3moAkFoW7wJ8ZXLKRTBzt
 OBueFdTHJsKN4cJtoi9kxABEd9jFQ8H3sw5/njLiCgDc0WtPlT+twL0SpcUvE9RQP2QV
 x+wp98OB4qDnkmy4SsFg6lwbfO4GrjZl1NZC2bPHcfhOajS5FzTp9nlvHGRvdUkDDkbC
 v/SY+64dfdssYDzDDKZpfk1UslghPVKeEQnLBqKj/Zj+Ir/5GZJoJxlyErJtSQ56tPbU
 oxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TFwKTH4LtTpDuZl5ZgBUSTrQgVfxuVLAFgwDKvI0eoI=;
 b=SI8E8K5EV1XQsJFe148PAvQ/HSx9r5jJ88SnuUZKOm7iD1XM98lx2RGvLpRnALQl4v
 9CZqWJkJzJEP2oc8bQFvFfO1p8DM+w0oPwDVZ3td4+WQenXHPE6LYgAgV2hYjx2va4TA
 /IMGboPjn8BX0fUm21xd9Um4xc+rsPbokFdTZUKNySyHjFIlEjPPGtjgWjYSdvAx//A4
 I89etimOqtt6hMEgoY/8a1SHFXPogwJgphwc92ntrjefU0bYDipQzsfvoO1mNWR1caVL
 ytvD+txB1y5W1voltZg5VD+O+icyGCSJUSwzFF6ls9hgKjJa1daXEwceodkO3MFGbxaD
 rc7A==
X-Gm-Message-State: AOAM532M/eroU0SmmLLpHFvF7JCTDbr2ztwoSRu9j9LYKRm7bYQvBJAX
 vtpTzp9TXw7Bl5g1NwfVQZJeyHNPUHy2/Q==
X-Google-Smtp-Source: ABdhPJxbEisEnPciLljPjIWt/4IaldGaMDfPXPjjy0FadHZrrz8unyuhA1tdx7d4+Q4Jx7gzXft10w==
X-Received: by 2002:a17:90a:5ae2:: with SMTP id
 n89mr2696420pji.177.1639672718409; 
 Thu, 16 Dec 2021 08:38:38 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q8sm6380659pfk.152.2021.12.16.08.38.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:38:37 -0800 (PST)
Subject: Re: [PULL 0/8] s390x patches (and one gitlab-CI fix)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211216094447.58496-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76b05ebe-6c6e-7bdc-016b-dc36aaadb2d4@linaro.org>
Date: Thu, 16 Dec 2021 08:38:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216094447.58496-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.034,
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

On 12/16/21 1:44 AM, Thomas Huth wrote:
>   Hi!
> 
> The following changes since commit e630bc7ec9dda656a452ed28cac4d1e9ed605d71:
> 
>    Merge tag 'pull-block-2021-12-15' of git://repo.or.cz/qemu/armbru into staging (2021-12-15 12:14:44 -0800)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/s390x-2021-12-16
> 
> for you to fetch changes up to 79e42726050b7be6c2104a9af678ce911897dfaa:
> 
>    gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices (2021-12-16 10:22:39 +0100)
> 
> ----------------------------------------------------------------
> * Small fixes for the s390x PCI code
> * Fix reset handling of the diag318 data
> * Add compat machines for 7.0 (all architectures)
> * Ease timeout problem of the new msys2-64bit job
> 
> ----------------------------------------------------------------
> Christian Borntraeger (1):
>        MAINTAINERS: update email address of Christian Borntraeger
> 
> Collin L. Walling (1):
>        s390: kvm: adjust diag318 resets to retain data
> 
> Cornelia Huck (1):
>        hw: Add compat machines for 7.0
> 
> Matthew Rosato (4):
>        s390x/pci: use a reserved ID for the default PCI group
>        s390x/pci: don't use hard-coded dma range in reg_ioat
>        s390x/pci: use the passthrough measurement update interval
>        s390x/pci: add supported DT information to clp response
> 
> Thomas Huth (1):
>        gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices
> 
>   .gitlab-ci.d/windows.yml        |  2 +-
>   .mailmap                        |  1 +
>   MAINTAINERS                     |  6 +++---
>   hw/arm/virt.c                   |  9 ++++++++-
>   hw/core/machine.c               |  3 +++
>   hw/i386/pc.c                    |  3 +++
>   hw/i386/pc_piix.c               | 14 +++++++++++++-
>   hw/i386/pc_q35.c                | 13 ++++++++++++-
>   hw/ppc/spapr.c                  | 15 +++++++++++++--
>   hw/s390x/s390-pci-bus.c         |  1 +
>   hw/s390x/s390-pci-inst.c        | 15 +++++++++------
>   hw/s390x/s390-pci-vfio.c        |  1 +
>   hw/s390x/s390-virtio-ccw.c      | 14 +++++++++++++-
>   include/hw/boards.h             |  3 +++
>   include/hw/i386/pc.h            |  3 +++
>   include/hw/s390x/s390-pci-bus.h |  3 ++-
>   include/hw/s390x/s390-pci-clp.h |  3 ++-
>   target/s390x/cpu.h              |  4 ++--
>   target/s390x/kvm/kvm.c          |  4 ++++
>   19 files changed, 97 insertions(+), 20 deletions(-)

Fails like so:

  (162/171) tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alias: 
FAIL: None != 'Cascadelake-Server-v1' : Cascadelake-Server must be an alias of 
Cascadelake-Server-v1 (0.14 s)

https://gitlab.com/qemu-project/qemu/-/jobs/1893456217

Which is presumably the compat machines in patch 7.


r~

