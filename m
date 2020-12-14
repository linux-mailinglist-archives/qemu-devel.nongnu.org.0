Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D32D9646
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:26:17 +0100 (CET)
Received: from localhost ([::1]:42530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kol3Y-0007PS-KG
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kol2F-0006gM-6Z
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:24:55 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:46075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kol2D-00015C-O1
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:24:54 -0500
Received: by mail-ed1-x544.google.com with SMTP id r5so16579202eda.12
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 02:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zEybmFhW7e/zqqQdl5Y1OZHC+z0S3Ag4I4cyARUEHRs=;
 b=KLWC5jVNHGltBBNkDD8vHlW4IH/Bg6wVtLAyWP/0Pa55JsD3CF/x6r3ZqGGCe8Dbxb
 cRQo00DGXuTNN+YLk6hDi8Sr9aII9wffOXkkGegrbF6sMExxMGJXdkm82i2T5y/GfOtW
 kQmynnwKhCKbdSEJW5SRsf4o4PNRmNU0tL1FdEr0RabLxPNuDXj8ns/I72vRhilmz2Y4
 yvq4ud5fIra8ZO2BsYGWY0dvAA+ZAkWEeZa2XmBDxotHXmQz6vWOqP6IpJbuim2L8yQI
 CLhiEkv4NnU1N6EKaD9/J07ipCBco/YoFy4z7pQOc4wUFGK/lzJnlPlw1obO7N0KC6i1
 YP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zEybmFhW7e/zqqQdl5Y1OZHC+z0S3Ag4I4cyARUEHRs=;
 b=cy4ZfIktfT8YlGyij+AqJM+bJfv6tfA0RRhEk/ckCkeDiOj8l6PT21o/3uuwx4xncp
 HLMWudarGDkkpCxFEiC7sHrbfdSdZaGGXMMw9gwFHZm0r2DgdTJklteUG2yyAV41flJp
 ePpJML4P37gguNLSzz0/6g8API9+w142U/asB4YeBWGcc4zrhVLmy8d29EDVf9Gkcx2C
 UV6w4OvJGCfNKrIj4AOFCscVsQw4HFy1H7yOsZM9I8PfrHqvqY4/jlE7cvIt0DubVlGM
 dD7X9mjYy95rSa23rFSc80FanyzpucIAbojMWt7dctH3jJvGB3rJsiRbNetKBy+fL8xt
 ghcA==
X-Gm-Message-State: AOAM531csfQrldtj2L2cWJXFA3XSw2PeBsZAljN4yt5QcQs2F26OtkOR
 G6MhC8Rub6vwMsQHlweWcfxS/zsl5IKixIoyhvyBeCtOSmU=
X-Google-Smtp-Source: ABdhPJwBdu99aB2RfLeWVG/L1fHvgszh89eEYBt1JKo44UuVXh3cNJx72zojChsnszJl0Z9lVzkxd5gckpLygHC2H3s=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr23857233edw.52.1607941492459; 
 Mon, 14 Dec 2020 02:24:52 -0800 (PST)
MIME-Version: 1.0
References: <1603891979-11961-1-git-send-email-mihai.carabas@oracle.com>
 <1603891979-11961-5-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1603891979-11961-5-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 10:24:41 +0000
Message-ID: <CAFEAcA8SycqckBv6+sOQ90OCY=UD3FRmXCqjXdh+bP8_wNQNYQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/arm/virt: Use the pvpanic pci device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Oct 2020 at 14:23, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> From: Peng Hao <peng.hao2@zte.com.cn>
>
> Add pvpanic device in arm virt machine config file.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>  default-configs/devices/arm-softmmu.mak | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 9a94ebd..4efcca2 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -44,3 +44,4 @@ CONFIG_FSL_IMX6UL=y
>  CONFIG_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
>  CONFIG_ACPI_APEI=y
> +CONFIG_PVPANIC=y

This should be done in a Kconfig file, I think, not in
default-configs/. More specifically, if you get the Kconfig
right for the pvpanic pci device when you add it (by giving
it a Kconfig stanza including "default y if PCI_DEVICES")
then all machines which have PCI, including Arm ones, will
cause it to be compiled; so this patch can go away entirely.

thanks
-- PMM

