Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0841D2E879F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 15:28:15 +0100 (CET)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvht8-0004ny-2X
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 09:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhJ6-0000dm-2I
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:51:00 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pragnesh.patel@sifive.com>)
 id 1kvhJ4-0003Vt-G7
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 08:50:59 -0500
Received: by mail-ej1-x633.google.com with SMTP id d17so30456611ejy.9
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 05:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=08MZbdL81dXa7tMD8XyvYgTJboEnwKGPjFl7Rg6OUcU=;
 b=YDlNMSaPgb1EYkjDdWi6H00s39qDxMMvSyHGPEw/ZvbH0I5EIH7PxGvIA6ejpgZ23r
 FdDE3oBJUamET2zWa0PnWVKGr8xtWmX9j2Tjtz6CbMoPDOsONUv07/FP4SeoCnhd96+w
 yE21bNSTICXjNzNEGK7FxEUC/il65b1cg9tG4XauxqRvIt+7FM26doOxX8IGi3qDfCMF
 9BB1fIFZ643Yg+LjlOzegUqxHUuM1ndjTwR2l265Is7gTyohr/LYZMKVIJhET0Gb20X0
 WI04O/SlUYwn9ulMPSSAnAl3kRuvAyqpR5/5m/zKrqGuM+kaW4ui9vNvLbxYgVDuiIt+
 XD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=08MZbdL81dXa7tMD8XyvYgTJboEnwKGPjFl7Rg6OUcU=;
 b=oCfE4r+cW5EoAQRNdX152TAYY4c163D/z2D+Dyba0f/YrQ3RyFhsUxuALPEtWmDjpp
 0jyTvPkgdZ+B61mAQxV2+um7S2NgK0IwnoDyTE/coZdGzB5qTbGL3C190E2z4e3t9Tx5
 py696YMGHzBFCHbf23IMK0bU7UNoQLP86Ebtktx7tC/UGzk7NW79DWAXyPrdOKxdHbXP
 vcOERjIPSD9zGB7LOaawHc/X7Wmk9DPW9m1wIZ14D/kjDVOB0cZ3J4TV1MT6iAzsUVxp
 xTqVmCRZWd2Eib0kxZscUtzT+35eU9u9IEJ8nJHnEugsKsVlnjMFFB7w2sw6Vz/xrjJT
 Nlxg==
X-Gm-Message-State: AOAM530KKMEKtv6shfPILqRtJbx0MxN5+J4oECrZWm/Lf798H+4RqCFr
 V6NtMSY/oxJBtAxQotQ6gwflIn8+RRcJKACAGXyOcA==
X-Google-Smtp-Source: ABdhPJxv07kMlPZwnyGK3YBvzKr3imeMUH24j8V4gUXlSzDdploOOua3ih3Hrp0rXL0KbCL9op85Aow6x29aFKHEUZU=
X-Received: by 2002:a17:906:440e:: with SMTP id
 x14mr21378196ejo.77.1609595456841; 
 Sat, 02 Jan 2021 05:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-5-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-5-bmeng.cn@gmail.com>
From: Pragnesh Patel <pragnesh.patel@sifive.com>
Date: Sat, 2 Jan 2021 19:20:44 +0530
Message-ID: <CAN8ut8Lo2f+Z0nsxejDCBuJO8AoC2o4QwWX+4es8=MO4KQo4aA@mail.gmail.com>
Subject: Re: [PATCH 04/22] hw/sd: sd: Support CMD59 for SPI mode
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=pragnesh.patel@sifive.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 02 Jan 2021 09:24:39 -0500
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
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 31, 2020 at 5:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> After the card is put into SPI mode, CRC check for all commands
> including CMD0 will be done according to CMD59 setting. But this
> command is currently unimplemented. Simply allow the decoding of
> CMD59, but the CRC check is still ignored.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/sd/sd.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Reviewed-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Pragnesh Patel <pragnesh.patel@sifive.com>

