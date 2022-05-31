Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A3538EF3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 12:30:34 +0200 (CEST)
Received: from localhost ([::1]:39826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvz8y-0003Z4-3M
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 06:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvz4r-0001IO-HW; Tue, 31 May 2022 06:26:22 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nvz4o-0001gd-KI; Tue, 31 May 2022 06:26:16 -0400
Received: by mail-ed1-x52e.google.com with SMTP id n28so8057319edb.9;
 Tue, 31 May 2022 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FviAagMNdDvuLc4JYJYUJyz8tMbkqIkPtoqB1O3UUqM=;
 b=Du3Mh2gtFnzRHR63RuMgsyjItCeTS3Z6yNeLVwlLJXppxiz7FngzODYQ1imblsM6QE
 hMJBbZxzSrMrJUHenE1sn5m0BMLJwGt01zSIcBTm9Oc6AKnxzJ5lN1IoQGkdMZBSMOzO
 HCeXo7WAYj8FOrL4IyE4eeDU30R8NhAvAn2KO5s8+80WOe8/xqTX/EDqtir7plReHjwI
 ZYzLxQCDHaUrAJlVHf1LosN8b7Xwf6KLMbVaD0IczVnayFLA+dsYdog1HUdpdO1T9mIk
 AcrdaSB2kL7WyzxFdqvKcXfPnNP3QhiJLdxHe4muHW0a2I9IDoF5XhI38MUE5WZVWGkL
 92vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FviAagMNdDvuLc4JYJYUJyz8tMbkqIkPtoqB1O3UUqM=;
 b=ROKWTIwVzjZvW+LOHi1pq9fQIvmP03eR93nw3ODmEAH2/JcsOCW6dFBswyh0EAvWYT
 acxNmgWU/Vtu2RtwKpF6LdT2tdfiGrFLKY43nlL3DH9O8bzymtdd7772LN7n5U5AIZuD
 7xMv0QhFLbM1CIo+FYorTAd1zVQo8mmKZHw0xGXu5P81J3f70D4Em750Q+bTaufh2MxB
 gyfKiMeMyQyJgTV47/UMLecvjdlS8IHksKwTG/dnqXliIunfI/T8u8/5OGMe4VhLJ9a/
 7fes/BGgF7qV8RClMQU9RSlBjGYiRq7FdqVqkFPhJHU1VZyCelW7Z/T2DXjkO6F5KAIR
 EdaA==
X-Gm-Message-State: AOAM532PcGpOvq0c8pYzgnhcSVcDBYIbmnJWnpfvBGfOSLwy03aovcsQ
 h3QJAK2ch8vLNwor1K8nDqU=
X-Google-Smtp-Source: ABdhPJwD74w6Y5rt7yAaSVSrWs8SMCrTfmtjc3X+SV9Jd8Eh01ZS84Rj/1jAeOUcAXpU7D1u40s87g==
X-Received: by 2002:a05:6402:390b:b0:42a:acb3:bb5 with SMTP id
 fe11-20020a056402390b00b0042aacb30bb5mr61436755edb.236.1653992769362; 
 Tue, 31 May 2022 03:26:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ga11-20020a170906b84b00b006fec56a80a8sm4713783ejb.115.2022.05.31.03.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 03:26:08 -0700 (PDT)
Message-ID: <91374d96-bc7e-4bc9-de50-fe1d228ec96c@redhat.com>
Date: Tue, 31 May 2022 12:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] pci: fix overflow in printf string formatting
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 Dario Faggioli <dfaggioli@suse.com>, qemu-stable <qemu-stable@nongnu.org>
References: <20220531092540.10151-1-cfontana@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220531092540.10151-1-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/31/22 11:25, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   hw/pci/pci.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a9b37f8000..6e7015329c 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2640,15 +2640,15 @@ static char *pci_dev_fw_name(DeviceState *dev, char *buf, int len)
>   static char *pcibus_get_fw_dev_path(DeviceState *dev)
>   {
>       PCIDevice *d = (PCIDevice *)dev;
> -    char path[50], name[33];
> -    int off;
> -
> -    off = snprintf(path, sizeof(path), "%s@%x",
> -                   pci_dev_fw_name(dev, name, sizeof name),
> -                   PCI_SLOT(d->devfn));
> -    if (PCI_FUNC(d->devfn))
> -        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));
> -    return g_strdup(path);
> +    char name[33];
> +    int has_func = !!PCI_FUNC(d->devfn);
> +
> +    return g_strdup_printf("%s@%x%s%.*x",
> +                           pci_dev_fw_name(dev, name, sizeof(name)),
> +                           PCI_SLOT(d->devfn),
> +                           has_func ? "," : "",
> +                           has_func,
> +                           PCI_FUNC(d->devfn));
>   }
>   
>   static char *pcibus_get_dev_path(DeviceState *dev)

Cc: qemu-stable@nongnu.org

