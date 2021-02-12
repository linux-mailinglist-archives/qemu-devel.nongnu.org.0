Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331AA31A50C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:10:52 +0100 (CET)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAdq7-0001yK-8K
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdY1-0003yK-RW
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:52:10 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdXv-0000Rx-2R
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:52:05 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r21so360463wrr.9
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O5psqa/0/xm0VWzQvOc1HGRlnSq0DmwJ0lepmvbdMpg=;
 b=Bj/awv/3JgXxi+WOOqdEQZL8u2H8U59R1w9lw2F70aD2tVKZg6R8tkvFpygS0SR2/m
 WIr0hTpZghEWzF1HZ04zeKLS3Ys2aW3Lryqe+6r9bSelPxNVnh4hSSSduEqsE6OS2VPQ
 4tF1IisaNgiWt8jtg7/1gWDmYiy/fTv7Pzx20Jkl07pWYj0s+aC620qv+7jDk3icHPEc
 WmalPo/5v4462MXV5Q7qVHO4H+FQqbLSeepnJZYBdXLoVek6kkmr1mZ/yXckdI09BAWo
 uTWRSSabu87OhcuUpvusQZiJM3DExg2TnxL6O2xJwQbnObB6VGxMMb9NMq8dV19jm+qX
 a3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O5psqa/0/xm0VWzQvOc1HGRlnSq0DmwJ0lepmvbdMpg=;
 b=DZVpKzgWtqIQhY3/wIFenAQSPPtJSDxGH3oCenTTBtf8A2dwUu+WT/ijp7phzrr0vw
 jqBKJp4bnAzD82I29nRZ7SlhBBkdWK6VI833GErEj18fiC8Ttto0Rthsw3k8alrskxrf
 UQ/2CjnzIB146qgriRWxkeo5ebfbQzVWCoGcyMRHGHjqa29h+vlPxXTQtwxEAU5lKS5U
 rHp40m0c/9i7yamFm3cO0govLdLA23Pd8G/35Z529bAu5AvvnDVWnOW0PsU70TBeaa8L
 7Jzh3DdVs0Levk+PNh1k4ZMbBToXq2L3N5QKzZXhC5JHYd/sXYuPzo+QVFCsEBSdqXGg
 LxHQ==
X-Gm-Message-State: AOAM530m84hPYI05PX8hJJLGmBvZsEX5EKExzuDbppGufcUwX2hNYDS/
 I+Hpkdk4PqcmzjQ3nF4w0Sg=
X-Google-Smtp-Source: ABdhPJx2dQkFmEd/fsC2DpEMieZpltrPG7nikG3yQ8gHWKxRhzodZkoXMuYofEW8hqCvlXq1dgW2rw==
X-Received: by 2002:adf:a34f:: with SMTP id d15mr5222420wrb.18.1613155921517; 
 Fri, 12 Feb 2021 10:52:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r12sm11280588wrp.13.2021.02.12.10.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:52:00 -0800 (PST)
Subject: Re: [PATCH v2 03/42] esp: QOMify the internal ESP device state
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-4-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <743ad0ea-6b85-29cb-8f92-60b4d9f0e9de@amsat.org>
Date: Fri, 12 Feb 2021 19:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209193018.31339-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 8:29 PM, Mark Cave-Ayland wrote:
> Make this new QOM device state a child device of both the sysbus-esp and esp-pci
> implementations.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp-pci.c     | 48 +++++++++++++++++++++++++++++++------------
>  hw/scsi/esp.c         | 45 +++++++++++++++++++++++++++++++++-------
>  include/hw/scsi/esp.h |  5 +++++
>  3 files changed, 78 insertions(+), 20 deletions(-)

Please setup scripts/git.orderfile ;)

...
> @@ -354,9 +365,11 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
>  {
>      PCIESPState *pci = PCI_ESP(dev);
>      DeviceState *d = DEVICE(dev);
> -    ESPState *s = &pci->esp;
> +    ESPState *s = ESP(&pci->esp);
>      uint8_t *pci_conf;
>  
> +    qdev_realize(DEVICE(s), NULL, errp);

       if (!qdev_realize(DEVICE(s), NULL, errp)) {
           return;
       }

>      pci_conf = dev->config;
>  
>      /* Interrupt pin A */
> @@ -375,11 +388,19 @@ static void esp_pci_scsi_realize(PCIDevice *dev, Error **errp)
>      scsi_bus_new(&s->bus, sizeof(s->bus), d, &esp_pci_scsi_info, NULL);
>  }
...

> @@ -956,7 +958,9 @@ static void sysbus_esp_realize(DeviceState *dev, Error **errp)
>  {
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      SysBusESPState *sysbus = SYSBUS_ESP(dev);
> -    ESPState *s = &sysbus->esp;
> +    ESPState *s = ESP(&sysbus->esp);
> +
> +    qdev_realize(DEVICE(s), NULL, errp);

       if (!qdev_realize(DEVICE(s), NULL, errp)) {
           return;
       }

With both if():
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

