Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29772561A4F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 14:27:54 +0200 (CEST)
Received: from localhost ([::1]:53874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6tGy-00026r-Er
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 08:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6tDC-00009m-F4
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o6tD5-00064b-Oc
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656591831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3NIRLbX8N2WOBzPUO8ZngROUg4GskgpgnMoyt6FWdU=;
 b=dUyAsbZz0u+rnuMrpt+lfT0WSvOfY+39aC8SKZFjpTBsD0VaUb0nfv3ApZzI5gEcZicH0n
 5Smb6tPvYk6HZ/y2maqF25T8/RCjItq2/CDIqyLQGarxZVBWPdToyQrCY2a1Vs9II793OZ
 87jvfn1juCadkBG3ZLS/U66r36o+3o0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-F6a1z8vfP8yGVDOdbNIBPA-1; Thu, 30 Jun 2022 08:23:50 -0400
X-MC-Unique: F6a1z8vfP8yGVDOdbNIBPA-1
Received: by mail-ej1-f72.google.com with SMTP id
 kv9-20020a17090778c900b007262b461ecdso6131329ejc.6
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 05:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r3NIRLbX8N2WOBzPUO8ZngROUg4GskgpgnMoyt6FWdU=;
 b=YXxwsPd7Vsnkx+lCdNoBywblihw2IqPKmrSUx+QkeDPPlizPe3cSuJ/RbsCewY6bAi
 xkLQaCd73bHIDlUBZGkBySFquEJceNZ3X7IV+h6cnQviixYBcu3MeiZ28S3DyQx31UuX
 DWuJDSjDb6ln9+eXvEy3r2L542ixXZpTcLd4Mbaf1lxQ44ZTQIlaMUXjaQtL8VXvzfvo
 +kpukgHS8gcMDsSEar1D0i4HHTqbQa76gyxVdC7WcmtqhWAFazxEPS5/BQINKHL3RKwh
 UECWo0qEsQgI9YppEunAt6eWrgYTTbg2MrzCIZyQswHkUQv3G9a0z6pGmJjhv2Qkyrq2
 BbXA==
X-Gm-Message-State: AJIora/irbwFCyMPx2o1r8SPm2CIO6Nf51bB3YUetvOwRPGwh/NgG/2S
 6Hc7ffyFnszhX6s2LRj4Zjp7noefmBriziWXEYx0ZciuU6WdcU2FJE0GOB3ZFA0YQqZ3z8Lj3jf
 jUAp4ZWTHyO1uzW0=
X-Received: by 2002:a05:6402:516b:b0:435:8f7b:b6f7 with SMTP id
 d11-20020a056402516b00b004358f7bb6f7mr11127516ede.291.1656591828916; 
 Thu, 30 Jun 2022 05:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vbuxpagjpkXSzpWFpXP8i0978M4dSWH0MZb8vcGt1WEYHYL8TNtbgBaHhGzAcR/vk/xnO/Vg==
X-Received: by 2002:a05:6402:516b:b0:435:8f7b:b6f7 with SMTP id
 d11-20020a056402516b00b004358f7bb6f7mr11127486ede.291.1656591828712; 
 Thu, 30 Jun 2022 05:23:48 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a056402055900b00435681476c7sm13212200edx.10.2022.06.30.05.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:23:48 -0700 (PDT)
Date: Thu, 30 Jun 2022 14:23:47 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Brice Goglin <Brice.Goglin@inria.fr>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?B?TWF0aGlldS1E?=
 =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220630142347.22485226@redhat.com>
In-Reply-To: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 30 Jun 2022 09:36:47 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> Allow -numa without initiator value when hmat=on so that we may
> build more complex topologies, e.g. NUMA nodes whose best initiators
> are not just another single node.
>

patches looks fine code-wise,
however something wrong with them, i.e. 'git am' doesn't like them
nor ./scripts/checkpatch (which one should use before sending patches).

I've checked it's not my mail server/client issue(or whatever)
that corrupts them (ones downloaded from patchew are broken as well)

> changes v3->v4
> * use -numa cpu instead of legacy cpus=
> changes v2->v3:
> * improve messages for patches 0/4 and 3/4
> changes v1->v2:
> * add q35 acpi test
> 
> Brice Goglin (4):
>    hmat acpi: Don't require initiator value in -numa
>    tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
>    tests: acpi: q35: add test for hmat nodes without initiators
>    tests: acpi: q35: update expected blobs *.hmat-noinitiators
> 
>   hw/core/machine.c                             |   4 +-
>   tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
>   tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
>   tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
>   tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>   tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>   tests/qtest/bios-tables-test.c                |  49 ++++++++++++++++++
>   7 files changed, 50 insertions(+), 3 deletions(-)
>   create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
> 


