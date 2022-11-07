Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAB761F182
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 12:09:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orzyA-000068-Fb; Mon, 07 Nov 2022 06:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1orzy8-00005H-3G
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 06:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1orzy6-0005fp-3l
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 06:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667819224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7zeNAuSACaLmi+5as1Gb8t9katDir9aRfymZE5llVeo=;
 b=cY2h/Btm6g8n0ryuqu49b42rX2tp5OgBbOHEvqBrZQY5mSr2CqwpNRff94kC3HBM+CLeNK
 T5gFWWwUj1KqG6nuz4mCtDWCpkaYhPmGph0bFqrwhQztTSYHGdtlepZW4PTVwKcefrhEnX
 2rNkvRsSdoIcpHTEyA41MSxO3xVLy0E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-65-soYgG2YZNli1O7ICYvYKtQ-1; Mon, 07 Nov 2022 06:07:03 -0500
X-MC-Unique: soYgG2YZNli1O7ICYvYKtQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bs7-20020a05620a470700b006fac7447b1cso2901134qkb.17
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 03:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zeNAuSACaLmi+5as1Gb8t9katDir9aRfymZE5llVeo=;
 b=BNkb2+VWs3+Y70FKuOj2ShSQ8KaQX9NVcZMD9P1uWG7OV9ywnyIH3tOyXhq9VoF+w1
 8KElnWtXP91pypY/2VQcqssZmkrtU3tcMeZVrEvmf19PmPctQU8WcwSmHYWqCkD2X6RF
 Q51XV6fuwgcAA+lHo7GNnph4h5jAidSj5JNDi8x5RbSVMQWvy2236DP8Vc23Gx3KLWHX
 NLRdlYau5FTr0HmmK0xsWxeJWcAR2z8CFvcGcNoN1rUZ5WPLyUsPf5HfBKFCSoZCyjCQ
 AbythdX+6iYgEx/gtQXy3h4TLHeV+7MCTvujdU9Iu+RyLyTorsnmb0WuYlm8QH2UHFxo
 5vKA==
X-Gm-Message-State: ACrzQf1FlC2MzhlDkkU9Z7wE6z42tG0Q/Jk8li0P1Onm7vNXlrzFcX8L
 LvTfpm1O00tXL3LONtsQKeP7KVzutuYMm4JDHloYbw2EKiV/IrnTg+XzeWpLDNijFicpcxOnhIl
 kewXIJMdmrfhSBOhY5gzQAQ+KwbiyW6Q=
X-Received: by 2002:ad4:5d6d:0:b0:4bb:7821:b326 with SMTP id
 fn13-20020ad45d6d000000b004bb7821b326mr43222662qvb.67.1667819223248; 
 Mon, 07 Nov 2022 03:07:03 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4cqcuMhUslE4ND3WoAgebgX87Vt3pNmdRN7dBMA81O/srDYR+RQFrK5uEMNs5MdMLT/WusLSFAprHI+/2KRLo=
X-Received: by 2002:ad4:5d6d:0:b0:4bb:7821:b326 with SMTP id
 fn13-20020ad45d6d000000b004bb7821b326mr43222642qvb.67.1667819223017; Mon, 07
 Nov 2022 03:07:03 -0800 (PST)
MIME-Version: 1.0
References: <20221107103510.34588-1-mcascell@redhat.com>
In-Reply-To: <20221107103510.34588-1-mcascell@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 7 Nov 2022 12:06:52 +0100
Message-ID: <CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, bin.meng@windriver.com, XRivenDell@outlook.com, 
 coc.cyqh@gmail.com, ningqiang1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Nov 7, 2022 at 11:35 AM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> Make sure to reset data_count if it's equal to (or exceeds) block_size.
> This prevents an off-by-one read / write when accessing s->fifo_buffer
> in sdhci_read_dataport / sdhci_write_dataport, both called right after
> sdhci_buff_access_is_sequential.
>
> Fixes: CVE-2022-3872
> Reported-by: RivenDell <XRivenDell@outlook.com>
> Reported-by: Siqi Chen <coc.cyqh@gmail.com>
> Reported-by: ningqiang <ningqiang1@huawei.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>  hw/sd/sdhci.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 306070c872..aa2fd79df2 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -978,6 +978,10 @@ static bool sdhci_can_issue_command(SDHCIState *s)
>  static inline bool
>  sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
>  {
> +    if (s->data_count >= (s->blksize & BLOCK_SIZE_MASK)) {
> +        s->data_count = 0;
> +    }
> +
>      if ((s->data_count & 0x3) != byte_num) {
>          trace_sdhci_error("Non-sequential access to Buffer Data Port register"
>                            "is prohibited\n");
> --
> 2.38.1
>

Reproducer:

cat << EOF | ./qemu-system-x86_64 -machine accel=qtest \
-nodefaults -drive if=none,index=0,file=null-co://,format=raw,id=mydrive \
-device sdhci-pci -device sd-card,drive=mydrive -nographic -qtest stdio
outl 0xcf8 0x80001004
outl 0xcfc 0x107
outl 0xcf8 0x80001010
outl 0xcfc 0xfebf1000
writel 0xfebf102c 0x7
writel 0xfebf1004 0x10200
writel 0xfebf100c 0x200000
writel 0xfebf1028 0x10000
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1020 0xdeadbeef
writel 0xfebf1004 0x200
writel 0xfebf100c 0x20
writel 0xfebf1028 0x20000
writel 0x00100000 0xfebf1021
writel 0xfebf1058 0x00100000
writel 0xfebf1028 0x8
writel 0xfebf100c 0x200011
writel 0xfebf1020 0xaabbccdd
EOF

-- 
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


