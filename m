Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098886C0D4C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 10:30:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peBps-0006Ak-N1; Mon, 20 Mar 2023 05:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peBpq-0006A2-Eg
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:29:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peBpo-0000LX-Ns
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 05:29:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679304583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zla75YYn969sawTi7UI2kCPVXgAQOmKhZjVnbylxu0k=;
 b=KeRWdx3F/+NgbiYWjDCHv0NOLx+f2HSuWobp0oVDF28MyVAQhpT15rEFl0corCTGDdCsM8
 Wx0P8UkeBmG7fTOYhEy4BS864mz4RcxokP0Qv6uHHb98nKMDZUnwSoSSIDB+1e7KoQI5AK
 npwQcbo+4wjtcO6qkKi9JCHTuDPhc5k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-ic39GPOzOUSfJYVtDHS3ow-1; Mon, 20 Mar 2023 05:29:41 -0400
X-MC-Unique: ic39GPOzOUSfJYVtDHS3ow-1
Received: by mail-wm1-f70.google.com with SMTP id
 fl22-20020a05600c0b9600b003ed26ca6206so8160938wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 02:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679304580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zla75YYn969sawTi7UI2kCPVXgAQOmKhZjVnbylxu0k=;
 b=Z8gV5AU01/0GZz+w7J0dNKTB9alAeV3tt524KsB25D+XDWWUd4gutZYAMmERMalmkc
 C/tjWb1TGbFTZTlXDd60YToM0zVHoJ6fgEUsNzF60JbtmrK3fY5d2yjlZ7TK2zFumsb+
 21QsLDOjkiuni76dNqIRs9aMs2uY48uIiqKycKPflNqjmHFKXP6siFaPaCRos/C8DyAl
 BnY5kGiBU43v7o51cr9wcY9ZKd/VMSP0vdluog1mkTahWHt72W/xqhZNPwdtL6vA9sXH
 aT0TKxjFWxKTrU5mGUK1d5cQyZ57Xdl2OPddNntIMUDk4XS+z57adfdZV2tHx4ZS4DsF
 5Irg==
X-Gm-Message-State: AO0yUKWTb1W/fAIobD2JuzQEHBNgArYPyCWiILwrXPF/J+qi4QzOnPdL
 urgEkyxPPk01m2NqZZYAFDGHi9BrFuHHMj7ISbeQI+Ajf/wMMKw8lJjFf+uPf4FbfPFByhnUAEL
 yuIb0nLCcWchGVlo=
X-Received: by 2002:a5d:5508:0:b0:2cf:ef5b:49d4 with SMTP id
 b8-20020a5d5508000000b002cfef5b49d4mr13534153wrv.48.1679304580844; 
 Mon, 20 Mar 2023 02:29:40 -0700 (PDT)
X-Google-Smtp-Source: AK7set9bAa49SgwUc4+Kf8e87zayU8kKHuBbvtAxylfMwwzid1/dVV7XQBaspE96vm8pVZ4SbdRmCA==
X-Received: by 2002:a5d:5508:0:b0:2cf:ef5b:49d4 with SMTP id
 b8-20020a5d5508000000b002cfef5b49d4mr13534143wrv.48.1679304580546; 
 Mon, 20 Mar 2023 02:29:40 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-234.web.vodafone.de.
 [109.43.179.234]) by smtp.gmail.com with ESMTPSA id
 l12-20020adfe9cc000000b002cea8e3bd54sm8390503wrn.53.2023.03.20.02.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 02:29:39 -0700 (PDT)
Message-ID: <896207da-abce-f39e-7695-ac0876a4aa4b@redhat.com>
Date: Mon, 20 Mar 2023 10:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] replace TABs with spaces
Content-Language: en-US
To: Yeqi Fu <fufuyqqqqqq@gmail.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20230315032649.57568-1-fufuyqqqqqq@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230315032649.57568-1-fufuyqqqqqq@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15/03/2023 04.26, Yeqi Fu wrote:
> Bring the files in line with the QEMU coding style, with spaces
> for indentation.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/378
> Signed-off-by: Yeqi Fu <fufuyqqqqqq@gmail.com>
> ---
>   chardev/baum.c                |   66 +-
>   hw/char/parallel.c            |   24 +-
>   hw/char/serial.c              |   68 +-
>   hw/core/loader.c              |   42 +-
>   hw/dma/etraxfs_dma.c          |  834 +++++++--------
>   hw/gpio/max7310.c             |   22 +-
>   hw/input/ads7846.c            |   54 +-
>   hw/rtc/m48t59.c               |  150 +--
>   hw/rtc/twl92230.c             |  160 +--
>   hw/scsi/scsi-bus.c            |    4 +-
>   hw/sd/sd.c                    |  184 ++--
>   hw/watchdog/wdt_ib700.c       |    2 +-
>   include/crypto/aes.h          |    8 +-
>   include/crypto/desrfb.h       |   16 +-
>   include/disas/dis-asm.h       |   68 +-
>   include/elf.h                 | 1800 ++++++++++++++++-----------------
>   include/exec/cpu-all.h        |    2 +-
>   include/hw/acpi/acpi.h        |    4 +-
>   include/hw/elf_ops.h          |   42 +-
>   include/hw/pci/pci_bridge.h   |   10 +-
>   include/hw/pcmcia.h           |   32 +-
>   include/hw/scsi/scsi.h        |    2 +-
>   include/hw/sd/sd.h            |    8 +-
>   include/hw/virtio/virtio.h    |    2 +-
>   include/qemu/bitmap.h         |   52 +-
>   include/qemu/compiler.h       |    4 +-
>   include/qemu/uri.h            |   32 +-
>   pc-bios/optionrom/optionrom.h |  262 ++---
>   softmmu/physmem.c             |    2 +-
>   tests/unit/test-rcu-list.c    |    2 +-
>   util/bitops.c                 |    8 +-
>   util/envlist.c                |  202 ++--
>   32 files changed, 2084 insertions(+), 2084 deletions(-)

Thank you for tackling this! Changes look fine to me:

Reviewed-by: Thomas Huth <thuth@redhat.com>

I'll take this patch for my next pull request.

  Thomas


