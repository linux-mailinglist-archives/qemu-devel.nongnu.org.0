Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6DE66BFD8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHPao-0000IP-Bm; Mon, 16 Jan 2023 08:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHPZg-00005x-FO
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:30:58 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHPZe-0000me-94
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:30:55 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m21so40719243edc.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 05:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54HheQ5S4o1N65n4T5lfykN0zt7MMBVHKnFWTI39SJA=;
 b=dERDFOYYdz/JT2E4gwEJkxHqsSOav0zoFyvCB1C454YUTkmlA+8A28aqVxlL7j6xzj
 Z5s89MtEqJ/moc+SiGevIF8cK4UTX4v18UxarA+SCsp3ixQ8e24DpKpiKUBGqvGgSYFT
 pCMoSGB1HUEYeS99RMG57CQB0r7jPyyU1v4iLe6HV/b3l+DCJcIBn29EjK5xil9MVF/6
 L1+XgZePWYzBc+qN+Bh6Uv43uPIU1z9vyA+F7oU4ZCiNAkS3IHX8p6Ay9UZEHtTY+zwj
 p7tZfP9Xf2Rtugy6xWe/GkDmgKbhpMIhXg2brQCMdvZMCTvY+0gZaQjy7roMurDcVSTK
 D19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=54HheQ5S4o1N65n4T5lfykN0zt7MMBVHKnFWTI39SJA=;
 b=nPaCUYsJ47Uy+ZzKTZYjS/54Zl4T7NksoSikvDXv5GUa8dPSD18k4KJDxdmXuB1tKK
 5LTHKq2Ns1w9P7TBjr8nBy143FR7+YNuaKMSG6zSSZL4l10rlTwIeeEq4YgQ6OmbQkPN
 Y6y45w9K9rbD75OKKDK54WWl9V2gz7BJjC1prp1w1mRW+jN1LbCjtvSZcxum9vCvpkph
 HpveSuFSr0v4z6mwR5THiR82fJH6bESMNnHFwaNBUGpHdtJ8/FCiYM9OTdeM41JUqaQM
 j/q0lpI8iFmDevLE0dhJJic2bhyJ9Z7/wtvvBqRH6yYrKaRL9Lx89MBe+Y2kEBVeZ7Rq
 payA==
X-Gm-Message-State: AFqh2krFAKZ2olYNkz+hN1JcjXVLbbV88xWBGg0f92l3qJM4p5VsDMTl
 a0k+w+jR6m5NJzd0jn/t+RM=
X-Google-Smtp-Source: AMrXdXst48Q1xdvX9F35o3N33AMRj/bEyHMuqNqr9dGpYYeX5reKaW+5E/rPRn1cwftvN/65Ssxx1w==
X-Received: by 2002:a05:6402:538c:b0:483:21d8:87af with SMTP id
 ew12-20020a056402538c00b0048321d887afmr70668990edb.24.1673875852640; 
 Mon, 16 Jan 2023 05:30:52 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-143-217.77.191.pool.telefonica.de.
 [77.191.143.217]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b007b839689adesm11670322ejh.166.2023.01.16.05.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 05:30:52 -0800 (PST)
Date: Mon, 16 Jan 2023 13:30:41 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/7] hw/acpi: Add missing includes
In-Reply-To: <87bkmyaazk.fsf@pond.sub.org>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-2-shentey@gmail.com> <87v8l7ugc3.fsf@pond.sub.org>
 <ED034842-BBE4-4C6A-8E39-105BCBB58F6D@gmail.com>
 <87bkmyaazk.fsf@pond.sub.org>
Message-ID: <B8E4E808-9479-40F6-B286-39CE51E99A52@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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



Am 16=2E Januar 2023 13:02:23 UTC schrieb Markus Armbruster <armbru@redhat=
=2Ecom>:
>Bernhard Beschow <shentey@gmail=2Ecom> writes:
>
>> Am 16=2E Januar 2023 06:46:36 UTC schrieb Markus Armbruster <armbru@red=
hat=2Ecom>:
>>>Bernhard Beschow <shentey@gmail=2Ecom> writes:
>>>
>>>> When removing the "hw/boards=2Eh" include from
>>>> hw/acpi/acpi_dev_interface=2Eh, these include directives must be adde=
d to make
>>>> the code compile again=2E
>>>>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>
>>>You don't actually remove #include "hw/boards=2Eh" from
>>>hw/acpi/acpi_dev_interface=2Eh in this series=2E  Accident?
>>
>> It gets removed in "[PATCH 3/7] hw/acpi/acpi_dev_interface: Resolve Acp=
iDeviceIfClass::madt_cpu", no?
>
>Got eaten on the way to me, and I didn't notice, because git-am is still
>happy=2E  Sorry for the noise!
>
>The commit message could point to PATCH 3=2E  However, I'd reshuffle a bi=
t
>instead=2E  Split PATCH 3 into everything but the removal of #include
>"hw/boards=2Eh", and the removal=2E  Squash PATCH 1 into the latter,
>resulting in a straighforward cleanup patch=2E

Race condition: https://lore=2Ekernel=2Eorg/qemu-devel/20230116125842=2E66=
817-1-shentey@gmail=2Ecom/

Yeah, doing the include cleanup after the aml changes makes the series mor=
e straighforward indeed=2E I'll send a v3=2E

Thanks,
Bernhard

