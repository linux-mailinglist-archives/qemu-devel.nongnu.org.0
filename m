Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85E6E7F39
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 18:11:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppAO4-0001z1-VY; Wed, 19 Apr 2023 12:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppAO1-0001yM-NG
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:10:25 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppANz-0001SC-Ds
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 12:10:25 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94a34d3812cso759449966b.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681920621; x=1684512621;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hn0HPwIm+d3/JKoFjaf/cXpINr29WqpsXSXDjDugMHY=;
 b=Yghu9QO9epJsmTHbzPDrLR13qy89WBlGG5Yk9dsjnvAru0B2YnzVOHxEEBOBx0KoX5
 Df1Gep65Higf/pSUYgrRMTQoTyJamA9YFwIbiV06M0aDz/YG20B4Ky/4qs2H1GcbbMAZ
 meV682NROVrc7vAsyfwAjXJPzAFhXOOfV1mdGmrDgGIEqyyAhoPH6/5lIx6AlU/wzalw
 P6niC+uWx8uIuAqlDq6pFQMBmxJVH9qJCXdHJ+f2DW/k8wIysD7CQttTlf93nb0vh5IT
 ZlqyEstKSLR5pGPOnTqD5s0RbeFtDBuWlquu3R6uyVyeg9YwfV3AEkJG2Cr4pQxz8uSg
 umJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681920621; x=1684512621;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hn0HPwIm+d3/JKoFjaf/cXpINr29WqpsXSXDjDugMHY=;
 b=f0NWo9+BkQmwj0hEU437KB4A/ljgvsFr2pioAQgnza1/ZNmDhqQIK0tz+55qHnRtoA
 JIjKwXo193OBj2qn/Wllmcu75ng+KTjrUH1xCSmMM8INsq2BKfQQZn8o5f+DCSXwVfF0
 fFcsk+nqOu0cByQQJrVtA1lkH38ICVOZzOE4F9ZS4LLtm0herzlfEHF5jrt0md+2hbC+
 W0xq6b84KyX89m1VQjxaq82xRrOq68+i9P2SABa15dei24qgCe2koJpizOhGm/+8VLpk
 A0K5RWYN3bJ1jxlHzvn1VLZYFQOkjfsDqYflHI9u8K/tbKZRusBCjLj2z5g3evOGwFMr
 DOTA==
X-Gm-Message-State: AAQBX9cWkgXdy2vS51T26n4LShbKaoUYtwHJBfDyt9Aj/ujrzhrI3J9Y
 hhHosGHP8hY3bZcEHYYIZ14rgI3X8t9FbNIwA2Hy9w==
X-Google-Smtp-Source: AKy350ZFUmulbu7AwMV2sGq6mKBvnNvbgiv5kcpcso3dD6K/z71J2uZh8XlEulNsPcFGlsO7CZkS3U/XJsfcxLZTeek=
X-Received: by 2002:a50:d0c9:0:b0:505:4fb:4430 with SMTP id
 g9-20020a50d0c9000000b0050504fb4430mr3120839edf.6.1681920621316; Wed, 19 Apr
 2023 09:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230419102940.185968-1-zhenzhong.duan@intel.com>
In-Reply-To: <20230419102940.185968-1-zhenzhong.duan@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Apr 2023 17:10:09 +0100
Message-ID: <CAFEAcA_62h5U2jCOJq76pryCjVf3eV-Ovh6Cpwv8rXzNWd1H-w@mail.gmail.com>
Subject: Re: [PATCH v4] memory: Optimize replay of guest mapping
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, peterx@redhat.com, 
 jasowang@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com, 
 richard.henderson@linaro.org, eduardo@habkost.net, david@redhat.com, 
 philmd@linaro.org, chao.p.peng@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 19 Apr 2023 at 11:41, Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:
>
> On x86, there are two notifiers registered due to vtd-ir memory
> region splitting the entire address space. During replay of the
> address space for each notifier, the whole address space is
> scanned which is unnecessary. We only need to scan the space
> belong to notifier monitored space.
>
> While on x86 IOMMU memory region spans over entire address space,
> but on some other platforms(e.g. arm mps3-an547), IOMMU memory
> region is only a window in the entire address space. User could
> register a notifier with arbitrary scope beyond IOMMU memory
> region. Though in current implementation replay is only triggered
> by VFIO and dirty page sync with notifiers derived from memory
> region section, but this isn't guaranteed in the future.
>
> So, we replay the intersection part of IOMMU memory region and
> notifier's scope in memory_region_iommu_replay(). Update doc
> comment to match this change.

Hi; I have a couple of minor wording tweaks, and one question
about the docs:

> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 15ade918baa4..61da32d8a428 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -425,12 +425,13 @@ struct IOMMUMemoryRegionClass {
>       * Called to handle memory_region_iommu_replay().
>       *
>       * The default implementation of memory_region_iommu_replay() is to
> -     * call the IOMMU translate method for every page in the address space
> +     * call the IOMMU translate method for every page falling in the
> +     * intersection part of IOMMU memory region and notifier's scope

"falling in the intersection of the IOMMU MemoryRegion and the
MemoryRegion which the notifier was registered for"

>       * with flag == IOMMU_NONE and then call the notifier if translate
>       * returns a valid mapping. If this method is implemented then it
>       * overrides the default behaviour, and must provide the full semantics
>       * of memory_region_iommu_replay(), by calling @notifier for every
> -     * translation present in the IOMMU.
> +     * translation present in the intersection part.

"present in the IOMMU that is within the MemoryRegion the
notifier was registered for."

Question: is it OK for an implementation of this method to call
the notifier for translations that are in the IOMMU and which
are not in the scope of the notifier (ie which are outside
the intersection) ? Or must it specifically restrict itself
to only calling the notifier for translations which are
inside the notifier's range ?

If the latter, we need to check all 4 existing implementations
of this method to ensure that they are not sending notifications
they should not; if the former, we should document that
implementations have that leeway.

thanks
-- PMM

