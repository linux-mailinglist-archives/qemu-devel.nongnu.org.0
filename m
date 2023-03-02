Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFAE6A8163
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:42:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhKP-0004de-9F; Thu, 02 Mar 2023 06:42:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXhKD-0004Tb-Rs
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXhKC-0006U3-Eq
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:42:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677757335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BCVDis/KuBY393W5OTQOORkiXQCBloWqFypwmpaMLUw=;
 b=QHIEVVjm7sEwIsyquiBWMT97zB02u347TDw4rf0zotCU8w/smgo9ZYGnttW8kHyI1hEDpf
 PBQSZes8Eon1CiGT5Ic8s8nWedtb2IhQTDtEGvFg5BoynJC3nEOIp56hrMml1iDmG3jkZ/
 HItwzj9z74S0mOUmB87Dg3MD7K+PITg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-wRzbxR2XOVednsGkYt8tGw-1; Thu, 02 Mar 2023 06:42:14 -0500
X-MC-Unique: wRzbxR2XOVednsGkYt8tGw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so966150wmr.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 03:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677757333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCVDis/KuBY393W5OTQOORkiXQCBloWqFypwmpaMLUw=;
 b=XBP+EA2aMIihc2nuehTS/U0wTJvNtwDku3G8YFCMHlgM/Z2CJ8f3u08olOvKab03Zz
 CwWetEOtYT035BOorVtA4V53fGmELVOLxbGcZn6hmciAejq7luJCy4fxyRyhZjXvGFqc
 20xMYibh2pewQFR/PK7xT2Z9FKeR04b4tZymMMeDm54UQv0tHL0D4LSDy6jDC9FT3ppr
 w41J7XlCCwjRazA5ttC7/OhBqJh9GKJgFEAptuzazUtL6fUI+c5caFrp//LeC1jMMZFR
 RIOvvmgFLQa7fumtQsuirJPRraBvM63YPQgLFDRJ0seEFupA8AyMxYqfwb/pexk79RzG
 b0aw==
X-Gm-Message-State: AO0yUKUoWeuJ/zYYZnAoO8WgRkyFY+wFtgPH7J8/mzAAN8kmBSdRfj/S
 MdCHgZ2QFQTLdOqrxDLk8VyRLdfXj7MsWz9VuYF1XVphZQLnqN209T41o53+72ui4F0BxKTMtSN
 7IlcdDPkFrc4po5g=
X-Received: by 2002:a05:600c:908:b0:3eb:20f6:2d5c with SMTP id
 m8-20020a05600c090800b003eb20f62d5cmr7908990wmp.35.1677757333346; 
 Thu, 02 Mar 2023 03:42:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/KuI0oCmVjMYFk1gi1d4rkhFZWRk1ea7XmCVs41rZLZou7GvB7a87CoxEmGDOjmcg7QnxAJA==
X-Received: by 2002:a05:600c:908:b0:3eb:20f6:2d5c with SMTP id
 m8-20020a05600c090800b003eb20f62d5cmr7908979wmp.35.1677757333077; 
 Thu, 02 Mar 2023 03:42:13 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003dc434b39c7sm7463580wmp.0.2023.03.02.03.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 03:42:12 -0800 (PST)
Date: Thu, 2 Mar 2023 06:42:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Anton Kuchin <antonkuchin@yandex-team.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PULL 31/53] pcie: set power indicator to off on reset by default
Message-ID: <20230302064150-mutt-send-email-mst@kernel.org>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-32-mst@redhat.com>
 <37e6d07b-d3db-4a9b-42b6-dd04375822da@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37e6d07b-d3db-4a9b-42b6-dd04375822da@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


Unless there's a bigger issue I'm not redoing the pull just for this.

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


