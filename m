Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18B379DE2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 05:37:44 +0200 (CEST)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJDL-0002t9-B0
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 23:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJCK-00022I-8k; Mon, 10 May 2021 23:36:40 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJCI-0001Pi-JT; Mon, 10 May 2021 23:36:40 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n2so27602586ejy.7;
 Mon, 10 May 2021 20:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NjafwwthRg7lYpPNh+BZ1yo/tnN+GLqHjZ78rXy2DQ4=;
 b=FgOe8U6ZbE2k8bPO+t9r/h8FWluTEjMCK1iY+8MpCmsLuQVxINzzYLAOc6h6vE3iQ7
 K4pXhptd+G29LBFENW6mIJ3Ghi27ga9283VCJCyBOkl0IxVa5BHQYsews7ZCO2PPpqqY
 6N6jGB7ipReBR3Tp+eJfB32/dZPUPmBCc9guERIS/VitcSO04uhe3yjYDzmX+ChlewgY
 Ju4w9cTMAMWuPsqL+6ytF0/rkMNDy5mxNAMWh2dTOzKZpBETaTXXpEci8lrJ8KGHxQr7
 8LVsT06tcr1VJK4q+anuhGH5paY8KKWpGJ7dHY3gfbMezJ8iewHb50BC+tC6L2KqIsIk
 wC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NjafwwthRg7lYpPNh+BZ1yo/tnN+GLqHjZ78rXy2DQ4=;
 b=IXF/9mX/h4k9FI+wiOfjyhH78rWrjhKGrYbpgHQRieWFbR+dQQ/zxaFXVbu2glivTN
 blIcPka8F9RpuT8a+TdkGcMiy7rVQKKq0nOW/QpoKM9K1nwsIBUb+4z3C43N2g9u2Bkr
 hOpUNXf3UzI5tmSN1sjgt0YYtJSNr9TIrwCt11pjfiZ5kAKqHtN8quDeQKLsC6zMram6
 Jp73QSrsH+JZFJct12Nwe3qAQD8cV1TZjkLByttKupIxtJloWf9hXO+67r+ipX06Shx+
 +DBtDte63t+4MdfYd4Kq1Kr9deGIRzXwyP/HQbinGIAKidFMtTymlZbhnn0Lpfj1cd5I
 Jheg==
X-Gm-Message-State: AOAM532iwzxtHG/bb3RkidaQGTLRnFuLGYQs2GqVWwtmZUi9xoddrbre
 Sk9I8iwXuON2NfvU+7T7LAi87jBPoPSIQQ==
X-Google-Smtp-Source: ABdhPJzO5mQaaV4B5vfx8KgE9Ie4hU2KLHTFNs89zCLX04BGDoWftaEyT3oCAYIX3YJubbZ/DgMgJw==
X-Received: by 2002:a17:906:edcf:: with SMTP id
 sb15mr28797181ejb.202.1620704196045; 
 Mon, 10 May 2021 20:36:36 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id re26sm10541829ejb.3.2021.05.10.20.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 20:36:35 -0700 (PDT)
Subject: Re: [PATCH] hw/pci-host: Do not build gpex-acpi.c if GPEX is not
 selected
To: qemu-devel@nongnu.org
References: <20210425182124.3735214-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <29fc7f06-7043-598e-98fb-dae99273e5ea@amsat.org>
Date: Tue, 11 May 2021 05:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210425182124.3735214-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Xingang Wang <wangxingang5@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Jiahui Cen <cenjiahui@huawei.com>, Yubo Miao <miaoyubo@huawei.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial (patch reviewed).

On 4/25/21 8:21 PM, Philippe Mathieu-Daudé wrote:
> Since its introduction in commit 5b85eabe68f ("acpi: add
> acpi_dsdt_add_gpex") we build gpex-acpi.c if ACPI is selected,
> even if the GPEX_HOST device isn't build. Add the missing
> Kconfig dependency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> The gpex*.c files aren't covered by any MAINTAINERS section:
> 
> $ ./scripts/get_maintainer.pl -f hw/pci-host/gpex.c -f hw/pci-host/gpex-acpi.c
> get_maintainer.pl: No maintainers found, printing recent contributors.
> get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
> 
> Markus Armbruster <armbru@redhat.com> (commit_signer:2/2=100%)
> Paolo Bonzini <pbonzini@redhat.com> (commit_signer:2/2=100%)
> Alistair Francis <alistair.francis@wdc.com> (commit_signer:1/2=50%)
> "Philippe Mathieu-Daudé" <philmd@redhat.com> (commit_signer:1/2=50%)
> "Michael S. Tsirkin" <mst@redhat.com> (commit_signer:14/8=100%)
> Jiahui Cen <cenjiahui@huawei.com> (commit_signer:6/8=75%)
> Igor Mammedov <imammedo@redhat.com> (commit_signer:4/8=50%)
> Gerd Hoffmann <kraxel@redhat.com> (commit_signer:2/8=25%)
> Yubo Miao <miaoyubo@huawei.com> (commit_signer:2/8=25%)
> qemu-devel@nongnu.org (open list:All patches CC here)
> ---
>  hw/pci-host/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
> index 87a896973e7..d52dce77cbd 100644
> --- a/hw/pci-host/meson.build
> +++ b/hw/pci-host/meson.build
> @@ -3,7 +3,7 @@
>  pci_ss.add(when: 'CONFIG_PCI_BONITO', if_true: files('bonito.c'))
>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_DESIGNWARE', if_true: files('designware.c'))
>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', if_true: files('gpex.c'))
> -pci_ss.add(when: 'CONFIG_ACPI', if_true: files('gpex-acpi.c'))
> +pci_ss.add(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'], if_true: files('gpex-acpi.c'))
>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_Q35', if_true: files('q35.c'))
>  pci_ss.add(when: 'CONFIG_PCI_EXPRESS_XILINX', if_true: files('xilinx-pcie.c'))
>  pci_ss.add(when: 'CONFIG_PCI_I440FX', if_true: files('i440fx.c'))
> 

