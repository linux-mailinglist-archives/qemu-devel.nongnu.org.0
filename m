Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C34AD5FF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:12:30 +0100 (CET)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOQ9-0005Xv-Vo
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:12:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOKV-0002L8-Dg
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:06:39 -0500
Received: from [2a00:1450:4864:20::430] (port=37491
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOKT-0004wv-16
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:06:38 -0500
Received: by mail-wr1-x430.google.com with SMTP id w11so30035201wra.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ExVkVapun/PEfUCahl/v8BjEzlh6+gGK00uy+BoJ62I=;
 b=wP13gC8vfbDxkBDrqnIWd4z5F1cLQUw3VTwVQsmZph220tWGKh1j8KIlDhYwDN5IrQ
 cyed7iagFb91NOQ8fJ1XFylP93ALJCevTeehgwe4015H3TrMHbplrV9E+t5Rkj+x6EZk
 s7ApDah7Vk+AVtCuIXu55Damsqd2YEIfHtw3nHGFfCmeYdNlV9rQ5ldXwMKdLKbMkKxe
 s8iXAywiureEH8iIcqrKpcgqTv4euCI4C7yB8L5VVsOeGsQmbiGHBAVm9aXMFxKnLnIL
 iia8jg4uRBWbd1bBQhJYA1bdPEEe6115ubFIcXuuoWrKOcJ5mRFVGzgOF++RCcRJgzQr
 p81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExVkVapun/PEfUCahl/v8BjEzlh6+gGK00uy+BoJ62I=;
 b=ehabjgySjyfvMdip4NBNyFpr/9RRvxHB61wDVGy/CR2wObUlZexBomlTB0K33qFTCi
 7rrCLPbXGW3O+EdBICpi5qSdGZSC2sAY9+Zl+0OETizpvVQBX7S84KEzYngiWXgq2jnW
 3Ew72vrvdjBUfwdK/Wsze4rLCneCOhofstQN9vpZJwK4z/oi2ZfbAzhnGboWczXlENVO
 HVW4DEXzPSDcAeGackyDvZ9cUbZZaDuYCxfGHneu+VyZ72cnO+TvVeFMxG2wBsygNvMx
 aWVRbmmgzvjCAuJllJiXl3mPfne9ZP/p5XwbmoWMjFAXrye+ioz9UfhdbggynPkQmgc+
 mBdw==
X-Gm-Message-State: AOAM530rZwE3SpGuwuXFrOBfgE/bednbVft4sIg8xLo0y1ugcs91QMVB
 vVqOelV+p6EbYalbHqsSOljgiGV6WJalRzOVu+J+KQ==
X-Google-Smtp-Source: ABdhPJx4nr/IFmgUwO2mgJC7YH5B9UH1+8afp2L77Cz2sb9iCofn2TfcmWcg0/1J59YGhiJwNIaElyNbgHdBJN2SKuQ=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr3134189wry.319.1644318395601; 
 Tue, 08 Feb 2022 03:06:35 -0800 (PST)
MIME-Version: 1.0
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-4-richard.henderson@linaro.org>
In-Reply-To: <20220208071237.319844-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 11:06:24 +0000
Message-ID: <CAFEAcA_q7yTO+Es_cnune_BwTb_DM1v8PX_PsOgHf==nYmBWJw@mail.gmail.com>
Subject: Re: [PATCH 3/5] linux-user: Introduce host_sigcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 08:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not directly access ucontext_t as the third signal parameter.
> This is preparation for a sparc64 fix.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

