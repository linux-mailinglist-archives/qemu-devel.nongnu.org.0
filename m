Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9367250395
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 18:46:58 +0200 (CEST)
Received: from localhost ([::1]:56334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAFcX-0004XL-Sw
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 12:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFZM-00013f-JU
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:43:40 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAFZK-0008Ol-PX
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 12:43:40 -0400
Received: by mail-ej1-x643.google.com with SMTP id d11so12557591ejt.13
 for <qemu-devel@nongnu.org>; Mon, 24 Aug 2020 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AUhijiFetrjVGCam9+t9oFw7bq1jPFam5zsjFC3v1Lg=;
 b=GqiCkcVdYZ3J8cT+Fcy5NyfHgsLr/MRh3QTkhQHRBUn1AG3GwyAnWLTyuSeLc9zUmg
 PtmI02dWzPH7fmreWEhjmCcujBuFJFvM30hrXoo32jA0mTJDxxkRAblipu/QVEkSUBbS
 ogZMuB1/pYlwzx5kBEpI4UInIlpkIapqBv50rHW65XmO7NNZFUxhn3u2EqQSMN3dUT12
 tmExDAuGs0I/+rkshe/JatnWIYSGy4YfWyH310Sj4rUlZ4wknYkUAoZP1VDwYa43vvXS
 PFFE47HR9mUtqNkLIhk8/4Bif8I8feYSMEFS1Oa7vkaBIfGRr60G7E0SlWRsoozmNYJj
 MkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AUhijiFetrjVGCam9+t9oFw7bq1jPFam5zsjFC3v1Lg=;
 b=EJBB6KLOvRtuqysqae8gfwCrSPxphKYBOIQSdC7eBqbtTXY2EqsB9iFkp4ewGd2gnN
 RlAn3vtkeepypLGRKZd3kmNf8pF0HlVKj30Jn6ICfE5oqeiqeO7KQZnzvZzo8/GtD+yG
 siObzJErvPdkLOF5TnbnA/wpxfwQU+c20dt1+ONhoEhfug+fauWtfIS7cd6IZqzhwLoK
 ehuU7KaSfhubCfPfNIuV4JZeWjTDfOxxUsd44riRZRCKMHJl4vD8pDuWAXPXmxK9lK2q
 igPocXSd9M0Y+QMooGLGGT7X0GHTBIvDF52GtsGtDgjjIAak/+kgw0gToDiTYI/5r+da
 AKSg==
X-Gm-Message-State: AOAM5321Z6PvBv4unrf6aoobd4JeD6iQVOk2HNrXcTkt7fRI+0oteqro
 G/w0s05PFqx3VYv/2MsJFOQQ4Ji/21jDOtNh7rjMrw==
X-Google-Smtp-Source: ABdhPJxQNJg0csIOyAmtbYhTVnivjBD7h7f9gWnJuUSrdkXVl2S3I1REoVnUG+706XRmesda/bQ8+Z6S7IWrxvqZfE8=
X-Received: by 2002:a17:906:b248:: with SMTP id
 ce8mr6188409ejb.85.1598287417310; 
 Mon, 24 Aug 2020 09:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200815013145.539409-1-richard.henderson@linaro.org>
 <20200815013145.539409-9-richard.henderson@linaro.org>
In-Reply-To: <20200815013145.539409-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 17:43:26 +0100
Message-ID: <CAFEAcA8wwardBdLvi3iYeD5U2nyKHkt2jXzou5F8naVzTS14+Q@mail.gmail.com>
Subject: Re: [PATCH 08/20] target/arm: Split out gen_gvec_ool_zzzp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 Aug 2020 at 02:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Model after gen_gvec_fn_zzz et al.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

