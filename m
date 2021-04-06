Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AEA355528
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 15:31:16 +0200 (CEST)
Received: from localhost ([::1]:40510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTlnW-00027C-RL
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 09:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTlle-0001cQ-By
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:29:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTllY-00018M-I5
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 09:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617715750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNUR/6ptzdZReVac4L2fv//VQ8blle1RDC2wm35FNts=;
 b=Z8dSa+cs27/LpVaPCf1edn9NLunVfUUuKGCd3xZLp8U/DZInofHEsWkwRXQSBA8QprqyI0
 Sae2iCgmE9KcI7nunC2cRqzcGI4zHBmWCdaH3deB8fHeurfgI9/5LFKF8q6W7FBCLcIC7Y
 RM+bS2CwkwFBZrmvDnMm3HiSsEoepwU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-o1V3Gk5TNguAL0kYinEAlA-1; Tue, 06 Apr 2021 09:29:08 -0400
X-MC-Unique: o1V3Gk5TNguAL0kYinEAlA-1
Received: by mail-ej1-f72.google.com with SMTP id bn26so5446009ejb.20
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 06:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SNUR/6ptzdZReVac4L2fv//VQ8blle1RDC2wm35FNts=;
 b=a9sqF+7SpanFSy3iYruYSYy4b2pmscSFUX+YG1kZuYmKCEJebElXW5X9JCo14fRIs7
 eakwKyrYCHErF2/31aDj0WZQREGGYiUeznuoAUe8xRxPz85wSuAfY62HjV3/ujNZCHHh
 jatX0ORbKPYlx66HWRGuIrM27Mt55YjV5gmXJjJ4aI8kNfJIFooaWrSLEPGF6EoM+nO3
 Xa/QTRveaTenCh9NrdrmLqBKD2qSeys5Vu/gfqMOf8Km/SDhMqAN/Tp2OZFXKuNlZlgz
 XURE7OrtzqPC1fnAB1SvcT3PiniSbIsXnVshbZho5qn9gDudLDN24L7p8KSl3zzXQxIP
 3aFg==
X-Gm-Message-State: AOAM532NNNXE9swgHDOXnIHtZSzlF4yOLC5xlbi08dIxrJraA2wZl8cY
 Eh1zDlbEIIgbF4a4NH0XbjQmj0g65jkON3KeFSfCO5UYKfIbUtEPSWZ3Dbn0bDSu+LjLEy6u2Px
 M/on6fz8uK7Ybdrs=
X-Received: by 2002:a17:906:18a1:: with SMTP id
 c1mr32680945ejf.62.1617715747674; 
 Tue, 06 Apr 2021 06:29:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC9jl8MFv+SuUZLr4LpE3iiuWjq12JNQHkJeTUj3AWVqkUE3WoKIb5R8UvQ3m5npOfahgWKw==
X-Received: by 2002:a17:906:18a1:: with SMTP id
 c1mr32680924ejf.62.1617715747463; 
 Tue, 06 Apr 2021 06:29:07 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o17sm6631096edt.10.2021.04.06.06.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 06:29:06 -0700 (PDT)
Subject: Re: [PULL 09/16] memory: add a sparse memory device for fuzzing
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210316211531.1649909-1-pbonzini@redhat.com>
 <20210316211531.1649909-10-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <306526fe-ecce-bc4a-8667-89d3e1e49fd1@redhat.com>
Date: Tue, 6 Apr 2021 15:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316211531.1649909-10-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 10:15 PM, Paolo Bonzini wrote:
> From: Alexander Bulekov <alxndr@bu.edu>
> 
> For testing, it can be useful to simulate an enormous amount of memory
> (e.g. 2^64 RAM). This adds an MMIO device that acts as sparse memory.
> When something writes a nonzero value to a sparse-mem address, we
> allocate a block of memory. For now, since the only user of this device
> is the fuzzer, we do not track and free zeroed blocks. The device has a
> very low priority (so it can be mapped beneath actual RAM, and virtual
> device MMIO regions).
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  MAINTAINERS                 |   1 +
>  hw/mem/meson.build          |   1 +
>  hw/mem/sparse-mem.c         | 151 ++++++++++++++++++++++++++++++++++++
>  include/hw/mem/sparse-mem.h |  19 +++++
>  4 files changed, 172 insertions(+)
>  create mode 100644 hw/mem/sparse-mem.c
>  create mode 100644 include/hw/mem/sparse-mem.h

> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 0d22f2b572..ef79e04678 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -1,5 +1,6 @@
>  mem_ss = ss.source_set()
>  mem_ss.add(files('memory-device.c'))
> +mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
>  mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))

Completing the diff:

>
>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)

There is a problem when MEM_DEVICE is not selected, sparse-mem
is not linked (even if CONFIG_FUZZ is selected):

tests/qtest/fuzz/generic_fuzz.c:826: undefined reference to
`sparse_mem_init'
clang-10: error: linker command failed with exit code 1 (use -v to see
invocation)

Easy fix:

-- >8 --
--- a/hw/mem/meson.build
+++ b/hw/mem/meson.build
@@ -1,8 +1,9 @@
 mem_ss = ss.source_set()
 mem_ss.add(files('memory-device.c'))
 mem_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
-mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c'))
 mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
 mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))

 softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
+
+softmmu_ss.add(when: 'CONFIG_FUZZ', if_true: files('sparse-mem.c'))
---

Patch coming.


