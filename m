Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A248C4033C3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 07:27:02 +0200 (CEST)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNq6v-0004fa-Or
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 01:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq5j-0003CZ-Tw
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:25:47 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mNq5i-0004If-Eg
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 01:25:47 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id c6so1763384ybm.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 22:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tO46fVX7ZKClLBB/Qma2STuWS534urrw9a1/MhmrKnw=;
 b=ikkbg+a5AzhCDubUlebCgQJPwrxCeMTNXh4o294CKWPfY3W4OPwhZdJNt4BY1lh5Rd
 C3frAxH7gEvNSfi1LisLomgG/v6DiyfiZ+EkMQQDHnbEqzyI1uCRMN+W6ojTRhQWvCCC
 iU3AZXoGKrxcm2mtmrmBSg7dMt8AOWAjn00FvgfQEUmsOAKYmFayESWRw2EHjZwpCLcB
 SwwIyG3+3c1Z9L33cS7HZGrs8Pku4S38p7V+Y4vv+STeGS4rMVYNQtsV1B8/aCdu8GPL
 u6z6rDEhNjN2/03kb59R9GZMHlC8d0An44dMTeoC71f1xWRg6w54XDUMBMRNM4k9RM9k
 KL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tO46fVX7ZKClLBB/Qma2STuWS534urrw9a1/MhmrKnw=;
 b=DueZ4f5pAKwRwnrND6Spv4xuImshb/BrtQpSWowq4t0XZTsy2dPP0lk4puD/ndsxek
 HZ712B/BE5bXtjsTGcqOESooOIovBRAJqXhai9l0zGzSp4UN3aD7DG+AgRLV9gqFyWCs
 c2dp+HrKFJ9sP4ekXelAB+DULKPwSUt8QHOy8YHxp0IOGpxtAitjk1vSYO3RgjP89gya
 LmrOGkVarz3TbuUIIfsw88sJ7jLAMBN6Nka4XIIiBejKuXJsau0cJerYz+twkYR6lFax
 WvVpXdN+lLQp63U+rO9/s9e3XyGPIfq61yDTCd44SzfTpC00H5f3LJB6ATOIovj7IspM
 +BJA==
X-Gm-Message-State: AOAM533mdPr5w7d73lZ+LJEsb6YKk+h4o9MRAl3A6XEBWL1Stwk0ODgk
 +0QRytcXsyfqstZSWhLgYd1Y7/mVsI/EaPi7et4xu11nRXs=
X-Google-Smtp-Source: ABdhPJzICw/W8KgsXe1qis7ftzQmG5iRwxnRBLIlytoQ1bw98CQ6Xh2t8XnVOVLNKa3QhybcZaXEGa7rnRfHmjl2SAs=
X-Received: by 2002:a05:6902:120a:: with SMTP id
 s10mr2588172ybu.293.1631078745156; 
 Tue, 07 Sep 2021 22:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-13-philipp.tomsich@vrull.eu>
In-Reply-To: <20210904203516.2570119-13-philipp.tomsich@vrull.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 8 Sep 2021 13:25:35 +0800
Message-ID: <CAEUhbmXMj9veb3zLd1Vg8b5j-FUw1z6ZuVUzs5hgkoBeXJG2sg@mail.gmail.com>
Subject: Re: [PATCH v10 12/16] target/riscv: Add a REQUIRE_32BIT macro
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 5, 2021 at 4:47 AM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
> With the changes to Zb[abcs], there's some encodings that are
> different in RV64 and RV32 (e.g., for rev8 and zext.h). For these,
> we'll need a helper macro allowing us to select on RV32, as well.
>
> Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Moved the REQUIRE_32BIT macro into a separate commit.
>
>  target/riscv/translate.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

