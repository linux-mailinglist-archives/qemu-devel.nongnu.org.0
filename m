Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C95B2C3E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 04:50:48 +0200 (CEST)
Received: from localhost ([::1]:54190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWU6R-0004ro-Uu
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 22:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWU4p-0003DW-Cr
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 22:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oWU4m-000715-SF
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 22:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662691744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTVcI3qy9POghb1B1kb9zKJF2bqG0VCL5cLWfI48Nak=;
 b=gbUFXWtq7GtDjkfu+xnpdtde2I5vtYMmugAjQNBw2zdzjxX1BRgzlM6Nci4IGerVRZlIXJ
 P6Uif0Q1xFd27Ibi2gZf5/78mVyeey1tXqDsAuCioDTgQwNWd4Otvwva6rOHheajfSezwq
 c/zvDl+D1pML3vKn5VE4A8OGoOpAgaM=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-kIpMSj1aOcC3vjKI0yZ0Jg-1; Thu, 08 Sep 2022 22:49:02 -0400
X-MC-Unique: kIpMSj1aOcC3vjKI0yZ0Jg-1
Received: by mail-vs1-f71.google.com with SMTP id
 129-20020a670387000000b00390232a1bfcso32073vsd.21
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 19:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UTVcI3qy9POghb1B1kb9zKJF2bqG0VCL5cLWfI48Nak=;
 b=gGRG3V2anKYPhUN//SSxrHuXgxCyuUlVCFs5YKZm8+5lonIru2/vm9oc7Z3PCIGtSF
 VmjvO3zeSAv4jdV2ezscRx1kd0nlCKeJtqZcft08apSfYy+Qflk96dK0x9auCqlU2ueA
 tWGeDbfC6wGONmVwY28maVdPrI3Ep+cCaMDcROXzVj44uH20GK53gpdu+xLDCA7bTGvD
 Pu1NueIeAdnzl2sm0T8HGP67aO6BVAvjU84Mof8IJFuEuth5PAg47yoSUhaUi4TitCNI
 VrCzwf6XjII8gwV7despfeXrVLlmEjQ/tQ50xyc7UKpiObOvg/JH+D/m93M61uiX2VI7
 jK8A==
X-Gm-Message-State: ACgBeo3t8pleG7iPC/Z9vVwno51WRUfsXVGtPYunms+JgRcACz0+hhqC
 sm5X+0a456Q08XuHWJ8JY6WivfsspTjlKNDMxcJChlCUCX0gLkKSBkEhSrNPzKCGksUFZSzosnv
 B690SVNM0QcAScYRaGwg44lgC10/5Eok=
X-Received: by 2002:a05:6102:3c4:b0:388:d643:a5b3 with SMTP id
 n4-20020a05610203c400b00388d643a5b3mr4412597vsq.21.1662691741474; 
 Thu, 08 Sep 2022 19:49:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR47+aJFbI6Iuuv+UlW4khR+YUBFTF/u98+CoI7cLI+U5f3X5O7cpsUmJoL0FO/9wvS+aVcT827RewOLxOWIHuI=
X-Received: by 2002:a05:6102:3c4:b0:388:d643:a5b3 with SMTP id
 n4-20020a05610203c400b00388d643a5b3mr4412593vsq.21.1662691741214; Thu, 08 Sep
 2022 19:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220827070343.85978-1-thuth@redhat.com>
In-Reply-To: <20220827070343.85978-1-thuth@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Sep 2022 10:48:50 +0800
Message-ID: <CACGkMEs+-e1+YmxBysQfYYUxCLJwp2i38nHz6S1tn0UNdnBNFw@mail.gmail.com>
Subject: Re: [PATCH] hw/net/tulip: Fix DMA reentrancy issue with stack
 overflow (CVE-2022-2962)
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Sven Schnelle <svens@stackframe.org>,
 qemu-stable@nongnu.org, Siqi Chen <coc.cyqh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sat, Aug 27, 2022 at 3:03 PM Thomas Huth <thuth@redhat.com> wrote:
>
> The Tulip NIC can be used to trigger an endless recursion when its
> descriptors are set up to its own MMIO address space. Fix it by
> limiting the DMA accesses to normal memory.
>
> Fixes: CVE-2022-2962
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1171
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Zheyu has posted a similar path which has been merged:

commit 36a894aeb64a2e02871016da1c37d4a4ca109182
Author: Zheyu Ma <zheyuma97@gmail.com>
Date:   Sun Aug 21 20:43:43 2022 +0800

    net: tulip: Restrict DMA engine to memories

Thanks

> ---
>  hw/net/tulip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index 097e905bec..b9e42c322a 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip = {
>  static void tulip_desc_read(TULIPState *s, hwaddr p,
>          struct tulip_descriptor *desc)
>  {
> -    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> +    const MemTxAttrs attrs = { .memory = true };
>
>      if (s->csr[0] & CSR0_DBO) {
>          ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
> @@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
>  static void tulip_desc_write(TULIPState *s, hwaddr p,
>          struct tulip_descriptor *desc)
>  {
> -    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> +    const MemTxAttrs attrs = { .memory = true };
>
>      if (s->csr[0] & CSR0_DBO) {
>          stl_be_pci_dma(&s->dev, p, desc->status, attrs);
> --
> 2.31.1
>


