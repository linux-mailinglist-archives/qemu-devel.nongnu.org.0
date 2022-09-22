Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1E5E60C7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:20:19 +0200 (CEST)
Received: from localhost ([::1]:51524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKFe-0000Ho-JJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obJ4h-0005pL-5a
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1obJ4b-0003Xc-9h
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 06:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663841088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UTbSku4IMGq+dqke5u44orpZdaAzL25RBDqR1N0gPI0=;
 b=ZPotZKYkkKZNTQ3dHt2IDOFyRMOF1KleAvKvhau+4U16A9GuNiiGz/3TE0Um+glXYgxVcz
 KABHLeBSMB8+otTECyElcvHFxDmq2/uAQYyOheG4K+NxXP345zG6Wou1UwmMrd04oZchPH
 gTopuXSenpZsiG9YC0L9jn7FRyrCqAs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-2dhutWzNON6dzgFXIWXSag-1; Thu, 22 Sep 2022 06:04:47 -0400
X-MC-Unique: 2dhutWzNON6dzgFXIWXSag-1
Received: by mail-wr1-f71.google.com with SMTP id
 i27-20020adfaadb000000b0022a48b6436dso3107815wrc.23
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 03:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=UTbSku4IMGq+dqke5u44orpZdaAzL25RBDqR1N0gPI0=;
 b=kRJ3IGY2NenK0uEEqDjvd+zJ0nqPD0FUGcAIcoSG/Mg/CMI2j5HzSC7PYXwM2+wNZm
 gK4A5uimxksqP2emwc1cJtf+QVWo6wVi1yFTOiAtzGMDxROQmgHWi1yN7XA3gRx3QEcu
 Ae9jlxzklEZJiUq435ZcDvomo4Ek48c0g4B04nByCFfVsUHQR09rLrcZSiJSfk6Jt/Ja
 UFK+V9RllNwK8lp2OkkQYRUSkM0D75Lmfo6YyYFYfOyXAu5dFzeomgb6t3DTMPH3uGsC
 aBLb0M1WDxTtP2Rcw7WPETAs6RfPrjXY1McNr8Zr0z1kECDk2d5AHoQxjjwZIeTfIg8H
 6jGQ==
X-Gm-Message-State: ACrzQf3KXy3ZYqTrAhIOdCHhFLkPo/UxtEf742ZqjmEM/pQh9QATJgAA
 ZbA6XowNP2o/8QxQo8fLWbny5vtTooRXIRUlrsGf1NGR3LnqNl/QFckraddwaAO50MVrWdpKvgD
 0c2x275S9IEWi7jk=
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr1455327wrr.583.1663841085860; 
 Thu, 22 Sep 2022 03:04:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7a/v0WBRJd0us2BuaLGyPTPCHAjjstdesNMlCKVtAxKaQ5jpfOzYZzAJP/iUlEny8gQszzbQ==
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr1455304wrr.583.1663841085495; 
 Thu, 22 Sep 2022 03:04:45 -0700 (PDT)
Received: from redhat.com ([2.55.16.18]) by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c220600b003b492753826sm5338556wml.43.2022.09.22.03.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 03:04:44 -0700 (PDT)
Date: Thu, 22 Sep 2022 06:04:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lev Kujawski <lkujaw@member.fsf.org>
Cc: qemu-trivial@nongnu.org, f4bug@amsat.org, John Snow <jsnow@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Message-ID: <20220922060325-mutt-send-email-mst@kernel.org>
References: <20220602204731.18706-1-lkujaw@member.fsf.org>
 <20220906102155-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906102155-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 06, 2022 at 10:23:57AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jun 02, 2022 at 08:47:31PM +0000, Lev Kujawski wrote:
> > One method to enable PCI bus mastering for IDE controllers, often used
> > by x86 firmware, is to write 0x7 to the PCI command register.  Neither
> > the PIIX3 specification nor actual hardware (a Tyan S1686D system)
> > permit modification of the Memory Space Enable (MSE) bit, 1, and thus
> > the command register would be left in an unspecified state without
> > this patch.
> > 
> > Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
> 
> 
> I don't think this is appropriate in trivial at all.
> 
> 
> 
> > ---
> > This revised patch uses QEMU's built-in PCI bit-masking support rather
> > than attempting to manually filter writes.  Thanks to Philippe Mathieu-
> > Daude and Michael S. Tsirkin for review and the pointer.
> 
> But pls note I wrote:
> 
> 	Might need machine compat machinery
> 	for this.
> 
> without said machinery, if guest set one of the other
> bits, migration will fail.

I assume v3 will be forthcoming, right?


> 
> >  hw/ide/piix.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> > index 76ea8fd9f6..bd3f397de8 100644
> > --- a/hw/ide/piix.c
> > +++ b/hw/ide/piix.c
> > @@ -25,6 +25,8 @@
> >   * References:
> >   *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
> >   *      290550-002, Intel Corporation, April 1997.
> > + *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
> > + *      Intel Corporation, April 1997.
> >   */
> >  
> >  #include "qemu/osdep.h"
> > @@ -160,6 +162,19 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
> >      uint8_t *pci_conf = dev->config;
> >      int rc;
> >  
> > +    /*
> > +     * Mask all IDE PCI command register bits except for Bus Master
> > +     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
> > +     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
> > +     *
> > +     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
> > +     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
> > +     * actual PIIX3 hardware, the datasheet itself (viz., Default
> > +     * Value: 0000h), and the PIIX4 datasheet [2].
> > +     */
> > +    pci_set_word(dev->wmask + PCI_COMMAND,
> > +                 PCI_COMMAND_MASTER | PCI_COMMAND_IO);
> > +
> >      pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
> >  
> >      bmdma_setup_bar(d);
> > -- 
> > 2.34.1
> > 
> > 
> > 


