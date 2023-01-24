Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E538B679F29
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 17:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKMSb-00019s-SA; Tue, 24 Jan 2023 11:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKMST-00014E-4e
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:47:46 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKMSO-0000md-ER
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 11:47:40 -0500
Received: by mail-pj1-x102a.google.com with SMTP id lp10so12131817pjb.4
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 08:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l5UFNlo87HYCjRuV0v9OXAtBOngBlaZT5HNlM8zZwF0=;
 b=gLrVGuyaltCyCMKe1qJSROQt32Rt00/lMr7h56SHQ4SkqM1wR5EfTzar9HhiugwJnT
 0e46JZ+ptaBW8V5wQI3Ve2yrqf6unM8nxzqh43nYO5VBccitk8z5PER3m8OTJ000mQL0
 5rIT9SSyPbs97MF0+L5dSXj7lhg6N2CUHX3toPUrEAGEtzOmPuLUtQFMl/pLZO7z6GA3
 osKM8uYtWgJyMSOZcHE/+RAg0hzwtcB/QcZV+/ZPvMMoVHc/mfLP87I2GxqzrQ+ZJMQI
 bX1vcuj4qbvemFaI3ioxipFZ2CKMMSRggxahQA1bVNQQpIEkSSrXy99DbcVUKikIOQYn
 iH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5UFNlo87HYCjRuV0v9OXAtBOngBlaZT5HNlM8zZwF0=;
 b=DnNJmaFkkHc8zoOMFQKGLpmlkTDBIhR/oTck4/xdgJERKaP059A6BddIjZYgGfo5C+
 1u+ezgCL5zJGxSpV+WEZQDRkeKCS0WdbQ6/qBPJecjqGtAX8iWtIKDyos0qwI28QiOO+
 dv4IRFNMh9oyz7QVw4PeQKCp5+rypOcG9iC9ATlVcrTr6DcHEaQgqxhAuGE24xClV3AU
 uonWdzgRAhI3j6kk6GJuNAQ1jY2AWBNJ0fLNedlSrHiqAkauSqizKgy1RCvcVRLtO2kI
 US8qH3lxdmrCr297bD2L6otl3U6I+i3zmqflk0iSqtpgV01Tjzvs9ekWqV7iUTLy5tv2
 HGFw==
X-Gm-Message-State: AO0yUKXEd19qbU7mnTVJmOZ6q+Y6ApUMFjqokIP4EoPDUbwIYlJWE4Bq
 bS4Ls8mPGkStMp02voUBonI6V6wBHC759PAfEPLMxA==
X-Google-Smtp-Source: AK7set+pmm24nyT5TCdKrfiFaAiOyNWy+4h2dKOgJ4Nst/UEJ67umAukRy9hyeZ53Fq0D4+j04oDBIa8Qmtvv4vmT2E=
X-Received: by 2002:a17:90a:8a0b:b0:22b:e329:7262 with SMTP id
 w11-20020a17090a8a0b00b0022be3297262mr726866pjn.221.1674578854781; Tue, 24
 Jan 2023 08:47:34 -0800 (PST)
MIME-Version: 1.0
References: <20221223090107.98888-1-agraf@csgraf.de>
In-Reply-To: <20221223090107.98888-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2023 16:47:23 +0000
Message-ID: <CAFEAcA8Mk_E7e5dYZoC3qzm4DV2Brdqj4Of_VkaxDfe4wSV-ug@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 23 Dec 2022 at 09:01, Alexander Graf <agraf@csgraf.de> wrote:
>
> The finalize_gic_version() function tries to determine which GIC version
> the current accelerator / host combination supports. During the initial
> HVF porting efforts, I didn't realize that I also had to touch this
> function. Then Zenghui brought up this function as reply to my HVF GICv3
> enablement patch - and boy it is a mess.
>
> This patch set cleans up all of the GIC finalization so that we can
> easily plug HVF in and also hopefully will have a better time extending
> it in the future. As second step, it explicitly adds HVF support and
> fails loudly for any unsupported accelerators.
>
> Alex
>
> v1 -> v2:
>
>   - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
>   - Include TCG header for tcg_enabled()
>
> v2 -> v3:
>
>   - Fix comment
>   - Flip kvm-enabled logic for host around
>
> Alexander Graf (2):
>   hw/arm/virt: Consolidate GIC finalize logic
>   hw/arm/virt: Make accels in GIC finalize logic explicit

Since AIUI these patches depend on "hvf: arm: Add support for GICv3",
would you mind including these when you respin that one (ie make
a series-of-3-patches)? That way I don't need to keep this series
on my to-review queue just because it's blocked on another patch :-)

thanks
-- PMM

