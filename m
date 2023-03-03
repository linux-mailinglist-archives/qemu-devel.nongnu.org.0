Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44F6A9514
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:20:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2W7-00043L-5a; Fri, 03 Mar 2023 05:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2W5-00042v-Ac
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:19:57 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2W3-0001az-Mi
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:19:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so3564802wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677838792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UeKDS2J9ivPxSreJh641jAdlF/X7WuFE5gTaUy5A4o4=;
 b=yekgzilU+/1Uh4mqoABfGr0Kq6ppkZ4eVr6134GV3Uggn3X4LCFmxBmktZagHwk60R
 5cyBTOVhwSQwkdnv/Jsofs5oWY2iLS20iVXtzpeX4e3zd+Obq2tiRexLYqzgX0mfNUL8
 +LsbaHX8GCpHOPGEO66jLI8FFGql0YrrASsN/NQxDf2IjDLdjkeCznGrkWFURWEX2JPr
 wo04kyjMrHY7FObD1et0QB/7kyXNoVKuMALtmsQhV+lEwwolR4ZIUctABbGVm3H2zwBV
 EkwARw3Y0/xSswBBwjIaOaEH0oTB4x9luz4vGJOm/bISnmGQ7zPaJiNo0YeJrHgpktbd
 4FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677838792;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UeKDS2J9ivPxSreJh641jAdlF/X7WuFE5gTaUy5A4o4=;
 b=uLptO++htrDgFvmZjlx9r5l83ChcbkMtgKc3fJI2Ie49XoXwOwQIk4g3VmSBWgvHyy
 Rq13jSjTS0cH7FDbkIoeBXPxYPookxQuJBO0y+cdPvc/wLAwi5tk6o/Kl+rZooSv5+qq
 VwB21IEhGopQ4lN+b5nzDbS/djjCJMLRtew9XVMZIiyQNBrsKNAkMW1qjX+fXTk3WHQf
 Zb3moI3dltSeq3xihyODIYPuQDHClWLUraTR4/hOPsDKZ8GtOMgYlk6NBLwESBcie5N5
 3PzA4HaXvk3LovYFiFXR4AlnuJUbTq7CkC7MLZAvgAKS0b0dYGbNWsy39nklyQpSB06d
 rlwg==
X-Gm-Message-State: AO0yUKUCae0HZCUMdLD3bTE+lFTIl4TpldCaOvC2g95wh5tSkhlfD0YF
 dhr/PwKa52WYIgRSOI0RwVGB7g==
X-Google-Smtp-Source: AK7set+U7YiSD5diPtaAG0vxGzK2Cx9H75ZWLX+FH0gwbOy3crXuOaF8Zxh/VzJXpz0qzQAFvqprfg==
X-Received: by 2002:a05:600c:4e41:b0:3ea:e7e7:a2f9 with SMTP id
 e1-20020a05600c4e4100b003eae7e7a2f9mr1312618wmq.13.1677838792627; 
 Fri, 03 Mar 2023 02:19:52 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003e91b9a92c9sm1976382wmg.24.2023.03.03.02.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:19:52 -0800 (PST)
Message-ID: <aeac5ad3-6672-10b1-283d-10d950688697@linaro.org>
Date: Fri, 3 Mar 2023 11:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Haitao Shan <hshan@google.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303023013-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303023013-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/3/23 08:33, Michael S. Tsirkin wrote:
> On Thu, Mar 02, 2023 at 06:26:12PM -0800, Haitao Shan wrote:
>> Add the configure support for the Android Emulator hypervisor driver
>> accelerator. The Android Emulator hypervisor driver is a Windows
>> driver made by porting the KVM from kernel 4.9-rc7.
>>
>> Signed-off-by: Haitao Shan <hshan@google.com>
> 
> Replying on patch 1 but it applies to the whole patchset.

Indeed this series lacks a cover letter, which would show
this huge diffstat:

  MAINTAINERS                       |   12 +
  accel/Kconfig                     |    3 +
  docs/about/build-platforms.rst    |    2 +-
  hw/i386/aehd/apic.c               |  204 +++++++++++++++
  hw/i386/aehd/i8259.c              |  165 ++++++++++++
  hw/i386/aehd/ioapic.c             |  164 ++++++++++++
  hw/i386/aehd/meson.build          |    6 +
  hw/i386/meson.build               |    1 +
  hw/i386/pc.c                      |    5 +
  hw/i386/x86.c                     |    5 +-
  include/exec/poison.h             |    1 +
  include/exec/ram_addr.h           |    2 -
  include/hw/core/cpu.h             |    7 +
  include/hw/intc/i8259.h           |    1 +
  include/hw/intc/ioapic.h          |    1 +
  include/sysemu/aehd-interface.h   |  878 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  include/sysemu/aehd.h             |  168 ++++++++++++
  include/sysemu/hw_accel.h         |    1 +
  meson.build                       |   16 ++
  meson_options.txt                 |    2 +
  qemu-options.hx                   |   20 +-
  scripts/meson-buildoptions.sh     |    2 +
  target/i386/aehd/aehd-accel-ops.c |  119 +++++++++
  target/i386/aehd/aehd-accel-ops.h |   22 ++
  target/i386/aehd/aehd-all.c       | 1349 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  target/i386/aehd/aehd-cpu.c       |  150 +++++++++++
  target/i386/aehd/aehd-cpu.h       |   41 +++
  target/i386/aehd/aehd-stub.c      |   22 ++
  target/i386/aehd/aehd.c           | 2003 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  target/i386/aehd/aehd_i386.h      |   26 ++
  target/i386/aehd/aehd_int.h       |   50 ++++
  target/i386/aehd/meson.build      |    8 +
  target/i386/cpu-sysemu.c          |    3 +
  target/i386/cpu.c                 |   12 +-
  target/i386/cpu.h                 |    5 +-
  target/i386/helper.c              |    3 +
  target/i386/meson.build           |    2 +
  37 files changed, 5465 insertions(+), 16 deletions(-)

> There's obvious duplication with kvm here - probably not surprising.
> 
> I'd be interested to hear from KVM people to know whether
> there's interest in unifying code, or they would rather
> not bother supporting this platform and it's better off
> being kept separate.

I believe the hw part can be unified, reducing the maintenance
cost. (I gave Haitao few hints replying to the relevant patches).

Regards,

Phil.

