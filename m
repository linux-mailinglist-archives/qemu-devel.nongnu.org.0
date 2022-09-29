Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1081B5EFC30
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:46:38 +0200 (CEST)
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxcK-0004KC-Qm
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odxLH-0001Yv-0L
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odxLA-000521-Ik
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 13:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664472531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ee74vZ2+nDWj/8Ky/P/PwQkAspnTrwNqbrRcVZAkfE8=;
 b=JuUm0x/pU2KmYEsqPOX0MPFtmsb3A+/u7FNgOQNNIDjT9C0BvILohWdUAkzCyDJ7utKh8T
 2RNnYNSSwOZEyZbzQoxSWf94gkyRdcX++J9IokSI6W5gk51H+BLwKS8ko7iPUja4IyqImX
 +uYp9p68fZ6u18gFUynkqa9ekRhBhwk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-nmVXGo2hM7i8d7mtYR6IUQ-1; Thu, 29 Sep 2022 13:28:49 -0400
X-MC-Unique: nmVXGo2hM7i8d7mtYR6IUQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so1732177eda.19
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 10:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ee74vZ2+nDWj/8Ky/P/PwQkAspnTrwNqbrRcVZAkfE8=;
 b=xGc6Czhn7ftpG/tvyDOMzhFQEJXq+iAx3VahbF8QWPXohqnDAOmM6Zi6Dzm9njOAxb
 AdOzNH/L00HUGjs91urdtey3O2Dg7Omi3sTdwdPHnes0HbzyKhGjyz/mbvW2NMdfRQnZ
 37+Go/oJCaUsmNCH55qtbZ28qaGEfSc4UW25VvrvRAohE3Uz7D6r2Hnxn5F4KlVXi1g+
 wLZfghMFraz0SfKLVW9qONfCPaw0n9Ipr8qSmL0ZB46tFnR1z4VgVFoSC/ZNKtJ9tan+
 C0K93xCT9d0VyGqwsQ7GNDI2Rb21pmI2SM5hj93L57cdt2WIs/eGgXRtYVUuCizdF9c+
 dSmA==
X-Gm-Message-State: ACrzQf12/mEAEp7oQy9IzufNeeHO4xnXJ3QoiD2LYwYtxkvFXgo2DM6w
 cvcs7zIlE8xUB+VtRXVtF6fhT3JntvobJajNkrme+cZstnbLf5mNZ69VX8rwAs1JU/aOJiS+Fjg
 v9YfcGAIdDNe66xo=
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id
 f13-20020a0564021e8d00b0044158dbb6a2mr4182020edf.277.1664472528569; 
 Thu, 29 Sep 2022 10:28:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Bu9pW2u2b1ouHMGXN6IOcGYu9uUO0uGgZojVl1QDjEoqp3phmNzdNe+OzXBKTdTFjfCFIgQ==
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id
 f13-20020a0564021e8d00b0044158dbb6a2mr4182003edf.277.1664472528345; 
 Thu, 29 Sep 2022 10:28:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 dk12-20020a0564021d8c00b0044e8d0682b2sm38807edb.71.2022.09.29.10.28.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 10:28:47 -0700 (PDT)
Message-ID: <d20d8f67-2ad9-7b87-71f6-011aab7b6ba5@redhat.com>
Date: Thu, 29 Sep 2022 19:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 0/4] Enable notify VM exit
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220929070341.4846-1-chenyi.qiang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220929070341.4846-1-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.099, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/22 09:03, Chenyi Qiang wrote:
> Notify VM exit is introduced to mitigate the potential DOS attach from
> malicious VM. This series is the userspace part to enable this feature
> through a new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT. The detailed
> info can be seen in Patch 4.
> 
> The corresponding KVM support can be found in linux 6.0-rc:
> (2f4073e08f4c KVM: VMX: Enable Notify VM exit)

Thanks, I will queue this in my next pull request.

Paolo

> ---
> Change logs:
> v7 -> v8
> - Add triple_fault_pending field transmission on migration (Paolo)
> - Change the notify-vmexit and notify-window to the accelerator property. Add it as
>    a x86-specific property. (Paolo)
> - Add a preparation patch to expose struct KVMState in order to add target-specific property.
> - Define three option for notify-vmexit. Make it on by default. (Paolo)
> - Raise a KVM internal error instead of triple fault if invalid context of guest VMCS detected.
> - v7: https://lore.kernel.org/qemu-devel/20220923073333.23381-1-chenyi.qiang@intel.com/
> 
> v6 -> v7
> - Add a warning message when exiting to userspace (Peter Xu)
> - v6: https://lore.kernel.org/all/20220915092839.5518-1-chenyi.qiang@intel.com/
> 
> v5 -> v6
> - Add some info related to the valid range of notify_window in patch 2. (Peter Xu)
> - Add the doc in qemu-options.hx. (Peter Xu)
> - v5: https://lore.kernel.org/qemu-devel/20220817020845.21855-1-chenyi.qiang@intel.com/
> 
> ---
> 
> Chenyi Qiang (3):
>    i386: kvm: extend kvm_{get, put}_vcpu_events to support pending triple
>      fault
>    kvm: expose struct KVMState
>    i386: add notify VM exit support
> 
> Paolo Bonzini (1):
>    kvm: allow target-specific accelerator properties
> 
>   accel/kvm/kvm-all.c      |  78 ++-----------------------
>   include/sysemu/kvm.h     |   2 +
>   include/sysemu/kvm_int.h |  75 ++++++++++++++++++++++++
>   qapi/run-state.json      |  17 ++++++
>   qemu-options.hx          |  11 ++++
>   target/arm/kvm.c         |   4 ++
>   target/i386/cpu.c        |   1 +
>   target/i386/cpu.h        |   1 +
>   target/i386/kvm/kvm.c    | 121 +++++++++++++++++++++++++++++++++++++++
>   target/i386/machine.c    |  20 +++++++
>   target/mips/kvm.c        |   4 ++
>   target/ppc/kvm.c         |   4 ++
>   target/riscv/kvm.c       |   4 ++
>   target/s390x/kvm/kvm.c   |   4 ++
>   14 files changed, 272 insertions(+), 74 deletions(-)
> 


