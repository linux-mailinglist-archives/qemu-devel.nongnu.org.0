Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461BE467507
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 11:30:54 +0100 (CET)
Received: from localhost ([::1]:34326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt5q9-0000UG-3m
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 05:30:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mt5jm-0005xN-Ua
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:24:18 -0500
Received: from [2a00:1450:4864:20::335] (port=34389
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mt5jk-0003DQ-CI
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:24:18 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so4223737wmi.1
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 02:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bziUSmpQZai/+nLv0M0Z03PIzqpIxdE8OSRc0c1n1fM=;
 b=uA2mLaFU2h3dZZ8hCT8lNOud9qdnKZNSzut5mB9u7tmoqkdtLXCSQSfXOWQUbkHU4Y
 ujmAcUpGyyZc3OQ+NiO7dNWbTvUmw8o1WlLBcCyqUtMTof/9s2D61YP0BHYvCFI1DJ+k
 jt51rkt0yUP4zHUhFnHPwkxUh0yWmJuaomUgsRx0tLTe/2j/l014Ktuvl8Ugvg2NlNSe
 dKEJgQeA546UA9MT50cudxNmqeGSTGnzje2sWx6CuveN1gWYsSphcOy4w3yCkBqUCDre
 kgOQwG3A6uWQlBaiCsB6Y7115Haod6QJ6hruGbPC/mEq4p09K95rfpHptnC/4Qet/m9y
 tehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bziUSmpQZai/+nLv0M0Z03PIzqpIxdE8OSRc0c1n1fM=;
 b=6oegmVrFzoiS4Ac7g9mJ9CtZiXT7aKz6HHLu3oKs6ZsCG7Yk8NKEzrDyy7981+1jgv
 HzFLyawZah1iNBqCtnq/mmCjXKkuvWMGB+H2FhwHkIuzNr+P/Wfkn1Ns5VJ06Ra7w/FZ
 4Bzjmraf7KhBb9HueHAirAa8AlvMHRmQd63yA1Y+d98WH6zjjG4cKWdvy8OtMje1K2OA
 1gJWq90taLUlt5cMo04ylOOlUK/aagfnCwDcF5aHwyv20Uatfe5Y4hLco8JziciRnKPK
 AVkUfb0kL4MMRZQRLE60BFbRhyvrLVvGLurrWctx+5PEuW0knxtyiAlDAm31Iy3s87bK
 O4Ew==
X-Gm-Message-State: AOAM530Jwu3ElpZclItYIZ+2MgiaZyoJjUKcGtsL5M/DCSbUB1i1uII3
 EKGj7Oz+jpxHNlu4Pw60gB/q3A==
X-Google-Smtp-Source: ABdhPJxzc9yZOyVEEIndG0g9nLKJDMTPSNkZ5liQtgdV5nc+1KTTFPz9+OU+nE3ZmsNLR6ky5jk4xw==
X-Received: by 2002:a05:600c:3ba3:: with SMTP id
 n35mr14152545wms.88.1638527054670; 
 Fri, 03 Dec 2021 02:24:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o3sm4856732wms.10.2021.12.03.02.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 02:24:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DB14B1FF96;
 Fri,  3 Dec 2021 10:24:12 +0000 (GMT)
References: <20211202164929.1119036-1-alex.bennee@linaro.org>
 <87r1avgc9o.fsf@redhat.com>
 <d756e6f4-cabc-5384-fb73-08e498d49bfd@ilande.co.uk>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH for 6.2?] Revert "vga: don't abort when adding a
 duplicate isa-vga device"
Date: Fri, 03 Dec 2021 10:23:02 +0000
In-reply-to: <d756e6f4-cabc-5384-fb73-08e498d49bfd@ilande.co.uk>
Message-ID: <877dcmx9yr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 02/12/2021 17:14, Cornelia Huck wrote:
>
>> On Thu, Dec 02 2021, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>>=20
>>> This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.
>>>
>>> The check is bogus as it ends up finding itself and falling over.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Resolves: https://gitlab.com/qemu-project/qemu.git/-/issues/733
>>> ---
>>>   hw/display/vga-isa.c | 10 ----------
>>>   1 file changed, 10 deletions(-)
>>>
>>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
>>> index 8cea84f2be..90851e730b 100644
>>> --- a/hw/display/vga-isa.c
>>> +++ b/hw/display/vga-isa.c
>>> @@ -33,7 +33,6 @@
>>>   #include "hw/loader.h"
>>>   #include "hw/qdev-properties.h"
>>>   #include "qom/object.h"
>>> -#include "qapi/error.h"
>>>     #define TYPE_ISA_VGA "isa-vga"
>>>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
>>> @@ -62,15 +61,6 @@ static void vga_isa_realizefn(DeviceState *dev, Erro=
r **errp)
>>>       MemoryRegion *vga_io_memory;
>>>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>>>   -    /*
>>> -     * make sure this device is not being added twice, if so
>>> -     * exit without crashing qemu
>>> -     */
>>> -    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
>> Don't you simply need to invert the check? You should get NULL back
>> if
>> there is another device already...
>
> Yes that's correct - the existing check is simply missing a ! at the
> front. For an existing example take a look at the the fw_cfg device:
>
> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/nvram/fw_cfg.c#L1228
> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/nvram/fw_cfg.c#L1125
>
> Unfortunately it seems that I also missed this when I added my R-B tag
> :(

Although that doesn't seem to fix the original problem:

  =E2=9E=9C  ./qemu-system-x86_64 -name ELKS -machine isapc -cpu 486,tsc -m=
 1M -vga std -rtc base=3Dutc -netdev user,id=3Dmynet,hostfwd=3Dtcp:127.0.0.=
1:8080-10.0.2.15:80,hostfwd=3Dtcp:127.0.0
  .1:2323-10.0.2.15:23 -device ne2k_isa,irq=3D12,netdev=3Dmynet -drive if=
=3Dide,format=3Draw,file=3D$HOME/images/qemu.advent/day23/hd32mbr-fat.bin -=
drive if=3Dide,format=3Dqcow2,file=3D$HOME/images/qemu.advent/day23/scratch=
.qcow2 -serial mon:stdio
  QEMU 6.1.93 monitor - type 'help' for more information
  (qemu) quit
  =F0=9F=95=9910:23:50 alex@zen:qemu.git/builds/all  on =EE=82=A0 plugins/u=
pgrade-insn-tracking-plugin [$!?] took 5s=20
  =E2=9E=9C  ./qemu-system-mips64el -M pica61 -device isa-vga
  RAMBlock "vga.vram" already registered, abort!
  fish: =E2=80=9C./qemu-system-mips64el -M pica6=E2=80=A6=E2=80=9D terminat=
ed by signal SIGABRT (Abort)
  =F0=9F=95=9910:23:54 alex@zen:qemu.git/builds/all  on =EE=82=A0 plugins/u=
pgrade-insn-tracking-plugin [$!?] [=E2=9A=A1 IOT]=20

>
>
> ATB,
>
> Mark.


--=20
Alex Benn=C3=A9e

