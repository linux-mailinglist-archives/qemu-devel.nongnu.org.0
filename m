Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ECD361914
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:05:40 +0200 (CEST)
Received: from localhost ([::1]:46750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGfj-0005ND-FO
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGeN-0004UL-PD
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:04:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXGe7-0002Jp-EV
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618549437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRkbYoSlzrcIOrMEFMTJ/CkkFjk9cusSiEbvF8gFMgc=;
 b=U37ZoEDPKxAeAm1qzOPQBV5YVHyHGDba6A+PpGRAubYlBP/thc3q8CFFwUbKK+fPAUoeug
 bONgUXVaeqAd3H4PStPfxNbq7qCpLxJmlVCh0eCKaJ1ZTf8FG8MKMUhVVfz02/MlM2FpIe
 E6KP5hy3ntYgS+QtLohaP/BInG8Dm6w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-QxqDH86tMxmYXDBogXTESQ-1; Fri, 16 Apr 2021 01:03:53 -0400
X-MC-Unique: QxqDH86tMxmYXDBogXTESQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so3848289wro.8
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 22:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sRkbYoSlzrcIOrMEFMTJ/CkkFjk9cusSiEbvF8gFMgc=;
 b=cI0lEzCn6wl0WTCxnkfH+sqazUcgBr7xq0zKVEoYzAGbYcDxaL96xOh16bJFUv91Pl
 GH27r0625W71MZeWyKoP81TfufJI4PVTBZeaTZdE4b7tzc+fICDSsw7fDwZgjJnjM3Ai
 Ro5lMiSv2/ipnQfcxdvCrQAKjSFRT4qssrQbIwOPP5eEDEXUP+9G7Zk5jBwf62K3iBOD
 ib0Lj/zWIkn3xkTFXlCiRs2qKHuCKsSfmUpPvFu2uO/h2VVfuMVccANEsoBdLokmaC0D
 qSFClel27o8E+SB8wK9CuVVYP1kxk7Pszi2OVxJfMxJCn2XeJZ3ag5ChVdmnn4b4GTK7
 1kDA==
X-Gm-Message-State: AOAM533fumseVqn2bPgGF/2eNkM/TSrEkdFDWUlITer5OgxXqGOjSw18
 5RZvX+ouWLKRqqK5qeyob/ukaNy48LBS55e5BCPPqCMYGs0XgM4CHRQ1KHsT15WEG5iArXZEncB
 rD8i4fD6d+5rpiVE=
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr6101874wma.127.1618549431994; 
 Thu, 15 Apr 2021 22:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuSc5mBKs+UMc55iPFMk6ZSCmm99y4qrQk1uDEJq60oQry53dSe6nKwLChPMlPO9OfhxiMcQ==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr6101853wma.127.1618549431830; 
 Thu, 15 Apr 2021 22:03:51 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f7sm4460219wrp.48.2021.04.15.22.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 22:03:51 -0700 (PDT)
Subject: Re: [PING^2] [PATCH] [NFC] Mark locally used symbols as static.
To: Yuri Gribov <tetra2005@gmail.com>, qemu-devel@nongnu.org
References: <CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com>
 <CAJOtW+6S8bTZa-n33TpYoVJVge_6_Xm3=M6h=Sy+cYEe+GJ0DA@mail.gmail.com>
 <CAJOtW+7NN2rkcnKmNmMqEUXAgFku+zECRZgv2LX1G73HM-d2NQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <075db5e1-ee1e-94eb-6903-68e3817b6e3e@redhat.com>
Date: Fri, 16 Apr 2021 07:03:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJOtW+7NN2rkcnKmNmMqEUXAgFku+zECRZgv2LX1G73HM-d2NQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Marek Vasut <marex@denx.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yuri,

On 4/15/21 7:27 PM, Yuri Gribov wrote:
> Hi all,
> 
> This patch makes locally used symbols static to enable more compiler
> optimizations on them. Some of the symbols turned out to not be used
> at all so I marked them with ATTRIBUTE_UNUSED (as I wasn't sure if
> they were ok to delete).

It would be easier to integrate your work if your split it
in multiple patches, and send them as a series, and add the
Reviewed-by/Acked-by tags to the corresponding ones (these
could be queued via the qemu-trival tree already). See below.

> The symbols have been identified with a pet project of mine:
> https://github.com/yugr/Localizer
> 
> Link to patch: https://patchew.org/QEMU/CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com/
> 
> From 4e790fd06becfbbf6fb106ac52ae1e4515f1ac73 Mon Sep 17 00:00:00 2001
> From: Yury Gribov <tetra2005@gmail.com>
> Date: Sat, 20 Mar 2021 23:39:15 +0300
> Subject: [PATCH] Mark locally used symbols as static.
> 
> Signed-off-by: Yury Gribov <tetra2005@gmail.com>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com> (xtensa)
> Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc)
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com> (tracetool)
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com> (hexagon)
> ---
>  disas/alpha.c                                 | 16 ++--
>  disas/m68k.c                                  | 78 ++++++++---------
>  disas/mips.c                                  | 14 ++--
>  disas/nios2.c                                 | 84 +++++++++----------
>  disas/ppc.c                                   | 26 +++---
>  disas/riscv.c                                 |  2 +-

patch #1, "disas: Mark locally used symbols as static"

>  pc-bios/optionrom/linuxboot_dma.c             |  4 +-

patch #2, "pc-bios/optionrom: Mark locally used symbols as static"

>  scripts/tracetool/format/c.py                 |  2 +-

patch #3, "scripts/tracetool: Mark locally used symbols as static"

>  target/hexagon/gen_dectree_import.c           |  2 +-
>  target/hexagon/opcodes.c                      |  2 +-

patch #4, "target/hexagon: Mark locally used symbols as static"

>  target/i386/cpu.c                             |  2 +-

patch #5, "target/i386: Mark locally used symbols as static"

>  target/s390x/cpu_models.c                     |  2 +-

patch #6, "target/s390x: Mark locally used symbols as static"

>  .../xtensa/core-dc232b/xtensa-modules.c.inc   |  2 +-
>  .../xtensa/core-dc233c/xtensa-modules.c.inc   |  2 +-
>  target/xtensa/core-de212/xtensa-modules.c.inc |  2 +-
>  .../core-de233_fpu/xtensa-modules.c.inc       |  2 +-
>  .../xtensa/core-dsp3400/xtensa-modules.c.inc  |  2 +-
>  target/xtensa/core-fsf/xtensa-modules.c.inc   |  2 +-
>  .../xtensa-modules.c.inc                      |  2 +-
>  .../core-test_kc705_be/xtensa-modules.c.inc   |  2 +-
>  .../core-test_mmuhifi_c3/xtensa-modules.c.inc |  2 +-

patch #7, "target/xtensa: Mark locally used symbols as static"

>  21 files changed, 125 insertions(+), 127 deletions(-)

Regards,

Phil.


