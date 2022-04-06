Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511864F5D09
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 14:13:09 +0200 (CEST)
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc4X5-00025R-If
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 08:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nc4VW-0001O3-Bv
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 08:11:30 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:40395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nc4VU-000861-Lr
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 08:11:30 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2e5e9025c20so23571087b3.7
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 05:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hMDdU/IVi4xFA95TT0dX+9hzhAbp5Gd8rsRU6m5Rn0Q=;
 b=eiKCWjpPkgdxdrJvKg6NBbDa7UXfh+aLO5rpBertn8efBWanAXP43mQjO2mUSY6nuf
 W4cJwCWBzXbq9ZNHDfAbEerAPTQfUnSXoBZWw7DQ8XcavaeVjkHzARDZ3p79vM8KytlO
 F9QC1q9/Kw+hRKajxPgWYeYPGdiONH7tdP+dCteriL1/Hq0anjzToyDAil92QyUXdnDA
 kNImb5rRUmOptDMheENldpsy0+MNtR7o9gM2SYf1OxqaUCKrusb+mRkZyHentqq4A2Wh
 Z7YcxHi37SJz1PCzZIUVlU0Ai6u5Q3yhtRkK5+kzXDbrV+DXbg+Bm0S/Fg5qD3ptwZi5
 Qz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hMDdU/IVi4xFA95TT0dX+9hzhAbp5Gd8rsRU6m5Rn0Q=;
 b=X6CRd4sFbGtXdKErgg0ndF+O+5cZmpZIPgH/MagJu6u2qpVsUFxFdobDz9oYslGa+f
 V/w3MN8M4EY9p6o7W2qotp0BMl9LTXpd1Lg8XyZAGO0HQGK6mifbGmBhuYt1FCp+C+T7
 xv3h1rcyEmRAgmNAnx8P04f9SdHi1jTqvrRCNX/KPE80oTSKUNjeV0FxpVSrEX28yDI7
 lKHe1JacUQqCFf4hekm/is0CCJV44LK9FJE67eQzFJsS1GoGqfzf1JRzCQXWcsWHAIS1
 KMgTVr3SZIX2EhqyC1GTm/K3PQNfZ40ZRX2aqHUcruhU5hs9pmK0ThvL5SlQFZSF7gnJ
 5l0Q==
X-Gm-Message-State: AOAM5312FptKsdQ4qSIOPxa/VzRJ9Nq5our28FErdmOO5Gwd8J0dPYDk
 rP3lacyj2TTHJ1eFGru8CMY+L4tDlrwLnJ/Pz9XTjw==
X-Google-Smtp-Source: ABdhPJwweUMMdnoRC85BPT3bmOrUJQjAG53870BZrWvJm9cVKtxFb5eMNHqHYQhwNgOWfn80sImrr0vK7k0THRiqJdw=
X-Received: by 2002:a81:1592:0:b0:2eb:5472:c681 with SMTP id
 140-20020a811592000000b002eb5472c681mr6679491ywv.10.1649247087562; Wed, 06
 Apr 2022 05:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220406102515.96320-1-dgilbert@redhat.com>
In-Reply-To: <20220406102515.96320-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Apr 2022 13:11:16 +0100
Message-ID: <CAFEAcA_FJ4GKntsDm2zddEXgnX2W60rSydFDi=rj3jgjNFbGSg@mail.gmail.com>
Subject: Re: [PATCH] migration: Fix operator type
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Cc: leobras@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 11:31, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Clang spotted an & that should have been an &&; fix it.
>
> Reported by: David Binderman / https://gitlab.com/dcb
> Fixes: 65dacaa04fa ("migration: introduce save_normal_page()")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/963
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/ram.c b/migration/ram.c
> index 3532f64ecb..0ef4bd63eb 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1289,7 +1289,7 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>                                           offset | RAM_SAVE_FLAG_PAGE));
>      if (async) {
>          qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
> -                              migrate_release_ram() &
> +                              migrate_release_ram() &&
>                                migration_in_postcopy());
>      } else {
>          qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

