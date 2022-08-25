Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35775A16AF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 18:28:13 +0200 (CEST)
Received: from localhost ([::1]:41638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRFiG-0000Yh-OI
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 12:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRFgs-0007UD-1y
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:26:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRFgp-00079p-GM
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 12:26:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h24so25291124wrb.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=7BRQRviDzzhZc29Dx67+zWgdByifR3+7lF4XT2StMAc=;
 b=pguL8hmKsDLTcxgS1FYfKubu9848Qkh1KxHzGRondt0bzEf/1VSvtwxSmLaMpi0Xo0
 BM3Mg+F+/4M7xcQNBhLxxfDvL8Xnuda/65fuIwmADPLjYFDqbkEy7N9SarinyDlrYkxr
 05WSTQBh8hcf4LxFSgasie4jBqjE9YERSK9sXHZBCFAgFQvc+Tzt/mLEToIGKjshMF32
 d6IIfPoQrISXR022mwLHENiJ7oCbCBewUj3hdSYMJGDr2LCFG3SvjUSPqduwnhkqFVmJ
 t+Sl3unPEIro2qplrKxQXDVwSV9Dxt+r5ZHy/EeaI+OGl7teobSfjS0At4khZPaRDbHT
 KS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=7BRQRviDzzhZc29Dx67+zWgdByifR3+7lF4XT2StMAc=;
 b=v3I/chF638wO15jyXVmadCCjO9tZbmd7pSMi7PiPEYEuH8/1Kd2F+SlPG+Uv5eT7wD
 03QwOjhiazV4+i+qJ+4RPj5kS7uUf+Lz7Y2SCOv+4Zv/L9yscZ4xKZCMOtbuU5yFeQ40
 MEpwkw/KXnhYELvRTmVvBvs+q3g5mEf5uFDPHKBNTzbogrNd8G4UbFZb7p5yPWVM9pPa
 wkRDZclS6Fqer/eUTYgflR6Z5+Hjxkg4sT3TfSjAzGXpxkmLhhuER7QtRHjRz0h31H53
 VK3guFzHiBnpVJ+eoWz6DQBf81GBqW7UvcTLIVyDhUlhZGvP47bydRXfC9V9blH/aEW5
 qZqw==
X-Gm-Message-State: ACgBeo1Q2uM+su7IXetTFhh98E//G4kBKmfdkOmma7DwGkrQRcivFly8
 UDxLWAJ5Sj+YZc3ZxP/DALtvuQ==
X-Google-Smtp-Source: AA6agR69dpombntxQv3NoCebBH8XZ6YZCEQa6vlHPgeh8j4+asBym+7x2+090ogBudsCRSOU9S/BNQ==
X-Received: by 2002:a05:6000:2a1:b0:225:7d0e:a8 with SMTP id
 l1-20020a05600002a100b002257d0e00a8mr2113971wry.322.1661444800499; 
 Thu, 25 Aug 2022 09:26:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a0560001e0500b002206203ed3dsm21620386wrb.29.2022.08.25.09.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 09:26:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39C411FFB7;
 Thu, 25 Aug 2022 17:26:39 +0100 (BST)
References: <20220822175317.190551-1-thuth@redhat.com>
 <87ilmhh7nd.fsf@linaro.org>
 <69e48a9d-a343-5cdc-d0fc-6b38fd9d25fd@amsat.org>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Gerd Hoffmann
 <kraxel@redhat.com>
Subject: Re: [RFC PATCH] tests/vm: Remove obsolete Fedora VM test
Date: Thu, 25 Aug 2022 17:25:55 +0100
In-reply-to: <69e48a9d-a343-5cdc-d0fc-6b38fd9d25fd@amsat.org>
Message-ID: <87a67sgugw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 24/8/22 19:29, Alex Benn=C3=A9e wrote:
>> Thomas Huth <thuth@redhat.com> writes:
>>=20
>>> It's still based on Fedora 30 - which is not supported anymore by QEMU
>>> since years. Seems like nobody is using (and refreshing) this, and it's
>>> easier to test this via a container anyway, so let's remove this now.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> Queued to testing/next, thanks.
>
> FYI this is the image I'm using to test x86 guest on aarch64/mips64
> hosts, but I can test a BSD-based instead; I suppose Linux as a guest
> is already well tested.

We already have a lot of coverage in avocado for that. If we want to
keep a VM image around though it needs updating to something supported
(either an LTS or more recent Fedora).

>
>>> ---
>>>   tests/vm/Makefile.include |   3 +-
>>>   tests/vm/fedora           | 190 --------------------------------------
>>>   2 files changed, 1 insertion(+), 192 deletions(-)
>>>   delete mode 100755 tests/vm/fedora
>>>
>>> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
>>> index 8d2a164552..2cc2203d09 100644
>>> --- a/tests/vm/Makefile.include
>>> +++ b/tests/vm/Makefile.include
>>> @@ -15,7 +15,7 @@ endif
>>>     EFI_AARCH64 =3D $(wildcard
>>> $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
>>>   -X86_IMAGES :=3D freebsd netbsd openbsd fedora haiku.x86_64
>>> +X86_IMAGES :=3D freebsd netbsd openbsd haiku.x86_64
>>>   ifneq ($(GENISOIMAGE),)
>>>   X86_IMAGES +=3D centos
>>>   ifneq ($(EFI_AARCH64),)
>>> @@ -45,7 +45,6 @@ vm-help vm-test:
>>>   	@echo "  vm-build-freebsd                - Build QEMU in FreeBSD VM"
>>>   	@echo "  vm-build-netbsd                 - Build QEMU in NetBSD VM"
>>>   	@echo "  vm-build-openbsd                - Build QEMU in OpenBSD VM"
>>> -	@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
>>>   ifneq ($(GENISOIMAGE),)
>>>   	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, =
with Docker"
>>>   ifneq ($(EFI_AARCH64),)


--=20
Alex Benn=C3=A9e

