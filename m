Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED55E8A93
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 11:13:10 +0200 (CEST)
Received: from localhost ([::1]:38368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc1Dg-0002B1-U9
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 05:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oc1BV-0008Dv-2T
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 05:10:53 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oc1BS-0005uK-Pl
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 05:10:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id f20so2998809edf.6
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 02:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Yq2diIusuO1Sjn6Er52SaSUiU3/pPgt/CwGzIP3Y3zY=;
 b=hh+9WHL9qZxT/6IynQEUfmi7bDD4oG+vABunBbAUrv542Ok20erkAVZ1PvW6T07RHz
 uAzminIXPiTD48ihJaVTjGFXetDhlX54Jsgr8oVaPdjzAPIf1lbUzZsPvwnpT40Zz2qx
 vs30NsGUP17gVLOHt+JpZYSCUXxm37JWqVCH755DeBtLvEbLeGWU7FCTEWApnXDXcab0
 AKt8vjF7nThr+w8u9Xj9UuoXfOopXfyqonOqZH4fu66uCw2+0qi/89kzVtDOmjMv8/Au
 g37aX03T7Lh7rpItUaGUjjib1Ws9IXYcEqAxH8ajckMBQfJjJeRWin2/VGslE+duoQW4
 yIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Yq2diIusuO1Sjn6Er52SaSUiU3/pPgt/CwGzIP3Y3zY=;
 b=PYah9ajVzI+9ymWBIfUWWUChFO9SPff8PvW6UX0DaEdityaNQg3VUvD+QNPQx45PSC
 A8Ls3OC67dYH2/UzkEtE9Ksl+8lUQB40SwNK4rkrBooS1+XXPHMjgq6ahXZUKyAVPeZE
 pnKrGTk9LEBc55EJVGRSIrMdn2LW9gRvxIb/7HTRw4vyeDjIXHcbOnG50zg/vuk5IRgD
 ZtEH+/SY3FqdjpvsG7R4mcHJNu5T8VX8enArill3BbTr4h4nBloutuK2Ft3v8d3MFBkN
 A2zU/fUmFsSUEpMxwAp1gBlX7L2dyyPtIgnlS2Li/Ujqh6LKY+nc5aPVZqqN4/1aIpTk
 hw+A==
X-Gm-Message-State: ACrzQf3/UM7tkvQjdSx0nAvgbm5mex+GU+OlRKR5PFbap51tlWO8zfL7
 oqyTZj63nMw543+mWM92cUv4QkINCcLPiBvWQ8PnVA==
X-Google-Smtp-Source: AMsMyM5BJDZoFkojrtO5KOkLRtoWDkl6PuSon2UA9rL2nHBJXNUqCuSPzuUQ8SHvNDbWIvdsr5KxURmgNRp4n++N6Eg=
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id
 dk6-20020a0564021d8600b004570e840f0emr436343edb.241.1664010646563; Sat, 24
 Sep 2022 02:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
 <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
 <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
In-Reply-To: <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Sep 2022 10:10:35 +0100
Message-ID: <CAFEAcA97oHsQdk2fSq=umiUv8nNue0xCLtboRR2yPt_Gxh_zEg@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Sept 2022 at 00:42, Patrick Venture <venture@google.com> wrote:
> On Thu, Sep 22, 2022 at 8:21 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On Thu, Sep 22, 2022 at 8:35 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> > A question to which I don't know the answer: if the guest writes to
>> > the device to change the MAC address, should that persist across
>> > reset, or should reset revert the device to the original MAC address
>> > as specified by the user on the command line or whatever ? At the
>> > moment you have the former behaviour (and end up storing the MAC
>> > address in two places as a result -- it would be neater to either
>> > keep it in only one place, or else have emc->regs[] be the current
>> > programmed MAC address and emc->conf.macaddr the value to reset to).
>> >
>> > I'm not sure we're consistent between device models about that,
>> > eg the e1000 seems to reset to the initial MAC addr, but the
>> > imx_fec keeps the guest-set value over resets. Jason, is there
>> > a recommended "right way" to handle guest-programmable MAC addresses
>> > over device reset ?
>>
>> I think it depends on the NIC.
>>
>> E1000 has a EEPROM interface for providing the MAC address for the
>> ethernet controller before it can be accessed by the driver during
>> reset. For modern Intel NICs like E810, it has similar semantics but
>> using NVM instead of EEPROM. So the current e1000 behaviour seems to
>> be correct (treat the initiali MAC as the one stored in the EEPROM).
>>
>> I guess most NIC should behave the same as having a persistent storage
>> for MAC for the controller during reset, but I'm not sure this is the
>> case for imx_fec.

> So the first time the NIC is realized, it should take the value from
> the command line.  Then later if the guest OS updates it, it should
> always on reset use that provided value?

I think what Jason is suggesting is that that should depend on what
the real hardware does. On a physical board, if the guest sets the
MAC address, and then you power-cycle the hardware, does the MAC
that it set still persist after powercycle ? Does the guest writing
to these MAC registers correspond to writing to an EEPROM ?

thanks
-- PMM

