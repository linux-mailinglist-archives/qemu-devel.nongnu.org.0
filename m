Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D195F3822A0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 03:58:05 +0200 (CEST)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liSWC-0003nK-W4
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 21:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSV2-0002Lj-6Z; Sun, 16 May 2021 21:56:52 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSV0-0001fh-2K; Sun, 16 May 2021 21:56:51 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e190so6436868ybb.10;
 Sun, 16 May 2021 18:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MdUDeR4rnuS357cVYHKdFK/P4yJxsmHWbyyMRd5YlfQ=;
 b=qHstk+/8bDPk0TAP4B2Rb6rk6KZMT5WQzSFszow62/MCekNJsO3uQYqmcFMIM2Mch/
 c3FnYG/SL3tSlI3wWhATPbemsPfpMa63tfB9eOMg9HgK7vtFBccJwwG1xRxaVD4g4+hW
 7vVPKWAXDYO9F5+ymJmhgYRozbUKBWQh0o6Rx0i1j3pto8loRvd6UOapsia9uk7krEAn
 n4H+pWrQ3ntOyKixs9yQLIDfSG8rJmVt9YYixgsboWRLY5ksR3G+piD3ys0AGNMI/D73
 GID6mlr86EW4xsnT5Ugu8cHDuGmZ69IlrqZ+QCYsIyoSqga971hJiHnprw8T/gsNul86
 exxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MdUDeR4rnuS357cVYHKdFK/P4yJxsmHWbyyMRd5YlfQ=;
 b=DoGBjTSFayE/lBOVvhTcJldoGjpUm/mBSNbQy6vYzsyl0HWSwYVeJ9N+F24ktIKqlw
 P1W+FfUbjxTlWCYCL9tVbsfxBplO7xs+2nXA24j68EOVl+Fzt8kkjOAGFuTsGDuew6rz
 7Sh5rqz1wdQ5JFgmiuB4JaDp/F/ijcWSfolBeCXcig4mjWH4+ncnhdy9eJ1Qbj64OczC
 hEPkKyRXod741iLG84Sz1vwTa3l3+zpCF5MShlcgc1JaFSeL9IP7c7nIQ1c0cNYsEt6G
 hlQEOp78mLWLtUxmuoq+wlk0fwshvz+ohwq1FuRAtnrk5tnXsoi3izoj8MiduSzryV2S
 GSAQ==
X-Gm-Message-State: AOAM531XwT0sbhWgMp6Yk3dBNk/L5pG8vqQt8M9fKsq27tva+W1mD+aF
 oiAhLD+aAwd/2jvarHYq2/pvNhPtpJadEGsGOUk=
X-Google-Smtp-Source: ABdhPJwp4pqAE3F7V/6SCKHRPpoGLEPR5uRUWeN7JKZR1UxJEIbgllVxcA2d9m0yRRWmwNvCa9ok6ejB/rU5D8f6J0E=
X-Received: by 2002:a25:e645:: with SMTP id d66mr48300489ybh.314.1621216608760; 
 Sun, 16 May 2021 18:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210513171244.3940519-1-f4bug@amsat.org>
In-Reply-To: <20210513171244.3940519-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 09:56:37 +0800
Message-ID: <CAEUhbmXBcs9s6qfR_eTKgAfHvKaqc97T844HSR_BPEUtWDv5uw@mail.gmail.com>
Subject: Re: [PATCH] hw/input/ps2: Use ps2_raise_irq() instead of open coding
 it
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 1:26 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Inspired-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/input/ps2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

