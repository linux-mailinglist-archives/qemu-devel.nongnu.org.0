Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 410E25F30A5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:03:06 +0200 (CEST)
Received: from localhost ([::1]:46156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofL68-0007I8-E8
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofKti-0001JQ-OE
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:50:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofKtf-0001yz-73
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 08:50:14 -0400
Received: by mail-wr1-x434.google.com with SMTP id bq9so16589184wrb.4
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=O3TARe3H30GzqDTT/rkdXcZL67B5vvR4YT2FtijE/yY=;
 b=COq58mRhgXp1ZNYgpT7ef9+bKRTyQqWvi3Y1oaqkSaZeTyikTpoEE0+lr3XjTUv3TX
 3/UnxywhPwJNSba40BcoRYSlu2KVq2OEY9lipksGBYCeGPGWHXLZFPGB6kQYC/CQjgvo
 UdNWT1AxMr+oDCH89cG54rYrmGQUxUOXP61xt8F18xlfz0YrYXXtOT3/sbNZUmAy92Eh
 Lk4JGgbb8GvV5VvykxeklOi7elCf1jpR1TaP4xqIyOKdYhBDp7e2fhYIeaYguO99C1PK
 wr9k7RgLF4lnBvZywOZSQT9x2xr6LypNvbyQTZU5rvJh0I288VNLRYmStV5PPlNwNyth
 Q1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=O3TARe3H30GzqDTT/rkdXcZL67B5vvR4YT2FtijE/yY=;
 b=I/kkwlIkN3ZzWHuGFXmDN7VW2qN2As9rpIbhkJLw/3a0dmZrXFsQhEOUsoc56cW4Ar
 G8oaaF6rFMT4K2IvlF3dDPJgWO8HHIXKH0cUHwwcSc8r2zu9LMl3vbBhv9nqXp4gPrYO
 Eqb1C7tg9+dqNfCNXw2tXAeTS4dGZSxYZ8RCcqXhny3ZdeD4O/oYhgXLu3XMKfO160U+
 5xClv9f1pRHtcGTZDbs4MAuDaFZ4pb218JyzR7PYSonkqQ9wjhX0XpuC5HlzVVqcQVsg
 oCS1MTMqYOlUKHwiQaRxXjyRpO1f7bDgMJTQrwgiTiD64W6wsjSdfWr5xpxUSpa4llBe
 oB1g==
X-Gm-Message-State: ACrzQf1Yz9Houty8ncYAX6q1FudNH6LgoTsipL3Ke0zdtNizT/h90Fpy
 fSJh41ycQETlP8pNO5C80jHRPQ==
X-Google-Smtp-Source: AMsMyM4OX7Z+nr5h/UM3DobjY/BnO/PDVWbyQDq6iqk6PzHBLfwkmX1v16N2eLXU/UofYmn3SI5ttQ==
X-Received: by 2002:adf:d4c3:0:b0:22e:326f:e8ef with SMTP id
 w3-20020adfd4c3000000b0022e326fe8efmr5242564wrk.242.1664801407955; 
 Mon, 03 Oct 2022 05:50:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i7-20020adffdc7000000b0022e3d7c9887sm3056839wrs.101.2022.10.03.05.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 05:50:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D65F1FFB7;
 Mon,  3 Oct 2022 13:50:06 +0100 (BST)
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-14-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 13/18] accel/tcg: Do not align tb->page_addr[0]
Date: Mon, 03 Oct 2022 13:47:15 +0100
In-reply-to: <20220930212622.108363-14-richard.henderson@linaro.org>
Message-ID: <87fsg5nkap.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Let tb->page_addr[0] contain the offset within the page of the
> start of the translation block.  We need to recover this value
> anyway at various points, and it is easier to discard the page
> offset when it's not needed, which happens naturally via the
> existing find_page shift.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c      | 16 ++++++++--------
>  accel/tcg/cputlb.c        |  3 ++-
>  accel/tcg/translate-all.c |  9 +++++----
>  3 files changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 5f43b9769a..dd58a144a8 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -174,7 +174,7 @@ struct tb_desc {
>      target_ulong pc;
>      target_ulong cs_base;
>      CPUArchState *env;
> -    tb_page_addr_t phys_page1;
> +    tb_page_addr_t page_addr0;

We don't actually document that this is an offset here (or indeed in
TranslationBlock) and the definition of tb_page_addr_t:

  /* Page tracking code uses ram addresses in system mode, and virtual
     addresses in userspace mode.  Define tb_page_addr_t to be an appropria=
te
     type.  */
  #if defined(CONFIG_USER_ONLY)
  typedef abi_ulong tb_page_addr_t;
  #define TB_PAGE_ADDR_FMT TARGET_ABI_FMT_lx
  #else
  typedef ram_addr_t tb_page_addr_t;
  #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
  #endif

implies these are full size pointers into the guests address space.
Either we need a new type (tb_page_offset_t) or to properly comment the
structures with what they mean.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

