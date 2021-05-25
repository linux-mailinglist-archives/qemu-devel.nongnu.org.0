Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A763909CA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 21:40:51 +0200 (CEST)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llcv4-0000tJ-Ds
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 15:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llcsu-0006vF-R6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:38:36 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llcss-0002mP-0B
 for qemu-devel@nongnu.org; Tue, 25 May 2021 15:38:36 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 z85-20020a1c7e580000b029017a76f3afbaso10935367wmc.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YenYKyQMhN70L2G5Fv4PANy3+7EGwsm0wC4/ASy0/ds=;
 b=BL0DO20JbL+T/Kt3vgIYX+XxFOGqIBTj0qpr+QED4G3j+oL49klVsW4SL5VUTwEBKX
 jCDicUNSxK73PbeZ1Jx429hQxqZWz2OEERwdyFsCxxXTiYTR+sBMOf2F/6YBP0ZUnCSo
 ymHLyCmJeCM5iV2uO2x0KMaXXVDxHOIaNDjAFNhjxQ+OBpAdDJRHfmfELJaWhjPzh2Ho
 RklxXKET2SEIINseX2r/UrOO3GPiFXbmTyrealsB11HLly6OfeqiZCTMO1UbQhPgYuzU
 X+6sCrkfSWnUXynUF5q9z/d1szDGlbeFM/egIvyG4GwAYwlaU0RkeESEUggxS29zfDCn
 zSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YenYKyQMhN70L2G5Fv4PANy3+7EGwsm0wC4/ASy0/ds=;
 b=B3NN8alhA64Vzsj13EEapQUS/lSHCPN4i/tUhyZ1XnWckuMIUS2O9ky9EaoT4bnSmf
 c/jqk4NxPMXQsRv6Opld9RZpaKF13IFesMfXhu4I9x/d+icY8GqW6hMM7IPkctamBwsn
 Q6tx1e3ABhVoLKHMe4CHlFeX9HUkP5tYZSXnlT2HLorCA4iVWX5lWTx3cJu3RCZr9yI1
 xONxof3SMWnJ8NoScRyV/vBKptED+swcsXswpqkAm9sWXbfiumFUCFq95+N0lEcf+SIU
 WGO49z3muMsXs9/fJAAFxipsMCQq9sTYx7AddrLiu6rFme/adIYlqymScZpl6d2BmoOX
 yPjQ==
X-Gm-Message-State: AOAM530O67Zb6mb0ysTLrMiC/qErQrU+9yS3HMpzvx/iC3RbeIdnqK/w
 FraNR12C6b/vujR3qedg3yiCWA==
X-Google-Smtp-Source: ABdhPJxNm63GCdaQb+micxXaWjPwfIQF6McumPVc0lXeEr4uxpKvlmTVOT0jQ8sQhd/TaFIGVxsH4Q==
X-Received: by 2002:a05:600c:ad9:: with SMTP id
 c25mr24709255wmr.56.1621971512421; 
 Tue, 25 May 2021 12:38:32 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p20sm3539569wmq.10.2021.05.25.12.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 12:38:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D00DF1FF7E;
 Tue, 25 May 2021 20:38:30 +0100 (BST)
References: <20210429234201.125565-1-shashi.mallela@linaro.org>
 <87fsya3a7b.fsf@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v3 0/8] GICv3 LPI and ITS feature implementation
Date: Tue, 25 May 2021 20:30:23 +0100
In-reply-to: <87fsya3a7b.fsf@linaro.org>
Message-ID: <87czte38p5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Shashi Mallela <shashi.mallela@linaro.org> writes:
>
>> This patchset implements qemu device model for enabling physical
>> LPI support and ITS functionality in GIC as per GICv3 specification.
>> Both flat table and 2 level tables are implemented.The ITS commands
>> for adding/deleting ITS table entries,trigerring LPI interrupts are
>> implemented.Translated LPI interrupt ids are processed by redistributor
>> to determine priority and set pending state appropriately before
>> forwarding the same to cpu interface.
>> The ITS feature support has been added to sbsa-ref platform as well as
>> virt platform,wherein the emulated functionality co-exists with kvm
>> kernel functionality.
>
> So I'm definitely seeing a slow down in one of my testcases but it
> doesn't seem to be HW access related. Via:
>
<snip>
>
> So I ran with the hotblocks plugin:
>
>   ./qemu-system-aarch64 -cpu max,pauth-impdef=3Don -machine type=3Dvirt,v=
irtualization=3Don,gic-version=3D3 -display none -serial mon:stdio -kernel =
~/lsrc/linux.git/builds/arm64.initramfs/arch/arm64/boot/Image -append "cons=
ole=3DttyAMA0" -m 4096 -smp 1 -plugin contrib/plugins/libhotblocks.so -d pl=
ugin -D hotblocks.log
>
>   collected 130606 entries in the hash table
>   pc, tcount, icount, ecount
>   0xffffffc010627fd0, 4, 10, 3998721 - memcpy
>   0xffffffc010628288, 2, 6, 3984790 - memset
>   0xffffffc01062832c, 3, 4, 1812870 - memset
>   0xffffffc0100a8df8, 4, 4, 1743432 - __my_cpu_offset
>   0xffffffc01015c394, 2, 4, 1304617 - __my_cpu_offset
>   0xffffffc010093348, 3, 3, 1228845 - decay_load
>   0xffffffc010093354, 3, 3, 1228447 - decay_load
>   0xffffffc01009338c, 3, 2, 1228447 - decay_load
>   0xffffffc01009336c, 3, 7, 1180051 - decay_load
>   0xffffffc010631300, 3, 4, 1114347 - __radix_tree_lookup
>   0xffffffc0106312c8, 3, 12, 1114337 - __radix_tree_lookup
>   0xffffffc0106312f8, 3, 2, 1114337 -=20
>   0xffffffc010132aec, 3, 4, 1080983
>   0xffffffc010132afc, 3, 12, 1080983
>   0xffffffc010132b30, 3, 2, 1080983
>   0x000000004084b58c, 1, 1, 1052116
>   0x000000004084b590, 1, 7, 1052116
>   0x000000004084b57c, 1, 4, 1051127
>   0xffffffc01001a118, 2, 6, 1049119
>   0xffffffc01001a944, 2, 2, 1048689
>
> So whatever is holding it up is because it's heavily spamming core
> functions.

Well given I've seen it hit gic_handle_irq > 1000 times already while in
the "PCI: CLS 0 bytes, default 64" phase of the kernel boot makes me
think the IRQs are just re-asserting themselves and firing continuously.

Indeed -d trace:gicv3_redist_set_irq shows a lot of:

  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 0
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 1
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 0
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 1
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 0
  gicv3_redist_set_irq GICv3 redistributor 0x0 interrupt 26 level changed t=
o 1

--=20
Alex Benn=C3=A9e

