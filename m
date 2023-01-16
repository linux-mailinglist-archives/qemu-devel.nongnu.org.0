Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EE266B98A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:57:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLIk-0007OS-2X; Mon, 16 Jan 2023 03:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHLIg-0007N6-Tf
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:57:06 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHLIf-0007W5-FV
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:57:06 -0500
Received: by mail-ej1-x630.google.com with SMTP id qx13so8049422ejb.13
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0r7llfx13USb1/GSeXuNeCdN3UpPjK9PX7PoO+EWNRk=;
 b=eDJN/em3/4+nwydBLJBoGNm8bPzOe+KBmBu4nYXJRMcX3LdbnwkH2FE2Ad4GBoPESr
 qC6Um53zTJ7Z5Szbp39yMctRHyodLkkPjY8RCAbU6lCbWfA9s5UNNgPCK8Y7MES4WeDX
 2ckm3Lk+zrpz6hfsk8Hhf89NhRHoIlsK6C5dWjALONvKnG1zlhv7WfYl9AKR2QH9qHQb
 dYBwzvvfhhKyHkEaKF/Z+46MgznyxKzlTbfGwgxyx0wGcDi2Vhd729YP1GO0I4E1I3wo
 pC2Ut2wlaf3GN3x0k5zEI0oj4l4CweBKZbMqFEM703RhTfwCwo/lFJpvfzBBbD15er73
 adlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0r7llfx13USb1/GSeXuNeCdN3UpPjK9PX7PoO+EWNRk=;
 b=IuM/4ml4QgrtnJaXD3EJJvBeQz0i+7iJioSviqF8xOagntJ8feGmYMApdejOhdPQeL
 rfoI49kB8bCVNWVcjU8tw4hkeO0kxmj09jkNYYMW6yrAis9A47mt4Hhk6yIRVruxf2QN
 RG5mQV0VagrrfsFaU8ExiSABmLY/Lku0POi9sQKIXRSasqMhx+ATStuyS5MVzC4rikKO
 Z3Ahg0gtYJspB36ZTEFq0ewfd4D+4aUOluLj+QPdrpa/NQWQKthpD6cBCZgQoZeQP2Hk
 WC6jM0bwmt7DbAQRa/7xh5vpxuRD7p9cMdl4TBwChKZs8rFCoeGRNuQoLoN9JHuTkHX9
 rfOQ==
X-Gm-Message-State: AFqh2kpbvPaDVADwA6SefQyF5dKzYpgOtboeSic4jez3mZCF216g95Bu
 isrcCTdt3+XvcXcEC7EkY+g=
X-Google-Smtp-Source: AMrXdXsyyWkwZnFk1xCtSX+dSQQnzz0KsXr6NXOLtBsEtovr3m2smQ5X6jKoCLNGdS2ZCrnim2xKww==
X-Received: by 2002:a17:907:175c:b0:84d:45db:b203 with SMTP id
 lf28-20020a170907175c00b0084d45dbb203mr23440172ejc.12.1673859423747; 
 Mon, 16 Jan 2023 00:57:03 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-143-217.77.191.pool.telefonica.de.
 [77.191.143.217]) by smtp.gmail.com with ESMTPSA id
 z20-20020a1709067e5400b00809e33ba33dsm11617291ejr.19.2023.01.16.00.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:57:03 -0800 (PST)
Date: Mon, 16 Jan 2023 08:56:56 +0000
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
In-Reply-To: <87v8l7ugc3.fsf@pond.sub.org>
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-2-shentey@gmail.com> <87v8l7ugc3.fsf@pond.sub.org>
Message-ID: <ED034842-BBE4-4C6A-8E39-105BCBB58F6D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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



Am 16=2E Januar 2023 06:46:36 UTC schrieb Markus Armbruster <armbru@redhat=
=2Ecom>:
>Bernhard Beschow <shentey@gmail=2Ecom> writes:
>
>> When removing the "hw/boards=2Eh" include from
>> hw/acpi/acpi_dev_interface=2Eh, these include directives must be added =
to make
>> the code compile again=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>
>You don't actually remove #include "hw/boards=2Eh" from
>hw/acpi/acpi_dev_interface=2Eh in this series=2E  Accident?

It gets removed in "[PATCH 3/7] hw/acpi/acpi_dev_interface: Resolve AcpiDe=
viceIfClass::madt_cpu", no?

