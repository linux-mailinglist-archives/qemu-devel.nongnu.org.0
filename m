Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3B2D7A86
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:11:26 +0100 (CET)
Received: from localhost ([::1]:38888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl0v-00023U-9c
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkya-00014D-PU
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:09:02 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkyP-0005Re-V5
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:09:00 -0500
Received: by mail-oi1-x232.google.com with SMTP id 9so3216525oiq.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sTBaiesWmShQLOiqogNisGXEJBLm2mWXp90YuRQCmkY=;
 b=YiCtYn1y9a1TbiAnMCPqr9T9dmO1/07a/eA4I7ztI9zRB73G5Yxv65ugHasbhsf9Tc
 s/nDKLldjSPUNFVht7DCBuhkVj7BVtFMwieh7tpMIsnmBjlM5dtPJT5/9HTxn188qwln
 WmeOMu807ySx+B+GbVpKVJXyCHkePMfqOo8a09FxbzeZm2yZtsvxGVdEaCYcBiEuwHnF
 /ZWhTHZSZsVXx8BdsIsfX9YWoDjWDJLuetvwW56pgBjdE80mLEqpNOtK2hDnfNCj2Ddk
 GSDqmNQwybMyuE9Tp34mqe6QxNegmQLa561m4zuQmH0kq8DGWMRx9cSlFms71+1/nz4p
 Vi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sTBaiesWmShQLOiqogNisGXEJBLm2mWXp90YuRQCmkY=;
 b=TqRFEY+smbOFY2OW0vTAZKZtOUlku8dCIr2nCLtzj2tql2vtH24IjqMqcHPCPOcEAC
 uHy9yftvcCboXsdkcCUHEb9x1zAI/WwNnH1hlGGTFLUrhHkPG5yJmBNCdk78Jhrt26r9
 RvcJBWHijck1O7oQbtkwti7ZEIQzLQ36Ayaz9x8j2oAuro0vVszbyFny9kBc2HCvojN7
 Cq4NvZQyaByrO6UvAXO4PK7TgRaQEIMNfD7nJBaVfakkbE8JrofX8fGneSy6GbF/WO8u
 LXmiAjWaNAXIOzjmCAO7osoQlaslKcfz+AIawPViqcKIbxyAHjA4cacSByLzrEax2wqy
 kONg==
X-Gm-Message-State: AOAM5325FRwOCLlS0I6CaBdHdKWlV1MIwqgZ7vppVFNFD9i0NI7kZoS1
 BPgQdJp98Hjgnfq5oi2NUwL1aQ==
X-Google-Smtp-Source: ABdhPJyBNGi5Q0OuZuBTYWiv+V/KmLb2uigzUUe68K761778MToEuuIUry10VV6ZBHhm63g5hsH74A==
X-Received: by 2002:aca:59c2:: with SMTP id n185mr9710609oib.96.1607702928686; 
 Fri, 11 Dec 2020 08:08:48 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i16sm1914276otc.61.2020.12.11.08.08.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:08:47 -0800 (PST)
Subject: Re: [PATCH v11 04/25] i386: move kvm accel files into kvm/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-5-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <042299f1-e69d-aac1-514a-e1f90c1755ee@linaro.org>
Date: Fri, 11 Dec 2020 10:08:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-5-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  meson.build                          | 1 +
>  target/i386/cpu.h                    | 2 +-
>  target/i386/{ => kvm}/hyperv-proto.h | 0
>  target/i386/{ => kvm}/hyperv.h       | 0
>  target/i386/{ => kvm}/kvm_i386.h     | 0
>  target/i386/kvm/trace.h              | 1 +
>  hw/i386/fw_cfg.c                     | 2 +-
>  hw/i386/intel_iommu.c                | 2 +-
>  hw/i386/kvm/apic.c                   | 2 +-
>  hw/i386/kvm/clock.c                  | 2 +-
>  hw/i386/microvm.c                    | 2 +-
>  hw/i386/pc.c                         | 2 +-
>  hw/i386/x86.c                        | 2 +-
>  target/i386/cpu.c                    | 2 +-
>  target/i386/helper.c                 | 2 +-
>  target/i386/{ => kvm}/hyperv-stub.c  | 0
>  target/i386/{ => kvm}/hyperv.c       | 0
>  target/i386/{ => kvm}/kvm-stub.c     | 0
>  target/i386/{ => kvm}/kvm.c          | 0
>  target/i386/machine.c                | 4 ++--
>  MAINTAINERS                          | 2 +-
>  target/i386/kvm/meson.build          | 3 +++
>  target/i386/kvm/trace-events         | 7 +++++++
>  target/i386/meson.build              | 4 +---
>  target/i386/trace-events             | 6 ------
>  25 files changed, 26 insertions(+), 22 deletions(-)
>  rename target/i386/{ => kvm}/hyperv-proto.h (100%)
>  rename target/i386/{ => kvm}/hyperv.h (100%)
>  rename target/i386/{ => kvm}/kvm_i386.h (100%)
>  create mode 100644 target/i386/kvm/trace.h
>  rename target/i386/{ => kvm}/hyperv-stub.c (100%)
>  rename target/i386/{ => kvm}/hyperv.c (100%)
>  rename target/i386/{ => kvm}/kvm-stub.c (100%)
>  rename target/i386/{ => kvm}/kvm.c (100%)
>  create mode 100644 target/i386/kvm/meson.build
>  create mode 100644 target/i386/kvm/trace-events

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

