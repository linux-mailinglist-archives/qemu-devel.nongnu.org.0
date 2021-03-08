Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9C3313CF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:51:25 +0100 (CET)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJ6K-0007Px-Ku
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJIwn-0000SC-Pl
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:41:33 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJIwm-0002Jo-5d
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:41:33 -0500
Received: by mail-ed1-x52a.google.com with SMTP id w9so15672594edc.11
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 08:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EU/tWllRAWo3eBdhvjzBL+3de30Xa6y5ngKubWqVofU=;
 b=mKUnbnNlEybh3Dk0nS6LQgShhMuItSHnkSeCCoQbgVSE0GxRKSTO0UIR/Or9U4bGD+
 /ytoej3NNihM9pqVxBg6sDdnUGIzVvPgRoXWjblGUEBMsRJSTxLdF8jfU8FHb7FX454a
 Y45rc7vK/KCuK0W5ZgxzJjghZLp9SCkR2Svt0hACwfk3nuQrX2eVnIDBvCWshwAP4bUn
 bup30ZnX+3T9ZatGWoDBYjAOy8/Ar/RTTpsreIrPsGrehcVXF9/2+3n8CAZCjF7g9ikW
 oLy2oNscPam4pryI3zfVJF1IR4y/4Q0zNATuIOxldjtiuANp4x2fhjU+ogRYtSQVtqKu
 agSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EU/tWllRAWo3eBdhvjzBL+3de30Xa6y5ngKubWqVofU=;
 b=QxIL+QvpUxH0nlnTa/oNT25iLueSIzNyVBhVb6LWTFxulRS0KzEWwBtF16w5QVzocQ
 3F4jQDqXqHjGKni8JDaucC5/Y6j8w06KlW5J5HjjAF5VeOz0aWuSTQjPRpqoYyTDGVBS
 NFLd65Rk+D1AQwe2khr3nfijoQJwt4QVbFARIbtdXTw4yfjr7/bMFGocN72rrjP0IUWt
 /t67Dk6OIgrUnkPpPjL4UllyIr6lGJmt975p6Ve7Qt9etHLm+yrrMw0uY8DNx0Sl1xXZ
 /tRIRsOsZDEq4/IWOJ8ESVNYTVgO2NUs6BzdWnLJjZuugFRQVjqZl9oyw9RIFrmf0DOx
 4HaQ==
X-Gm-Message-State: AOAM531VNy7ASsOoWA/jCYasxKihU3cHV2VuLtDHZ1qVZe3mbq8baml/
 gknkh149ryO1Ev/ck9zBY5C/DRMCbQ1mO5p+NSlAZQ==
X-Google-Smtp-Source: ABdhPJyjyfy9Yn93qsyyWJLSVAQBQXFctSCAedPoBC9ycWALcDzZyxRO79Cxk2B44gvJRUaiUKNxvjAIEbOoinXz6Dg=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr22502626edu.100.1615221690589; 
 Mon, 08 Mar 2021 08:41:30 -0800 (PST)
MIME-Version: 1.0
References: <20210225091435.644762-1-eric.auger@redhat.com>
 <20210225091435.644762-7-eric.auger@redhat.com>
In-Reply-To: <20210225091435.644762-7-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 16:41:14 +0000
Message-ID: <CAFEAcA8VtN6xe6KANgh19kNK=DT1cB31fo7OwRSvdcLjkd+qdQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, vivek.gautam@arm.com,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 at 09:15, Eric Auger <eric.auger@redhat.com> wrote:
>
> If the whole SID range (32b) is invalidated (SMMU_CMD_CFGI_ALL),
> @end overflows and we fail to handle the command properly.
>
> Once this gets fixed, the current code really is awkward in the
> sense it loops over the whole range instead of removing the
> currently cached configs through a hash table lookup.
>
> Fix both the overflow and the lookup.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

