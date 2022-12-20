Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11B3652933
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 23:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7lUy-0005rN-8Q; Tue, 20 Dec 2022 17:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7lUm-0005ou-P9; Tue, 20 Dec 2022 17:54:02 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7lUk-0005fV-Cf; Tue, 20 Dec 2022 17:54:00 -0500
Received: by mail-ej1-x634.google.com with SMTP id m18so32770936eji.5;
 Tue, 20 Dec 2022 14:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EYzq3Ns8OqFJ/7/ONat9gRsCJsmcuVs0qWNs+OaF2TI=;
 b=Vdc/Y9hk+bgnCGi2sbowdNGPS7iROs0VrLPASjXb857a9X3B0jlQznAfa5eH3+m31F
 6o9TiOMoDjss1aJMdVVWsx43wThlV3TN1vuUtiZSGZ59PsjzK+pA6C7BezJE+ELFDRh1
 GQklR6P7o2g3+qKlRfssnzwSUGblkC26pZePG6sK/QVW0+Zp8rpMZoNUOu5YSGM1bVDY
 0JL4HG86iKrUdl3tiT6E4y9blMrJpxLEkRGeywPhyGl2QynG4CwnuIFdY7UwCwtcKkHY
 EZ+/Pb1lyusNQR6MI1wt8rcBkmrBNnQ/Kp0QGM2QVqeGK0IA7+CJAznjbcl0R5slaPye
 XpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EYzq3Ns8OqFJ/7/ONat9gRsCJsmcuVs0qWNs+OaF2TI=;
 b=dZfAcakET4WN1zg8D9ooOlE4fffG8xWgfqt/TBLOa4greSCNeWKFOKuTkXrbBh9xIN
 YLnNRfDkoLapCQOEKlNRhosotjVbxPef+fThTJ8yn01qItTgUdXyZ3ajWTPl8ME6/RKz
 GmyUrIIyNYx84KLOi3gySMk+kDSAHS+bcQ5hGnqyl5XUXmYLl7srbcLocF97NcjUyeUb
 xMNf1PY3CDG6nI4/ui+CiR1mULnZc+VXf0y44neYlk/mB1PjBujV/Bsj0NyJg2m2hy5E
 E36bSAvPH28Jo+P9UjisAeraoqmowpJ3I5ob0XEoWCzksU1IxQsG5Ve7mfDADn3JL4FL
 bYoQ==
X-Gm-Message-State: ANoB5pn0tbBNkIOatoIf5FdMIuHz4KZ9ouHAI4OR3Kdu1Me/e0sfpsaS
 RVGCztUfedJ3uH1tcU/he5c=
X-Google-Smtp-Source: AA0mqf4p090hLz1hIo7c7NqQA/CjYV76xJcBEVCHyrfypYQLYTzR0p/i3WyEHnTDY/jNCxQL7mPPqA==
X-Received: by 2002:a17:906:4704:b0:7c1:13b7:a5a1 with SMTP id
 y4-20020a170906470400b007c113b7a5a1mr39129951ejq.46.1671576836132; 
 Tue, 20 Dec 2022 14:53:56 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-170-133.89.14.pool.telefonica.de.
 [89.14.170.133]) by smtp.gmail.com with ESMTPSA id
 a14-20020a170906670e00b007c0f45ad6bcsm6223989ejp.109.2022.12.20.14.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 14:53:55 -0800 (PST)
Date: Tue, 20 Dec 2022 22:53:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Michael Tokarev <mjt@tls.msk.ru>, 
 qemu-trivial@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 0/6] Trivial PPC cleanups
In-Reply-To: <FBA6F5D9-F6B5-445D-BC47-12FD202BC929@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
 <6fc82e52-b7a4-778b-1510-4831570a50a3@gmail.com>
 <FBA6F5D9-F6B5-445D-BC47-12FD202BC929@gmail.com>
Message-ID: <1B1DB7AC-0775-4A8D-B804-7AF826D1BDFE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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



Am 20=2E Dezember 2022 22:40:25 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>
>
>Am 16=2E Dezember 2022 17:50:41 UTC schrieb Daniel Henrique Barboza <dani=
elhb413@gmail=2Ecom>:
>>Queued in gitlab=2Ecom/danielhb/qemu/tree/ppc-next=2E Thanks,
>
>Thanks Daniel!
>
>Is there a way we could accomodate for Zoltan's comment still? It's just =
cosmetics, so should be pretty simple=2E

Yeah, you sent a pull request already! Thanks!

I''ll address Zoltan's comment in a future series since I'm working on e50=
0 anyway=2E

Best regards,
Bernhard

>
>Best regards,
>Bernhard
>>
>>
>>Daniel
>>
>>On 12/16/22 11:57, Bernhard Beschow wrote:
>>> These are some patches which helped me when getting a u-boot image to =
run on ppce500 machine=2E
>>>=20
>>> Testing done:
>>> - `make check`
>>> - `make check-avocado`
>>>=20
>>> Bernhard Beschow (6):
>>>    target/ppc/mmu_common: Log which effective address had no TLB entry
>>>      found
>>>    target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
>>>    hw/ppc/virtex_ml507: Prefer local over global variable
>>>    hw/ppc/e500: Prefer local variable over qdev_get_machine()
>>>    hw/ppc/e500: Resolve variable shadowing
>>>    hw/ppc/e500: Move comment to more appropriate place
>>>=20
>>>   hw/ppc/e500=2Ec           | 10 ++++------
>>>   hw/ppc/virtex_ml507=2Ec   |  2 +-
>>>   target/ppc/mmu_common=2Ec |  5 +++--
>>>   3 files changed, 8 insertions(+), 9 deletions(-)
>>>=20

