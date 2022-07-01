Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46125637E8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:29:04 +0200 (CEST)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JVv-0003XP-PU
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7JTU-0001Nl-2r
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:26:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o7JTQ-0005X3-5H
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656692787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPdu1sQIadMeCybGFflIZZlVxSoM3+6IuLAuNHaK/xQ=;
 b=G3FI9e3aSt4QwlaUz5gQ9vqBULPJqIqgMpFsobN7+79giOqSgi9cH0cmPizzyxV+eJQgsr
 HUQnevYWLVnGZmSUpaQN/jDuSwuwuU/sUFcM1FU6C34nI3jkPEFZHZMgpCLeDzlkNb0pCc
 Y+1z5WwVAaK2hcRfdZq7Kq/MxEVI1DI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-f8L7Zp0zMaeY6Rf7EOc9DA-1; Fri, 01 Jul 2022 12:26:23 -0400
X-MC-Unique: f8L7Zp0zMaeY6Rf7EOc9DA-1
Received: by mail-ej1-f72.google.com with SMTP id
 hs18-20020a1709073e9200b0072a3e7eb0beso964646ejc.10
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 09:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HPdu1sQIadMeCybGFflIZZlVxSoM3+6IuLAuNHaK/xQ=;
 b=2SZvN2iUV2AVhGhSxtOro3SncH8vslyewJnyDkwdakcoyuMgGm60Gmt6EYMWDwh+BW
 5IbqDAPr9NocVrLqW4ZBDNfXI1HBfMtR396GDLRi5Q85hkASlPaG5MP698e/NzxTVfgt
 v6BNGOn4TB1ilYcSI+hYF+VFuZBMUnXU468QFbcmF/PiGtW/5/fanNqjPxlI4afYQ0yL
 Pm0V/76IfX8wxngDc44+pROVC8lxi1q5Rp8jz0K4nxXsOWNVAJ+O8I4dwRc5SCLdyMFl
 8GEiXNLa7IjS9ubAC/q6AZV+oyWJS/YobDi4S00XDOA7LawoFBsUOBasHyH0leu35QWd
 rKTQ==
X-Gm-Message-State: AJIora9Wm4KAG0WA6z35GyPnwYSYzyxTUrcR7a7jwWuVipcDoLLfE4Xs
 MkCtANhU6/THyYLHBp9KXNPv3yBFaSWiSdELhu5ecSXHgXXQqF8ihsj1MY3fYaemxk2K8A7Dthh
 6SGAtxyw7K6R3q20=
X-Received: by 2002:a17:906:604f:b0:718:e9e8:9d2a with SMTP id
 p15-20020a170906604f00b00718e9e89d2amr15050299ejj.315.1656692781636; 
 Fri, 01 Jul 2022 09:26:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqiIechtyR1ownhJ5+i0bVVKp4c7rkrFNEsV5iOEGAk5N1HL6HnFQkDatdYcTcb1dO9jhuSQ==
X-Received: by 2002:a17:906:604f:b0:718:e9e8:9d2a with SMTP id
 p15-20020a170906604f00b00718e9e89d2amr15050278ejj.315.1656692781297; 
 Fri, 01 Jul 2022 09:26:21 -0700 (PDT)
Received: from redhat.com ([2.55.3.188]) by smtp.gmail.com with ESMTPSA id
 e34-20020a056402332200b00437d2b6cae5sm5275074eda.83.2022.07.01.09.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 09:26:20 -0700 (PDT)
Date: Fri, 1 Jul 2022 12:26:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca
Subject: Re: [PATCH 02/17] acpi: x86: deduplicate HPET AML building
Message-ID: <20220701121346-mutt-send-email-mst@kernel.org>
References: <20220701133515.137890-1-imammedo@redhat.com>
 <20220701133515.137890-3-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701133515.137890-3-imammedo@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 01, 2022 at 09:35:00AM -0400, Igor Mammedov wrote:
> HPET AML doesn't depend on piix4 nor q35, move code buiding it
> to common scope to avoid duplication.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Apropos, tests/data/acpi/rebuild-expected-aml.sh ignores the
fact that some tables might be identical. Also, there's no
way to reuse expected files between machines. And so we have:


[qemu]$ find tests/data/acpi -type f -exec sha256sum '{}' ';'|sort
01fefc161dcd26564d86826df5c000b080a3442912165a1432dddd3fe9d1b78a  tests/data/acpi/virt/APIC
01fefc161dcd26564d86826df5c000b080a3442912165a1432dddd3fe9d1b78a  tests/data/acpi/virt/APIC.memhp
01fefc161dcd26564d86826df5c000b080a3442912165a1432dddd3fe9d1b78a  tests/data/acpi/virt/APIC.numamem
034be54fda2de6c07e7568b0c2ed6e0a0936c235f1a4ae42dbad0771b8b451db  tests/data/acpi/pc/NFIT.dimmpxm
034be54fda2de6c07e7568b0c2ed6e0a0936c235f1a4ae42dbad0771b8b451db  tests/data/acpi/q35/NFIT.dimmpxm
0ecccad48c22fc54f86756ef5e9dbf5360544bcd50970e277a13422c5831b67c  tests/data/acpi/q35/DSDT.memhp
10341f3d4e6822e578f0759e9c2cdf3ed24267e5a427cb2a31b63a028e208147  tests/data/acpi/virt/FACP
10341f3d4e6822e578f0759e9c2cdf3ed24267e5a427cb2a31b63a028e208147  tests/data/acpi/virt/FACP.memhp
10341f3d4e6822e578f0759e9c2cdf3ed24267e5a427cb2a31b63a028e208147  tests/data/acpi/virt/FACP.numamem
1a93fe13736fb8d51277ab086f7d7a3bbc6bcf946c68229c785ba8257ec8d865  tests/data/acpi/pc/SRAT.memhp
1a93fe13736fb8d51277ab086f7d7a3bbc6bcf946c68229c785ba8257ec8d865  tests/data/acpi/q35/SRAT.memhp
3f0fe229cae8032140af80d8e84105e1b3cc2307b5daa60548d0a00c3b5c0649  tests/data/acpi/pc/SLIT.cphp
3f0fe229cae8032140af80d8e84105e1b3cc2307b5daa60548d0a00c3b5c0649  tests/data/acpi/pc/SLIT.memhp
3f0fe229cae8032140af80d8e84105e1b3cc2307b5daa60548d0a00c3b5c0649  tests/data/acpi/q35/SLIT.cphp
3f0fe229cae8032140af80d8e84105e1b3cc2307b5daa60548d0a00c3b5c0649  tests/data/acpi/q35/SLIT.memhp
3f0fe229cae8032140af80d8e84105e1b3cc2307b5daa60548d0a00c3b5c0649  tests/data/acpi/virt/SLIT.memhp
3fb3115e2c3c626603dbb20ab49825295d952f171ed7901a7f464cead2f40800  tests/data/acpi/pc/FACS
3fb3115e2c3c626603dbb20ab49825295d952f171ed7901a7f464cead2f40800  tests/data/acpi/q35/FACS
43b225e2dc8f37c4a7d5af6452187097a4417b0aaa102a5a7000c4ba683946cb  tests/data/acpi/virt/SPCR
43b225e2dc8f37c4a7d5af6452187097a4417b0aaa102a5a7000c4ba683946cb  tests/data/acpi/virt/SPCR.memhp
43b225e2dc8f37c4a7d5af6452187097a4417b0aaa102a5a7000c4ba683946cb  tests/data/acpi/virt/SPCR.numamem
48831ff36e0e0c1916a0a637854a44f861aee551fff75d486da31605caebd16f  tests/data/acpi/rebuild-expected-aml.sh
498a52d92d615ba2c5c69d62296f4f21792543c8d52ccb9fade1c69cfd83fae8  tests/data/acpi/pc/APIC.cphp
498a52d92d615ba2c5c69d62296f4f21792543c8d52ccb9fade1c69cfd83fae8  tests/data/acpi/q35/APIC.cphp
49906fead65caf8e2b093dc193ec082772c7559a9a8fe2d20914bc44dc811716  tests/data/acpi/q35/DSDT.dimmpxm
5307211b50c65c8c05e4efb81b1d320e9208b5d3aac5a3d6bd37b9f47ef3bc4c  tests/data/acpi/pc/DSDT.ipmikcs
532089625245db3aeb4bf3a88c13d054be1fb21a24599b9d1bc17832a416937a  tests/data/acpi/pc/DSDT
5d3803c3e90296d0a4ea3b9501b0af926196f7288b1ff9160c5294141113e396  tests/data/acpi/q35/DSDT.numamem
5e4c0a107998d58be1ff10ffa08bff225f7f6efe3027095135d2e55bc15512fe  tests/data/acpi/pc/DSDT.cphp
61402328e4de16de4b7409564225268ae522ad913d9ef92276611ef22d9013a0  tests/data/acpi/virt/SRAT.numamem
645efebd748df15bd2cf7f0186cc7aeaaf8b40ac4adea29d871ac323360fc82c  tests/data/acpi/q35/FACP
6608617b0a5df135a12a3866e4e4239fbe77e3004ff4d6ea42f16879e69cf10f  tests/data/acpi/pc/DSDT.dimmpxm
6bc5f8fb421eff6f00de89743a56a88c951f47180b5ad83ceaad69aaf9fad984  tests/data/acpi/q35/DSDT.ipmibt
73d031ef66864988d9be337684317128c2e45c75a2af4fc35f20d216d83a2efd  tests/data/acpi/virt/DSDT
73d031ef66864988d9be337684317128c2e45c75a2af4fc35f20d216d83a2efd  tests/data/acpi/virt/DSDT.numamem
79fd95d6904b66b0a99982c64a0d54ea75bfa0568e8f02e1dcd9cdca404a758f  tests/data/acpi/pc/APIC
79fd95d6904b66b0a99982c64a0d54ea75bfa0568e8f02e1dcd9cdca404a758f  tests/data/acpi/q35/APIC
836514ed3adca20b1085838a37688dc1427811b648a7cc4e2a0a0f2d0cc6c99f  tests/data/acpi/pc/DSDT.numamem
84d4fd8e55b1785e8c22d1ea17a542266ca14af0c747115316cc7201df338e03  tests/data/acpi/q35/MCFG
879dd52ff293ddbc4d1f589482f882619b99816c4e362f19dab099d1a0e42da9  tests/data/acpi/pc/SRAT.numamem
879dd52ff293ddbc4d1f589482f882619b99816c4e362f19dab099d1a0e42da9  tests/data/acpi/q35/SRAT.numamem
87ec0a685c6bcb1e33af3e558431f038ecd33e4243dd68a4b14d4e97c3d5fb6d  tests/data/acpi/q35/SSDT.dimmpxm
8b28d0ce160bf42a812871210141f5d509932682a959b579c0d4f8f43b03fb42  tests/data/acpi/virt/SRAT.memhp
90a603d2f099cc3e3c9bd9de2f8f1cdad5307a6d2f6d2e7951f5418c7f422908  tests/data/acpi/q35/DSDT.cphp
95d9002674201957e58be516daf29729c2ac8e926bfb7256c1bc56fb8dc6eb01  tests/data/acpi/virt/MCFG
95d9002674201957e58be516daf29729c2ac8e926bfb7256c1bc56fb8dc6eb01  tests/data/acpi/virt/MCFG.memhp
95d9002674201957e58be516daf29729c2ac8e926bfb7256c1bc56fb8dc6eb01  tests/data/acpi/virt/MCFG.numamem
9aa0f3568a9f1c25d4c12257831974af88236bcc4b21b90df78ebe95bbb97475  tests/data/acpi/pc/HPET
9aa0f3568a9f1c25d4c12257831974af88236bcc4b21b90df78ebe95bbb97475  tests/data/acpi/q35/HPET
ac64d624eb666028565f4d508a80ae04ed7b48232c60c320de1beba4999ecb69  tests/data/acpi/virt/DSDT.memhp
b65c1b10bc565814f0c0950abd40712fd098b88c88f37f9bb20355356dd2b04f  tests/data/acpi/pc/DSDT.bridge
bb1c9e9e87bf9c1f8c96eb1deb201abb8a177296f1daa4dd53a9450c94307b7f  tests/data/acpi/pc/SRAT.cphp
bb1c9e9e87bf9c1f8c96eb1deb201abb8a177296f1daa4dd53a9450c94307b7f  tests/data/acpi/q35/SRAT.cphp
c9864027de5fed8169f5a283f64f15b799f34d26f66e3f4131da5c5ce1ec6d5d  tests/data/acpi/q35/DSDT
ca48a8cf471fcdde73f0997700cb99a39e738257eb26b5509dfb81005a694b83  tests/data/acpi/pc/SSDT.dimmpxm
ddfb6d6b50dd4645efac8358d86c7d2f310cbf0300823b68ef0d996e31f01c44  tests/data/acpi/virt/GTDT
ddfb6d6b50dd4645efac8358d86c7d2f310cbf0300823b68ef0d996e31f01c44  tests/data/acpi/virt/GTDT.memhp
ddfb6d6b50dd4645efac8358d86c7d2f310cbf0300823b68ef0d996e31f01c44  tests/data/acpi/virt/GTDT.numamem
e641d8505ab15bfd7ec399431eb3cb709cf0e06e15c528cc7d5da389392c89da  tests/data/acpi/q35/SRAT.mmio64
e7274a622cf4be3d991a8cedf4437c1976334a1332fac78aaeaa47a94d6e2697  tests/data/acpi/pc/DSDT.memhp
e93a393836970c4f32fff86a1931b8e45ee4634e5c99168491f2c55823647fda  tests/data/acpi/pc/APIC.dimmpxm
e93a393836970c4f32fff86a1931b8e45ee4634e5c99168491f2c55823647fda  tests/data/acpi/q35/APIC.dimmpxm
ee7b4e121c41519501119b4b7bd52edcf1124fcf271b7dd3086f0038b182b947  tests/data/acpi/q35/DSDT.bridge
f089eb8441987367f223fa5e5e9fec8c12d9557cf0c6d68d0e8372be4c39fa7c  tests/data/acpi/pc/FACP
fabfa7d0ed2367bf1499b1a1d0b7253cd08a298e2aa0be3ca8f0dae5150e71a9  tests/data/acpi/q35/DSDT.mmio64
fb7675409f2264b14e5859e9187e7d05811bcc0570444b18cded8ff49a3514c5  tests/data/acpi/pc/SRAT.dimmpxm
fb7675409f2264b14e5859e9187e7d05811bcc0570444b18cded8ff49a3514c5  tests/data/acpi/q35/SRAT.dimmpxm


It's easy to fix up duplications within virt. But I am not 100% sure how
fix up duplication between q35 and pc. I think we should really
fix qemu to allow pc-i440fx and pc-q35 as machine types. Right now:

microvm              microvm (i386)
xenfv-4.2            Xen Fully-virtualized PC
xenfv                Xen Fully-virtualized PC (alias of xenfv-3.1)
xenfv-3.1            Xen Fully-virtualized PC
pc                   Standard PC (i440FX + PIIX, 1996) (alias of pc-i440fx-7.1)
pc-i440fx-7.1        Standard PC (i440FX + PIIX, 1996) (default)
pc-i440fx-7.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-6.2        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-6.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-6.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-5.2        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-5.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-5.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-4.2        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-4.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-4.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-3.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-3.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.9        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.8        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.7        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.6        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.5        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.4        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.3        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.2        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.12       Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.11       Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.10       Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-1.7        Standard PC (i440FX + PIIX, 1996) (deprecated)
pc-i440fx-1.6        Standard PC (i440FX + PIIX, 1996) (deprecated)
pc-i440fx-1.5        Standard PC (i440FX + PIIX, 1996) (deprecated)
pc-i440fx-1.4        Standard PC (i440FX + PIIX, 1996) (deprecated)
q35                  Standard PC (Q35 + ICH9, 2009) (alias of pc-q35-7.1)
pc-q35-7.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-7.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-6.2           Standard PC (Q35 + ICH9, 2009)
pc-q35-6.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-6.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-5.2           Standard PC (Q35 + ICH9, 2009)
pc-q35-5.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-5.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-4.2           Standard PC (Q35 + ICH9, 2009)
pc-q35-4.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-4.0.1         Standard PC (Q35 + ICH9, 2009)
pc-q35-4.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-3.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-3.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.9           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.8           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.7           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.6           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.5           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.4           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.12          Standard PC (Q35 + ICH9, 2009)
pc-q35-2.11          Standard PC (Q35 + ICH9, 2009)
pc-q35-2.10          Standard PC (Q35 + ICH9, 2009)
isapc                ISA-only PC
none                 empty machine
x-remote             Experimental remote machine
xenpv                Xen Para-virtualized PC


which IMHO is a bit of a mess.

Then we could maybe use the directory "pc" for files common to i440fx
and q35.  Maybe just teach the test to look under tests/data/acpi/x86
too? And I think we should teach tests/data/acpi/rebuild-expected-aml.sh
to check for duplicates and at least warn the user.


-- 
MST


