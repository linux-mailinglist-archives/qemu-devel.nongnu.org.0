Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E56F648DF30
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:48:50 +0100 (CET)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n871d-0004DI-I8
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:48:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86ws-0002LL-ME
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:43:55 -0500
Received: from [2a00:1450:4864:20::429] (port=39890
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86wr-0007VA-3w
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:43:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id s1so12300677wra.6
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kaag0bGJydDMMTDaSi9w7OYqhWGolg6pIfvPqtcX4d4=;
 b=GWrxA+pI0O/WFFSVb3Nh1djbm4OlnZNuevWtZozI3bVfsrGEPWY8/M5iEY9tKg4bMI
 qvdOX+7tZwvTj/NK0FliYvNBfDdZ8m/pqvmnqVYHs3JRe5TnnZou3D5478Ue5fZNhh2/
 7aFMBcrwgGX2UgBzKEH95NG/ExN8RsAF05HSa0OiAoU5fOKIXJDJLRyqcG4EqhHls3zM
 KZF2jh/NPllz5qX9kJh0gVGnA42QxZzuv3sk+im08mG86VKhcNB96ldiQIEAKk+H57Qk
 xJFLWX5PnktgvC5TbKzxUFycAXBBY0La/GH+ibNRcdBOWLaYNAo916j11mShkapmZNkO
 gmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kaag0bGJydDMMTDaSi9w7OYqhWGolg6pIfvPqtcX4d4=;
 b=Sl103tLeHlXvMT52mGOXd3/DKKLhWmUP3nt6xkk6ehc2dENMsIc9npfwH1kAhrf2QH
 SgHJ3qcicavDfCxfXrYrM+ACFM/uUg96e0GScoK12IzfDfzh5lpdLXgwzNWWTst1j/U+
 VwWCL5j8Ms1w6WrcGeK4dS6+bCVpiVmpBWjU/UQ8XC5gqn4qpGYsMmPTmoMRzyXbzhPc
 5eF8p2Jaax6jbZKDnEM4G43FiGXJbmmNgqzutSewlZKvdBHs53QjEd3MKfEBFO8dRJ7/
 anpxNlCba8R3OdsJQvSSOahcJY2SJXBTVmyfA/940k3YUGa82JpnEOkZ6aYf4Q3IdaN7
 s2Yw==
X-Gm-Message-State: AOAM5307ucX6RPI2czIFzt7Y47J/WdBMG2DdotRGRlfdENEA66KWntW4
 q844hZwk/iApBuioMwU+IWJxF386tXDDQdwcvFZP/w==
X-Google-Smtp-Source: ABdhPJwINiR8qKeUMz1B2nHyT3+WgNyKs1a5f+W4B2FaaNRaYZKWq7c8YXIGTsqB45jfpHmY1sY9WjMy4g+0BWgzmvU=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr5647538wrn.172.1642106631520; 
 Thu, 13 Jan 2022 12:43:51 -0800 (PST)
MIME-Version: 1.0
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-2-dgilbert@redhat.com>
In-Reply-To: <20220113194452.254011-2-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:43:40 +0000
Message-ID: <CAFEAcA80kZMYZkOpw8mka+skyMyq4W_pLUeYg_1D2MJUGYLUJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ppc: Fix vmstate_pbr403 subsection name
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: lsoaresp@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 19:45, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The pbr403 subsection is part of the tlb6xx state, so I believe it's
> name needs to be:
>
>     .name = "cpu/tlb6xx/pbr403",
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  target/ppc/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> index 756d8de5d8..e535edb7c4 100644
> --- a/target/ppc/machine.c
> +++ b/target/ppc/machine.c
> @@ -718,7 +718,7 @@ static bool pbr403_needed(void *opaque)
>  }
>
>  static const VMStateDescription vmstate_pbr403 = {
> -    .name = "cpu/pbr403",
> +    .name = "cpu/tlb6xx/pbr403",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = pbr403_needed,
> --
> 2.34.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

