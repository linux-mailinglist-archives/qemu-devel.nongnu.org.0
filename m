Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AF264EB3C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p69bZ-00034Z-Rm; Fri, 16 Dec 2022 07:14:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69bX-00034M-PD
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:14:19 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p69bW-0004dF-4M
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:14:19 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m5-20020a7bca45000000b003d2fbab35c6so1596603wml.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 04:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uOCWCaQx3V5+3c9754/9s9rv/VOM/Dbt74/65QJbGEE=;
 b=NgQWerDvN1q5mP8bxK779ocMqB4BN+TIQvzrPBcQw46ksrDROLFSyOQIxb4MGQHhHg
 yap3InH0GBy6ev53lf2Un92PLW7LgCX4AIYra1vv6IG6X9XPoo3LExupmCNkVt5LZRZR
 wptNM+7pFd+RrTeoXhq1jV/uKZs6OFye5tcXz2ru3eZgBKVEPfKdPdtbG7lAys9n92C4
 RT/+oP1D0KoDMxiGiPyN+kAnB/F3yqxZj66fHyxKtq+hmewJ6q5pU80q3CUDbN2TFTAr
 /B3prb5FI7EB2rVL+hS0pqZ89OAFGiv9o3HG1fiaZr8HLf0o1VZUaS/pV9kmznfyF7jH
 lTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uOCWCaQx3V5+3c9754/9s9rv/VOM/Dbt74/65QJbGEE=;
 b=56O0ITx30EHraqd49iGV1zI0+vk9edsMVdgY+q7UL80dfDtOimyUucMth+Cb1eY4ll
 KQgmZX3/6JC+Eql7RMuoy54XnjNoO0UU6vo5w5/P2YmC9H8oX2o0v8IrVv8A5RRUOuA2
 D57O/UbCIfijN52S4JJOn4eUKF5aNnT1MiyMQdMA7r8u3+FKkCHgsu16xaCQ1oLxUB+R
 afsFzYDoKFQvkoCgeKKoQZqHggCL6UQnW1OrIsFzmg42ggZt+m3+gCRZaaRBtx623jMi
 VJk1GfJ6O2QFaMxEO96D+HS0b4jwreIz8MfbBVdVTJLy4RMc0/g93nhEZHRnlcDa7Auk
 JKgA==
X-Gm-Message-State: ANoB5plaQyjIXvr090FkLFw4GIY8NtVcRXv+Zz58kDaMDR6P+Yrrq7pL
 bOFeFSaPcjHU/zHLfcpSTksV1A==
X-Google-Smtp-Source: AA0mqf5REoEcKZlXDhClyAaXPNFPOCJyPclN4XbwONJ3GhUzTwn5GsgTSDyj8Pj6s0sT13XaTtnF8A==
X-Received: by 2002:a05:600c:1d02:b0:3cf:d365:1ea3 with SMTP id
 l2-20020a05600c1d0200b003cfd3651ea3mr25628663wms.12.1671192856407; 
 Fri, 16 Dec 2022 04:14:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c020800b003b4935f04a4sm2757661wmi.5.2022.12.16.04.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 04:14:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA0C71FFB7;
 Fri, 16 Dec 2022 12:14:15 +0000 (GMT)
References: <20221209093649.43738-1-philmd@linaro.org>
 <20221209093649.43738-4-philmd@linaro.org>
User-agent: mu4e 1.9.6; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH-for-8.0 3/5] accel/tcg: Rename
 tb_invalidate_phys_page_[locked_]fast()
Date: Fri, 16 Dec 2022 12:11:25 +0000
In-reply-to: <20221209093649.43738-4-philmd@linaro.org>
Message-ID: <87o7s3h7fs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> Emphasize this function is called with pages locked.

The _locked should be a suffix rather than in the function and possibly
a __locked for continuity with the other __locked functions in the file.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  accel/tcg/cputlb.c   | 2 +-
>  accel/tcg/internal.h | 6 +++---
>  accel/tcg/tb-maint.c | 6 +++---
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index ac459478f4..6402fe11c1 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1510,7 +1510,7 @@ static void notdirty_write(CPUState *cpu, vaddr mem=
_vaddr, unsigned size,
>      if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)=
) {
>          struct page_collection *pages
>              =3D page_collection_lock(ram_addr, ram_addr + size);
> -        tb_invalidate_phys_page_fast(pages, ram_addr, size, retaddr);
> +        tb_invalidate_phys_page_locked_fast(pages, ram_addr, size, retad=
dr);
>          page_collection_unlock(pages);
>      }
>=20=20
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 35419f3fe1..d8b58c1e70 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -37,9 +37,9 @@ void page_table_config_init(void);
>=20=20
>  #ifdef CONFIG_SOFTMMU
>  struct page_collection;
> -void tb_invalidate_phys_page_fast(struct page_collection *pages,
> -                                  tb_page_addr_t start, int len,
> -                                  uintptr_t retaddr);
> +void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
> +                                         tb_page_addr_t start, int len,
> +                                         uintptr_t retaddr);
>  struct page_collection *page_collection_lock(tb_page_addr_t start,
>                                               tb_page_addr_t end);
>  void page_collection_unlock(struct page_collection *set);
> diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
> index 0c56e81d8c..bf84728910 100644
> --- a/accel/tcg/tb-maint.c
> +++ b/accel/tcg/tb-maint.c
> @@ -1200,9 +1200,9 @@ void tb_invalidate_phys_range(tb_page_addr_t start,=
 tb_page_addr_t end)
>   *
>   * Call with all @pages in the range [@start, @start + len[ locked.
>   */
> -void tb_invalidate_phys_page_fast(struct page_collection *pages,
> -                                  tb_page_addr_t start, int len,
> -                                  uintptr_t retaddr)
> +void tb_invalidate_phys_page_locked_fast(struct page_collection *pages,
> +                                         tb_page_addr_t start, int len,
> +                                         uintptr_t retaddr)
>  {
>      PageDesc *p;


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

