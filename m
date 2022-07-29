Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CFA585177
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 16:22:23 +0200 (CEST)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQsg-0006n6-71
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 10:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHQp4-0003h3-2B
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:18:38 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHQp2-0002lu-Ar
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:18:37 -0400
Received: by mail-yb1-xb33.google.com with SMTP id e127so7656083yba.12
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=zKfiLfnf97M25tEB3vH908lioT94s15xazhyBc8D+n0=;
 b=cdnKQm9VCmNag3HDJQO9ztvx+wm1F7ZipMLk37jDuPFzTixrmx4DT/alxb83KizMyt
 LqgoxE2v0IgQuWPXxmNZey4/JjUzUgN4lafG0YyBaXBKa8P8CGG4Mbnp01iWnv0POX2/
 Y4Lwph/bYjHEdSw5I0pvcky+0cF08e3G26alP/2p9+r2C88um0JNTHFa1IrQr562bVY6
 JctgmUD9PYVpmKqGkWnrcUWMQWnC/Y1VWwp8MEBwzp9/w9YKs5E2w+F5MienLqI8REj0
 iprV11s3VsjG2n8gdal0Ucu0glgXeDBO2S0akYhX91kop5t1QxDTPk6S0EoXH/xWG4Nx
 dA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=zKfiLfnf97M25tEB3vH908lioT94s15xazhyBc8D+n0=;
 b=Zl0UNKOJ1+oizTZ1ZPboZAD7iYr48CutbZ1OqElToM5O4qGMJMH4Ezd9v8iPX5+Yis
 3IsC5ILJbwivx8iHQ6f8V+aEmn64iJOukRnQRCRuHaOA8mpR1TecrS28H+i5/PCvOX0n
 ChXlrj2v5/eoAvMIjf2gd0TJt9b95TJvlyzffHcB2r3gN4na3QCZkPZ5239AWp8Srnb0
 qy5prEaHrOi+xQMOdM1lqKwFugaJhbtH3+OMtjHL1cv4CVBjwzYglJO2exe6QPArav+5
 k2yERCphGDvQcA4HiEyKuU0JacWC335/LKct6IObyaIbYmfibYQaBCipEGGS08RwVIMw
 xbiA==
X-Gm-Message-State: ACgBeo1UN+5JUKI/Ja0IzAykP+Aokj/tJQkuST5hK98XYJjRW9DFA08A
 GZNU7IyrTBJjk5NzgFPJ6vc2j5xvoDovRhbJbHw/Bg==
X-Google-Smtp-Source: AA6agR6Y7yobLhoN9H5e5tcATNxvnInJ0md716c1fT2cJLWvTknJdVx9WmZcAxEwONCOYDvVFIFLRyFEhENZlkiLBA0=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr2684938ybq.140.1659104315246; Fri, 29
 Jul 2022 07:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220729140252.66572-1-milica.lazarevic@syrmia.com>
In-Reply-To: <20220729140252.66572-1-milica.lazarevic@syrmia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 15:17:55 +0100
Message-ID: <CAFEAcA-N-GPKqLeQtOWVMHvB-Di4inKK8Cy9XFjT62PMeiyBRA@mail.gmail.com>
Subject: Re: [PATCH] disas/nanomips: Convert nanoMIPS disassembler to C
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: thuth@redhat.com, qemu-devel@nongnu.org, cfontana@suse.de, 
 berrange@redhat.com, pbonzini@redhat.com, vince.delvecchio@mediatek.com, 
 richard.henderson@linaro.org, djordje.todorovic@syrmia.com, 
 mips32r2@gmail.com, dragan.mladjenovic@syrmia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 29 Jul 2022 at 15:13, Milica Lazarevic
<milica.lazarevic@syrmia.com> wrote:
>
> C++ features like class, exception handling and function overloading
> have been removed and replaced with equivalent C code.
>
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
> Please see the discussion about why converting it here:
> https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg01803.html
>
> The validity of the disassembler after refactoring has been tested with
> the QEMU emulator version 6.0.1. With the most recent version, there is a
> problem with the executing nanoMIPS programs in the semihosting mode. The
> issue is reported here: https://gitlab.com/qemu-project/qemu/-/issues/1126
> We're currently working on fixing this.
>
>  disas/meson.build                  |    2 +-
>  disas/{nanomips.cpp => nanomips.c} | 8407 ++++++++++++++--------------
>  disas/nanomips.h                   | 1076 ----
>  3 files changed, 4154 insertions(+), 5331 deletions(-)
>  rename disas/{nanomips.cpp => nanomips.c} (73%)
>  delete mode 100644 disas/nanomips.h

Is it possible to break this down into smaller pieces so it isn't
one single enormous 5000 line patch ?

I guess partial conversion is likely to run into compilation
difficulties mid-series; if so we could do "disable the
disassembler; convert it; reenable it".

The rationale here is code review -- reviewing a single huge
patch is essentially impossible, so it needs to be broken
down into coherent smaller pieces to be reviewable.

thanks
-- PMM

