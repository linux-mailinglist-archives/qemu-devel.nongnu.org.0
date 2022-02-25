Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0EF4C3A8E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 01:54:13 +0100 (CET)
Received: from localhost ([::1]:38282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNOs8-0002gT-D5
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 19:54:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nNOpi-0000lW-BQ; Thu, 24 Feb 2022 19:51:43 -0500
Received: from [2607:f8b0:4864:20::530] (port=40569
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nNOpf-0006tR-4I; Thu, 24 Feb 2022 19:51:41 -0500
Received: by mail-pg1-x530.google.com with SMTP id w37so3195205pga.7;
 Thu, 24 Feb 2022 16:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zAuuBc2ZbUyljlMI3LJblRI5IJJbC0XbnDjdJchfCyU=;
 b=UnTBhDLghf7iAlWchm7Uuy+wDzsPWJngz5Lh+K1F+QJeZVxqL0/VaKTxIuL9VBfLOX
 zNi7S5MPDuQnJPMUUmAIeN4m5vyByJ2CWU1Gs7cVekTN+K+LjFpzT0Zgh3z6oNLWxBYv
 8PTfEKxrah+iOsPbMpsxneC6PIlzLhLICMBiJs2fhlZuijvi2LbZbVzYXtlLv0ou3TL1
 ksPZKdrCqfUYv2uTYMa3+KqGK8JItICowR9XbKnqKB/3mhNBhc+31c/6JDsYXXM1anV9
 r/K329VXHh7q8ecjxXQT1Car0tToJhl/dt8JD5QGXVX67twos5QNx1dJvyWO2dqJTgmQ
 kgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zAuuBc2ZbUyljlMI3LJblRI5IJJbC0XbnDjdJchfCyU=;
 b=a0fCUJ3ZWHZbThCd/FK0zMR0qH8FUuuA9Se+z9XhHoH1fMU3U1RI0tDQ6JauE27cGX
 eKxJz0nYJdZ5TuGZrWpiSKBABKxpYtuWsZVjA3h5AfTFs7T8bPQCHFuLkXMsP9Lt7jOP
 UIH2hmTTBbtrGt17NiqdAyB0hfIk7CH/wHGYeG9CJlnq6OHdKqksJlDa2VZdABOxrGEG
 UfGzWbdtmL+A4lqoGpHoxhbXtF4U6wOXb6TJHSZZbnY1ghlqhx02fhnDn7BYXW6m8DMI
 sGM+deoG8bkTpUUOCx9I6m0fvSkyK9dKMvJSa33oy/ieDj14zFKR5e9pUT3pxYXd8176
 c5hw==
X-Gm-Message-State: AOAM533o4+e1G7xNT0WzSzFa0z8aUFqAghPEb3sjk5d5UhScktwtTyoI
 FoDceAe8qRmaninFRr322/Q=
X-Google-Smtp-Source: ABdhPJyPhL835rRAsZaFZjbh7l9SS32CpQXY9tgDS6h4YyGeViBn92m9bVQZbhLyxNbjyr3liwwiPg==
X-Received: by 2002:a63:ba5e:0:b0:372:9bb2:c12d with SMTP id
 l30-20020a63ba5e000000b003729bb2c12dmr4229158pgu.380.1645750297254; 
 Thu, 24 Feb 2022 16:51:37 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id
 p30-20020a635b1e000000b0037572b4b9f5sm635465pgb.39.2022.02.24.16.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 16:51:36 -0800 (PST)
Date: Fri, 25 Feb 2022 10:51:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 4/4] spapr: Add KVM-on-TCG migration support
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-5-farosas@linux.ibm.com>
In-Reply-To: <20220224185817.2207228-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645749518.dllm9jbas4.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of February 25, 2022 4:58 am:
> This adds migration support for TCG pseries machines running a KVM-HV
> guest.
>=20
> The state that needs to be migrated is:
>=20
> - the nested PTCR value;
> - the in_nested flag;
> - the nested_tb_offset.
> - the saved host CPUPPCState structure;
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

The series generally looks good to me, I guess patches 1 and 2 are
fixes that could go ahead.

Main thing about this is I was thinking of cutting down the CPUPPCState
structure for saving the host state when in the L2, and making a
specific structure for that that only contains what is required.

This patch could easily switch to that so it's no big deal AFAIKS.

> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 7ee1984500..ae09b1bcfe 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -10,6 +10,7 @@
>  #include "kvm_ppc.h"
>  #include "power8-pmu.h"
>  #include "hw/ppc/ppc.h"
> +#include "hw/ppc/spapr_cpu_core.h"
> =20
>  static void post_load_update_msr(CPUPPCState *env)
>  {
> @@ -679,6 +680,48 @@ static const VMStateDescription vmstate_tb_env =3D {
>      }
>  };
> =20
> +static const VMStateDescription vmstate_hdecr =3D {
> +    .name =3D "cpu/hdecr",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(hdecr_next, ppc_tb_t),
> +        VMSTATE_TIMER_PTR(hdecr_timer, ppc_tb_t),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static bool nested_needed(void *opaque)
> +{
> +    PowerPCCPU *cpu =3D opaque;
> +    SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> +
> +    return spapr_cpu->in_nested;
> +}

I don't know the migration code -- are you assured of having a
spapr CPU here?

Maybe this could call a helper function located near the spapr/nested
code like 'return ppc_cpu_need_hdec_migrate(cpu)' ?

Thanks,
Nick

