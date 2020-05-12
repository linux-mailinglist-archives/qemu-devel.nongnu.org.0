Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F401CF72D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 May 2020 16:31:39 +0200 (CEST)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYVwZ-0000Vv-02
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 10:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYVv7-0008Nk-Ra
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:30:09 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYVv6-0007H8-AJ
 for qemu-devel@nongnu.org; Tue, 12 May 2020 10:30:09 -0400
Received: by mail-oi1-x243.google.com with SMTP id o7so18394181oif.2
 for <qemu-devel@nongnu.org>; Tue, 12 May 2020 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gaa5qNGeRKOlm9Fu0UtVno/cCLdy5JYObMzJkgguNSc=;
 b=nhnKrxiTwmiGJlW3ccU0afHTp8Mnq9BCeZOketCo4JVRzF3W8jgL2YxRHdtlvX+iRW
 lXt9Aa4SvTFRbc7xtQXdHH6uivbMD00+6Siq6Y4aA+7P0oNGgvulvhe1H2xp31G0ZxsA
 +Wr/C24x2XAquQ2wTNyjUsNwyQWP5gDM2LXM6EXgDJqT96YHc4ICRfIH3RmVwScbIu16
 Sxs+OZOUdSJ0XAxjVeabDwJnulzPeVDKvoV3CE7CZ/DcmL8twNDyUadAoLy0YiKmoY9o
 ZTu0yiTph+qjSI1sIz5xvYZNTGRL1Z19cKFNel2UGmESRRYjQXhkGNdDuqr26FWy9HGv
 ZZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gaa5qNGeRKOlm9Fu0UtVno/cCLdy5JYObMzJkgguNSc=;
 b=IPilME319kQBaWt5dBdxYytA2OPSwdxVTYFflWygyz1W6uGyzEUD+NdVn7+i+wkt8Q
 mdINfbdDuO1ZWqcQqqU4tiY4G+InA3GlYqWKvA5taPFJ7wjLoVpuOMHXKWV+q2Wmbvv+
 cHdiXuVSicWrGTeDHmuKeni/G2SHOHABN/GR9gO7fpLyi0ChcyRc84/PET19NsQWVf1Y
 Uj0uy2Gi/m5tQfmfUpccPTSElIdCdY+k9V/IxxSF8A+svl8yQoEIKYYp3OtZJpzVM69d
 ONogaZorOyissd926oYWiR+pYez40nLbSgVfiSglKAYoyncXuJT6WVigmLqHoR4eYsAh
 SjKg==
X-Gm-Message-State: AGi0PuYv+/x5NNoMCaX+kiU1bNJ620LZiPNkHYLcODNQmDQwnz/0P2/J
 8cyOhgKbSZBit9Pg3ommoXW1CxSmZAKqzjV3U4Acvg==
X-Google-Smtp-Source: APiQypK4pbp6MiR8O7PJ8pyoBqihvc2pyk0aJzhX4AeoT1/G+DvYkUt3dsGuecqMXAXUfZtRjv2l2q50Kc7XFOACgnU=
X-Received: by 2002:a54:400c:: with SMTP id x12mr22716288oie.146.1589293806974; 
 Tue, 12 May 2020 07:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200508152200.6547-1-richard.henderson@linaro.org>
 <20200508152200.6547-15-richard.henderson@linaro.org>
In-Reply-To: <20200508152200.6547-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 May 2020 15:29:55 +0100
Message-ID: <CAFEAcA93iba1E8-gRcDkFcikRJk9UCwbsy2AahOa6msaGdZyTQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] target/arm: Clear tail in gvec_fmul_idx_*,
 gvec_fmla_idx_*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On Fri, 8 May 2020 at 16:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Must clear the tail for AdvSIMD when SVE is enabled.
>
> Fixes: ca40a6e6e39
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Is it worth adding a "Cc: qemu-stable@nongnu.org" ?

thanks
-- PMM

