Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B38C83BADCB
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 18:18:34 +0200 (CEST)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m04pF-0000p3-QP
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 12:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m04o3-000063-PO
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:17:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m04nz-0007jk-If
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 12:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625415433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6E6S1n7qBQz9Sqx6g1X6rTm5I7O6fRypwU0HdbXoEOc=;
 b=COxoAi29FIxsPI09MBIzSNXAHSlAqbX9C7oyjUaqTARnZWBl1JRbXZkMLMCVwTS8QGsZ0B
 mIPn6OiE1IY6xjeXPcRYiHumyTMWHOirF7dB4UWKo1GkMzBERu2Wi/r0OE+S9JKcYvTYNK
 K1kshf8VaQGd3XaYBR1qCCf99rj39uo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-2i9E3-kqP1Kjl7M1CS0ohA-1; Sun, 04 Jul 2021 12:17:02 -0400
X-MC-Unique: 2i9E3-kqP1Kjl7M1CS0ohA-1
Received: by mail-ed1-f71.google.com with SMTP id
 p19-20020aa7c4d30000b0290394bdda6d9cso7755097edr.21
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 09:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6E6S1n7qBQz9Sqx6g1X6rTm5I7O6fRypwU0HdbXoEOc=;
 b=PTghsAy6Y8zpwHlRItDvTXbzkVV/ppVb42btpHAP9lsrwWXsjw9EpQ5y5GMHMvl5jd
 XoIr0hlQoxdxT6fwlYrG7AzMXPQ2K7xKgKC3WZISRmx8G1YMSaU+Qm7gAvLloPoasvCd
 RPZ0GvjwzlM1fO5JnxUHu6Ljzg0cjFJzB6xUu6JaIvoZGbgj+yiJNvgVMLVbPP/L3cWS
 UJ2wMm98IBSQ5QTXsWj48bMfurSwMMw/+SDcf7g8sAhhG1Ga3cOBhMNuLz0+kXJFO567
 M4YLeZnMjsc0gLwh33egmk0GD6d+TdUUDleZFtdBMXlAvRW7bkcOucU3sqSXRhE9AkRg
 FFDA==
X-Gm-Message-State: AOAM531spzb6N3nt4uuIJR2TWX2NHEC9iUZ/fthh90spbjV+W9ruA+PW
 S/auRTw1Y/latB7P3rA9Xap/FlCIrqRbmOLqiRJPbLWKsiXDI/tHAcw02SUvVoqsubXfENNIWOf
 CeR130S+6bMPG88M=
X-Received: by 2002:a05:6402:792:: with SMTP id
 d18mr11307588edy.281.1625415421653; 
 Sun, 04 Jul 2021 09:17:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxreBoQl+Z2XIIjk+q7SR7obaHrFJwVywDpf4xMwXv3G46bXD1JTD2JX9cQ52L0CCGaLplejQ==
X-Received: by 2002:a05:6402:792:: with SMTP id
 d18mr11307571edy.281.1625415421442; 
 Sun, 04 Jul 2021 09:17:01 -0700 (PDT)
Received: from thuth.remote.csb (p5791d89b.dip0.t-ipconnect.de.
 [87.145.216.155])
 by smtp.gmail.com with ESMTPSA id t6sm4069565edd.3.2021.07.04.09.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 09:17:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] Fix for Haiku
To: Richard Zak <richard.j.zak@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <CAOakUfOhn43BUUGoJPahxmxxTk8vcPeyrgsX0GDmzt46ZriNeA@mail.gmail.com>
 <CAFEAcA-rhL_BEJMi7a2tCoVE61OV2o5QeDdDfz1JXL9fLvM_cQ@mail.gmail.com>
 <CAOakUfNpv_7TE+86R0+Ng=10mXtx2=pyZUZG8jPDgOdLbqrqKQ@mail.gmail.com>
 <5c47cf07-f02e-f7d8-2725-5ae0a240e37b@amsat.org>
 <975f0d41-be4e-7e8c-2fc6-64eafc7c11a8@amsat.org>
 <951cdc26-1f4f-68d0-0187-e31513fa00c9@amsat.org>
 <CAOakUfMmxSrBcQTQaRBB1g3qFCrpm-BLDVvfgoRm2Ww_-Pe3mQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0a17d006-b1ef-ab1e-8616-50e29681f998@redhat.com>
Date: Sun, 4 Jul 2021 18:16:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOakUfMmxSrBcQTQaRBB1g3qFCrpm-BLDVvfgoRm2Ww_-Pe3mQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Meta comment: Please avoid
ƃuıʇsod uʍop ǝpısdn
... it makes threads much harder to read.

On 04/07/2021 16.20, Richard Zak wrote:
> Exactly. One of the developers on the Haiku forum shared with me the patch 
> that Haiku uses for qemu, and it has a few lines concerning error codes. 
> I'll look into this.
> https://github.com/haikuports/haikuports/blob/14c2cab5428145b93232cb69683a67bbe68a9f06/app-emulation/qemu/patches/qemu-3.1.1.1.patchset 

So something like the change in target/xtensa/xtensa-semi.c is the right way 
to go - using a switch-case statement looks like the right fix instead of 
disabling the targets in the configure script.

> This is a stopper for the configure script changes?

Well, if anyhow possible, we should avoid hacks like disabling a target in 
the configure script. Since this problem seems to be understood, you should 
aim for the right fix instead.

  Thomas

> În dum., 4 iul. 2021 la 05:30, Philippe Mathieu-Daudé <f4bug@amsat.org 
> <mailto:f4bug@amsat.org>> a scris:
> 
>     On 7/4/21 11:27 AM, Philippe Mathieu-Daudé wrote:
>      > On 7/4/21 11:03 AM, Philippe Mathieu-Daudé wrote:
>      >> On 7/4/21 12:06 AM, Richard Zak wrote:
>      >>> For MIPS (all sub-targets, 64-bit and EL) & xtensa(eb), the compiler
>      >>> complains about running out of memory. Best I can see, that's not what
>      >>> actually happens, but that's the error message. I was going to
>      >>> investigate this later, but this was the error which was causing the
>      >>> test with the Haiku VM with that corresponding make target. My
>     desktop &
>      >>> laptop have 64 GB, and I'm pretty sure it didn't get to that point.
>      >>>
>      >>>
>      >
>     /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>      >>> final link failed: memory exhausted
>      >
>      >> See how Haiku handles POSIX errno:
>      >>
>      >>
>     https://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h
>     <https://github.com/haiku/haiku/blob/master/headers/os/support/Errors.h>
>      >>
>      >> #define B_GENERAL_ERROR_BASE   INT_MIN
>      >>
>      >> #define B_POSIX_ERROR_BASE     (B_GENERAL_ERROR_BASE + 0x7000)
>      >>
>      >> #define B_POSIX_ENOMEM  B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 0)
>      >> #define E2BIG           B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 1)
>      >> #define ECHILD          B_TO_POSIX_ERROR(B_POSIX_ERROR_BASE + 2)
>      >> ...
>      >>
>      >
>      > Same problem with Xtensa:
>      >
>      > static uint32_t errno_h2g(int host_errno)
>      > {
>      >     static const uint32_t guest_errno[] = {
>      >         [EPERM]         = TARGET_EPERM,
>      >         [ENOENT]        = TARGET_ENOENT,
>      >         [ESRCH]         = TARGET_ESRCH,
>      >         [EINTR]         = TARGET_EINTR,
>      >         [EIO]           = TARGET_EIO,
>      >         [ENXIO]         = TARGET_ENXIO,
>      >         [E2BIG]         = TARGET_E2BIG,
>      >         [ENOEXEC]       = TARGET_ENOEXEC,
>      > ...
> 
>     Annoyingly enough this is also how linux-user/syscall.c does
>     (thinking about code re-use):
> 
>     /*
>       * This list is the union of errno values overridden in asm-<arch>/errno.h
>       * minus the errnos that are not actually generic to all archs.
>       */
>     static uint16_t host_to_target_errno_table[ERRNO_TABLE_SIZE] = {
>          [EAGAIN]            = TARGET_EAGAIN,
>          [EIDRM]             = TARGET_EIDRM,
>          [ECHRNG]            = TARGET_ECHRNG,
>          [EL2NSYNC]          = TARGET_EL2NSYNC,
>          [EL3HLT]            = TARGET_EL3HLT,
>          [EL3RST]            = TARGET_EL3RST,
>     ...
> 
> 
> 
> -- 
> Regards,
> 
> Richard J. Zak
> Professional Genius
> PGP Key: https://keybase.io/rjzak/key.asc <https://keybase.io/rjzak/key.asc>


