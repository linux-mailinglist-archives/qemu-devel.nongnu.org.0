Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1F14B74E0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:56:37 +0100 (CET)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3wC-0002Fj-Q5
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:56:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK3UZ-0007yv-Nv
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:28:04 -0500
Received: from [2a00:1450:4864:20::434] (port=45007
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK3UW-0006Lo-7Y
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:28:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id u1so20079772wrg.11
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RdilMSZ5G3Q8UmLpPWoOtg0YYs6Zcoyt8d2cNdM4CWI=;
 b=xrKqTA7XAoAIFcFhicQoLKBkY2ypGMJE6hrsNeosZh2xCwsRs6tob9GLjq0g9FiGh8
 fpTbAFZBdUEnM2m7MYsGZeE5HpfvvzcQeDAxaGqvRw+xMrAbQQWx63a+4TnEziYdTR6j
 mfoYad3c922Z9+vGOWYRo4i2reDHGTERHDh8HFhYBbr5sKN5xuiEr7wzXh7vklAjF5C5
 E/Hmgn15JPRxBeCiW+XAApZ1ZsKLc6p0kBGOLYwNp4pHEcLjRrUzvctk9bXHsBkLAZXi
 yGRnq/3AcDenlEs3hA+qSiqZ5CON46UunLR03YZH/nr8czblCtbgUcKkz5yadpZOJ+ba
 4rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RdilMSZ5G3Q8UmLpPWoOtg0YYs6Zcoyt8d2cNdM4CWI=;
 b=r1SN3GRRCIcfl6B3M3OdMbKVHhPt3Hj4R5ijqzcGFuXjPdapmCB1hmlce3rOOTFycB
 A3oQVqBsdMzLO7dd2QQHpl/1UOJqTJDStV0yiFUkYR1BUyPj7k6wsnIFbHQ0yNlx9bPh
 bZTkWV2tll+8OuRyCmRcel2JJcMHsL/uEX+V0oUKLj+wg1tlCpbkIMFAF2o74QmlU+t2
 t0Pw90A6bfMDUU6iqLvnYxg8vS7roRvFJbVfnPb2sAwJ0v0HkXek1Df2BX80V2vAXlG6
 mFvuzo/pNtG+Qams97G0aSZJ083P8aTdwDYZVsolXJh4js8xQDCX6aCQiNhr0fJGpdSb
 Gn/A==
X-Gm-Message-State: AOAM530pclQYqutPvHr4CUiPzsUXy5ttFbcNCLTPLJTRVTWmEflgEcB3
 gCH0Shxe0D/AM1OfAOsTdzTKiqpUPm3DNAyvr5pMwg==
X-Google-Smtp-Source: ABdhPJwBntiBQ1g9MYlVprVAyyLVZ34VLY/11pQpiTW0BraXxWT9E9fWBxZv90r2bepJatCNzCj09Zmy13zk9bIM1Ek=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr348387wrs.295.1644953275419; 
 Tue, 15 Feb 2022 11:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20220203142320.33022-1-agraf@csgraf.de>
In-Reply-To: <20220203142320.33022-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 19:27:44 +0000
Message-ID: <CAFEAcA99M7M2vOiOZ+vYNorGyK3kvZ8AhYfZ2=FGzaqQgZRN+A@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Add simple dirty bitmap tracking
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 14:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> The actual tracking of dirty bitmap updates is happening in architecture code.
> So far, the aarch64 hvf code has not updated QEMU's dirty bitmap at all. The
> net result of that is that the VGA device's framebuffer would not update.
>
> This patch adds simplistic dirty bitmap updates. Unfortunately hvf can only set
> permissions per full region, so we have to mark the complete region as dirty
> when only a single byte was modified inside.
>
> We also handle the write protect update logic before we handle any writes.
> This allows us to even handle non-ISV instructions on dirty logging enabled
> memory regions: Once we flip the region to writable again, we just rerun
> the trapping instruction.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/hvf/hvf.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0dc96560d3..92ad0d29c4 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1163,6 +1163,28 @@ int hvf_vcpu_exec(CPUState *cpu)
>              break;
>          }
>
> +        /*
> +         * Dirty log updates work without isv as well. We just run the write
> +         * again with write permissions set. So handle them before the assert.
> +         */

I'm not 100% sure, but I think that this check should come before
the "is this fault caused by a cache maintenance operation, if so
skip it" check, not after. Some cache operations (eg DC IVAC)
require write permission (as opposed to merely announcing themselves
in the syndrome WnR as writes), and we want to really execute them,
not skip them, if we're doing a cache op to RAM rather than to MMIO space.
(My somewhat shaky reading of the KVM kernel sources is that it
effectively does this too.)

> +        if (iswrite) {
> +            uint64_t gpa = hvf_exit->exception.physical_address;
> +            hvf_slot *slot = hvf_find_overlap_slot(gpa, 1);
> +
> +            if (slot && slot->flags & HVF_SLOT_LOG) {
> +                /*
> +                 * HVF can only set a full region's permissions, so let's just
> +                 * mark the full region as dirty.
> +                 */
> +                memory_region_set_dirty(slot->region, 0, slot->size);
> +                hv_vm_protect(slot->start, slot->size, HV_MEMORY_READ |
> +                              HV_MEMORY_WRITE | HV_MEMORY_EXEC);

This looks OK I think, but it is also not the same as the x86 hvf
code. There we have:

    if (write && slot) {
        if (slot->flags & HVF_SLOT_LOG) {
            memory_region_set_dirty(slot->region, gpa - slot->start, 1);
            hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
                          HV_MEMORY_READ | HV_MEMORY_WRITE);
        }
    }

which only marks 'dirty' the 1 byte at the address being accessed,
not the entire slot. Is that a bug in the x86 hvf code, or something
we should also be doing here ?

Also, when we initially set up slots, we pick the permissions like this:
    if (area->readonly ||
        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
    } else {
        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
    }

Are we guaranteed that we never try to mark the non-writeable
(because readonly or romd) slots for dirty-logging, or do we need
to somehow track whether this is a read-only slot so we don't
incorrectly enable writes for it?

(It does make sense that dirty-logging on a read-only area is a bit
pointless, so maybe we do guarantee never to do it.)

> +
> +                /* Run the same instruction again, without write faulting */
> +                break;
> +            }
> +        }

thanks
-- PMM

