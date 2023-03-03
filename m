Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132E66A8DC7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 01:16:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXt5i-00064o-HZ; Thu, 02 Mar 2023 19:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXt5g-0005y5-97
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:16:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXt5e-0005wQ-JN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 19:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677802561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIBR05ytDMFCNzAJluH8knJqRsuXeDp4DxKD8hcb/sE=;
 b=BX+gMXtBacp810qxAowA9N8DLrLeyaz5T/OkQOztdWkmn6w4y+XhqOyFl1/nbsStOMpuUO
 +lnasLqJsegStJ+zPd7T7tcNl+MDU8bilqjJjFe2oXpC67AQiFrpUe0pP2cNOxWOk2BdqL
 7XhlZ4moEsxOW06uHRmd1LTEwGgixRc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-fEkWJSolPumIjNJfHNFwpA-1; Thu, 02 Mar 2023 19:15:59 -0500
X-MC-Unique: fEkWJSolPumIjNJfHNFwpA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r7-20020a05600c35c700b003eb3f2c4fb4so282163wmq.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 16:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677802559;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tIBR05ytDMFCNzAJluH8knJqRsuXeDp4DxKD8hcb/sE=;
 b=bd8ViDiHNeXQJfBHtzq6kDNyRd2OSOthIPS5RCa01rsd+g4nZGfQdxa7UkHjtAhK7o
 /PZbhm5Dd0wV8KBKe0gTYXf5nZc/IXxgbqd+C9w/StWvTUoFdpzkofC/tYHnxW7jFW30
 6xiwenhBBEDJ+g9AyufR5y18RZqYxzIlip4HViE3X6LMECtFVcNvcxR68EN9hxR81LmS
 +l144SeBJQsZcYHmHJTWl/FIAeGG9+OWZv6S2vwzyTmXCIE8uJIH5mWBwgR9W/2QTtD/
 jrJCo3gSc9lod7YJzoGQSW5GcFUFrCRMkSVjZPUxCLJMcYzffpaPVPOqpgxepnw8/m+T
 pCUQ==
X-Gm-Message-State: AO0yUKXy7xjFjy9IMVhnpeXCv64VWh9iXmk3rSy67FxSWAyvWhhydtOv
 OtAn/oODiHONtQJxnH1o0oeR8Lt93WlUz+oRgWeR41R+J77MMtvnAZenK2oCag3V7ZAYuTwMFjy
 OCHfHcajQ+kfNknk=
X-Received: by 2002:a05:600c:1992:b0:3ea:f0d6:5d36 with SMTP id
 t18-20020a05600c199200b003eaf0d65d36mr9094283wmq.29.1677802558820; 
 Thu, 02 Mar 2023 16:15:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8joz/eLvFzUJPBVxjJmlDq8puWI9hwLejd6DUZMYM01PZkFl8vpB62VhVM4Gq3pbTsLWvaaA==
X-Received: by 2002:a05:600c:1992:b0:3ea:f0d6:5d36 with SMTP id
 t18-20020a05600c199200b003eaf0d65d36mr9094274wmq.29.1677802558619; 
 Thu, 02 Mar 2023 16:15:58 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a1c6a15000000b003e733a973d2sm4224446wmc.39.2023.03.02.16.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 16:15:58 -0800 (PST)
Date: Thu, 2 Mar 2023 19:15:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PULL 31/53] pcie: set power indicator to off on reset by default
Message-ID: <20230302191546-mutt-send-email-mst@kernel.org>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-32-mst@redhat.com>
 <37e6d07b-d3db-4a9b-42b6-dd04375822da@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37e6d07b-d3db-4a9b-42b6-dd04375822da@yandex-team.ru>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 02, 2023 at 02:34:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 02.03.23 11:26, Michael S. Tsirkin wrote:
> > From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > 
> > It should be zero, the only valid values are ON, OFF and BLINK.
> 
> At any chance, fix s/should be/should not be/

fixed now thanks!
> > 
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > Reviewed-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> > Message-Id: <20230216180356.156832-13-vsementsov@yandex-team.ru>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >   hw/pci/pcie.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > index 90faf0710a..b8c24cf45f 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -684,6 +684,7 @@ void pcie_cap_slot_reset(PCIDevice *dev)
> >                                    PCI_EXP_SLTCTL_PDCE |
> >                                    PCI_EXP_SLTCTL_ABPE);
> >       pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL,
> > +                               PCI_EXP_SLTCTL_PWR_IND_OFF |
> >                                  PCI_EXP_SLTCTL_ATTN_IND_OFF);
> >       if (dev->cap_present & QEMU_PCIE_SLTCAP_PCP) {
> 
> -- 
> Best regards,
> Vladimir


