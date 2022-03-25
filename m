Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3250D4E716C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 11:42:07 +0100 (CET)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXhOQ-0003z3-8r
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 06:42:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXhMM-0002Lr-9V
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:39:58 -0400
Received: from [2a00:1450:4864:20::42d] (port=40731
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nXhMK-0007WD-B9
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 06:39:57 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d7so10271494wrb.7
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hOIMqoJFdXp7xWR2zpny2V06Vyv43g+vRng6G3Fav6o=;
 b=NJerOdEDgIm+cT3HLSSpuXvGxsB7XZwH8Dy8vt74ecb5Gnvs4A6MDmvihYi0A4Pqvg
 88AOA6bhUDfUFR8cMgjqmM1Q8JoWhCfZwp5cdwRTFO1LJFn9NtF4jv8a1FNDpFLCMMB6
 hgSeSAA9VXUQ7F/73xiyAcgUecyGWUk0WL8M4/qQA2UKkKH8ZAyEX9sIZJDTm7uhHoou
 8dTMzR8QvjDCoop/JMdOkL3HvY8kVRpkZHBgaURPHMmSdyYIM3azCuagyxn4PF9eA2Gf
 dcUS191SvGuMYqubwn47gBUBtStSJRw2ojeQAZVdDBG613C4XyyFV9pDytiaGYnPElEf
 aKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hOIMqoJFdXp7xWR2zpny2V06Vyv43g+vRng6G3Fav6o=;
 b=n2qBc/WEqlNyznMB886j5DCw15vF27ITYYWFr74BT2avKyP9GW5SdRY0aGIlAq/++u
 p1Kz/90pd/N0khp3oHS2pF5RPexByejYMNUcBuxqxfmKIUcZlMIU1mI75fyS/9BYfA8i
 twf/m/HsCMi52liiRVqS2XJXGtu57pDu2GgGSE6VtTleeAOVbxMlAYOXUI1Jzw3GuSDE
 dyBmtLJ38La221U2IaRVobJ3lweOcJhrY6JwxnSc4TeHNYbjTzZD00CPnPKH1PcQpUSK
 Sx3JqWJUn6tllSv70dTe6rw2ZkyI0WobyLY6BGu3PIvQXO26F5RIisTSF/SbjoH5S/aw
 7m+w==
X-Gm-Message-State: AOAM530MjHbm/qJgdiQ3xK7tulzLO4JSI7/wopomOq4SNrSYzW/kr7n9
 errTNNJy1A0LTWlZ7cBdqLUbZA==
X-Google-Smtp-Source: ABdhPJw2EBtdVT3sqo9slR9RgddDKnCHi2HBeRzJr6V8WnCIRm9AKGFVKDzNQdiO/EnuOZBk7jprWQ==
X-Received: by 2002:a5d:59a3:0:b0:203:d9fa:6968 with SMTP id
 p3-20020a5d59a3000000b00203d9fa6968mr8704799wrr.585.1648204788644; 
 Fri, 25 Mar 2022 03:39:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a5d46ca000000b00203fd86e198sm4653261wrs.96.2022.03.25.03.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 03:39:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C57721FFB7;
 Fri, 25 Mar 2022 10:39:46 +0000 (GMT)
References: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Plugins Not Reporting AArch64 SVE Memory Operations
Date: Fri, 25 Mar 2022 10:19:59 +0000
In-reply-to: <YjzR3erB5ZhkAI2A@strawberry.localdomain>
Message-ID: <874k3m2u4t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 robhenry@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Hi folks,
>
> I see there has been some previous discussion [1] about 1.5 years ago
> around the fact that AArch64 SVE instructions do not emit any memory
> operations via the plugin interface, as one might expect them to.
>
> I am interested in being able to more accurately trace the memory
> operations of SVE instructions using the plugin interface - has there
> been any further discussion or work on this topic off-list (or that
> escaped my searching)?
>
> In the previous discussion [1], Richard raised some interesting
> questions:
>
>> The plugin interface needs extension for this.  How should I signal that=
 256
>> consecutive byte loads have occurred?  How should I signal that the cont=
rolling
>> predicate was not all true, so only 250 of those 256 were actually activ=
e?  How
>> should I signal 59 non-consecutive (gather) loads have occurred?
>>=20
>> If the answer is simply that you want 256 or 250 or 59 plugin callbacks
>> respectively, then we might be able to force the memory operations into =
the
>> slow path, and hook the operation there.  As if it were an i/o operation.
>
> My initial reaction is that simply sending individual callbacks for each
> access (only the ones which were active, in the case of predication)
> seems to fit reasonably well with the existing plugin interface. For
> instance, I think we already receive two callbacks for each AArch64
> `LDP` instruction, right?

This seems the simplest solution. I think what you need to look at is
how the sve_ldst1_host_fn and sve_ldst1_tlb_fn functions eventually
emerge out of the macro expansion (having a -E copy of the compiled
source might be helpful here).

That said I'm confused that softmmu isn't already hooked into by virtue
of using the softmmu slowpath (cpu_[ld|st]_*). However user space
emulation which typically directly accesses a final host address will
need to be fixed.

> If this is an agreeable solution that wouldn't take too much effort to
> implement (and no one else is doing it), would someone mind pointing me
> in the right direction to get started?

Richard, anything to add?

>
> Thanks!
>
> -Aaron
>
> [1] https://lists.nongnu.org/archive/html/qemu-discuss/2020-12/msg00015.h=
tml


--=20
Alex Benn=C3=A9e

