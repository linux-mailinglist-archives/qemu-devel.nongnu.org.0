Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1168BFFC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:24:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Q7-0008GX-Pp; Mon, 06 Feb 2023 09:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2Ns-0005xy-Co
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:22:16 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2Nq-0006gI-MZ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:22:16 -0500
Received: by mail-pg1-x534.google.com with SMTP id n2so5703947pgb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TbAAseeB02E13z1gGaCC9rI4ImRQfUWDzjq2rieospA=;
 b=Yc5qWPNJS8lfuvaZ5N/cHr1cGKbT2+WAd+VHx2A36hPhsOkMh8G0BlqE4DpRuGhgFj
 qIOpMc4M3NCLemL+nsQrjedVgJWw/UhpFfBuB/fZIBDElICmW4F+0ZVHQeQ2lzyPwJIi
 7lOkp2SPjmEJYDZ5atalBn8QDgRN6NmWrS5ht3Hr4LwDjn3NkawAHre9FDXiViUL3fg3
 fdcKJE5BBEgX0w+SlrX7MDBIKWGSNr/jvispkpjSb0a7Sr7P59Ywt8X0lyiHehax4K53
 3l6FnuSxkbb2YPW2YFYyRKpsAYH0LWnSZZcFIpiftbBqgUJL+p1ar0CZwlVAjLAa1Wjn
 1K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbAAseeB02E13z1gGaCC9rI4ImRQfUWDzjq2rieospA=;
 b=YJuDFRovMTqGHJXKOwLi9s8/px8A3Nu74JII98/XTbUhy1kiBbl7PH6ZsyUHKI7vsd
 8KQ9KjSBD4JN7Yf4iw0QMapDKh4uwe5bB8M8wSxdCUBECR0KIx+4TnDYpGxyZNU6YdLu
 LacDWbzN2b0n7MYV2EbLd01nspjHXv6/ojkXXcP+pUnuVcqNZRI2KUYhvQ61zP6f9OrM
 BZCQT83b0z6ooZVMNEt7J0Sykil/aEm2VvMnG5rbNX2OwX189cZxdulM3sKEeWDv7EuP
 q0cHbNK37JoQPD944WEocTmNcR5HfNr0klFH7xL+5Ch8E6uei7f6mwzzYqT/P9i51xZc
 KRCA==
X-Gm-Message-State: AO0yUKU1kZFMbH5+kK6JViuf/tfYT8r3RSLNWwE9MjYIkhl/Sf4Epvzc
 eGGwi6gVfWSecEBdiS6gaESIEGjoUH1k1dw5wYZe/w==
X-Google-Smtp-Source: AK7set/mp3pOszfL5t2BSMfPTD6zhuM8nis6vs4CEA4N4qtfwtJa5dGio/nLmoKnY3pHdNH+HtKwkCClAxqRfNad2Mc=
X-Received: by 2002:aa7:9686:0:b0:58d:ce70:4683 with SMTP id
 f6-20020aa79686000000b0058dce704683mr4342522pfk.39.1675693333336; Mon, 06 Feb
 2023 06:22:13 -0800 (PST)
MIME-Version: 1.0
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-11-farosas@suse.de>
In-Reply-To: <20230206140809.26028-11-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2023 14:22:02 +0000
Message-ID: <CAFEAcA9PVKam9400D++BYF8eOeHWWUzpWHF8puh60Jkv0rd4iw@mail.gmail.com>
Subject: Re: [PATCH 10/10] hw/arm: Select VGA_PCI for sbsa-ref machine
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Mon, 6 Feb 2023 at 14:10, Fabiano Rosas <farosas@suse.de> wrote:
>
> The sbsa-ref machine explicitly creates a VGA PCI device, so make sure
> vga-pci.c is included in the build.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 5022d519ea..74fceb419d 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -234,6 +234,7 @@ config SBSA_REF
>      select WDT_SBSA
>      select ARM_GICV3_TCG
>      select E1000E_PCI_EXPRESS
> +    select VGA_PCI
>
>  config SABRELITE
>      bool

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

