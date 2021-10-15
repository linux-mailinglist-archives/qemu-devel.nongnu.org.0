Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4FE42EEFE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:42:19 +0200 (CEST)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKfK-0000Xy-Jc
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbKdK-0007fw-UP
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:40:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mbKdH-0001Oi-44
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634294409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iR1LydX5gSs5rG9I5kyHaPAacSqdkmuZ3XUDFY6PqW8=;
 b=GnVmNlTI0DEZxNfb394uXckS778v72kC58lJk8lLHwqJIblMFX0bUiln3ofCT/+s+1x23C
 vIGd60Y9O4PORWdr91LVPwO5+w/9io+GgERvSRgKWSTU1nfusiZOW7ZLDOyEsSG/hQB97W
 70fcMEXoJZtJohIGlHQ7rSE/F3qiFPs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-MS3rPJnKNjGmKnCqXDnZog-1; Fri, 15 Oct 2021 06:40:04 -0400
X-MC-Unique: MS3rPJnKNjGmKnCqXDnZog-1
Received: by mail-ed1-f71.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so7832484edy.14
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 03:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iR1LydX5gSs5rG9I5kyHaPAacSqdkmuZ3XUDFY6PqW8=;
 b=mfz4sASp7e9C1yfZVtSlqlhxt1kfmT06IVW0J8SAJsz2RbGBY2vNJAGMNu+K1xnBC+
 zZ8Vtugtp3yrsjjHTA5okv03ODoy3067XmD42YOP0Hs+So2rlxzenN1gOg7lgiHtxl+E
 4TxZ9YusfzMWG067haH7MIaweeox3G97Fqe7oUv2lGdS42Z+ID/Rbar0KBteIxNV6+uw
 FYm8BTXOMlnLtIQ8q/tHY5kesiS/wYfFBqTk5bM0s+8vGGy2+WAnR2gifJdgNU+u4UHp
 hOvD61n0xFfnkA3uvslpFOsrHD1s8GihHYWmBvZhpeOZdR/vKKUo7YZj4dXrk87VrMpz
 yncA==
X-Gm-Message-State: AOAM530Z1xFQabcnMczsmLba0fEOLGuIOTBug1Nx6OFsBx6WQMAOkNTg
 QVy2UDaI3Xlm4EVtS1s757PxpNohTp6LBR8z9PcQGciknTnh4lZyvGx0u3YJOsTzEzzyE7VZ60E
 0v2wf4EyEWaigH1M=
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr16454543edd.48.1634294403697; 
 Fri, 15 Oct 2021 03:40:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh8kTMPjljyAlXL1Pv87UuQBLifCLvhsyJDrlokXGISzw4E/P/mXceIYKEkReGDh9jq1YM9w==
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr16454520edd.48.1634294403500; 
 Fri, 15 Oct 2021 03:40:03 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b2sm3919379ejj.124.2021.10.15.03.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 03:40:02 -0700 (PDT)
Message-ID: <48f3ac74-8157-7e8b-f3b5-da6c28318f7b@redhat.com>
Date: Fri, 15 Oct 2021 12:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] configure/optionrom: Fix MSYS2 multiboot.bin issue
To: Helge Konetzka <hk@zapateado.de>, qemu-devel@nongnu.org
References: <2b5ab039-8495-b55f-03f1-ecfd996907a9@zapateado.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <2b5ab039-8495-b55f-03f1-ecfd996907a9@zapateado.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/09/21 12:56, Helge Konetzka wrote:
> This patch enables native builds on MSYS2 with symlinks disabled.
> 
> 
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
> ---
> 
> Without this patch these builds fail with:
> 
> make[1]: *** No rule to make target 'multiboot.bin', needed by 'all'. Stop.
> make: *** [Makefile:189: pc-bios/optionrom/all] Error 2
> make: *** Waiting for unfinished jobs....
> ...
> ==> ERROR: A failure occurred in build().
>       Aborting...
> 
> Builds fail because make cannot determine correct TOPSRC_DIR/SRC_DIR 
> based on copied instead of linked Makefile
> 
> After applying this patch to current master I succeeded in building 
> natively on Linux and Windows/MSYS2 with symlinks disabled and enabled 
> (winsymlinks:nativestrict, bash executed as Administrator).
> 
>   configure                  | 4 ++++
>   pc-bios/optionrom/Makefile | 5 ++---
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index da2501489f..a12bc8edbf 100755
> --- a/configure
> +++ b/configure
> @@ -5090,6 +5090,10 @@ for rom in seabios; do
>       echo "RANLIB=$ranlib" >> $config_mak
>   done
> 
> +config_mak=pc-bios/optionrom/config.mak
> +echo "# Automatically generated by configure - do not modify" > 
> $config_mak
> +echo "TOPSRC_DIR=$source_path" >> $config_mak
> +
>   if test "$skip_meson" = no; then
>     cross="config-meson.cross.new"
>     meson_quote() {
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 30771f8d17..3482508a86 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -1,6 +1,5 @@
> -CURRENT_MAKEFILE := $(realpath $(word $(words 
> $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
> -SRC_DIR := $(dir $(CURRENT_MAKEFILE))
> -TOPSRC_DIR := $(SRC_DIR)/../..
> +include config.mak
> +SRC_DIR := $(TOPSRC_DIR)/pc-bios/optionrom
>   VPATH = $(SRC_DIR)
> 
>   all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin

Queued, thanks.  Sorry for the delay!

Paolo


