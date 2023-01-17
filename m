Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D134D670C26
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 23:52:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHuo8-0006yv-Im; Tue, 17 Jan 2023 17:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHuo4-0006xe-Rs
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:51:52 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pHuo2-0006VL-N5
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 17:51:52 -0500
Received: by mail-ej1-x634.google.com with SMTP id mg12so6685880ejc.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 14:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbh03W6hVMjCODjzgpmoric/2rTMsA2rWH3ep2nias0=;
 b=GTBzrSwzC0C+TbpKBPASdjFgmPK9MbGvc5t3esQ65Uc/KQOCsm545QihSYOgepEsAx
 rqv7NBrNxsqiw9wLC8PjaY726+IF868Uqcoj1MJRZOA4PJI6MkrYnw81z2bffpWxJHzM
 Z15Wib++E6k1CJqXVVSu0WXiI57WxyfvsbcY+C7GpVDz5Mh1x48lhAUgcWXntXBAOKWz
 hrPRKlnzYBmW5etZlK2IJv/Pmx+QPNK1/OGBDtAd1FrJT698evGYc/mBAwJ0xxncm0CU
 QlSENUD08VRWCnaxpeuwqiIgQ4exc1RAQ5IPg7Y1L9iYNnBN96IiweLC3PDczt4WJBBA
 kQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbh03W6hVMjCODjzgpmoric/2rTMsA2rWH3ep2nias0=;
 b=ZNRwNUsowgeshCEDNzqaV249UqarhpgFteNpyg71r3hGGEnOtItztiWCz6LP76uagg
 gt0YPXpBt1FWXbcoPUe8AepwXy13j5rS3RBHoraWM3kIV+5vQA+r070MNwb3agUPMndk
 SRVw+4+GdhaY1+n0t6czouRy9DJtlRXt6mvuKoSI/cSZlmXZEH/xyUARs40pHQFbEcUE
 LKYEnRhjMuR8ZR593690FiYUK+RII3jA8blj8RaO0Bbmad21wbggUDhXHIvzlrXYEmbK
 RcVpucV1oHa5VdN9M+sBIOAHySXyvk3ITzIJ8se3VADBPxqHW/IRIIu56Xhe7yKfg0yl
 UiWg==
X-Gm-Message-State: AFqh2kr3n+hmnssSq2h1PJoH6nM3dKTCff+4oSHtr0A47o5byh4Utued
 L70iFu5Ly00uWq0RXikyvhbUatnA/aU=
X-Google-Smtp-Source: AMrXdXuViHlaRCcJQwvdFLv4FdIMUTrp63hp3JtXnf0wno9j+1Rox2wLPKLD9Iw0BNao/SOEWyvs+g==
X-Received: by 2002:a17:906:b24c:b0:869:236c:ac41 with SMTP id
 ce12-20020a170906b24c00b00869236cac41mr4837674ejb.24.1673995908835; 
 Tue, 17 Jan 2023 14:51:48 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-011-043-201.77.11.pool.telefonica.de.
 [77.11.43.201]) by smtp.gmail.com with ESMTPSA id
 k15-20020a17090632cf00b0087120324712sm2738569ejk.23.2023.01.17.14.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 14:51:48 -0800 (PST)
Date: Tue, 17 Jan 2023 22:51:45 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
Message-ID: <D2349D00-B64B-4197-A62E-A74CB20112FB@gmail.com>
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



Am 4=2E Januar 2023 14:44:31 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally rem=
oves
>
>it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to make Xen i=
n the PC
>
>machine agnostic to the precise southbridge being used=2E 2/ will become
=
>
>particularily interesting once PIIX4 becomes usable in the PC machine, av=
oiding
>
>the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>
>
>
>v2:
>
>- xen_piix3_set_irq() is already generic=2E Just rename it=2E (Chuck)
>
>
>
>Testing done:
>
>None, because I don't know how to conduct this properly :(

Ping

Successfully tested by Chuck=2E Patches 2, 4 and 6 still need review=2E

I can rebase to master if that eases review -- please let me know=2E Curre=
ntly this series is based on my "Consolidate PIIX south bridges" series:

>Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>
>          "[PATCH v4 00/30] Consolidate PIIX south bridges"
>
>
>
>Bernhard Beschow (6):
>
>  include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>
>  hw/isa/piix: Reuse piix3_realize() in piix3_xen_realize()
>
>  hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
>
>  hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
>
>  hw/isa/piix: Resolve redundant k->config_write assignments
>
>  hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>
>
>
> hw/i386/pc_piix=2Ec             | 34 ++++++++++++++++--
>
> hw/i386/xen/xen-hvm=2Ec         |  2 +-
>
> hw/isa/piix=2Ec                 | 66 +----------------------------------=

>
> include/hw/southbridge/piix=2Eh |  1 -
>
> include/hw/xen/xen=2Eh          |  2 +-
>
> stubs/xen-hw-stub=2Ec           |  2 +-
>
> 6 files changed, 35 insertions(+), 72 deletions(-)
>
>
>
>-- >
>2=2E39=2E0
>
>
>

