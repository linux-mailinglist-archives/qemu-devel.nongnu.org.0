Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6CA386BB5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 22:52:28 +0200 (CEST)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likDz-0003gn-1y
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 16:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1likCM-0002A8-9l
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1likCF-0000JG-60
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621284637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrrFPSR9Gm7AVojYFinR8SmyIfdetC3zrU2qc32nVGo=;
 b=AUpYYFGt/8PLe1JyijOtzCBtwwK+GrwfiyuEnDVTpGu0ztzlHcoyw+tVFqcv3744RDiiLe
 2WKtjomrge/sQc13we+mLlbyVJpsBT91nJ8y8CeEecK9LlGZN5mKl3M90YP21Z0W1cKGjg
 vJEoVt/6gk41VqlhIVtX2O3RYI2zC3c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-ZvzwdUyENEy3mG0S2BZmow-1; Mon, 17 May 2021 16:50:36 -0400
X-MC-Unique: ZvzwdUyENEy3mG0S2BZmow-1
Received: by mail-ed1-f70.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso4557262edd.19
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 13:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XrrFPSR9Gm7AVojYFinR8SmyIfdetC3zrU2qc32nVGo=;
 b=Sb8KibRVo+9gC2DliMn6AYMRGwNuWaDyqI5+kY7tO3xrhP6j20SuYyOdcwT8Hp8N9p
 fVIn72eD74J+skFM0TJgNRuzxgd00jbf0647ZuAhwXnapD0rqX5OoAeO0qRe1Ybk9ECs
 b7YowenLOstHZD5f4a8ER6seden1b5FmnG/MGG0CLmUgDQqu8RBm7UX5TgPrzVJhO+gt
 bbXXL9vU2ViwANtGUjXFcLVJE1rxlBDN0JJFR8kVNt7vnWBglUiH+bHdms3e0kkuQsEV
 HDiSkQhvvghtvRBOwlgG2vgsd6H0CrInQJJ6piRgE2BprK8caXAwTWajg7OYWU/YIMlT
 6WWA==
X-Gm-Message-State: AOAM530KJla/d5brikTuiUCjAIQ2LMQxlc6NgP/+uw6CYGGQ8qG3woaO
 vGvkeVixspfzjDpN1do9ZV8EwHbsrkSHGS4KC2VTwHVwqUqxM4s+YqsGkZt9Fbu/ijE1hPVur6C
 ZvwkEe50f75BSAeY=
X-Received: by 2002:aa7:c485:: with SMTP id m5mr2283598edq.230.1621284634794; 
 Mon, 17 May 2021 13:50:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6+FfTLEITie0MbIe9wnXBB2rZjRvrJTEg8oM4JgRvI2vP12eOhAZK9SHtfejGjBIugIAg7g==
X-Received: by 2002:aa7:c485:: with SMTP id m5mr2283579edq.230.1621284634476; 
 Mon, 17 May 2021 13:50:34 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u11sm11637306edr.13.2021.05.17.13.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 13:50:34 -0700 (PDT)
Subject: Re: [PATCH v4 0/9] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210517183954.1223193-1-philmd@redhat.com>
 <6ef11e42-7778-762a-f11b-d88f1b688db3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7ce0415a-50f9-d903-d1dd-d0b0b1757045@redhat.com>
Date: Mon, 17 May 2021 22:50:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <6ef11e42-7778-762a-f11b-d88f1b688db3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 9:19 PM, John Snow wrote:
> On 5/17/21 2:39 PM, Philippe Mathieu-Daudé wrote:
>> Missing review: #1
>>
>> Hi,
>>
>> The floppy disc controllers pulls in irrelevant devices (sysbus in
>> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
>>
>> This series clean that by extracting each device in its own file,
>> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
>>
>> Since v3:
>> - Fix ISA_SUPERIO -> FDC Kconfig dependency (jsnow)
>>
>> Since v2:
>> - rebased
>>
>> Since v1:
>> - added missing "hw/block/block.h" header (jsnow)
>> - inlined hardware specific calls (Mark)
>> - added R-b/A-b tags
>>
>> Regards,
>>
>> Phil.
>>
>> Philippe Mathieu-Daudé (9):
>>    hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC
>>    hw/block/fdc: Replace disabled fprintf() by trace event
>>    hw/block/fdc: Declare shared prototypes in fdc-internal.h
>>    hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>>    hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
>>    hw/block/fdc: Add sysbus_fdc_init_drives() method
>>    hw/sparc/sun4m: Inline sun4m_fdctrl_init()
>>    hw/block/fdc-sysbus: Add 'dma-channel' property
>>    hw/mips/jazz: Inline fdctrl_init_sysbus()
>>
>>   hw/block/fdc-internal.h | 156 +++++++++++
>>   include/hw/block/fdc.h  |   7 +-
>>   hw/block/fdc-isa.c      | 313 +++++++++++++++++++++
>>   hw/block/fdc-sysbus.c   | 224 +++++++++++++++
>>   hw/block/fdc.c          | 608 +---------------------------------------
>>   hw/mips/jazz.c          |  16 ++
>>   hw/sparc/sun4m.c        |  16 ++
>>   MAINTAINERS             |   3 +
>>   hw/block/Kconfig        |   8 +
>>   hw/block/meson.build    |   2 +
>>   hw/block/trace-events   |   3 +
>>   hw/i386/Kconfig         |   2 +-
>>   hw/isa/Kconfig          |   7 +-
>>   hw/mips/Kconfig         |   2 +-
>>   hw/sparc/Kconfig        |   2 +-
>>   hw/sparc64/Kconfig      |   2 +-
>>   16 files changed, 759 insertions(+), 612 deletions(-)
>>   create mode 100644 hw/block/fdc-internal.h
>>   create mode 100644 hw/block/fdc-isa.c
>>   create mode 100644 hw/block/fdc-sysbus.c
>>
> 
> Hi, tentatively staged:
> 
> https://gitlab.com/jsnow/qemu/-/commits/floppy/
> 
> pending CI:
> 
> https://gitlab.com/jsnow/qemu/-/pipelines/304308461

Not good enough:

qemu-system-sparc: ../hw/block/fdc.c:2356: fdctrl_realize_common:
Assertion `fdctrl->dma' failed.

Forget about it for your next pull request.


