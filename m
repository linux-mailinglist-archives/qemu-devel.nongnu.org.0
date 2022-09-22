Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392A15E605B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:04:02 +0200 (CEST)
Received: from localhost ([::1]:41242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJzt-0003on-9P
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obJsg-0006RE-41
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:56:35 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obJsd-0005ak-JH
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:56:33 -0400
Received: by mail-ej1-x62a.google.com with SMTP id z13so946007ejp.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 03:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=mKRN0hGhkKh2+EDicXlCcAoC/2R+bdIfPZsc4k4IaNQ=;
 b=xGgyVkzDafjjsJ3iOj7C7BqNwTlxmwz4pmRbha7+6bcOuJjdMisIVtZiPm1LQmnTAK
 +/iZM4IEFBJt6HC+VylS1o0MA5dC1rmE9MZfFw7MnLC3QxX8r/AVmMPZWHghEweK3aQt
 +Okr1Mf9nISQ0S/aEx0PXULczjIofGgUQDDHBXmPCVaCHxjFRviueHM0kQvW1OPTEOj3
 DcDY13ErsWGmM8BRkn1+mpPlK2ALsrgWayVc0qF4Lnou5774jl/ST5CHZmmnVVLzDbsp
 FiPJ2l9zBxeQIm0MONyuObz/YQKXGGbf7xbfLz7gJRlGU+64e6G3mN2SheUa9PiPb/+Q
 OIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=mKRN0hGhkKh2+EDicXlCcAoC/2R+bdIfPZsc4k4IaNQ=;
 b=mXtRKNv5SMbxjQLxYra7kLHabKX8T1j6LayLbB4KsfWA42akQMm24fm+tuoPcp95/S
 VPRIAHGV8+ukNhaEjMGdu+tWdxzU11Ipesb3yGomdXaCKpIorhZQC/CfAs7Ol0xafI70
 0yefRMFWfhIWKDFpyLIolMRV9tMsTfEWhZZrKN7b9odyP9R+HjEH+X1xGSK280nxAcFz
 ux3oco4myR1gVYif4P6xm9uSzRDAoprP0/sq+HdBOVDjfET1T4mSAvJklrT16k2D2OVu
 f4OxSNpBN1N1DKw+z6/JPDe7Qnbdd9IXflIITr0UQfPm7Mvc7u/+TH3SQOC3hC8MgnFe
 l73g==
X-Gm-Message-State: ACrzQf3BwHrCsppYbDVlkfCcYe0St67nUKALHQTHZURZb3rH4mB/D48d
 ui5Jd0jfjgm1eAaYoarCBlt8OWrDmFdD8w6WsGWChg==
X-Google-Smtp-Source: AMsMyM6sHedQy517Jccz8BJNQcB7pyecbPTP9rd5xtdd2foJCPBkkBFDZbbBGd80PlCtmr7uivL0TT2F4oEW/wWyVMA=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr2175928ejc.504.1663844189857; Thu, 22
 Sep 2022 03:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 11:56:18 +0100
Message-ID: <CAFEAcA83JeFLs+=mW2npa_5QLsJ_fzMxS2fD4=qHUhMJwYbJKg@mail.gmail.com>
Subject: Re: [PATCH v2 00/66] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a major reorg to arm page table walking.  While the result
> here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
> (HAFDBS), the ultimate goal is the Realm Management Extension (RME).
> RME "recommends" that HAFDBS be implemented (I_CSLWZ).
>
> For HAFDBS, being able to find a host pointer for the ram that
> backs a given page table entry is required in order to perform the
> atomic update to that PTE.  The easiest way to find a host pointer
> is to use the existing softtlb mechanism.  Thus all of the page
> table walkers have been adjusted to take an mmu_idx that corresponds
> to the regime in which the page table is stored.  In some cases,
> this is a new "physical" mmu_idx that has a permanent 1-1 mapping.
>
> For RME, "physical" addresses also have page permissions, coming
> from the Root realm Granule Protection Table, which can be thought
> of as a third stage page table lookup.  So eventually the new
> Secure and Nonsecure physical mmu indexes will joined by
> Realm and Root physical mmu indexes, and all of them will take
> the new Granule Page Table into account.
>
> Previously, we had A-profile allocate separate mmu_idx for secure
> vs non-secure.  I've done away with that.  Now, I flush all mmu_idx
> when SCR_EL3.NS is changed.  I did not see how we could reasonably
> add 8 more mmu_idx for Realm.  Moreover, I had a look through ARM
> Trusted Firmware, at the code paths used to change between Secure
> and Nonsecure.  We wind up flushing all of these mmu_idx anyway while
> swapping the EL1+EL2 cpregs, so there is no gain at all in attempting
> to keep them live at the same time within qemu.

Hi; I'm going to take patches 1, 3-16, 18 and 20 into
target-arm.next:

>   target/arm: Create GetPhysAddrResult
>   target/arm: Use GetPhysAddrResult in get_phys_addr_lpae
>   target/arm: Use GetPhysAddrResult in get_phys_addr_v6
>   target/arm: Use GetPhysAddrResult in get_phys_addr_v5
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav5
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav7
>   target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav8
>   target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
>   target/arm: Remove is_subpage argument to pmsav8_mpu_lookup
>   target/arm: Add is_secure parameter to v8m_security_lookup
>   target/arm: Add secure parameter to pmsav8_mpu_lookup
>   target/arm: Add is_secure parameter to get_phys_addr_v5
>   target/arm: Add is_secure parameter to get_phys_addr_v6
>   target/arm: Add secure parameter to get_phys_addr_pmsav8
>   target/arm: Add is_secure parameter to pmsav7_use_background_region
>   target/arm: Add secure parameter to get_phys_addr_pmsav7
>   target/arm: Add is_secure parameter to get_phys_addr_pmsav5

I haven't looked at the second half of the patchset yet -- I'll
come back to this after having worked through the rest of my
to-review queue.

thanks
-- PMM

