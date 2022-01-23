Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193B8497225
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 15:32:19 +0100 (CET)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBduh-0006RT-IY
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 09:32:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBdsS-0005e4-2M
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 09:29:56 -0500
Received: from [2a00:1450:4864:20::434] (port=35748
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBdsP-000403-Sm
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 09:29:55 -0500
Received: by mail-wr1-x434.google.com with SMTP id r14so8888994wrp.2
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=omvBzsMv51c477y9gifxmZja+pqlUmV7f0/dfZm54Eo=;
 b=Jklbj2CfWsGQYdjGai659vG/jgW9afrM2hjKknc77XkFdozqRin2vrRuOMKLII1P/z
 vZ5WPkGBpNIEM9Wu7nfqUnIS7je+7TA+YxNfv/Grc36Go/ddQ/IcLafqTTnZgqRr64ld
 hk7GZBj+D6C7YPbl/mDCH1fj9S6Vc0NseZ7IK5IzC/PvEpvwL0pDrzyAqXtPWKdDwGMp
 QmPlPxZy9VLZaJ+YubBAOrFQ0uceoR+czTNXGDWVIz3a/9LNk9e/qFCanb7eHkTQcaLt
 5zcBxmDSCH/PswtbSUOBeISIfJ2gG1TDku9jfJaA586/xIp/MCAoOkl0TA5VW1UPwJwp
 t5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=omvBzsMv51c477y9gifxmZja+pqlUmV7f0/dfZm54Eo=;
 b=n7h2PiMmVs5Zs7iBtw5IeBjGWm08ua6LN3+qzVbCQuZ348AzQMyi9L88rOMZo/uUx/
 EuOvKyFgvO8C+H0n1kPqaq7yGdk4voYUHrTsYWa9yBUUU7jqQaA2z2iLRHB/kJ46Njzr
 RmaiE4t3s5ZT1PPABCRqTO0+YoAsXm09KgPiFrY8rtnNwTOPYXa2SMAAzldA/aw2gGVZ
 URrTL2PP8M8FqzhTqMArwDHHuWoOMDEfDxBrKdtiXwRbMkjIA+CMHrMiC2iE96352DKN
 rJ8F1GYODMPCEHUUkQrPBpVn2e9DtknUkvFbvhSbgzUElhqpvlZJew6YWjyMsvsQAfJA
 /Naw==
X-Gm-Message-State: AOAM533vN3rqjecJCJs8KKPvuphBZtTyM5MfeomvRCn5hXs0n18cmPJ2
 IzY5IhoOrv2SNgsmyKz+0iUzT2ZtTXMkxDOZ2iDS5g==
X-Google-Smtp-Source: ABdhPJyXUsvVFuueD2iWIyhVE0XE6Km9Ruk8pWwmCJVbAR/uCrzUlYluc14E1I2asrh/1u3ZLD7esz9RB4pTjU3WwDM=
X-Received: by 2002:a5d:644a:: with SMTP id d10mr10677134wrw.295.1642948191767; 
 Sun, 23 Jan 2022 06:29:51 -0800 (PST)
MIME-Version: 1.0
References: <d1bd9dcf-514b-44bb-a848-8026b524fad1@www.fastmail.com>
In-Reply-To: <d1bd9dcf-514b-44bb-a848-8026b524fad1@www.fastmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 23 Jan 2022 14:29:40 +0000
Message-ID: <CAFEAcA96b+vVtbq4maMCwLAN0jdeG6EDp3Nz_h_s4HKQHSqfCQ@mail.gmail.com>
Subject: Re: Cross compiling 6.2.0 aarch64-softmmu for aarch64 host with musl, 
 struct redefiniton errors
To: Adam Baxter <voltagex@voltagex.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 23 Jan 2022 at 08:58, Adam Baxter <voltagex@voltagex.org> wrote:
> I'm trying to compile qemu 6.2.0 using musl-cross.
>
> I am getting the following errors on make:
>
> /output/aarch64-linux-musl/include/asm/sigcontext.h:83:8: error: redefinition of 'struct esr_context'
> /output/aarch64-linux-musl/include/asm/sigcontext.h:116:8: error: redefinition of 'struct extra_context'
> /output/aarch64-linux-musl/include/asm/sigcontext.h:125:8: error: redefinition of 'struct sve_context'

I think this must be a musl problem. Quoting the full error
message:

In file included from /output/aarch64-linux-musl/include/asm/ptrace.h:26,
                 from linux-headers/asm/kvm.h:37,
                 from /src/qemu/linux-headers/linux/kvm.h:15,
                 from /src/qemu/include/sysemu/kvm.h:25,
                 from ../hw/arm/boot.c:18:
/output/aarch64-linux-musl/include/asm/sigcontext.h:28:8: error:
redefinition of 'struct sigcontext'
   28 | struct sigcontext {
      |        ^~~~~~~~~~
In file included from /output/aarch64-linux-musl/include/signal.h:48,
                 from /src/qemu/include/qemu/osdep.h:105,
                 from ../hw/arm/boot.c:10:
/output/aarch64-linux-musl/include/bits/signal.h:18:16: note:
originally defined here
   18 | typedef struct sigcontext {
      |                ^~~~~~~~~~
In file included from /output/aarch64-linux-musl/include/asm/ptrace.h:26,
                 from linux-headers/asm/kvm.h:37,
                 from /src/qemu/linux-headers/linux/kvm.h:15,
                 from /src/qemu/include/sysemu/kvm.h:25,
                 from ../hw/arm/boot.c:18:
/output/aarch64-linux-musl/include/asm/sigcontext.h:66:8: error:
redefinition of 'struct _aarch64_ctx'
   66 | struct _aarch64_ctx {
      |        ^~~~~~~~~~~~
In file included from /output/aarch64-linux-musl/include/signal.h:48,
                 from /src/qemu/include/qemu/osdep.h:105,
                 from ../hw/arm/boot.c:10:
/output/aarch64-linux-musl/include/bits/signal.h:29:8: note:
originally defined here
   29 | struct _aarch64_ctx {
      |        ^~~~~~~~~~~~


The compiler is complaining because the system headers (provided by
musl) are defining these structs both in asm/sigcontext.h and
in signal.h, which means those headers can't both be included
at once. This isn't QEMU related: musl's headers just seem to
be broken here. glibc doesn't have this bug.

-- PMM

