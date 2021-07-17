Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D263CC6E1
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:42:28 +0200 (CEST)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4twx-0001YI-Rf
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tvk-0000tu-Nv
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:41:13 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tvi-0005E4-00
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:41:12 -0400
Received: by mail-ed1-x52f.google.com with SMTP id v1so17962054edt.6
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tkxZEiO4zHfvSDxpnJEJDTnoAakXfqUVGyeJ0x1RR5I=;
 b=GnLriCfFo7woIL5Y1LJtZxMMV5yU9URbXnB20AU1xTLw+/qhb53UpcNBR9PkmnTHwl
 YutWm7J6gN0nc05IiEyfN0EtXbzVOfQmOgSbsRIplEYpScdA5c2mgINmwjp+bqliPbl+
 aLsMa+RY3DKx1vrzrttZqYwiqJ/mZo4D3LOVEToDutO43pirSqRQP/9o7B3qiMweg1UY
 uf00myGhBZI3ovFYI78KRd/JSqFo3SWdQI+UD38IgO0GoudNGcIjWKahPF+pLzXEN8cD
 W/DwMdBchsL5m4hECN5CSDmahCgxHstLM+Q+Dp+A6kITFpa5jif2gxB3AJmP3hV2ttKd
 jb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tkxZEiO4zHfvSDxpnJEJDTnoAakXfqUVGyeJ0x1RR5I=;
 b=gDbvjbw8Wf6YeafI4f+JR81+XWAc/iyz4OCLphG4Pe/P0q+fIwvLZWnlzFeTCEhimc
 b8OLJKnxttYQrjifDfiZXNi7r9HyRZhpXAimsHBR5xeEbBFJib2DvyudMTwJCyNkFQ3+
 rSkha2Rr0eFhbR7nPOrK8UJNmt4ESJhX3c2jaVghqpwsWIPSrEFW5yYnj3YZlPmvpv90
 UFHH/kb05RLf0A4heC3MwPS0ZPOJC2P1tNi1NbB+FlBCYYBNtMpf70qNrzWYUgTQmPTm
 zMRy0T5tEneuErcnRdM5yUO9sGP/+RHVkydiPHSOdkz8SkidWSzrDt2NHStCdFXdh/QT
 SE7A==
X-Gm-Message-State: AOAM5311kXGrhDj+gQ0aQX+BHXjY178bPFB9puCTZN+qdt5duZYPed44
 dUoRaP/oQYop/6oYOblqSWWZ+zyEAs8jxF7OywO4+ZUuqc0=
X-Google-Smtp-Source: ABdhPJzvnf7/094rrHNPjT4KIj3/BFkk4lh10aFJK63lx5gX+TtLek1dRAXIXvHY4KnKCKJ3ieNQ4529oONKc3bH7As=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr25021309edq.146.1626565268233; 
 Sat, 17 Jul 2021 16:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210717232103.18047-1-peter.maydell@linaro.org>
 <20210717232103.18047-6-peter.maydell@linaro.org>
In-Reply-To: <20210717232103.18047-6-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 00:40:28 +0100
Message-ID: <CAFEAcA95smPcwMVrrofHpuo0Krh0Ry6fgJBOVs1eg83hczz6Kg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 05/10] linux-user: Split mmap prototypes into
 user-mmap.h
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Jul 2021 at 00:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Split out the mmap prototypes into a new header user-mmap.h
> which we only include where required.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h          | 20 --------------------
>  linux-user/user-mmap.h     | 34 ++++++++++++++++++++++++++++++++++
>  linux-user/elfload.c       |  1 +
>  linux-user/flatload.c      |  1 +
>  linux-user/i386/cpu_loop.c |  1 +
>  linux-user/main.c          |  1 +
>  linux-user/mmap.c          |  1 +
>  linux-user/syscall.c       |  1 +
>  8 files changed, 40 insertions(+), 20 deletions(-)
>  create mode 100644 linux-user/user-mmap.h
>
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 9e700d3af18..0cb79990579 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -201,12 +201,6 @@ extern IOCTLEntry ioctl_entries[];
>   */
>  int info_is_fdpic(struct image_info *info);
>
> -uint32_t get_elf_eflags(int fd);
> -int load_elf_binary(struct linux_binprm *bprm, struct image_info *info);
> -int load_flt_binary(struct linux_binprm *bprm, struct image_info *info);
> -
> -abi_long memcpy_to_target(abi_ulong dest, const void *src,
> -                          unsigned long len);
>  void target_set_brk(abi_ulong new_brk);
>  abi_long do_brk(abi_ulong new_brk);
>  void syscall_init(void);

Oops, this hunk should be in the previous patch (where these
were moved to loader.h).

> --- /dev/null
> +++ b/linux-user/user-mmap.h
> @@ -0,0 +1,34 @@
> +/*
> + * loader.h: prototypes for linux-user guest binary loader

...and this should say "user-mmap.h:".

> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +

-- PMM

