Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D54A513455
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 15:01:37 +0200 (CEST)
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3m4-00011m-Ew
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 09:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3jc-0007zt-Fo
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:59:04 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3ja-0002gg-UI
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:59:04 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i38so8803308ybj.13
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jRq2wBEpPNcqdkumVMkeg6cjECg35N5fx2Uzmbr9rLo=;
 b=Cgtq+3dKt8U1KJfYHjzErgQdjdCRhkwyBk7vh/+Bg/LEf40GqZ+aZNM/MrunQ5ZeX8
 sXTZpZvLS09Go2f4W55LjAQuRrmOEw/eyZT2KNaLCnsO8UPpSKrMxR6VXFRC7UXchR53
 edVmaZ+T5T4TDhGMqixV1BEsaTi2thZSlCrSqiOap60aqmPIJ3TzLoGpUBIL2d/eeHWS
 0/gXI1ptEJOXaRqgfODdHVr+of8icYtKu8hfP391EapQugSkTZ2ClUm1Gw03lrI+fBUU
 4LwFhz/XMIkFEa3ID+zz54hIj2QFbAdjoh75nSPX2GH7lQAsXLCcIVkiB2AMAIrOc05Z
 Gm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jRq2wBEpPNcqdkumVMkeg6cjECg35N5fx2Uzmbr9rLo=;
 b=cgTzfL6wbsPvX5s8oSxzsHkr63EnCqGN9LsgAwll8ny70YD+X/Wa4eCCTHxsNCnlF4
 udw+dm0O2Rm9pP+BbdDQSFoGYYf0OXAL2dSKmmU+cJnUj6itftARADnPZ6xvoF/lLXsM
 4mOeWcIXjyBMuro4SbJLcGIbI5QYhiSRoykTdp9HwbA5HdyQDOstoR6FNicvk7BxSCfK
 2ADwsF/vuemqVOq56oJOYMxpPxoRm20oKYjPjfqZvo0yRfPo/ov0rKeNuXPfoddRtiqT
 m6J09exg5OFkeYsyrQCY164921PgW45QU7weA7nLpoNJWg5hXu56D8x+11nHDAPFafq+
 b0Ng==
X-Gm-Message-State: AOAM530nAPyz9Ed5r3mw5awRq2UePdPQbnqtdMLYRYliQ6dGDSpLrChF
 9wLDMEC3Qqwg2BaFfu2UZITh0XfnxTAL+QqrwFB3skPi1/4=
X-Google-Smtp-Source: ABdhPJzfYGQmGpVsKDAEhn41O6LAo27jm3axfu4OgZ7NlEszESieHJcqRdSqQAKhZjHtLk7ljFF7RNcC8J7t0t2EnxQ=
X-Received: by 2002:a25:2fc2:0:b0:647:dcee:b2dd with SMTP id
 v185-20020a252fc2000000b00647dceeb2ddmr24187751ybv.288.1651150741818; Thu, 28
 Apr 2022 05:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220427111543.124620-1-jean-philippe@linaro.org>
In-Reply-To: <20220427111543.124620-1-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:58:50 +0100
Message-ID: <CAFEAcA-ipGkitCW_5oFeuzj1e1LYOKvU-MoU8xJgdXx1bfta3w@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/smmuv3: Cache event fault record
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: eric.auger@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 at 12:17, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The Record bit in the Context Descriptor tells the SMMU to report fault
> events to the event queue. Since we don't cache the Record bit at the
> moment, access faults from a cached Context Descriptor are never
> reported. Store the Record bit in the cached SMMUTransCfg.
>
> Fixes: 9bde7f0674fe ("hw/arm/smmuv3: Implement translate callback")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Applied patches 1 and 2 to target-arm.next, thanks.

For the future, if you send a multi-patch patchset could you
make sure you always send it under a cover letter? Some of our
tooling gets confused if the cover letter is missing (it doesn't
show up in patchew, for example).

thanks
-- PMM

