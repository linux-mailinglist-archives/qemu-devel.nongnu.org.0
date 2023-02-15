Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324656984EF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNkX-0007O8-1A; Wed, 15 Feb 2023 14:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pSNkR-0007LL-Fy
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:47:24 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pSNkP-00059w-Qm
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:47:23 -0500
Received: by mail-wr1-x436.google.com with SMTP id a2so20309695wrd.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=biYTv1KrIOn/rRnd6jYNDAxXi6lHTwPVoYtJhDKMIpw=;
 b=iJF2YJcR5FO6uIiQtECdmfsf7lsCPg41fUrQTnvWqSyLXfUKj8ejsTS42SH1XFK+Vv
 vJXcDfOTBy+hL8wpSD4WrrOwpUIpby5wUL3I3gS1Ahlg4n/pLx/Eyfqg3k1Rrqa9iA5Y
 o7JCWFuOLZTqu5Y+udqasAlp6egBo1Qgbv/whk0z1JubUr2NXnr1XIO8/xPUnbkSx0JA
 AbWFaYxuca9juYqF/DvNgN9WC4tV+zX23TNXIgPWtLFikDr9mnYgYPW4TgDnTbeh8NAL
 Js/H22rMjCjeyPs+DX+04KIxAS0ZKdczIGsai2CB3QPM258OZTJgNyWhQJoOZGKkEyss
 eENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=biYTv1KrIOn/rRnd6jYNDAxXi6lHTwPVoYtJhDKMIpw=;
 b=nwF9rQydzt8Eo0pOTkIH+LcPvMizVvAfXBd9lddU3h+oJuj6L2SC3aLrWw4QLtr26f
 3bGa9eM+vcz0k0S89DSjC1phL/FIThxGKSCoek+X5yIcFb1YCLB7az5vQZn0wXH7q1KU
 V50SJXGiKgNolFD41xxozOBPM4l/p7jz8xIAsEI+x1wTx/I4S/ulotIjivR8UQ+M+q2y
 WdKy2OiyIacPVo+HDDpO9/AfVWbXnIntBrjugACbjtu4nT/UrVv2tP5KEO8cJp8KshMX
 vsjvJXuGrqmy9aVAfMCbvlBDi7gkdAudtCE8kGRkzAhqqQcG/K/rOwgCrlmDeb356/pd
 vR9w==
X-Gm-Message-State: AO0yUKXazoAps3ndgfuxz28WEy70w04taaUtun9TlgEuQkIjhDiu7oR6
 1XDUzm4ze1Hdvddv8Ai7aeTnkw==
X-Google-Smtp-Source: AK7set8pm5SwlnLGwQeKoXHjnntroBqfz+onDoTwZpDlfcAAWeH+zofnYjqlRSptTfKY4znIhhz6ag==
X-Received: by 2002:a05:6000:1c0c:b0:2c5:4c9f:cf3b with SMTP id
 ba12-20020a0560001c0c00b002c54c9fcf3bmr342407wrb.7.1676490439501; 
 Wed, 15 Feb 2023 11:47:19 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 h10-20020adfe98a000000b002c5501a5803sm11406478wrm.65.2023.02.15.11.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:47:18 -0800 (PST)
Date: Wed, 15 Feb 2023 19:47:18 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
Message-ID: <Y+02xgL5RhO3vh6S@myrica>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-13-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205094411.793816-13-smostafa@google.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Mostafa,

On Sun, Feb 05, 2023 at 09:44:07AM +0000, Mostafa Saleh wrote:
> Allow TLB to be tagged with VMID.
> 
> If stage-1 is only supported, VMID is set to -1 and ignored from STE
> and CMD_TLBI_NH* cmds.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 24 +++++++++++++++---------
>  hw/arm/smmu-internal.h       |  2 ++
>  hw/arm/smmuv3.c              | 12 +++++++++---
>  include/hw/arm/smmu-common.h |  5 +++--
>  4 files changed, 29 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 541c427684..028a60949a 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -56,10 +56,11 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>             (k1->level == k2->level) && (k1->tg == k2->tg);

I'm getting some aliasing in the TLB, because smmu_iotlb_key_equal() is
missing the VMID comparison. With that fixed my handful of tests pass

Thanks,
Jean


