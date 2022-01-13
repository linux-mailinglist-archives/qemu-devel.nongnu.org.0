Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500448DE9E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:06:21 +0100 (CET)
Received: from localhost ([::1]:60394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n86MW-0007Zv-85
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:06:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85tN-0003py-8Z
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:36:14 -0500
Received: from [2a00:1450:4864:20::42e] (port=43923
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n85tK-00067o-72
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 14:36:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o3so11993676wrh.10
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 11:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEizAWo2G8WsDx0V9cHTvVijjib6Q7JqQzhf2gfwwE0=;
 b=GjarSvKydkiCVljayncHhvSr2vKdUqeeqO2vKn42TnrbVGoOu9lJwYaDlaLP0aw1G4
 nCsGMxRMxqAIPc1RZO3hS4vqf0nZBiOeMrOy9wZbC7Ha/bEf5quoPPiA1RfXrRfBR9wD
 L1RP8H/yqx3DbBjM77rKxyV2sdoP8BBnNZzWMwwJaJEhMb3OpoZgvv+C1SspjfvtSDbp
 Qd22jrdtzHbjudZr7iT2+syoGdl/ZcKXHjkif5/SK7k7KsKeM5sUPXRIah2R55hoMHrh
 TrRfMFslQ5wBVSAe7EZI6btIUSz990LYI5L888RExtQSzdxhZ9/wcHHootKZtXuN62IY
 KHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEizAWo2G8WsDx0V9cHTvVijjib6Q7JqQzhf2gfwwE0=;
 b=GPzGvXjLN2ofuil0bRLBGX+vaKGm1grfZWR3MsQo0F+9L8Q/HUuV/gUM2WEhFXDET6
 n6HGvmhixRbp2jq/++G/VaoAjYBGtPISh9zQKKhYYQNC/E5EadjaEEpHBmniI6yHOK2f
 SJgTocPna25DWqxSSmhkAQKX+4Lkg/C4fCz98oZ1hnA4Yf1eumh2ErRDVmQjUQWXPpKI
 5XbQDdnfvd9lkrSgLheY1FAh/EIPb4TYYnSVFYsjRRsaXB8GWPde4DSYKmdbMNLkSG2z
 uea3r4F7wevcmutlh2M94uRDyn92+Y7OVtRbmjelyWYNf9yU7dLrqgZYT+KMOJQm4Zc/
 he7Q==
X-Gm-Message-State: AOAM531e2bxRWjNgTi2GLKJEmDV1q88ERSBQk2S/tnmkNmoKUNPC6hLZ
 lA77NDPS05O6lAHE4KdUh5YchU65piN0qxGocBA6xQ==
X-Google-Smtp-Source: ABdhPJzwE/7K9Apr3Vxcp47/xgbC4W0OC6Uet25G+4DdaVEIQQ8foDiPT+S6QwjW9A2zMi2wccV+V2RqopFE0E1RUFA=
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr5133787wri.295.1642102568790; 
 Thu, 13 Jan 2022 11:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-15-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-15-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 19:35:57 +0000
Message-ID: <CAFEAcA-aiiV4ZRPsrB3KnAe5aLPKJHJQ+ZLxfXPoGqvg52gQjQ@mail.gmail.com>
Subject: Re: [PATCH 14/30] bsd-user: Add host signals to the build
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:32, Warner Losh <imp@bsdimp.com> wrote:
>
> Start to add the host signal functionality to the build.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/meson.build | 1 +
>  bsd-user/signal.c    | 1 +
>  meson.build          | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

