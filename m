Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD907686155
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 09:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN8D9-0006tw-Eq; Wed, 01 Feb 2023 03:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pN8D7-0006tg-RL
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 03:11:17 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pN8D6-0005JR-6X
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 03:11:17 -0500
Received: by mail-ed1-x536.google.com with SMTP id k4so6041111edo.12
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVVZZ7wS6QUXc/pYLeaK5exDkUy3Zt8bVZPG8D5u1No=;
 b=NNBDDLFB7AAMeRRFqJyd16OykOpWZFx+Aa0wFjgE6eFwenVdG/7sfGnHLqv/pYLL3h
 iW0X8t01DYuVnr+K87C7he1+16XUTSRBH1V3Xah0KYa+N9ZBDhfSVEO4GUxZat+VT8TB
 6laEuto6OZmr5tLV0GM6/GKNeWTtduYs3wTD4QeH8HD2Wqq6jOQy7QFpTJ98D2hXj6EV
 oSc2isVI4P9iXMMC7HLxcAphkIJsX7tK24mMoaFq0nF00NopIbAVisOv3fgk/dnGFriU
 nIo+X+ujkZRPMfsrQMPlVW1qgDIXpxJAn0l+Wix2Wiy7IYvJ1QQsVATPHNXkYOvvF5qy
 bO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVVZZ7wS6QUXc/pYLeaK5exDkUy3Zt8bVZPG8D5u1No=;
 b=DyOS6XnSyitwaWjGH79CNE3JC7RPD3R6WFUziFXAVsUVSqt92/vAbx7Qe/KJ+8qPAG
 hox3mQ94mZw9O7K+rq7tshGTUpImBL76BbP0OwAKBTt82EYwz7QaKtSZT9PSZJR2t8XC
 wkrSOp7eFLWw5pvHjQz9gWZ98n0dE0BCQlow3iSld5UbYfpBPq72n4qhSxHqaoWg5kCk
 PC9+vIT+Q+Zli5fTsIIDINvPRiTpd9R2MghagQHT7gDYN8Cq5X9HwG5qvUDRYeWi/0ev
 xvIAkJhXWgKmJHpcJf7pMRpUQqkolEGFXRSi3L8krUy44AE+e5hoN6/ikyI1GxuETsa0
 5QAw==
X-Gm-Message-State: AO0yUKWmxqt5Digzus9pxn4NFxFTOgHHcIXtt9l4nAOsb4ncjOfaLace
 iVRnPi12yDkyB7xWS/CtH9U=
X-Google-Smtp-Source: AK7set+7Bf1JJ24v+v8g+VmLgOtiu+gqip0P1fEsOqCRHaUKiWt1HbYwUVeskgGrEKFjwvxZ7zjEhQ==
X-Received: by 2002:aa7:c602:0:b0:499:d199:6614 with SMTP id
 h2-20020aa7c602000000b00499d1996614mr1058466edq.36.1675239074680; 
 Wed, 01 Feb 2023 00:11:14 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-206-008.89.14.pool.telefonica.de.
 [89.14.206.8]) by smtp.gmail.com with ESMTPSA id
 w11-20020a50fa8b000000b0049e09105705sm9323996edr.62.2023.02.01.00.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:11:14 -0800 (PST)
Date: Wed, 01 Feb 2023 08:11:10 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230118051230-mutt-send-email-mst@kernel.org>
 <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
 <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
Message-ID: <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 24=2E Januar 2023 17:07:30 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 24=2E Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony=2Eperar=
d@citrix=2Ecom>:
>>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S=2E Tsirkin wrote:
>>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
>>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finall=
y removes
>>> > it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to make =
Xen in the PC
>>> > machine agnostic to the precise southbridge being used=2E 2/ will be=
come
>>> > particularily interesting once PIIX4 becomes usable in the PC machin=
e, avoiding
>>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>>=20
>>> Looks ok to me=2E
>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>>=20
>>> Feel free to merge through Xen tree=2E
>>
>>Hi Bernhard,
>
>Hi Anthony,
>
>>The series currently doesn't apply on master=2E And a quick try at
>>applying the series it is based on also failed=2E Could you rebase it , =
or
>>maybe you would prefer to wait until the other series "Consolidate
>>PIIX=2E=2E=2E" is fully applied?
>
>Thanks for looking into it!
>
>You can get the compilable series from https://patchew=2Eorg/QEMU/2023010=
4144437=2E27479-1-shentey@gmail=2Ecom/ =2E If it doesn't work for you let m=
e know, then I can rebase onto master=2E All necessary dependencies for the=
 series are upstreamed meanwhile=2E

Ping

>
>Thanks,
>Bernhard
>>
>>Thanks=2E
>>
>>> > Testing done:
>>> > None, because I don't know how to conduct this properly :(
>>> >=20
>>> > Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>>> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"
>>

