Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE22E43797B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 17:01:37 +0200 (CEST)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdw36-0000xQ-E0
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 11:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdw0L-0006Qf-55; Fri, 22 Oct 2021 10:58:46 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:41746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mdw0H-0002QW-GP; Fri, 22 Oct 2021 10:58:44 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id i9so7553756ybi.8;
 Fri, 22 Oct 2021 07:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z0c1JyvVtjuZpSKhS0t0Y5KwURHtkqj3x3VO5PMsQFI=;
 b=Jl7Y8uklN5q9/Rc5PLtCPdoj/RQYf3mMydl1Yufde2PnnwdIdcGOObuwopDM0iPVNp
 72UmW7NYTKzNfHNwgnWQ7M8JZ045j6DGoEC62gRD0Ai/yk3E18gGlaZDcdArhOLlLXB+
 b4chFTX5qCqx8m9UVlU/btOZLfhNT/CcOI9Iq356gd9+2aYVjybRRNtPaI6ctf4NFDwW
 37XZ7GptqqsJjDnOybkp3Z7YQCe0jfF/RYHPbKL+4qcCCoxwxEkFRTIdxlRsirM5mxQw
 t/BDiLW+H2lGl1XWvBLF9ruuJBDfOkQnhRYBhwJYdLm+NKojVLGta9V81UC4nDVuV7cr
 oadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0c1JyvVtjuZpSKhS0t0Y5KwURHtkqj3x3VO5PMsQFI=;
 b=1iVyq1RPptxEQtdffjuriCnVSGlaBp5g9J6I6idxwm+BlJa/lxEaVIl3e1NDnLTAJt
 GqUpzQc+WEOWIwEfuHEHQ8LsKsgij0wNuRXeUblErb3vlmkeo+NXknZyTPYLQ9LiiUha
 Sf1jhk0akmxzNSrN35sQaTEPNqTzvC6BV6G80wRSLou0JQ0wpcqe/mhuyN95ayNd/dO+
 trXG1VrzUGuQfsF4E0bQm/QDP5egwwaYhBBT65+BB6423kxzhkSLd0MI8aZE7c8D3pDr
 FZQiKvinACXILSJARXCfI1kgmP8O3alFyg8w4H65RkzUlyzrqdKrb8hxEOc2ICnIUt21
 FQYQ==
X-Gm-Message-State: AOAM533KdFwSaVQPghjI/3C48aA4ekGA2fU3ZFPgXVc1laeeJt07nvk4
 fmKmr9kloIvS0pZ/VpGLVXKv31iZ1+37VL4OBWE=
X-Google-Smtp-Source: ABdhPJxvfFO4asrwdOKoCN/eszWMZ0JysK7ToMViLELV0zSJn3NqehgW1qvCoIH5AkZPu9zQsAGd1y0Vf5H/B8hz2Jw=
X-Received: by 2002:a25:c750:: with SMTP id w77mr189687ybe.109.1634914717998; 
 Fri, 22 Oct 2021 07:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211022060133.3045020-1-alistair.francis@opensource.wdc.com>
 <20211022060133.3045020-5-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211022060133.3045020-5-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Oct 2021 22:58:27 +0800
Message-ID: <CAEUhbmXmt46HkoKDTy-hDjM-PdWpqgg976fhUvJZW1nJPTRqmQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] hw/riscv: virt: Use the PLIC config helper function
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 22, 2021 at 2:02 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>

