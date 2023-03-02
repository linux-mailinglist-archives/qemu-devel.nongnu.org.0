Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1488A6A7873
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 01:39:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXWwz-00014q-Ql; Wed, 01 Mar 2023 19:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXWwv-0000xr-Bk
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 19:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXWws-0005LG-GX
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 19:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677717448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KXFACnV+59dMpo0TGrMpbD8WjLvSsSyYWtPjWzzduzc=;
 b=CuikHYlImsR9UEcD9pObzzC5SdcUhXwjV44C+k9hPMdn0ag8dmkRvENfLs6QX+eMhHTP2w
 JCsgnV8mpWPuPIRmxLA0MDxPe08vP4EjyBvTZnu+RVhkjbzXCinZ5Tw6Y2XWBWHxDLJs6D
 W4fgfOYk5R7B02K0mVCVgG6MjASS29U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-536-ayQS8RMLM0WozyM5KF3WaA-1; Wed, 01 Mar 2023 19:37:27 -0500
X-MC-Unique: ayQS8RMLM0WozyM5KF3WaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 t1-20020a7bc3c1000000b003dfe223de49so424581wmj.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 16:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677717446;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXFACnV+59dMpo0TGrMpbD8WjLvSsSyYWtPjWzzduzc=;
 b=FMhs8wMDjiVATW4A7eBg47usVMWYnisBi0TAHLuIJo+XCRqHLWsG1mg9nzRqpEcT/H
 Iir9YdWjLWiFxPkClBQvCErprGfO7h5lawIsN2SG09X6d3wSF9BdvoAHqXCX+zGqEGiO
 /UCEb55QmknPuquzUDrRtx0KIeiYL7txhydV5IOf8ytqt8QdYCin15UZoFtXvBPzGWoF
 Qeu27W9MtnrhzB4tPLCUcOJNjjJ2SBf8TgiDWgeDLTa4JNeqR6pft+fMeu/Ad8yehRN6
 iZvxcTsjuvtCe//ArBU4jvhLxpzqJMZamfgqP0bmI0tasBDjtfoGcLClDC1TzofCyTG8
 Xc2A==
X-Gm-Message-State: AO0yUKXm+SyIjwY1nxqNagccYB/IM9DgDVBpOi2y33Nk7jULGFeCo9Z+
 82bKE2D0cCSuLRcrl/PE3RXdQ3D/emO4gExJ9eW4HPcxF8dQ+TdZRX5TtOCs5Sg8yq6DWQwyEpt
 9dtAtDYUdrD79Rt4=
X-Received: by 2002:a05:600c:458a:b0:3eb:37ce:4c38 with SMTP id
 r10-20020a05600c458a00b003eb37ce4c38mr6697729wmo.3.1677717445797; 
 Wed, 01 Mar 2023 16:37:25 -0800 (PST)
X-Google-Smtp-Source: AK7set894yy3jmIj6ojIbVQpCQFSMoNKwoZOVlWg1oz9Vr1QV+oqer2fb9xPHag36lC8DOfjNhV8Hg==
X-Received: by 2002:a05:600c:458a:b0:3eb:37ce:4c38 with SMTP id
 r10-20020a05600c458a00b003eb37ce4c38mr6697719wmo.3.1677717445411; 
 Wed, 01 Mar 2023 16:37:25 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 hn30-20020a05600ca39e00b003e21f01c426sm1054769wmb.9.2023.03.01.16.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 16:37:24 -0800 (PST)
Date: Wed, 1 Mar 2023 19:37:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, ani@anisinha.ca, berrange@redhat.com
Subject: Re: [PATCH 14/33] tests: acpi: update expected blobs
Message-ID: <20230301193658-mutt-send-email-mst@kernel.org>
References: <20230224153812.4176226-1-imammedo@redhat.com>
 <20230224153812.4176226-15-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224153812.4176226-15-imammedo@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 24, 2023 at 04:37:53PM +0100, Igor Mammedov wrote:
> only following context change:
>  -  Local1 = Zero
>     If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
>     {
>         Return (Local0)
>  ...
>         Return (Local0)
>     }
> 
>  +  Local1 = Zero
>     Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h   |  35 ------------------
>  tests/data/acpi/pc/DSDT                       | Bin 6360 -> 6360 bytes
>  tests/data/acpi/pc/DSDT.acpierst              | Bin 6283 -> 6283 bytes
>  tests/data/acpi/pc/DSDT.acpihmat              | Bin 7685 -> 7685 bytes
>  tests/data/acpi/pc/DSDT.bridge                | Bin 12487 -> 12487 bytes
>  tests/data/acpi/pc/DSDT.cphp                  | Bin 6824 -> 6824 bytes
>  tests/data/acpi/pc/DSDT.dimmpxm               | Bin 8014 -> 8014 bytes
>  tests/data/acpi/pc/DSDT.hpbridge              | Bin 6323 -> 6323 bytes
>  tests/data/acpi/pc/DSDT.ipmikcs               | Bin 6432 -> 6432 bytes
>  tests/data/acpi/pc/DSDT.memhp                 | Bin 7719 -> 7719 bytes
>  tests/data/acpi/pc/DSDT.nohpet                | Bin 6218 -> 6218 bytes
>  tests/data/acpi/pc/DSDT.numamem               | Bin 6366 -> 6366 bytes
>  tests/data/acpi/pc/DSDT.roothp                | Bin 9745 -> 9745 bytes
>  tests/data/acpi/q35/DSDT                      | Bin 8252 -> 8252 bytes
>  tests/data/acpi/q35/DSDT.acpierst             | Bin 8269 -> 8269 bytes
>  tests/data/acpi/q35/DSDT.acpihmat             | Bin 9577 -> 9577 bytes
>  tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 8531 -> 8531 bytes
>  tests/data/acpi/q35/DSDT.applesmc             | Bin 8298 -> 8298 bytes
>  tests/data/acpi/q35/DSDT.bridge               | Bin 11481 -> 11481 bytes
>  tests/data/acpi/q35/DSDT.core-count2          | Bin 32392 -> 32392 bytes
>  tests/data/acpi/q35/DSDT.cphp                 | Bin 8716 -> 8716 bytes
>  tests/data/acpi/q35/DSDT.cxl                  | Bin 9578 -> 9578 bytes
>  tests/data/acpi/q35/DSDT.dimmpxm              | Bin 9906 -> 9906 bytes
>  tests/data/acpi/q35/DSDT.ipmibt               | Bin 8327 -> 8327 bytes
>  tests/data/acpi/q35/DSDT.ipmismbus            | Bin 8340 -> 8340 bytes
>  tests/data/acpi/q35/DSDT.ivrs                 | Bin 8269 -> 8269 bytes
>  tests/data/acpi/q35/DSDT.memhp                | Bin 9611 -> 9611 bytes
>  tests/data/acpi/q35/DSDT.mmio64               | Bin 9382 -> 9382 bytes
>  tests/data/acpi/q35/DSDT.multi-bridge         | Bin 12545 -> 12545 bytes
>  tests/data/acpi/q35/DSDT.nohpet               | Bin 8110 -> 8110 bytes
>  tests/data/acpi/q35/DSDT.numamem              | Bin 8258 -> 8258 bytes
>  tests/data/acpi/q35/DSDT.pvpanic-isa          | Bin 8353 -> 8353 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm12            | Bin 8858 -> 8858 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2             | Bin 8884 -> 8884 bytes
>  tests/data/acpi/q35/DSDT.viot                 | Bin 9361 -> 9377 bytes

this one is unfortunately malformed, and tests fail if I apply it.


>  tests/data/acpi/q35/DSDT.xapic                | Bin 35615 -> 35615 bytes
>  36 files changed, 35 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 7e7745db39..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,36 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/pc/DSDT",
> -"tests/data/acpi/pc/DSDT.acpierst",
> -"tests/data/acpi/pc/DSDT.acpihmat",
> -"tests/data/acpi/pc/DSDT.bridge",
> -"tests/data/acpi/pc/DSDT.cphp",
> -"tests/data/acpi/pc/DSDT.dimmpxm",
> -"tests/data/acpi/pc/DSDT.hpbridge",
> -"tests/data/acpi/pc/DSDT.ipmikcs",
> -"tests/data/acpi/pc/DSDT.memhp",
> -"tests/data/acpi/pc/DSDT.nohpet",
> -"tests/data/acpi/pc/DSDT.numamem",
> -"tests/data/acpi/pc/DSDT.roothp",
> -"tests/data/acpi/q35/DSDT",
> -"tests/data/acpi/q35/DSDT.acpierst",
> -"tests/data/acpi/q35/DSDT.acpihmat",
> -"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
> -"tests/data/acpi/q35/DSDT.applesmc",
> -"tests/data/acpi/q35/DSDT.bridge",
> -"tests/data/acpi/q35/DSDT.core-count2",
> -"tests/data/acpi/q35/DSDT.cphp",
> -"tests/data/acpi/q35/DSDT.cxl",
> -"tests/data/acpi/q35/DSDT.dimmpxm",
> -"tests/data/acpi/q35/DSDT.ipmibt",
> -"tests/data/acpi/q35/DSDT.ipmismbus",
> -"tests/data/acpi/q35/DSDT.ivrs",
> -"tests/data/acpi/q35/DSDT.memhp",
> -"tests/data/acpi/q35/DSDT.mmio64",
> -"tests/data/acpi/q35/DSDT.multi-bridge",
> -"tests/data/acpi/q35/DSDT.nohpet",
> -"tests/data/acpi/q35/DSDT.numamem",
> -"tests/data/acpi/q35/DSDT.pvpanic-isa",
> -"tests/data/acpi/q35/DSDT.tis.tpm12",
> -"tests/data/acpi/q35/DSDT.tis.tpm2",
> -"tests/data/acpi/q35/DSDT.viot",
> -"tests/data/acpi/q35/DSDT.xapic",
> diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
> index 0b475fb5a966543fef2cd7672a0b198838a63151..ec133a6d3aabcfd22b7b46019338db2de255da70 100644
> GIT binary patch
> delta 19
> acmca%c*Af*JmcgfMinN8#LcaY!Quc(l?Foq
> 
> delta 20
> bcmca%c*Af*JR@@fL*nFkMwQKNj6vc6P%j3t
> 
> diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
> index 17ef7caeb6fe4445f1234ff060c3db6809184ef6..2b4b7f31919f360e038e37de713639da753f13aa 100644
> GIT binary patch
> delta 19
> acmeA+>^9sG&p0`WQH6;iadRspn>YYICk0#p
> 
> delta 20
> bcmeA+>^9sG&&XWBkT^M>QDt)*Bda(7L?;Ex
> 
> diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
> index 675b674eaa92d99513ac243a97064d369791ee53..714a123e7a500cf0f862ff6c4e9a3f50a96af056 100644
> GIT binary patch
> delta 19
> acmZp*X|>r9&p0`WQH6;iadRtUgA4#az6Ip~
> 
> delta 20
> bcmZp*X|>r9&&XWBkT^M>QDt)*W4#OjMaTwI
> 
> diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
> index c1ce06136619f55c084a34c51997c059c29cb06a..6c0543cf75ad3e02468ed4925fd3369a183e9b45 100644
> GIT binary patch
> delta 19
> acmX?}csy}KJmcgfMinN8#LcaYPWk{%hX#lM
> 
> delta 20
> bcmX?}csy}KJR@@fL*nFkMwQKNjE?#MR9^=6
> 
> diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
> index 754ab854dc48fc1af2d335e7269c23a056e66eb8..e1bcb0a4f3ee1269bdd5e949206b40d0e3c076e6 100644
> GIT binary patch
> delta 19
> acmZ2sy25lrJmcgfMinN8#LcaY%8~#={{_7O
> 
> delta 20
> bcmZ2sy25lrJR@@fL*nFkMwQKNj7pLKNkIlH
> 
> diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
> index 170503336b3fd94cc7a4356003fa080f0ef57b01..1c90e119c5d3dc7e86d04942114e5cfe40de6039 100644
> GIT binary patch
> delta 19
> acmX?Scg}7@JmcgfMinN8#LcaYCuIRj*#^Y`
> 
> delta 20
> bcmX?Scg}7@JR@@fL*nFkMwQKNj3;CPQF#Y5
> 
> diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
> index 5dea100bc9492bb2367aac8660522201785c1efb..04e1c20f63be7c6c574e72590332707ca410852a 100644
> GIT binary patch
> delta 19
> acmdmNxY=++JmcgfMinN8#LcaYdg1^?7X{P+
> 
> delta 20
> bcmdmNxY=++JR@@fL*nFkMwQKNjJo0gN@oT_
> 
> diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
> index dd7135602709fc4a361930c74f9bebc6b32e6916..3c2aba132f10b5e4a9931877533a9d8f260b7381 100644
> GIT binary patch
> delta 19
> acmZ2rw7_UXJmcgfMinN8#LcaYv&8{IX9gVr
> 
> delta 20
> bcmZ2rw7_UXJR@@fL*nFkMwQKNjI+c6NRtMO
> 
> diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
> index 2f895e9b385c1ae2f58c7ade4de02328b1be7356..811965f42d97adadde6e9ec6d6153e767041bc6d 100644
> GIT binary patch
> delta 19
> acmZ2(v)pDwJmcgfMinN8#LcaYi(~*q$_7gS
> 
> delta 20
> bcmZ2(v)pDwJR@@fL*nFkMwQKNj0<G|OBe>Z
> 
> diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
> index c012b63ace2f359eec0368ed22ef507ee3905c78..bbf73023ade329770ff9f9ac5c897218764182b5 100644
> GIT binary patch
> delta 19
> acmX?QaLQmqJmcgfMinN8#LcaYN5ue0UIvx`
> 
> delta 20
> bcmX?QaLQmqJR@@fL*nFkMwQKNj7P)(PTB_q
> 
> diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
> index f2ef4b97290cc58c514c3ce7fd45cb08214d7138..c5d93366a417ad1a92c01659f1db9c159caa7132 100644
> GIT binary patch
> delta 19
> acmca-c+YS{JmcgfMinN8#LcaYk>UVKc?MMg
> 
> delta 20
> bcmca-c+YS{JR@@fL*nFkMwQKNj1l4hQ6C1w
> 
> diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
> index 657c8263f0c649abc806a67576fd74cb32af60c3..9e3d482366bd800cf987044801eebc814629b15b 100644
> GIT binary patch
> delta 19
> acmbQ}Gtp;5JmcgfMinN8#LcaYJt_c0t_Cpx
> 
> delta 20
> bcmbQ}Gtp;5JR@@fL*nFkMwQKNjNK{#N$>`r
> 
> diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
> index d68c472b460e4609a64ea67de3c4cebfca76164d..c304e15e366d7317fd0e9db0a144f02e0437d7a1 100644
> GIT binary patch
> delta 19
> acmdnvu*YG864PW=CKV=z#LXT|Ut|G790nW!
> 
> delta 20
> bcmdnvu*YG85)*R)L*is5CY8;eOrK=|NfZW(
> 
> diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
> index de7ae27125f9667d7aa7a7cc0e8210773b61a2e2..3aa5c4b3193d32bb8263a1fe06c05b714541c532 100644
> GIT binary patch
> delta 19
> acmX@>aModi64PW=CKV=z#LXT|ta1QCqXkd^
> 
> delta 20
> bcmX@>aModi5)*R)L*is5CY8;eOe}H$NxcQW
> 
> diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
> index 48e2862257ac614b5fd6391c4ec425106c48afb1..3ffbf8f83f64144ace17ff5f06bcb4fec9df33d9 100644
> GIT binary patch
> delta 19
> acmaFq_0nsD64PW=CKV=z#LXT|ipl^;Bn7<y
> 
> delta 20
> bcmaFq_0nsD5)*R)L*is5CY8;eObW^XPl^UB
> 
> diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
> index 30a4aa2ec8feb6012a64d476ff37b14717d20eaf..ebec32b575d310f98937fe9208f0c60349ca753d 100644
> GIT binary patch
> delta 19
> acmccYblGWx64PW=CKV=z#LXT|-0}cJ%mrrv
> 
> delta 20
> bcmccYblGWx5)*R)L*is5CY8;eOkDB+O7;cS
> 
> diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
> index 84e2b5cbc4483ae93634f223160253231dcc4932..b0994644ec811b962e80f49e36e122967f5af1d1 100644
> GIT binary patch
> delta 19
> acmaFm@XBF>64PW=CKV=z#LXT|N^$^3@dc*<
> 
> delta 20
> bcmaFm@XBF>5)*R)L*is5CY8;eOp0;<PDKV4
> 
> diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
> index e411d40fd1e297879d78dcf15486dd465ab54568..8e11b8ea4862c8ec27376703c9c43e9895ca60eb 100644
> GIT binary patch
> delta 19
> acmcZ^c{6f@64PW=CKV=z#LXT|6SV+H$p$h2
> 
> delta 20
> bcmcZ^c{6f@5)*R)L*is5CY8;eOcS&KP%Q?a
> 
> diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
> index 0603db8cc63cfc562f83e55eaf5162e7c29bf4d1..a895599c3c53c0cd0888ec166a30d6c036d26b93 100644
> GIT binary patch
> delta 21
> ccmeD9%h>Ukaf1@mWK|{=CWge#9!w5309TO)+W-In
> 
> delta 22
> dcmeD9%h>Ukaf1>Qa{)u*WF;n*&7Ms5H2`0o2T1?`
> 
> diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
> index beeb83c33b385fc8b41d44f299b8d9ba7203d935..725998cb587c02ac963f290bac5c14d665bc85e9 100644
> GIT binary patch
> delta 19
> acmeBi>2cYh#57rzNrj0aakB^05qSVRh6R=Y
> 
> delta 20
> bcmeBi>2cYh#Kc^{kT_Y1NoBJq(_wi4LM8?T
> 
> diff --git a/tests/data/acpi/q35/DSDT.cxl b/tests/data/acpi/q35/DSDT.cxl
> index 3d18b9672d124a0cf11a79e92c396a1b883d0589..04c2c66a25536854b4305787c8e0b41e96c3c133 100644
> GIT binary patch
> delta 19
> acmaFm^~!6564PW=CKV=z#LXT|O3DC8N(I0G
> 
> delta 20
> bcmaFm^~!655)*R)L*is5CY8;eOp3|?PqGFs
> 
> diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
> index 99a93e12a7faac78e9524ad6758f42c5c0df18eb..ef643b4ee02cacb9a55f89b8e7f05524125515a1 100644
> GIT binary patch
> delta 19
> acmdnwyUBNh64PW=CKV=z#LXT|St<ZQVFjN6
> 
> delta 20
> bcmdnwyUBNh5)*R)L*is5CY8;eOqnVGNM8mG
> 
> diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
> index 7f7601dbff820044aa646048c0bfe0e6324b9d0d..b136aea961c89a97db09db9b68809979564d8faf 100644
> GIT binary patch
> delta 19
> acmZp7Y<JwC#57rzNrj0aakB@Ly&M2JVFdsH
> 
> delta 20
> bcmZp7Y<JwC#Kc^{kT_Y1NoBJqlbsv@Kk)@_
> 
> diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
> index 6c5d1afe443d9261d3b93801711f8d5b267696f3..0970dbd5896fc0038b1369dbbcc982ead7736ae6 100644
> GIT binary patch
> delta 19
> acmbQ@IK^>;64PW=CKV=z#LXT|K5_s%PX#9c
> 
> delta 20
> bcmbQ@IK^>;5)*R)L*is5CY8;eOx|(;LHPxh
> 
> diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
> index de7ae27125f9667d7aa7a7cc0e8210773b61a2e2..3aa5c4b3193d32bb8263a1fe06c05b714541c532 100644
> GIT binary patch
> delta 19
> acmX@>aModi64PW=CKV=z#LXT|ta1QCqXkd^
> 
> delta 20
> bcmX@>aModi5)*R)L*is5CY8;eOe}H$NxcQW
> 
> diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
> index 79bce5c8f0132e72b8e700488ea56c7593737810..9709e5a7a7edcb7509954b553f7bf29a424033db 100644
> GIT binary patch
> delta 19
> acmeD7?)KiG#57rzNrj0aakB@LvoZiXQUxUd
> 
> delta 20
> bcmeD7?)KiG#Kc^{kT_Y1NoBJqlan$4LH-4k
> 
> diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
> index c249929add97439ceb9f891d44c425311517ad18..e1cd01f2349bb8c2f7f8badad11441ffe6d57acc 100644
> GIT binary patch
> delta 19
> acmZ4Hxy*Be64PW=CKV=z#LXT|aY_I`4+U`m
> 
> delta 20
> bcmZ4Hxy*Be5)*R)L*is5CY8;eOtDG;MePOO
> 
> diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
> index f2f60fdbb3b44ab9adb69bb36e4a80978536af9b..3b9dffb565833cc87bbf08dadfc1f31ac858e93b 100644
> GIT binary patch
> delta 19
> acmZonYE0Uo#57rzNrj0aakB^0PCWoU?*+gB
> 
> delta 20
> bcmZonYE0Uo#Kc^{kT_Y1NoBJq(+)iVM70Jk
> 
> diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
> index 9ff9983a80a7487470ccd02ce587200444675816..2cf7f6db0fd8de357278f942a4082e714804dca9 100644
> GIT binary patch
> delta 19
> acmZ2yzs`Px64PW=CKV=z#LXT|X|e!5<^^y7
> 
> delta 20
> bcmZ2yzs`Px5)*R)L*is5CY8;eOsTQ}MZg8#
> 
> diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
> index 1e7c45ef3ccb000a06f64152622b4bd27916d181..310e3d5053b90863f96c29dd69a514b4999b4a19 100644
> GIT binary patch
> delta 19
> acmX@)aL8eU64PW=CKV=z#LXT|zhnVJ00u4q
> 
> delta 20
> bcmX@)aL8eU5)*R)L*is5CY8;eOh07-N(2U+
> 
> diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
> index ed47451c44e3041e5b7fed55de7b6ef1aca54350..6672b6fa05c8ee30a8ea4ab0931d59c1315a4e9c 100644
> GIT binary patch
> delta 19
> acmZ4JxX^Kf64PW=CKV=z#LXT|k#Yb%Jq1nx
> 
> delta 20
> bcmZ4JxX^Kf5)*R)L*is5CY8;eOc8PbL;(f7
> 
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
> index efc2efc19f00ca7564467756616da44f5fd71cfe..eae2dc599331516e11632356f05d7831d1fa1e6a 100644
> GIT binary patch
> delta 19
> acmbQ`I?Hu~64PW=CKV=z#LXT|K?(poy#+%6
> 
> delta 20
> bcmbQ`I?Hu~5)*R)L*is5CY8;eOo0jjLwg0W
> 
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
> index 675339715f72b4400445ce8c0dd12f416aa0efb0..68c6a7d244cfc78efa6b9cd1385f2134ca149ad7 100644
> GIT binary patch
> delta 19
> acmdnuy2W*a64PW=CKV=z#LXT|ISK$knFWym
> 
> delta 20
> bcmdnuy2W*a5)*R)L*is5CY8;eOxX$mM~emj
> 
> diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> index eeb40b360f7c1de93501e1ddcd7dab306a51113b..4d2937a87c4a39993eaa756f02d59ef35a08f1c2 100644
> GIT binary patch
> delta 118
> zcmbQ}xzLl#CD<iop$Y>7Bf~~6A4W#e$>EGUg}4G-f_-@x_^?gRVki(~W@Jd1tjeTf
> z%#c{%=;;#C+>yh;03;Y0k`^dUs-2v~Fgc0mKM*j~CNd`0CRQ?Xu`@tu*2#rT1{@36
> QCuec7E@9lfkm-XW0I$^}K>z>%
> 
> delta 101
> zcmZ4JInk5LCD<ioq6z~8qtiw%A4W!z$>EGUML7dpf_-@xxUfymVki(~W@JbxU`U*-
> z#H6C(=;;#C+>yh;03;Y0k`_o!s-2v~Fgc0mKM*j~CNd`0CRQ?Xu}`jKGT6M4>4PEw
> DoVXuG
> 
> diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
> index 3aa86f07243f0449c7dc245650715d729744e3ee..e9b4881bdc72eb7c59dcf258c1a98363b46bfbcd 100644
> GIT binary patch
> delta 21
> dcmbO~jcNWgrVUC=lU12im>3c_doW$^002#l2H*ey
> 
> delta 22
> ecmbO~jcNWgrVUC=%moaIla-iMHhVH%>i_^$`Ug$`
> 
> -- 
> 2.39.1


