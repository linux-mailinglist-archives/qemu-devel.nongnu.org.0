Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777060D103
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:52:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMCB-0001yU-Sy; Tue, 25 Oct 2022 11:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMCA-0001a9-1Z
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:50:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onMBw-0001cY-5d
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:50:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bk15so21806082wrb.13
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRUqOtBXFxS2uW12eQqDobbCqwYiqElTn+Gq0UuPiDI=;
 b=TEem2cYXBtzwBZOBnYq5gFCzM0a+eEbAW9BK7krYBOQ/23lkt5oAq5e8M52CSU1Inv
 L7tVj3Wjt6dV3VC2Dq/PUYUoGlI5bIQi7GYiWMN/DLrot0htPrsOS7WOgEvV8Wqh5hXI
 gmGc2oR6OTnr0n8uwGfqBHUtXHYl613QuHbfLYkWysYlx29d2P1hsyFv+/cC+NgQoTXW
 6Qs7vZe/ujrZiQY+Utpoft4D+8HD7MLxTXOumBN9V3r2aALoVR1fTih3ZATr9L79omZ5
 S93zYY3zSYaLt6lX9MHrr0SDETxMH6ciLAnd09DDP8nJlbVEOWHOvzRiEMlRfXxalM+m
 AGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cRUqOtBXFxS2uW12eQqDobbCqwYiqElTn+Gq0UuPiDI=;
 b=rbLAxA1Yy1y1WLsvT5hS7Yhmy5xNJi8D96X/NRDdBwttzIMEAez5AIxBLTcNykgQSu
 wqV3wg2VUVl3UamtDoAclQFyUba/3e2vbNYL0rZIP1SGg7BTbkQuK4JRVk4ow14jG8Mk
 1PvjBOMvj4UHakH+Feq1UpB8cc/pX8LSgyGahbmrgD2nzsDvcWGqjgB/Fp9J0JK6Q8dj
 ijnTdWSQxdjS646YIvXhUJfHQgOC4UKV9FGNBkQrOeJcSHDDA47Z601EGQTZ+W9DA191
 4joCackA3EAsQH5BYU9RYf35A5UfAwUKjsJpizy93ESlzXhKqxY96OYeQ5ewn3a0j6lv
 j/ZQ==
X-Gm-Message-State: ACrzQf0lOkKOvdPnbCbOirf7OxvxNRoG3o4bOxJm1IRowyOuXx70uXwH
 kRShXQk3tFzWLBTqfIAQgp9u+Q==
X-Google-Smtp-Source: AMsMyM6ibc3C32mvkpf46fv7Q/HOyzyMonpNMF78Fb9BpR1a1k+k0fVeB7xCGY6dkpINLh1hhPBQtw==
X-Received: by 2002:a5d:64e1:0:b0:22e:762f:7d3f with SMTP id
 g1-20020a5d64e1000000b0022e762f7d3fmr25728858wri.526.1666713010248; 
 Tue, 25 Oct 2022 08:50:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x17-20020adfbb51000000b0023677693532sm3159000wrg.14.2022.10.25.08.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 08:50:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 261551FFB7;
 Tue, 25 Oct 2022 16:50:09 +0100 (BST)
References: <20221006031113.1139454-1-richard.henderson@linaro.org>
 <20221006031113.1139454-15-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, pbonzini@redhat.com,
 imp@bsdimp.com, f4bug@amsat.org
Subject: Re: [PATCH 14/24] accel/tcg: Call tb_invalidate_phys_page for
 PAGE_RESET
Date: Tue, 25 Oct 2022 16:42:52 +0100
In-reply-to: <20221006031113.1139454-15-richard.henderson@linaro.org>
Message-ID: <871qqv7vim.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> When PAGE_RESET is set, we are replacing pages with new
> content, which means that we need to invalidate existing
> cached data, such as TranslationBlocks.  Perform the
> reset invalidate while we're doing other invalidates,
> which allows us to remove the separate invalidates from
> the user-only mmap/munmap/mprotect routines.
>
> In addition, restrict invalidation to PAGE_EXEC pages.
> Since cdf713085131, we have validated PAGE_EXEC is present
> before translation, which means we can assume that if the
> bit is not present, there are no translations to invalidate.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/translate-all.c | 19 +++++++++++--------
>  bsd-user/mmap.c           |  2 --
>  linux-user/mmap.c         |  4 ----
>  3 files changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 8d5233fa9e..478301f227 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1352,7 +1352,7 @@ int page_get_flags(target_ulong address)
>  void page_set_flags(target_ulong start, target_ulong end, int flags)
>  {
>      target_ulong addr, len;
> -    bool reset_target_data;
> +    bool reset;
>=20=20
>      /* This function should never be called with addresses outside the
>         guest address space.  If this assert fires, it probably indicates
> @@ -1369,7 +1369,7 @@ void page_set_flags(target_ulong start, target_ulon=
g end, int flags)
>      if (flags & PAGE_WRITE) {
>          flags |=3D PAGE_WRITE_ORG;
>      }
> -    reset_target_data =3D !(flags & PAGE_VALID) || (flags & PAGE_RESET);
> +    reset =3D !(flags & PAGE_VALID) || (flags & PAGE_RESET);
>      flags &=3D ~PAGE_RESET;

Not a problem with this patch but I was a little confused by PAGE_VALID
because its the one "special" flag not documented in cpu-all.h:

  /* same as PROT_xxx */
  #define PAGE_READ      0x0001
  #define PAGE_WRITE     0x0002
  #define PAGE_EXEC      0x0004
  #define PAGE_BITS      (PAGE_READ | PAGE_WRITE | PAGE_EXEC)

The above are self explanatory as they mirror the mmap flags. But what
does PAGE_VALID really mean. We set it in the elfloader and whenever we
mmap which begs the question when is a page not VALID? The only place
that ever seems to clear the flag is the PPC mmu_helper code in a
response to a particular TLB operations. Should that code instead be
doing page_set_flags(PAGE_RESET)?

  #define PAGE_VALID     0x0008
  /*
   * Original state of the write flag (used when tracking self-modifying co=
de)
   */
  #define PAGE_WRITE_ORG 0x0010
  /*
   * Invalidate the TLB entry immediately, helpful for s390x
   * Low-Address-Protection. Used with PAGE_WRITE in tlb_set_page_with_attr=
s()
   */
  #define PAGE_WRITE_INV 0x0020
  /* For use with page_set_flags: page is being replaced; target_data clear=
ed. */
  #define PAGE_RESET     0x0040
  /* For linux-user, indicates that the page is MAP_ANON. */
  #define PAGE_ANON      0x0080

  #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
  /* FIXME: Code that sets/uses this is broken and needs to go away.  */
  #define PAGE_RESERVED  0x0100
  #endif
  /* Target-specific bits that will be used via page_get_flags().  */
  #define PAGE_TARGET_1  0x0200
  #define PAGE_TARGET_2  0x0400

  /*
   * For linux-user, indicates that the page is mapped with the same semant=
ics
   * in both guest and host.
   */
  #define PAGE_PASSTHROUGH 0x0800

Anyway that confusion aside:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

