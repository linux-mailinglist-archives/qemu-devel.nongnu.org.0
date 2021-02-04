Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623D30F5D6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:09:28 +0100 (CET)
Received: from localhost ([::1]:38438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gG7-00025c-Aj
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gAw-0004ek-4M
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:04:06 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gAo-000352-U1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:04:05 -0500
Received: by mail-wr1-x430.google.com with SMTP id v15so3896589wrx.4
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZYe9aKgFtPOmC6dV9O6j+m/rSHs0Zw9hoDpbUKRbn60=;
 b=hkmVbGn8raph9knoNs9pBrk6mZMqFc4zn4AIYfUHw2FzeHFIpjs7JKRX0QIsopartp
 1TTEBp3OnG+XPuDST8N+gE08hy/Kw1egdNuu8RmFfWrFgM1jYXl1jpkhrBOBjzQQ0imT
 94sUdhZKZwQ2+5U9bURQupHoKuPmrpRTHgmLRbOX/ddcNvbj+Fu7I1gC9CVVIAsbKnJP
 5mpg7w0iLVQMg/b5mo/D+8YTCI1JylNC7WW3jUiW9+4k6mKNwBLkjAwgm/srpfhURZ9l
 AQ47l61lDirP93MVzNFKUDFIoW+kWMoOQsz3BWxyXVj25+NXJAFkLJ98gm1Dqz/B989g
 chQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZYe9aKgFtPOmC6dV9O6j+m/rSHs0Zw9hoDpbUKRbn60=;
 b=nXZDao+hPu/DiE/OXO5kUHKTycJm0vw65b+66jcvSmwr1TvnNJFoY2R6PhHX5Xg8C0
 94WpkMPGo7BXpWMg7i15MnAqhy2g0rQQS2cXeUwoHS+RWJ079P8/hzxI69ZxTzoFhSlZ
 DSaRrz3sztcsL1bVfTzj/dCVl2HN/W3BJoJjhHV90Shpy7JCoaaLYx7RiBNO/RjSd6Gf
 cBK5KdFWPKwaKqqPw3oWtbwOyQJKPEp5ZRiJItwxDnDzNBhFRsJ1miX8s72P1zRnTVd6
 6bkcKokQk41ZQo5ndIdo/LkLJizLoAwpOzQ5ppgyeei6r6YCYO9wDOL0yI7cjQhYEstU
 vm3w==
X-Gm-Message-State: AOAM530VnFglfW7Mh0nDV2Wc4kAxLMhHLzTveSIahTt5OWkIMXhrgV7a
 OFeBeHMCuDynZtJpoaQ+JVPWAg==
X-Google-Smtp-Source: ABdhPJxliV4aIdNkkQdu6dIGjGY9iST4NdVeMEnBwV5UKVmpykgRbpuTyaxKp4faZRyQloVAIK3lUA==
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr10112608wrw.166.1612451036769; 
 Thu, 04 Feb 2021 07:03:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d9sm8865738wrq.74.2021.02.04.07.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:03:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A25F1FF7E;
 Thu,  4 Feb 2021 15:03:54 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/93] tcg: Manage splitwx in tc_ptr_to_region_tree
 by hand
Date: Thu, 04 Feb 2021 15:01:13 +0000
In-reply-to: <20210204014509.882821-5-richard.henderson@linaro.org>
Message-ID: <87tuqrq3hh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The use in tcg_tb_lookup is given a random pc that comes from the pc
> of a signal handler.  Do not assert that the pointer is already within
> the code gen buffer at all, much less the writable mirror of it.

Surely we are asserting that - or at least you can find a rt entry for
the pointer passed (which we always expect to work)?

>
> Fixes: db0c51a3803
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>
> For TCI, this indicates a bug in handle_cpu_signal, in that we
> are taking PC from the host signal frame.  Which is, nearly,
> unrelated to TCI at all.
>
> The TCI "pc" is tci_tb_ptr (fixed in the next patch to at least
> be thread-local).  We update this only on calls, since we don't
> expect SEGV during the interpretation loop.  Which works ok for
> softmmu, in which we pass down pc by hand to the helpers, but
> is not ok for user-only, where we simply perform the raw memory
> operation.
>
> I don't know how to fix this, exactly.  Probably by storing to
> tci_tb_ptr before each qemu_ld/qemu_st operation, with barriers.
> Then Doing the Right Thing in handle_cpu_signal.  And perhaps
> by clearing tci_tb_ptr whenever we're not expecting a SEGV on
> behalf of the guest (and thus anything left is a qemu host bug).
>
> ---
> v2: Retain full struct initialization
> ---
>  tcg/tcg.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index bbe3dcee03..2991112829 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -513,11 +513,21 @@ static void tcg_region_trees_init(void)
>      }
>  }
>=20=20
> -static struct tcg_region_tree *tc_ptr_to_region_tree(const void *cp)
> +static struct tcg_region_tree *tc_ptr_to_region_tree(const void *p)
>  {
> -    void *p =3D tcg_splitwx_to_rw(cp);
>      size_t region_idx;
>=20=20
> +    /*
> +     * Like tcg_splitwx_to_rw, with no assert.  The pc may come from
> +     * a signal handler over which the caller has no control.
> +     */
> +    if (!in_code_gen_buffer(p)) {
> +        p -=3D tcg_splitwx_diff;
> +        if (!in_code_gen_buffer(p)) {
> +            return NULL;
> +        }
> +    }
> +
>      if (p < region.start_aligned) {
>          region_idx =3D 0;
>      } else {
> @@ -536,6 +546,7 @@ void tcg_tb_insert(TranslationBlock *tb)
>  {
>      struct tcg_region_tree *rt =3D tc_ptr_to_region_tree(tb->tc.ptr);
>=20=20
> +    g_assert(rt !=3D NULL);
>      qemu_mutex_lock(&rt->lock);
>      g_tree_insert(rt->tree, &tb->tc, tb);
>      qemu_mutex_unlock(&rt->lock);
> @@ -545,6 +556,7 @@ void tcg_tb_remove(TranslationBlock *tb)
>  {
>      struct tcg_region_tree *rt =3D tc_ptr_to_region_tree(tb->tc.ptr);
>=20=20
> +    g_assert(rt !=3D NULL);
>      qemu_mutex_lock(&rt->lock);
>      g_tree_remove(rt->tree, &tb->tc);
>      qemu_mutex_unlock(&rt->lock);
> @@ -561,6 +573,10 @@ TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
>      TranslationBlock *tb;
>      struct tb_tc s =3D { .ptr =3D (void *)tc_ptr };
>=20=20
> +    if (rt =3D=3D NULL) {
> +        return NULL;
> +    }
> +
>      qemu_mutex_lock(&rt->lock);
>      tb =3D g_tree_lookup(rt->tree, &s);
>      qemu_mutex_unlock(&rt->lock);


--=20
Alex Benn=C3=A9e

