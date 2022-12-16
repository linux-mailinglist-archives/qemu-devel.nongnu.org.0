Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDCD64EB61
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:24:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69kE-0005zS-Qr; Fri, 16 Dec 2022 07:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69kC-0005zD-Ts
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:23:16 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69kA-0008QT-SN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:23:16 -0500
Received: by mail-wr1-x430.google.com with SMTP id bx10so2378259wrb.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 04:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uCtPMEoGcK9PUVbdhnJ++eGrtQARywP5iRcWQm6CpK4=;
 b=gO9El1ndMeiFbzG+M4AznPucafUIbAnPdX/sPiPGzHePPdZM+8UDZo7HHy+RsmA8Hm
 Qs9KkSVTHWbVcCceHC+Rx+WmYD7OuNs/Hy1hBbn+2UOlIJK61zqfrssuK8Wc6jbAiZGm
 7pEdeRHmoXyCk4W3s9m0Yj7h8Pnyl+zZ4vmvfSw5Aqpq77YaR8ZQfImd5dJCzUCi/XxL
 KlSQBXU+yFB3NXyuhDOcU1QAyKYzgJx53kA9nXDGPodOU3uz1Dz+EOI9JqVXitP5/NU4
 H7zlHUDb2eaLuu6u7fjgzFNJYT0X2ofMvRRJTCaHiT9kmc6JUriV+bzhsyxbRlPap+9x
 +kXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uCtPMEoGcK9PUVbdhnJ++eGrtQARywP5iRcWQm6CpK4=;
 b=q2c3qf2zC7AlwbxOSpxIit8ky+LmnVsBvFVdRIvBp2wNp54A0pIDQLKcvQohOEvTya
 DednudAkTPoUk1mFf4GpdYeytJUB5NRjyB8KftVnKbLzD9V1+pWT6YmBfvv762EUcpLM
 1A8AvB80aA6ZR5/p5V6GbomUcHQ0hkgYStnhl7bMmA5t04x30SQk59Z3z6qhfFnn2/ln
 3ZyLRZHh75WaGMY4+xPoIRCSiU9h6SOTYmvibG6TbzEUESiniKyCcbalq9DhWP6iCH6P
 2eVEJ5MJoawD8/BDdCdmNlWeMjfospbrnb7RdUF/D5VkB+zys/5kIBKzTTgN3Qt3CPps
 ylGQ==
X-Gm-Message-State: ANoB5pmwyvP6BcG7mi1elPee1qr8M+O2qiZj8iUDW7okvHrHkerj24Fw
 +JFa5kJvUKtaRlDmlv+dFVQsLw==
X-Google-Smtp-Source: AA0mqf7M4TZQnJJ0I+m52VPrOPdcLA4ppYNej6pEU46uO/qSX7kYlE4F5U4zE48IkrfkzZsnyOQGJg==
X-Received: by 2002:adf:fb48:0:b0:236:57de:1462 with SMTP id
 c8-20020adffb48000000b0023657de1462mr19493717wrs.29.1671193393175; 
 Fri, 16 Dec 2022 04:23:13 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a5d65cf000000b00241d21d4652sm2178987wrw.21.2022.12.16.04.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 04:23:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5B16C1FFB7;
 Fri, 16 Dec 2022 12:23:12 +0000 (GMT)
References: <20221209093649.43738-1-philmd@linaro.org>
 <20221209093649.43738-6-philmd@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH-for-8.0 5/5] accel/tcg: Restrict page_collection
 structure to system TB maintainance
Date: Fri, 16 Dec 2022 12:22:36 +0000
In-reply-to: <20221209093649.43738-6-philmd@linaro.org>
Message-ID: <87fsdfh70v.fsf@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Only the system emulation part of TB maintainance uses the
> page_collection structure. Restrict its declaration (and the
> functions requiring it) to tb-maint.c.
>
> Convert the 'len' argument of tb_invalidate_phys_page_locked_fast()
> from signed to unsigned.

You could push that cleanup higher because I think we only ever have
DATA_SIZE which is always in a fixed range.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  accel/tcg/internal.h |  7 -------
>  accel/tcg/tb-maint.c | 12 ++++++------
>  2 files changed, 6 insertions(+), 13 deletions(-)
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index db078390b1..6edff16fb0 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -36,16 +36,9 @@ void page_table_config_init(void);
>  #endif
>=20=20
>  #ifdef CONFIG_SOFTMMU
> -struct page_collection;
> -void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
> -                                         tb_page_addr_t start, int len,
> -                                         uintptr_t retaddr);
> -struct page_collection *page_collection_lock(tb_page_addr_t start,
> -                                             tb_page_addr_t end);
>  void tb_invalidate_phys_range_fast(ram_addr_t ram_addr,
>                                     unsigned size,
>                                     uintptr_t retaddr);
> -void page_collection_unlock(struct page_collection *set);
>  G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
>  #endif /* CONFIG_SOFTMMU */
>=20=20
> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
> index 4dc2fa1060..10d7e4b7a8 100644
> --- a/accel/tcg/tb-maint.c
> +++ b/accel/tcg/tb-maint.c
> @@ -523,8 +523,8 @@ static gint tb_page_addr_cmp(gconstpointer ap, gconst=
pointer bp, gpointer udata)
>   * intersecting TBs.
>   * Locking order: acquire locks in ascending order of page index.
>   */
> -struct page_collection *
> -page_collection_lock(tb_page_addr_t start, tb_page_addr_t end)
> +static struct page_collection *page_collection_lock(tb_page_addr_t start,
> +                                                    tb_page_addr_t end)
>  {
>      struct page_collection *set =3D g_malloc(sizeof(*set));
>      tb_page_addr_t index;
> @@ -568,7 +568,7 @@ page_collection_lock(tb_page_addr_t start, tb_page_ad=
dr_t end)
>      return set;
>  }
>=20=20
> -void page_collection_unlock(struct page_collection *set)
> +static void page_collection_unlock(struct page_collection *set)
>  {
>      /* entries are unlocked and freed via page_entry_destroy */
>      g_tree_destroy(set->tree);
> @@ -1196,9 +1196,9 @@ void tb_invalidate_phys_range(tb_page_addr_t start,=
 tb_page_addr_t end)
>  /*
>   * Call with all @pages in the range [@start, @start + len[ locked.
>   */
> -void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
> -                                         tb_page_addr_t start, int len,
> -                                         uintptr_t retaddr)
> +static void tb_invalidate_phys_page_locked_fast(struct page_collection *=
pages,
> +                                                tb_page_addr_t start,
> +                                                unsigned len, uintptr_t =
retaddr)
>  {
>      PageDesc *p;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

