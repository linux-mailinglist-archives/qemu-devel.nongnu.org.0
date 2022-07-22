Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABED857E32D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 16:42:53 +0200 (CEST)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEtrg-0005ix-Ci
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 10:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEtmp-0001w3-LF
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:37:51 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:41518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oEtme-0008Qf-AB
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:37:51 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10d8880d055so6509207fac.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AJ2FYNUBGXgn5CiBBxcinCck1vIhw42w0RrwKKeRmsI=;
 b=fCZ+16BJVI+GBllLCXHK1C6MWsEXtrxVoR2okc1103moA99KIYlASnSzdDszwLHLNz
 LtZ+2h8EY+s19x6bmN8BR+teaLjUv+Gw5pNNoqpt6C6pP4O4W4DtSTM/UyZQNbaE79yJ
 UsqqWrx3autLylzRvHh/mHUCn5icmGRAE1Z2TeReBISJ2tfPKNHgFXPpUtEdNSTp/AAR
 wN5T/fNNyMzYznmDBI6w6DKAlnkO+hgtPrxvYkZDDlssOPFdQ2vjUGFdJFNrk19H98J7
 ffJa+zgiRWVWerFZ3aWwhO4pPs8CHxaEPkyLtMcTXTIESEZXc1yeAFnrq9nn/wPWR88j
 46Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AJ2FYNUBGXgn5CiBBxcinCck1vIhw42w0RrwKKeRmsI=;
 b=SLJGVQyFmNAc2X14tO74A3FLR1PvaUwFKjowmV0tNdII1oxB2yhz0eOXoDobXdM6+x
 CO6+gvdX1bn/7J7IzXgBU7CavBanQ/Hndv1pwfZzmRUn57Ms7Hv4z9YDQC+2P3lSmjxM
 LQWM0Kp+ZXTKLdaT2ur+GX6yG2YgVlZxOfWXyKWAJnk6Zu5+htV68LIew+mBs5FsaWNe
 M5a8DjuiWQfk2GdW462QN9Q94Dq9yaFC7d6JrplWUhs8KFqHcEdrWKnX0ay0CjfH1ydo
 JcO8qzFnB2wz5biIVRgGyi+qse4Bri/Mn6rKShzHoh2NTzjIsxasqRQQVrMoU79N9yJq
 vURw==
X-Gm-Message-State: AJIora8niIZKXnZ2c3kz9alFvF4r96nB0msVyMi3OeDUTEsoqP/n0G5Z
 j77E7Tso6CVKHfT/nai/tjy9askbr9XElA==
X-Google-Smtp-Source: AGRyM1sBYBQQzlkVVQpes0Tvax5DsTG4AwjJL8AKgtMIqV5rYQkwczBRvQDW42SbLdgJVsgvVbwPjQ==
X-Received: by 2002:a05:6870:6322:b0:10b:b268:26de with SMTP id
 s34-20020a056870632200b0010bb26826demr8125865oao.119.1658500656309; 
 Fri, 22 Jul 2022 07:37:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 em39-20020a0568705ba700b0010d910ffc3asm2248899oab.18.2022.07.22.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 07:37:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C4051FFB7;
 Fri, 22 Jul 2022 15:37:32 +0100 (BST)
References: <20220721163621.761513-1-pbonzini@redhat.com>
 <20220721163621.761513-8-pbonzini@redhat.com> <87tu7az28k.fsf@linaro.org>
 <Ytm1KiyFGNqAo/Af@zx2c4.com> <87o7xhscey.fsf@linaro.org>
 <YtqJaf5gSyj9cVt6@zx2c4.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 7/9] hw/guest-loader: pass random seed to fdt
Date: Fri, 22 Jul 2022 15:27:38 +0100
In-reply-to: <YtqJaf5gSyj9cVt6@zx2c4.com>
Message-ID: <87k085rz6b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=alex.bennee@linaro.org; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey Alex,
>
> On Fri, Jul 22, 2022 at 10:45:19AM +0100, Alex Benn=C3=A9e wrote:
>> All the guest-loader does is add the information about where in memory a
>> guest and/or it's initrd have been placed in memory to the DTB. It's
>> entirely up to the initial booted code (usually a hypervisor in this
>> case) to decide what gets passed up the chain to any subsequent guests.
>
> I think that's also my understanding, but let me tell you what I was
> thinking with regards to rng-seed there, and you can tell me if I'm way
> off.
>
> The guest-loader puts in memory various loaders in a multistage boot.
> Let's call it stage0, stage1, stage2, and finally the kernel. Normally,
> rng-seed is only given to one of these stages. That stage may or may not
> pass it to the next one, and it most probably does not. And why should
> it? The host is in a better position to generate these seeds, rather
> than adding finicky and fragile crypto ratcheting code into each stage
> bootloader. So, instead, QEMU can just give each stage its own seed, for
> it to do whatever with. This way, if stage1 does nothing, at least
> there's a fresh unused one available for the kernel when it finally gets
> there.

That sounds suspiciously like inventing a new ABI between QEMU and
guests which we generally try to avoid. The DTB exposed to the first
stage may never be made visible to the following stages or more likely a
sanitised version is prepared by the previous stage. Generally QEMU just
tries to get the emulation right so the firmware/software can get on
with it's thing. Indeed the dynamic DTB for -M virt and friends is an
oddity compared to most of the other machine types which assume the user
has a valid DTB.

Either way given how close to release we are I'd rather drop this patch.

> Does what I describe correspond at all with the use of guest-loader? If
> so, maybe this patch should stay? If not, discard it as rubbish.

The original intent of the guest-loader was to make testing of
hypervisors easier because the alternative is getting a multi-stage boot
chain of firmware, boot-loaders and distro specific integration working
which can be quite opaque to debug (c.f. why -kernel/-initrd exist and
not everyone boots via -bios/-pflash).

>
> Jason


--=20
Alex Benn=C3=A9e

