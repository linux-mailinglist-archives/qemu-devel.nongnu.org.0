Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D5666672
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 23:52:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFjx8-0007Il-2K; Wed, 11 Jan 2023 17:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pFjx6-0007IF-Q2
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 17:52:12 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pFjx5-000564-2v
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 17:52:12 -0500
Received: by mail-ej1-x632.google.com with SMTP id u19so40523829ejm.8
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 14:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uq9k5vpzTfzdvC18fx4N6VLd84sLjhLqG/zg/SKSZYA=;
 b=drxJ3CxHG06mOa8R7pmhIk98rLSdNwS4k1jkr5PtrzuLPEhLd3Jf5ufGWzDqXXBkFm
 2y4OIX/08yg8eYddWSupXXrsAB8wBQkDDNTjHSTBLILlR9Vw5hd93k8s496SxXKZ1O2j
 D8xf1rmEQfQADmRCYnKro2PYBuc51GqwPrF2XjpzeEk+OS93TzxunuQVwmTodNenyduO
 uyikYRE+DbS1LREYdqR0mW3E5cqFdPXKQq/aLybDO87delYSuoa2uzyYI6kKzcStYy3b
 KFQOeU8wyQ17v29aQ1yDWnOQ8uDyCH3/8LBXcs2yL9sDbgktJ1DRan4/22yTLzW2eCUh
 fbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uq9k5vpzTfzdvC18fx4N6VLd84sLjhLqG/zg/SKSZYA=;
 b=iMcXmUE0EKOzX31c1Gmm1vi10PKLmkv4OXlU8IjXMEbL1BFk4VbvsjtG7MF8Lbs4zd
 9FxeQnWmT8h/oZEQ0syAs3LholxDWtnWxWKERuIP8ESb90fVZWu8pYbjCg3OcQPIxyEX
 lTaQD10u0wIMd77y3u4nLpVY1jL/hEX3e7cdCokr4l8RifGWcxMY8wgXyLt3505FdTE/
 UEff9V16fw28O4OxsFNs/+LIkDDB4yTNtsEuBg/3oebctgGqNeBM/zbA7Wq3/AElJ656
 oGF8CnN+jXTeR4+7oMgyjI+bAzqmFnr9lGi4MSdiUHI6jEbmNu/UdiZbK8b1OUbSWWbo
 wHdA==
X-Gm-Message-State: AFqh2krZcF0cnfUQWXY9emTkJfmLB7qHJ/HlV7Kc61YOBot2qu4UE6Oj
 Pfhw3W2jQ5q2V48Iu6c6cn0=
X-Google-Smtp-Source: AMrXdXv79DWWYmQHd9NzFSw3eGrLXh0IbtIRYgcfkVJVavGQvxq8NdUthlNaxDehp22WDUKYmaFRTg==
X-Received: by 2002:a17:907:cbc7:b0:846:ccf3:d901 with SMTP id
 vk7-20020a170907cbc700b00846ccf3d901mr78673408ejc.52.1673477529488; 
 Wed, 11 Jan 2023 14:52:09 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-046-148.77.191.pool.telefonica.de.
 [77.191.46.148]) by smtp.gmail.com with ESMTPSA id
 ec20-20020a170906b6d400b007c0f5d6f754sm6760243ejb.79.2023.01.11.14.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 14:52:09 -0800 (PST)
Date: Wed, 11 Jan 2023 22:52:02 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael S Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_2/4=5D_hw/core/qdev-properties-?=
 =?US-ASCII?Q?system=3A_Allow_the_=27slew=27_policy_only_on_x86?=
In-Reply-To: <20230110095351.611724-3-thuth@redhat.com>
References: <20230110095351.611724-1-thuth@redhat.com>
 <20230110095351.611724-3-thuth@redhat.com>
Message-ID: <0EAED634-D18C-4C97-850A-27DDA7058576@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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



Am 10=2E Januar 2023 09:53:49 UTC schrieb Thomas Huth <thuth@redhat=2Ecom>=
:
>The 'slew' tick policy is currently enforced to be only available on
>x86 via some "#ifdef TARGET_I386" statements in mc146818rtc=2Ec=2E We
>want to get rid of those #ifdefs, so we need a different way of
>checking whether the policy is allowed or not=2E Using the setter
>function in hw/core/qdev-properties-system=2Ec seems to be a good
>place, so let's add a check here=2E
>
>Suggested-by: Mark Cave-Ayland <mark=2Ecave-ayland@ilande=2Eco=2Euk>
>Signed-off-by: Thomas Huth <thuth@redhat=2Ecom>
>---
> hw/core/qdev-properties-system=2Ec | 28 +++++++++++++++++++++++++++-
> 1 file changed, 27 insertions(+), 1 deletion(-)
>
>diff --git a/hw/core/qdev-properties-system=2Ec b/hw/core/qdev-properties=
-system=2Ec
>index 54a09fa9ac=2E=2Ed42493f630 100644
>--- a/hw/core/qdev-properties-system=2Ec
>+++ b/hw/core/qdev-properties-system=2Ec
>@@ -33,6 +33,7 @@
> #include "net/net=2Eh"
> #include "hw/pci/pci=2Eh"
> #include "hw/pci/pcie=2Eh"
>+#include "hw/i386/x86=2Eh"
> #include "util/block-helpers=2Eh"
>=20
> static bool check_prop_still_unset(Object *obj, const char *name,
>@@ -558,13 +559,38 @@ void qdev_set_nic_properties(DeviceState *dev, NICI=
nfo *nd)
>=20
> /* --- lost tick policy --- */
>=20
>+static void qdev_propinfo_set_losttickpolicy(Object *obj, Visitor *v,
>+                                             const char *name, void *opa=
que,
>+                                             Error **errp)
>+{
>+    Property *prop =3D opaque;
>+    int *ptr =3D object_field_prop_ptr(obj, prop);
>+    int value;
>+
>+    if (!visit_type_enum(v, name, &value, prop->info->enum_table, errp))=
 {
>+        return;
>+    }
>+
>+    if (value =3D=3D LOST_TICK_POLICY_SLEW) {
>+        MachineState *ms =3D MACHINE(qdev_get_machine());
>+
>+        if (!object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
>+            error_setg(errp,
>+                       "the 'slew' policy is only available for x86 mach=
ines");
>+            return;
>+        }
>+    }
>+
>+    *ptr =3D value;
>+}
>+
> QEMU_BUILD_BUG_ON(sizeof(LostTickPolicy) !=3D sizeof(int));
>=20
> const PropertyInfo qdev_prop_losttickpolicy =3D {
>     =2Ename  =3D "LostTickPolicy",
>     =2Eenum_table  =3D &LostTickPolicy_lookup,
>     =2Eget   =3D qdev_propinfo_get_enum,
>-    =2Eset   =3D qdev_propinfo_set_enum,
>+    =2Eset   =3D qdev_propinfo_set_losttickpolicy,
>     =2Eset_default_value =3D qdev_propinfo_set_default_value_enum,
> };
>=20

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

