Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30706BAA6B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 09:06:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcM7x-0001iq-3d; Wed, 15 Mar 2023 04:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pcM7v-0001iC-5c; Wed, 15 Mar 2023 04:04:51 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pcM7t-0006kO-7Q; Wed, 15 Mar 2023 04:04:50 -0400
Received: by mail-ed1-x52f.google.com with SMTP id h8so28261840ede.8;
 Wed, 15 Mar 2023 01:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678867486;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YurBgA+nMbR7AkLy32GjMl8+UoHagXCimqpt2BdimHw=;
 b=HJhLxQakHnGQCR0BQ6oxZtxyMFVDQKSyGlTcUlm2cherXDB513CjhPiSBmvt1Imnig
 H5kR/zkHp4D9eHLzeRhzYvSKMIRnS+Pw15kXTY62C9NHi8YT3K2ywZG7cZk9jwO39MUY
 J5t6qbFGNK9/BjDCRE+3Uud5EhsQ7v+hRYv48eo7Z3DbM44NO4Bcr19duSKmI7+IilCf
 OiW4f3QPXmEFWgcQj5kSQEL5xHg7o4gfywpFWJlVutgypS3JFhVzGzsAr+jkBYcqEJey
 kNQ7eCmmtQSxDxIzLQJGV2iFoNNjMrHsfYq0W73PXe9CB7rbPkEM0ZDKoM3fXX/x5Df9
 pQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678867486;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YurBgA+nMbR7AkLy32GjMl8+UoHagXCimqpt2BdimHw=;
 b=PLykiVPTYwq3b4UmRjppShtQgUafJiYU2c4Ag3jDdbLzH+JOUuSgvdr3MsJz3ys4tl
 K3y1Rz0TCyBM+j5+lUQjOxgxphh3x2XNSze9TXqUhouaTMnpXrcPFXkzxBCu5ZUYkYtr
 cUE7WeGniRmghgMI4Qyr1oKLSiCeLjT3WuJ4wnVOaqAW7ijmUhNozYQ7mP3djQrGXMnb
 /tMBsPiuzJWPRcow4hf458wLtm0M8sauV3K5w1MK4U0fkBKKJ3H8fY1NS2pIiroYokRi
 ZWiTq6uwBctw1I9I0676TySSSgjDS3ZclRbAht2oE0LX1xEMIZqnjAa1HkO+5tLxJ8Cv
 11Zg==
X-Gm-Message-State: AO0yUKXJA8zGB+MsDYYhft9xFXAnag0MrF/hhTRCczu7k33q9vpq/9QC
 rm9GROqqa/FQx1WkdnYbBQvD2TY3GJc=
X-Google-Smtp-Source: AK7set9OWhT5wbaei9ltz46pA0QXhAYYn13w2N8CTrT60DR6c5PikuQdekdIzYFOQBuYno0wIu8eCw==
X-Received: by 2002:a17:906:2b50:b0:8aa:c2e1:6a64 with SMTP id
 b16-20020a1709062b5000b008aac2e16a64mr5183727ejg.61.1678867486369; 
 Wed, 15 Mar 2023 01:04:46 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 kb1-20020a1709070f8100b00923f05b2931sm2118148ejc.118.2023.03.15.01.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 01:04:45 -0700 (PDT)
Date: Wed, 15 Mar 2023 07:57:20 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
CC: Peter Xu <peterx@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH for 8.0] exec/memory: Fix kernel-doc warning
In-Reply-To: <20230315072552.47117-1-shentey@gmail.com>
References: <20230315072552.47117-1-shentey@gmail.com>
Message-ID: <49850BA4-972F-4177-A18B-8E9C65FA60E9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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

+ qemu-trivial

Am 15=2E M=C3=A4rz 2023 07:25:52 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>During build the kernel-doc script complains about the following issue:
>
>  src/docs/=2E=2E/include/exec/memory=2Eh:1741: warning: Function paramet=
er or member 'n' not described in 'memory_region_unmap_iommu_notifier_range=
'
>  src/docs/=2E=2E/include/exec/memory=2Eh:1741: warning: Excess function =
parameter 'notifier' description in 'memory_region_unmap_iommu_notifier_ran=
ge'
>
>Settle on "notifier" for consistency with other memory functions=2E
>
>Fixes: 7caebbf9ea53
>       ("memory: introduce memory_region_unmap_iommu_notifier_range()")
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> include/exec/memory=2Eh | 2 +-
> softmmu/memory=2Ec      | 8 ++++----
> 2 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/include/exec/memory=2Eh b/include/exec/memory=2Eh
>index 6fa0b071f0=2E=2E15ade918ba 100644
>--- a/include/exec/memory=2Eh
>+++ b/include/exec/memory=2Eh
>@@ -1738,7 +1738,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *=
notifier,
>  *
>  * @notifier: the notifier to be notified
>  */
>-void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n);
>+void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier);
>=20
>=20
> /**
>diff --git a/softmmu/memory=2Ec b/softmmu/memory=2Ec
>index 4699ba55ec=2E=2E5305aca7ca 100644
>--- a/softmmu/memory=2Ec
>+++ b/softmmu/memory=2Ec
>@@ -1996,17 +1996,17 @@ void memory_region_notify_iommu_one(IOMMUNotifier=
 *notifier,
>     }
> }
>=20
>-void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *n)
>+void memory_region_unmap_iommu_notifier_range(IOMMUNotifier *notifier)
> {
>     IOMMUTLBEvent event;
>=20
>     event=2Etype =3D IOMMU_NOTIFIER_UNMAP;
>     event=2Eentry=2Etarget_as =3D &address_space_memory;
>-    event=2Eentry=2Eiova =3D n->start;
>+    event=2Eentry=2Eiova =3D notifier->start;
>     event=2Eentry=2Eperm =3D IOMMU_NONE;
>-    event=2Eentry=2Eaddr_mask =3D n->end - n->start;
>+    event=2Eentry=2Eaddr_mask =3D notifier->end - notifier->start;
>=20
>-    memory_region_notify_iommu_one(n, &event);
>+    memory_region_notify_iommu_one(notifier, &event);
> }
>=20
> void memory_region_notify_iommu(IOMMUMemoryRegion *iommu_mr,

