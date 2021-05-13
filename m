Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14BE37F866
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:07:20 +0200 (CEST)
Received: from localhost ([::1]:44392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhB3f-00066i-Tu
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAyc-0008Ue-5t
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:02:06 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAyY-0008KL-34
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:02:04 -0400
Received: by mail-ej1-x62f.google.com with SMTP id w3so39758918ejc.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jplbw6F74bu5if+ZTZj8T120Xzd+C2UuwKzdhRRM4Kg=;
 b=p9usuX2SuFixE6TwaJOsPtQ7AeuYc+AnJfG1bb5xixDmPJW7mGyibEvVboZ5gS3n05
 Q2QpibdWxOwQlt8rOEy7BxXQ6WSMG2R3PaUlYwY1r6MSTH8bmL6/QtRhTrSZA/9/c7QX
 6xESQou3k6Q1ZQC9hhKrTk1lFTrdkLnl6eYHFU3DHr+ENOsdxkPQNEgKiDNTxs7iXAh2
 M3HF9+Wud4D2KtfazdwPpCbNtsgX+A00tg9dfL0rAQ/pmrKyTzsWIr0bwZ0IANvj0z1z
 H1LeS3HwNjN94prg6HlVlLZLyL7y9l2W4HDUUxZYYJPn9kI3QMxj/tSMfBO/VzsZ+6hA
 /fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jplbw6F74bu5if+ZTZj8T120Xzd+C2UuwKzdhRRM4Kg=;
 b=ZoqJcuNDXhrIie7CSZwT+emzBUOxVVR/EkAlbiRoXB89MRF83Mi+BTuahIXuxg9zRy
 4B6SXLkwFCCPaPKx2JiEvncMizWZBy2rat/fue2G7RnTborzDBGE5vhksWWb9I4aJbFF
 odi7F2bp9EOcKVFLkIN4ePRDP4P9xpFO2ibS+9sCxRIr4egPRA8HXqGs9sen3b8H0+0c
 vCF0P/i9mUapJU2ULsUxBn//6Jj6iNmrbhM3VzcM72TrwUlwUrEQsms5XDIHaH8ibJke
 P9H8bh1/mvFG3yGWz63Wi7rOe+Vsz2qDqtjLeCQBLZ9SOdXcMJ+ighH3RV3IFWqn1OEl
 SKRQ==
X-Gm-Message-State: AOAM532UNUW3neS82086WtcSMQIOPJmD4yH1G7KJ6uOxC3HVR88W1s5v
 pSGjQJ/fBTByQRT06B7vRGJ4lIM8B0G6ZOtX7AshEbb4qfc=
X-Google-Smtp-Source: ABdhPJyv/pTXCxmo9RJWSWDgdh0dc0ZF14uBrB7zLE57uPNbejhD8yeFdZgduJ/tASQld7Bk4xBq/Avh2FNp11L7iLI=
X-Received: by 2002:a17:906:254c:: with SMTP id
 j12mr12999110ejb.4.1620910919128; 
 Thu, 13 May 2021 06:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-61-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:01:47 +0100
Message-ID: <CAFEAcA8dgPGQhxtC=x_ntHJP_56h33A2E9SKzWbzgmyff3gF8A@mail.gmail.com>
Subject: Re: [PATCH v6 60/82] target/arm: Implement SVE mixed sign dot product
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h        |  2 ++
>  target/arm/sve.decode      |  4 ++++
>  target/arm/translate-sve.c | 16 ++++++++++++++++
>  target/arm/vec_helper.c    | 18 ++++++++++++++++++
>  4 files changed, 40 insertions(+)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index e4c6458f98..86f938c938 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -612,6 +612,8 @@ DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(gvec_usdot_b, TCG_CALL_NO_RWG,
> +                   void, ptr, ptr, ptr, ptr, i32)

This is one of those places where I'd take the long line even if
checkpatch complains,
just to maintain the parallelism with the preceding lines, but wrapping
is fine too.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

