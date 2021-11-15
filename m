Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8D45042F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 13:12:57 +0100 (CET)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmar2-0001zJ-8X
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 07:12:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmapD-00016F-Fr
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:11:03 -0500
Received: from [2a00:1450:4864:20::32e] (port=39444
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmapB-0007IR-DC
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:11:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10333321wmr.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 04:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=1FZmQ73FoYa5LvMzkym7OKz+hMfjOcDJNQAXhP/Wxns=;
 b=LHBcar5Di62Wj91sX2AV+BPoxqkyjiw8Io5Z9sDldTsjB5DZFBqF5wNPNgWVFLqYhg
 mneeAHZUDTMFkt4d1ymDljfP6MPFUjtyFVILbNV7+FBEYR0OuQvH2ue6891YAPn+Ry00
 JW1zCn+1DuKI0ZYqSi/t8xOr61tk7oPUWvLm1NfPSFbQmstsTlsTQwUooajPWG8tLJ73
 dkRRnblKMCDh3U1Hvd0NcwGuO9b852EayvnYcA2lrDO0Lz4LqOAGL+qJgGzrI4vGfVRU
 GZcw2xHcSC5aN02sFumj4pXAsVtrX1N4utcEfwmmKU4irUhdVZxd+ymo32NDVMNcnYkO
 eLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=1FZmQ73FoYa5LvMzkym7OKz+hMfjOcDJNQAXhP/Wxns=;
 b=Up9UnjMyKvHkFIs2Ipk3Ba6nKJlm+GEEGr2Awuft7DX+14xxlYu+PFzu/n37ISW+Ww
 pq84FR5Z4T4DUF25BpbAJ/vI+tLCbLaHTybdpu5jma/OHIt6MkSUlmhbKpuBC7YM8gXx
 VLziLZA8HTmodthP4xu0S+WvJMOdh3jtVRuXI2Nu9Gme4pMIrrSR7zOLBLvgz3YBfNmV
 wLmM1cJkJCgQXZXwl6o6O4rDJj/bCB3XuOQwXcDPB3bbetdAhZi+j12whx3PlbDBE+qk
 MBOBHsIUf3Pk9DkZJP/490Vb+I/I1fO0CW5jaJe/StuD4HlsptBHk6Bz11p8+S6ITXCz
 N8rA==
X-Gm-Message-State: AOAM533lMsnk0DhW4FBkKDUU0nqyztpPkKut7z+qHkBgBBXwwBfmq+8l
 V42Xl3zoPUq3CdedR6LC+zbA7w==
X-Google-Smtp-Source: ABdhPJyQtfaIC9p+PgZYH6rIpNWrPy8hHse6HSIFGcOowiyPCy/B0dFtYlgpvAUJmxKM23rGToMNRg==
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr58571248wma.30.1636978256974; 
 Mon, 15 Nov 2021 04:10:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o12sm15678020wmq.12.2021.11.15.04.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 04:10:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A1611FF96;
 Mon, 15 Nov 2021 12:10:55 +0000 (GMT)
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
 <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
 <67c00a6a-e50a-3ea6-ef1d-98494fdbd729@csgraf.de>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
Date: Mon, 15 Nov 2021 12:08:29 +0000
In-reply-to: <67c00a6a-e50a-3ea6-ef1d-98494fdbd729@csgraf.de>
Message-ID: <875ysty5yo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Andrei Warkentin <andrey.warkentin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexander Graf <agraf@csgraf.de> writes:

> On 15.11.21 11:46, Peter Maydell wrote:
>> On Sun, 14 Nov 2021 at 17:41, Alexander Graf <agraf@csgraf.de> wrote:
>>>
>>>
>>>> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org=
>:
>>>> This is tricky, because we use the cpu->isar values to determine wheth=
er
>>>> we should be emulating things. So this change means we now create an
>>>> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
>>>> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
>>>> unset), and depending on which of the two "do we have EL3?" methods
>>>> any bit of the TCG code is using will give different results...
>>> Do you think it would be sufficient to go through all readers of
>>> the isar bits and guard them behind an ARM_FEATURE_EL3 check in
>>> addition? I'll be happy to do so then! :)
>> That would be a big reverse-course on a design choice we made that
>> the preference is to look at the ID registers and phase out the
>> use of ARM_FEATURE bits where possible.
>
>
> I'm open to alternatives. As it stands, we're lying to the guest
> because we tell it "SMC is not available" but ask it to call SMC for
> PSCI, which is bad too.

Is testing the ISAR bits actually telling a guest that SMC exists or
just the CPU is capable of handling it? I guess -kernel only is a weird
case because otherwise if EL3 is available some sort of firmware has to
have gotten the CPU into a state a kernel can boot. It doesn't imply
that firmware knows how to do a PSCI call though - surely there is some
firmware configuration/probing mechanism you need to rely on for that?

--=20
Alex Benn=C3=A9e

