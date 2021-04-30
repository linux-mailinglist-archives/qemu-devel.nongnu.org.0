Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D036FBE2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:06:02 +0200 (CEST)
Received: from localhost ([::1]:47490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTmL-0004qu-OJ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTjt-0003Nr-Vm
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:03:30 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcTjs-0007mq-A9
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 10:03:29 -0400
Received: by mail-ej1-x633.google.com with SMTP id n2so105421858ejy.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 07:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pOyDmqnhM9jStYHgQFPGMMUOIX0c11D/fgAuY07ZQpc=;
 b=Z8+WNkKNoylKT4JIhF4YGFSHGK8+hdpnS7M9MYoZWe4LHx5ZFLs5ruVtNumuDj2Io2
 1fTwcsjuagzCi/6e4NU15UVv4PTXPzI6acQBFjGwAvExfGQeggsCBH5lRSv3xSEEsOhj
 GltWHg/Ejk8PikcyEy0G9Rw7+yqQEc8ExLRoex8qs9SKghMTuCXFDnKxvswZIxAMTiqF
 vzzcaVy5Ozk/uf+l38uDNQ22qT28FwV/UYx1f107aSN7I+WX5TI0THSsZNhU6JyRbyy9
 E+2S/3xUGQgHywdZdsR03/pk2baiy8Rfq3c6uU8skE9yfIUYlcvv/ungfSRYNL4GKefp
 89Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pOyDmqnhM9jStYHgQFPGMMUOIX0c11D/fgAuY07ZQpc=;
 b=WcVyYy+ANHizKh6BNKexQsa7R4jmn7vys0aEcHGPbGIgCBfsc+jgkbr7AjAvViH3Vt
 3Km3s2Atm3VhvxNHNMufBM79ybz5baKMLIzOIlOLmraoinIzTq9lmcidQD+bu7B8Nvf7
 6EjWJn2lHPVHSuGrTc9B5PQBIalU2Udkl9im/s0DIDbeWBiBG40n1AOIOxk2PxfY/VgS
 /grkrpAqjrUcK8GrsFTwsPFdcBh5EZHkye9A3OMd//RhQnA+WjPChtrxE24+dNDzIs0j
 wCtzsce5RPfEmOheLbSd0/Lw62YVcLd1xnPo67DLdC1Vh+JC92WiBFmGAhPExOc8beao
 sV0Q==
X-Gm-Message-State: AOAM530vMIOxUKKEv8DAMfBlEFPdTnwM/vTk5DJMLFatBVB1dAAbzlqa
 r3oGsJAeSlz6X1C7Y703Az567m1SRygxX2rzCkHt1w==
X-Google-Smtp-Source: ABdhPJxAth4fyGMq5j4AsD6uJqd/y856zNXc3/nUhbUbpDzV0GPrSIBFq6qPdtXm2k2EbhHD7ddmYgdS31uP/1h3+xk=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr4716249ejb.250.1619791406789; 
 Fri, 30 Apr 2021 07:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210427214108.88503-1-richard.henderson@linaro.org>
In-Reply-To: <20210427214108.88503-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 15:02:24 +0100
Message-ID: <CAFEAcA_Xd_gEsoU4PAH_77sApORURsMJDGF5Y4fa6ovqBOxKzA@mail.gmail.com>
Subject: Re: [PATCH] linux-user/aarch64: Enable hwcap for RND, BTI, and MTE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-stable <qemu-stable@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These three features are already enabled by TCG, but are missing
> their hwcap bits.  Update HWCAP2 from linux v5.12.
>
> Cc: qemu-stable@nongnu.org (for 6.0.1)
> Buglink: https://bugs.launchpad.net/bugs/1926044
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)



Applied to target-arm.next, thanks.

-- PMM

