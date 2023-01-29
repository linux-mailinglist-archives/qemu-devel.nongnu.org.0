Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF1E67FF9D
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 15:50:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM8zY-00081N-F3; Sun, 29 Jan 2023 09:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pM8z7-0007zC-B6
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 09:48:57 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pM8z4-0007ME-7y
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 09:48:44 -0500
Received: by mail-ej1-x62b.google.com with SMTP id me3so25295350ejb.7
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 06:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s9SCF6YTdqqFWVTAhQYnmYj2EL4sBzXIF2Z1MsoRpHQ=;
 b=NupRYdfM5DVit2E9+Otk6Ep2CpU53mTdET6VONp5/T+c7IekN50lDtWy2khjiMGlaB
 CmC4/vfuqYJTGL+BoybMVHcS1GmBbcCiWSCSd8YwxBhxFXdRNQJaoqRhMpJMIaYnriHr
 +mCXbLPkzv1BzKMeGBc9kdL2HYrW3gkhG0lwH7LrvlRVgHtW1xEKVivwM7ZDJ23OO5n9
 uO2nIFiVe/j4xMYfNggXBKDTQhlA7960T4EyHgmpBxQ43EhFjUWMHe49yXCykOBbkwEY
 UNtH3svILzVO7b51TNHEXDd+YoeAfzA+rk0Ueq9doaY1rQcJb+tkarzen6CinQnJDtbm
 ig9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s9SCF6YTdqqFWVTAhQYnmYj2EL4sBzXIF2Z1MsoRpHQ=;
 b=NVWBPRc6Yn8QNRSqdo8u+Kkz8jZA96mPZnfNzRXBUGowyPlnydCDoQVr0dIuPm20Bx
 DwynRJ132rwgrmTcKVgdUcDvVOwEueDhVss2vj9aKmbVwjOguxswqQTeldiUW2aba2UU
 zcvGLxRFKukTAect3Bfn8v2pow8QKbnriQitfxx9cFqhCnozCjivfVPAGANI2s2GpwBL
 Hq+Q6qdRbaM6mayr55pPhHbFvI5KuBGc/aPRg8wLA2ryRDvfWH9c0vZnB/sX0lvA0IC8
 Php1qToeIvDeB9I1/xdEsKb/VRm5SpwIseTaqeBztihKY4sgccIjoxFUyJwfOREOW5pQ
 SeDA==
X-Gm-Message-State: AO0yUKXWUP0x4xWHtqdF8Ddu01VeX+1MHMKH63JgvZGoY350wwV5PDdC
 65iWBy1Ga6rG7vy5vUdXxuc=
X-Google-Smtp-Source: AK7set+Zk72xtTKaJZOIlsoy3+k1b62aEPgTKEKf1OK/1QC+HIp2XERGAF1YZXddE00/eMQCS9MylA==
X-Received: by 2002:a17:907:674c:b0:7c4:fe36:5b80 with SMTP id
 qm12-20020a170907674c00b007c4fe365b80mr1376804ejc.62.1675003720521; 
 Sun, 29 Jan 2023 06:48:40 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf1ccd00356163aca05dbb0c.dip0.t-ipconnect.de.
 [2003:fa:af1c:cd00:3561:63ac:a05d:bb0c])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a170906605500b007c11e5ac250sm5486707ejj.91.2023.01.29.06.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 06:48:40 -0800 (PST)
Date: Sun, 29 Jan 2023 14:48:32 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 2/7] hw/acpi/ich9: Remove unneeded assignments
In-Reply-To: <20230124175537.5cb5da48@imammedo.users.ipa.redhat.com>
References: <20230122170724.21868-1-shentey@gmail.com>
 <20230122170724.21868-3-shentey@gmail.com>
 <20230124175537.5cb5da48@imammedo.users.ipa.redhat.com>
Message-ID: <C30520F0-7039-43CE-B409-68FAEC20071F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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



Am 24=2E Januar 2023 16:55:37 UTC schrieb Igor Mammedov <imammedo@redhat=
=2Ecom>:
>On Sun, 22 Jan 2023 18:07:19 +0100
>Bernhard Beschow <shentey@gmail=2Ecom> wrote:
>
>> The first thing ich9_pm_iospace_update() does is to set pm->pm_io_base =
to
>> the pm_io_base parameter=2E
>try to explain why 'pm->pm_io_base =3D 0' was there , what's changed=20
>and then why it's no longer needed=2E

Meanwhile I think the whole function is a no-op and can be removed=2E Some=
 archeology will explain how it came to be=2E

>
>> The pm_io_base parameter's value is the old
>> one of pm->pm_io_base=2E
>I can't parse this sentence=2E
>
>
>fixes: cacaab8bdd7460
>
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  hw/acpi/ich9=2Ec | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>=20
>> diff --git a/hw/acpi/ich9=2Ec b/hw/acpi/ich9=2Ec
>> index 2050af67b9=2E=2E0313e71e74 100644
>> --- a/hw/acpi/ich9=2Ec
>> +++ b/hw/acpi/ich9=2Ec
>> @@ -136,9 +136,7 @@ void ich9_pm_iospace_update(ICH9LPCPMRegs *pm, uint=
32_t pm_io_base)
>>  static int ich9_pm_post_load(void *opaque, int version_id)
>>  {
>>      ICH9LPCPMRegs *pm =3D opaque;
>> -    uint32_t pm_io_base =3D pm->pm_io_base;
>> -    pm->pm_io_base =3D 0;
>> -    ich9_pm_iospace_update(pm, pm_io_base);
>> +    ich9_pm_iospace_update(pm, pm->pm_io_base);
>>      return 0;
>>  }
>> =20
>

