Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B7C4010BF
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 18:03:35 +0200 (CEST)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMucI-0006AR-2m
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 12:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMuYn-0003E9-UL
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 11:59:57 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:36817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMuYm-00068J-Jy
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 11:59:57 -0400
Received: by mail-yb1-xb33.google.com with SMTP id f15so8520135ybg.3
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TMHsumP1XrX9UuoQgf0ckY34OxQzviClAicldSz/+68=;
 b=n/gxzzxEbz7YQNUmXRxZ5vYvC/h5zSrPzHWrZktEOCNdOHeVAupV9rMoSvvzddSMvF
 EmRMeWBQkSBz8kcbNreaVxMiyXcBylhr59YYsw5rBc2vuaEYI9ROQnMNrkk8j858DXN/
 yOCrKDjUILwoictT0S6Zx3IZTUsfBSzamF11Uu635wuL3ul/uUaCVFj51/stByergAn+
 z13rD/9JHp9HPb6f4svq0FyZI9VX4tTCEyu97zefi68wd1Lxi2nGe8rLwyPgYssCZUct
 FvgfGZLZ7iTm2MSFlBpU1Pcd+yQzO3YHNwpZAEV2QVzmmusKrKF7qLaHG3FqMaZDLhG6
 yWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TMHsumP1XrX9UuoQgf0ckY34OxQzviClAicldSz/+68=;
 b=LEfdC/rrpBAivgStjY/r9Lp8jStpgnspxt+3dpjDJPxtYmRybFv8zMX3LrWP4jmB6J
 EAcUnwv30u6Cyfr+RheX2Q6t0qinSZovp1zJQ28zIO6JL4JLyiRUiSwUttM5FrAIuvwM
 uNIEUlNomeAC148RQGbvOMJx/e6aOq28YEpi9k2Y98u2TqiyhbWpWieWdfQsRK7X9h8r
 8C6rVsh5xmtcBz7stsAkyPYN0Uw6TMS6yU1VxQa7zIAPTfmguig1CKh2vPW8ilQYo/hi
 Q9753IEU7GT/Bg6QLJ3L+DiGyC1CXaTvJXIfM4bXYIEOKW/BgdolrEEDiHXZCjQZPMWq
 zKNw==
X-Gm-Message-State: AOAM532Zrkh0Gg7gq7rMENjUV/MtiiwxXB9Xa1rrcljeci+C4oABXkPm
 dI4vd9UIGgFlDxTabREKIxuIlrgsqU/7pd9vOF4=
X-Google-Smtp-Source: ABdhPJy4K8AqHHjyx6RwPHBHcaQePIjgagL2wk4GcR9sr4oIKZyRfiT4vA9qEQePeIqfr0uwVgU/QOLiivEPH7tfwRY=
X-Received: by 2002:a25:80d4:: with SMTP id c20mr10596076ybm.345.1630857595131; 
 Sun, 05 Sep 2021 08:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210904235542.1092641-1-f4bug@amsat.org>
 <20210904235542.1092641-19-f4bug@amsat.org>
In-Reply-To: <20210904235542.1092641-19-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 5 Sep 2021 23:59:44 +0800
Message-ID: <CAEUhbmWa54h8GQNhczC9a+5OLXMdUwaAJYBq2+FdG1dAWO6BQQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/24] target/riscv: Restrict cpu_exec_interrupt()
 handler to sysemu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Warner Losh <imp@bsdimp.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 8:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Restrict cpu_exec_interrupt() and its callees to sysemu.
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/riscv/cpu.h        | 2 +-
>  target/riscv/cpu.c        | 2 +-
>  target/riscv/cpu_helper.c | 5 -----
>  3 files changed, 2 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

