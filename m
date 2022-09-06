Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69345AED7B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:42:42 +0200 (CEST)
Received: from localhost ([::1]:58386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZmj-00060G-EE
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVZUh-0003n6-4Z
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVZUf-0002FA-GE
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662474240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i6127IC2/fyddAz9RCJslzgJzlxCcBlp7fhZfdxkwwM=;
 b=K28LSXtQP5azSwPzmgQyKyuez/Fmkv0gau+IzWZCKjbKR90POTGuqCNNJzSLCaraVtjBpS
 lXqz4HbEf2VzIrRJde+j6jFoQR2m03DN74vern0OTuWSUxeb5+1D4dy5Tt72Epu8+DubAQ
 jqIPjpP33rKzbTnPtXvyBATwHUWvuhY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-R9dlrF1VPGejTw3pObGJcA-1; Tue, 06 Sep 2022 10:23:58 -0400
X-MC-Unique: R9dlrF1VPGejTw3pObGJcA-1
Received: by mail-ed1-f70.google.com with SMTP id
 v1-20020a056402348100b00448acc79177so7835603edc.23
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=i6127IC2/fyddAz9RCJslzgJzlxCcBlp7fhZfdxkwwM=;
 b=uKr13/Wz1sCIR99YPit3/WiSDntsV14lu1Gtoiz7ynBqugGOsKsL2vzQC0kJaFnSSn
 fIUAka7sZIbF7woVIAiu/h1L6F+Hgd/ziL5KVh9Kfukn14Id87Pf0BQrugycLBqPrtEj
 axpLmRgtnDaRGxXS5zAJ9NPuNn+iftl2PkmZxN3kjgt7ZojThkBHbQ7TNyjHbQrBvxX1
 9+QUpuM5huVKqSfqti/2hrenNGJPr4rYS2dbNMrXGVLGMUdGTubaIn1vhFAh11zE9YfZ
 QHmvKNb220YNufudd8MngTn4vZpqmyq1PVKtA45CaDI04eznuyNkYjakSINxpPaxZzrR
 BOfA==
X-Gm-Message-State: ACgBeo21S4sOs/n/rTKEmnBETuD+vbKfZz6b2sgn58ohaMONv7BF78z6
 t2n4YgzfrRwIPzMnYR3H18bI3G55dErR/5z62LibQfpnroHui2aGt/B5fWhNKD+igezARf2kCNj
 SV0ttgy1PFUJKFGU=
X-Received: by 2002:a17:907:c002:b0:73d:d96c:c632 with SMTP id
 ss2-20020a170907c00200b0073dd96cc632mr37873395ejc.543.1662474237151; 
 Tue, 06 Sep 2022 07:23:57 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5LC+ccekWY4PAjtk56YDkBYJVLK2Nkbs8y2fJi886WGHh/jz49E0BRxzRnnP1Kl5z+bx6mMA==
X-Received: by 2002:a17:907:c002:b0:73d:d96c:c632 with SMTP id
 ss2-20020a170907c00200b0073dd96cc632mr37873375ejc.543.1662474236912; 
 Tue, 06 Sep 2022 07:23:56 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 10-20020a170906218a00b0073ddfe1ea69sm6735718eju.111.2022.09.06.07.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 07:23:56 -0700 (PDT)
Date: Tue, 6 Sep 2022 10:23:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lev Kujawski <lkujaw@member.fsf.org>
Cc: qemu-trivial@nongnu.org, f4bug@amsat.org, John Snow <jsnow@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Message-ID: <20220906102155-mutt-send-email-mst@kernel.org>
References: <20220602204731.18706-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602204731.18706-1-lkujaw@member.fsf.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Jun 02, 2022 at 08:47:31PM +0000, Lev Kujawski wrote:
> One method to enable PCI bus mastering for IDE controllers, often used
> by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> the PIIX3 specification nor actual hardware (a Tyan S1686D system)
> permit modification of the Memory Space Enable (MSE) bit, 1, and thus
> the command register would be left in an unspecified state without
> this patch.
> 
> Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>


I don't think this is appropriate in trivial at all.



> ---
> This revised patch uses QEMU's built-in PCI bit-masking support rather
> than attempting to manually filter writes.  Thanks to Philippe Mathieu-
> Daude and Michael S. Tsirkin for review and the pointer.

But pls note I wrote:

	Might need machine compat machinery
	for this.

without said machinery, if guest set one of the other
bits, migration will fail.


>  hw/ide/piix.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 76ea8fd9f6..bd3f397de8 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -25,6 +25,8 @@
>   * References:
>   *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
>   *      290550-002, Intel Corporation, April 1997.
> + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> + *      Intel Corporation, April 1997.
>   */
>  
>  #include "qemu/osdep.h"
> @@ -160,6 +162,19 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>      uint8_t *pci_conf = dev->config;
>      int rc;
>  
> +    /*
> +     * Mask all IDE PCI command register bits except for Bus Master
> +     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
> +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> +     *
> +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> +     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
> +     * actual PIIX3 hardware, the datasheet itself (viz., Default
> +     * Value: 0000h), and the PIIX4 datasheet [2].
> +     */
> +    pci_set_word(dev->wmask + PCI_COMMAND,
> +                 PCI_COMMAND_MASTER | PCI_COMMAND_IO);
> +
>      pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
>  
>      bmdma_setup_bar(d);
> -- 
> 2.34.1
> 
> 
> 


