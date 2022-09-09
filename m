Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB86A5B3CF5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 18:27:13 +0200 (CEST)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWgqW-0005wj-AK
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 12:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oWgpG-00048x-21
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oWgpA-0005rE-H7
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 12:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662740744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iqg92T6+DIsD3HEOljmpjoovmZlRQMOWaRSmystH/zs=;
 b=d2UQuVu7xLl4w9rGnHr99PQNL8T8fxdULz6zmGNsmMeiYY3a/Ky8BYgDRAjRRT020TD/Fn
 5QAdK7oOTV6vIad+aXOjFtbm435cMZ1JJVIBQbeNG5KM5CM8AheiDjWMxZcNcTjscZiiCD
 11e4Z3o44aju/kXR0wnDxFO5dwHdhuM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-xIJk2HkePe6i7gU_WKuOAA-1; Fri, 09 Sep 2022 12:25:42 -0400
X-MC-Unique: xIJk2HkePe6i7gU_WKuOAA-1
Received: by mail-qt1-f198.google.com with SMTP id
 s2-20020ac85cc2000000b00342f8ad1f40so1894329qta.12
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 09:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=iqg92T6+DIsD3HEOljmpjoovmZlRQMOWaRSmystH/zs=;
 b=omkgfQmSCBi3rQQY8KCK2oz6U4A00Tj8O4HPcSG/R2bx2e6C1uvW5bg85YMr4GLT3n
 xDKcGLLdukMxG94fnYa2DMRbwE/RacNwPAAYMAWaFU60/5BwWbu5sYUS3iwxzl6dSiEf
 lyumM5rYJKCdj/NAUjiDe2oVwgILb0XQzbrGuHPrI/7wAjJIpQMl9aaSB3SP3JYIdnXE
 ZAnIxJRau3WaIttF7SgPYf9THb6hHAaebMu/PYmCR618aUXstfOx3/ouR+8krm/Ik/es
 TGHooknXa9earlGk4b3akMNwk+5qNDbKzK0shzkTNxOpSLMyCX1dIYMQWiuVa4SkR+Zk
 xIrg==
X-Gm-Message-State: ACgBeo0NC0ANsZW69X8+aOiHP0HiHhOifHUBEpM1OmK71p7ws0YFfq6I
 q7UbNq+7mIf3HNh509aAqz2Yvj/zg5sabyXw+GnkKSUP7BXyCzeMHBkOx4AVQB/Zmo4LJFU7WYp
 w38fbaebI8ey1EUU=
X-Received: by 2002:a05:620a:172b:b0:6bb:3dea:1fd with SMTP id
 az43-20020a05620a172b00b006bb3dea01fdmr10375450qkb.683.1662740742150; 
 Fri, 09 Sep 2022 09:25:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6n2O7RQP3m3YHIPv2uiMg0nXQxbZoxEAbEDGoaL6WVD66pXUnx5xegwqJGTCORAEgZyyyzOw==
X-Received: by 2002:a05:620a:172b:b0:6bb:3dea:1fd with SMTP id
 az43-20020a05620a172b00b006bb3dea01fdmr10375433qkb.683.1662740741925; 
 Fri, 09 Sep 2022 09:25:41 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a05620a240e00b006cc190f627bsm884222qkn.63.2022.09.09.09.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 09:25:41 -0700 (PDT)
Date: Fri, 9 Sep 2022 12:25:40 -0400
From: Peter Xu <peterx@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Xiaoyao Li <xiaoyao.li@intel.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [PATCH v5 3/3] i386: Add notify VM exit support
Message-ID: <YxtpBMZmrDK3cghT@xz-m1.local>
References: <20220817020845.21855-1-chenyi.qiang@intel.com>
 <20220817020845.21855-4-chenyi.qiang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220817020845.21855-4-chenyi.qiang@intel.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Aug 17, 2022 at 10:08:45AM +0800, Chenyi Qiang wrote:
> There are cases that malicious virtual machine can cause CPU stuck (due
> to event windows don't open up), e.g., infinite loop in microcode when
> nested #AC (CVE-2015-5307). No event window means no event (NMI, SMI and
> IRQ) can be delivered. It leads the CPU to be unavailable to host or
> other VMs. Notify VM exit is introduced to mitigate such kind of
> attacks, which will generate a VM exit if no event window occurs in VM
> non-root mode for a specified amount of time (notify window).
> 
> A new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT is exposed to user space
> so that the user can query the capability and set the expected notify
> window when creating VMs. The format of the argument when enabling this
> capability is as follows:
>   Bit 63:32 - notify window specified in qemu command
>   Bit 31:0  - some flags (e.g. KVM_X86_NOTIFY_VMEXIT_ENABLED is set to
>               enable the feature.)
> 
> Because there are some concerns, e.g. a notify VM exit may happen with
> VM_CONTEXT_INVALID set in exit qualification (no cases are anticipated
> that would set this bit), which means VM context is corrupted. To avoid
> the false positive and a well-behaved guest gets killed, make this
> feature disabled by default. Users can enable the feature by a new
> machine property:
>     qemu -machine notify_vmexit=on,notify_window=0 ...

The patch looks sane to me; I only read the KVM interface, though.  Worth
add a section to qemu-options.hx?  It'll also be worthwhile to mention the
valid range of notify_window and meaning of zero (IIUC that's also a valid
input, just use the hardware default window size).

Thanks,

> 
> A new KVM exit reason KVM_EXIT_NOTIFY is defined for notify VM exit. If
> it happens with VM_INVALID_CONTEXT, hypervisor exits to user space to
> inform the fatal case. Then user space can inject a SHUTDOWN event to
> the target vcpu. This is implemented by injecting a sythesized triple
> fault event.

-- 
Peter Xu


