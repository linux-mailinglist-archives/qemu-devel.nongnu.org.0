Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EC6613670
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:33:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTyp-0002jY-R0; Mon, 31 Oct 2022 08:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opTy9-0002fL-Rp
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:32:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1opTy5-0003uR-8c
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667219559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+410bms61PLJS6NdJuVCX+OOaNgZU0KlC8GkOp8PEhs=;
 b=G1GkE0g92xPhb9okgXT9TZdyuDK6HpDPoFICHLTZNUr5AgKJJN4vQDPXoSNlu2PKSy+FeI
 ZGZvEI+1rxi8CSrU8W0BLPw+iPqOEGhpQW/DmKWSRAF/8SAlrMupLneJvmHddloL79oHpD
 DJ9eE66n8BApM0yrWCZHpAs/5Mj1+64=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-YtYLGn0rPE2UGrd2ofpATg-1; Mon, 31 Oct 2022 08:32:38 -0400
X-MC-Unique: YtYLGn0rPE2UGrd2ofpATg-1
Received: by mail-qv1-f70.google.com with SMTP id
 b2-20020a0cfe62000000b004bbfb15297dso641929qvv.19
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+410bms61PLJS6NdJuVCX+OOaNgZU0KlC8GkOp8PEhs=;
 b=XTJSX7x+nNjc2hwm4PF65x3HX266STqA4DR2Vu2wFvcSmmLfG96VcNzUmad08aXy9f
 Kou/OJgKQA2+5flW8qRRHBqYFLRqqniqYT5r03cUehw8lbLVfFZlwsIH72uiPrIEW3Te
 UcRCcieTkDPPdzlcN5ZcaoWyNnvJ+7KBpBwacfnE6HPEa3XmHekYdSRGQ27lT6Jtx3jD
 pQdaUrRxD7N0IEJ0+vlhhOZCb3p/kF/EgKsProd2Sr2bmif6oFUAnuH98AUdDz/bdqbW
 jLZRa0iM+ilKYk7jvX5uJZPjbLqvUp5Oy3RSm4fohz0aNkQmalaUa6H0hPB3WVrTC1lS
 zaIw==
X-Gm-Message-State: ACrzQf2evHNqysigJbLZ7oswQfBUgnuR57G+XPE4ryUza5S5CC/omSID
 qKcrI5W1hdUspLHQwHWEXRz6vGb2LPCqg0+M1Y8pT/MhiFQhbMtMttLgiJaPehdmbZuSxx84Rf2
 VlRmGw9jlYEoHHmY=
X-Received: by 2002:a0c:b447:0:b0:4b3:cf2b:92f6 with SMTP id
 e7-20020a0cb447000000b004b3cf2b92f6mr10692650qvf.79.1667219557989; 
 Mon, 31 Oct 2022 05:32:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5y6hmrYQEKCvRrD1n7Vk6/Q5qSGRnzuqUPTSM3zWYWlUEEI6m6cT+X+aAbFMe6yGBvoribkA==
X-Received: by 2002:a0c:b447:0:b0:4b3:cf2b:92f6 with SMTP id
 e7-20020a0cb447000000b004b3cf2b92f6mr10692620qvf.79.1667219557728; 
 Mon, 31 Oct 2022 05:32:37 -0700 (PDT)
Received: from fedora (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x14-20020ac8730e000000b0039cb59f00fcsm3571940qto.30.2022.10.31.05.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:32:37 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:32:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>
Subject: Re: [PATCH v2 1/3] hw/i386/acpi-build: Remove unused struct
Message-ID: <20221031133233.597f3067@fedora>
In-Reply-To: <20221028103419.93398-2-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
 <20221028103419.93398-2-shentey@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022 12:34:17 +0200
Bernhard Beschow <shentey@gmail.com> wrote:

> Ammends commit b23046abe78f48498a423b802d6d86ba0172d57f 'pc: acpi-build:
> simplify PCI bus tree generation'.
>=20
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Message-Id: <20221026133110.91828-2-shentey@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 960305462c..1ebf14b899 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -121,13 +121,6 @@ typedef struct AcpiMiscInfo {
>      unsigned dsdt_size;
>  } AcpiMiscInfo;
> =20
> -typedef struct AcpiBuildPciBusHotplugState {
> -    GArray *device_table;
> -    GArray *notify_table;
> -    struct AcpiBuildPciBusHotplugState *parent;
> -    bool pcihp_bridge_en;
> -} AcpiBuildPciBusHotplugState;
> -
>  typedef struct FwCfgTPMConfig {
>      uint32_t tpmppi_address;
>      uint8_t tpm_version;


