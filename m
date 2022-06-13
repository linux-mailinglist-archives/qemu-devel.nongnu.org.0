Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6385484AC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 13:02:26 +0200 (CEST)
Received: from localhost ([::1]:40866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0hpw-0003Rq-BX
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 07:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dn3g=WU=zx2c4.com=Jason@kernel.org>)
 id 1o0hmh-00021m-L6
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 06:59:03 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:58730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=dn3g=WU=zx2c4.com=Jason@kernel.org>)
 id 1o0hme-0003kn-Si
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 06:59:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BF15B80E5E
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:58:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C996AC3411E
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:58:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cgBfDSwY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655117933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bggcztt9D24upce7gmqSrLyqZieD5he0+70rbAIR+6A=;
 b=cgBfDSwYpzqT7tIcB6iOaOgSxlhZZ5pDde67HMwHnRBABxGBinrYaKPttQVbrZ41lbeQUg
 gkJtUtvyKMKBr25/7fUWjm7oABCihwV+/EVWP+BZbwzRme7ctRRo3udP9MWFayZrrEsNMS
 P8xNwZIS/s5Vk8t5TxLlLAGxdC3BZOI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d790e26
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 13 Jun 2022 10:58:53 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id e184so9197231ybf.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 03:58:53 -0700 (PDT)
X-Gm-Message-State: AOAM533s8251sRNEIVNFu9E05I9saImdA+cfd/qYwYUo6FQg5lXsxKmu
 aydbvKP2EtBy0o7clq7PMQTgy72ZqoifUSGbvbU=
X-Google-Smtp-Source: ABdhPJz/QKi1p3ElZQ3pn1gIp2okl78A/58PKg7Tl9ij+yHZeLnqIA29sOccXgGuUM91mp/AGrRyn9ES2M5uW4i5C2I=
X-Received: by 2002:a25:cb0e:0:b0:663:dc85:b07f with SMTP id
 b14-20020a25cb0e000000b00663dc85b07fmr31973232ybg.267.1655117932276; Mon, 13
 Jun 2022 03:58:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:6407:b0:181:6914:78f6 with HTTP; Mon, 13 Jun 2022
 03:58:51 -0700 (PDT)
In-Reply-To: <YqaRn6GiHstCbbMm@antec>
References: <20220612215949.134807-1-Jason@zx2c4.com> <YqaRn6GiHstCbbMm@antec>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Jun 2022 12:58:51 +0200
X-Gmail-Original-Message-ID: <CAHmME9o_Oq7TKFXx-rxRxpVR-akE+gVCutK879Tp_ubVwEu=TA@mail.gmail.com>
Message-ID: <CAHmME9o_Oq7TKFXx-rxRxpVR-akE+gVCutK879Tp_ubVwEu=TA@mail.gmail.com>
Subject: Re: [PATCH] hw/openrisc: pass random seed to fdt
To: Stafford Horne <shorne@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=dn3g=WU=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/13/22, Stafford Horne <shorne@gmail.com> wrote:
> On Sun, Jun 12, 2022 at 11:59:49PM +0200, Jason A. Donenfeld wrote:
>> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
>> initialize early. Set this using the usual guest random number
>> generation function. This is confirmed to successfully initialize the
>> RNG on Linux 5.19-rc2.
>>
>> Cc: Stafford Horne <shorne@gmail.com>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> ---
>>  hw/openrisc/openrisc_sim.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
>> index 35adce17ac..41821b5f30 100644
>> --- a/hw/openrisc/openrisc_sim.c
>> +++ b/hw/openrisc/openrisc_sim.c
>> @@ -20,6 +20,7 @@
>>
>>  #include "qemu/osdep.h"
>>  #include "qemu/error-report.h"
>> +#include "qemu/guest-random.h"
>>  #include "qapi/error.h"
>>  #include "cpu.h"
>>  #include "hw/irq.h"
>> @@ -115,6 +116,7 @@ static void openrisc_create_fdt(Or1ksimState *state,
>>      int cpu;
>>      char *nodename;
>>      int pic_ph;
>> +    uint8_t rng_seed[32];
>>
>>      fdt = state->fdt = create_device_tree(&state->fdt_size);
>>      if (!fdt) {
>> @@ -165,6 +167,10 @@ static void openrisc_create_fdt(Or1ksimState *state,
>>          qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
>>      }
>>
>> +    /* Pass seed to RNG. */
>> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
>> +    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed,
>> sizeof(rng_seed));
>> +
>>      /* Create aliases node for use by devices. */
>>      qemu_fdt_add_subnode(fdt, "/aliases");
>>  }
>
> This all looks fine to me.  I will queue it with my current changes.  Since
> this
> is only applying to openrisc_sim I would like to also apply it to virt.  To
> do
> that I need to have a common core openrisc system creation api.  That way I
> don't end up copying and pasting this to every platform.

Sure. Or just do it on the virt board only if that's easier.

Jason

