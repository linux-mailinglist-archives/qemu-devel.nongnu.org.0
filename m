Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3951ED79
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 14:21:43 +0200 (CEST)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnfuw-00077a-9i
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 08:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnft3-0005Gd-31
 for qemu-devel@nongnu.org; Sun, 08 May 2022 08:19:45 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:40460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nnft1-0008Um-IJ
 for qemu-devel@nongnu.org; Sun, 08 May 2022 08:19:44 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id y2so20367634ybi.7
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 05:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ocokXtQl4rl2ryeBgabF5EOydXwdXDlseG4jxNRvCk0=;
 b=thDigvjWr1ZuVmZ+9jisosVipDXx8DnhrXXbvoGph7ftvRvduVfGztsgjvWM7uM2WQ
 L+pKTUHsITIfLSsws5anQRVdmM8y6llecChDcAMYBXkTQDntk4oHMOgEwBKCoIret/12
 8ruqAgOAG5aUjWczCW5jcHwIiIXh7urTYj08KxDGV8Se5kM+qlZvNPYCLM/Y7RbN1+tI
 53n+wOvSYRezjqW7emskoHiL3tD6tRJ4B5wcWXInoR2tVxDSTejHi4M1CDVdivuDxynR
 jqgMTR2Jy8a3QE9x7gWfudH+6aQjMVEmqgmMU1yv79mU3S59UL5c6nRZ9zpDAQU8jpQ4
 4Szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ocokXtQl4rl2ryeBgabF5EOydXwdXDlseG4jxNRvCk0=;
 b=vWXipv+Pd6DWKOWSB6lsDg2f5dn/EJ5FhbEIeWSC5B7b8FD1jRC4eVKVvzqO1fgEGF
 RjV2ksX8cpckTQDpH0vpggjXdXo62v04dcIojOVHhN6lRqZ3ici69Wkpk0rRRh/fBdm6
 U8Q7fGW1Idvim9YipB3j9CJBxnKcjdmIFTWHzOKn+lyoDKIAsGVHTfpL5Ms010bXGj2/
 Tvw/A3vr2N9PsP1n19Chs2kbUygKYEIbKvT269JPgOHQP24YNG/+iASzn0ONKGoCF+B4
 pMHbygkPXxbDQWdUdl8yBZE92+vt+zkdTiZ1SH0Ra3hhgWJJUZwBe5E6jcQwwIP2X1gY
 m5DA==
X-Gm-Message-State: AOAM531eBKEMKaDF0/ngoeVH6n1pcmqteElkC0LYUp5Uypvw3cTyZVoM
 p+m8yNveZ36NhIjgkwoRQyl+vnpAAbjXNZvRRySv9A==
X-Google-Smtp-Source: ABdhPJyTV0XPdThh8Q2SamCtkA77JOXpYOued7eQJDAp3oSbel+md5tSZMLKoK5SZrv4xdAh6xCnMAl386HQ6W2i3m8=
X-Received: by 2002:a25:6f85:0:b0:64a:8b67:d3b2 with SMTP id
 k127-20020a256f85000000b0064a8b67d3b2mr7430525ybc.85.1652012382515; Sun, 08
 May 2022 05:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <F1037D57-EB8E-43FA-A2C7-A43C45FEA82C@web.de>
 <7988B475-EEC0-4574-B0E2-BB61738B8964@web.de>
 <CAFEAcA-Dy=nY9SCtxv0omYCQqDqGq6Qwvja4c6f_9rPR8L-KCA@mail.gmail.com>
In-Reply-To: <CAFEAcA-Dy=nY9SCtxv0omYCQqDqGq6Qwvja4c6f_9rPR8L-KCA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 8 May 2022 13:19:31 +0100
Message-ID: <CAFEAcA_2N-36Yv_aOVg3DvkZYvfBTUDDDibz19N6+uSZGwEfUw@mail.gmail.com>
Subject: Re: Possible bug in Aarch64 single-stepping
To: Chris Howard <cvz185@web.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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

On Sun, 8 May 2022 at 13:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Introduction
>
> This document will explain how setup Mutt email client using OAuth2
> (modern authentication) to access your emails.

Argh, sorry about this. I mis-clicked something and pasted a
load of bogus text :-(

-- PMM

