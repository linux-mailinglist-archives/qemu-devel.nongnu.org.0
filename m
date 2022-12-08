Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5536473CC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 17:02:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3JLZ-0000lx-5S; Thu, 08 Dec 2022 11:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p3JLJ-0000i6-S4
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:01:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1p3JLH-0000T2-6U
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 11:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670515304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JwDLed74tf42x6lHAy4QSdtIwtQ7oJNBuFzB3bibV0=;
 b=KEtHNVm726po+TVqkw8QTp1FTrt60DqDLY9V1WFiBWvvRAx37+1RXdLwotGB8qXTR2YUz4
 ZGEk/zNyBVu5L9/3927kQAuH0fZ+Vxt6DL93Xr97quOevSjiAt8maycPaIcw4J21Prlk2F
 W48Pfx3OyXHAgdNKJhzR0W50VXO+jMQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-410-731F1TOsOoGV1U8qW3H16A-1; Thu, 08 Dec 2022 11:01:43 -0500
X-MC-Unique: 731F1TOsOoGV1U8qW3H16A-1
Received: by mail-wm1-f71.google.com with SMTP id
 p14-20020a05600c204e00b003cf4cce4da5so808166wmg.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 08:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6JwDLed74tf42x6lHAy4QSdtIwtQ7oJNBuFzB3bibV0=;
 b=SfdkoIZHVdGpeZfBlITZRnVcugViRn5XPnCKtFvhuY1dAdUrQOL7rg5vLuZxo/pS3D
 1N74Ja06PdRP1wrn6mkTI2S3TgAlCp+q6VO2zofX/FH6sEkJlha/czHkkoWJS8qvgkgJ
 BWtXjetlBxDj+CnGIwahKuF29ZIcOTg9616QHGg7Zoc0KG6bvfNvxK8piZAXrwbWCq4H
 FuFfLcxuadhHRKxPG5YOWZJb/1am+3Uzjx8x7a2PWgu85D2nb8VpUbH1R0SFv4oDBv3r
 JewtbDnLnW26rVqGFCShnVo0vTau+R2n/f9uvC7yh0DvTVYv80t28Q1TgjL0GvVVQ4Mg
 Z2Ig==
X-Gm-Message-State: ANoB5pkApw1+PamBsweKcOO23GXEJFrXXMN948cbvzikbjThfNi02E0q
 kTOza9u5mX/FQvFUGcAfhtKMFTM59SIMJN1KKim/ohUhtMSthYFklDD9XpdJ/BNGsXbsS6vKtTb
 jPivzEmGMX8CNAn0=
X-Received: by 2002:adf:dcc7:0:b0:242:4c5c:a696 with SMTP id
 x7-20020adfdcc7000000b002424c5ca696mr1708070wrm.33.1670515302156; 
 Thu, 08 Dec 2022 08:01:42 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6rtRm0tkXzEI3GH8Q3NgTxSw6u7cJditQmmIJGBqZJSVnkAoHAz8zwIwje0Xe5sdn7i5yndw==
X-Received: by 2002:adf:dcc7:0:b0:242:4c5c:a696 with SMTP id
 x7-20020adfdcc7000000b002424c5ca696mr1708033wrm.33.1670515301735; 
 Thu, 08 Dec 2022 08:01:41 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 k27-20020a5d525b000000b00242269c8b8esm22276667wrc.25.2022.12.08.08.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 08:01:40 -0800 (PST)
Date: Thu, 8 Dec 2022 17:01:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Kevin O'Connor <kevin@koconnor.net>, seabios@seabios.org,
 qemu-devel@nongnu.org
Subject: Re: [SeaBIOS] Re: [PATCH 4/4] be less conservative with the 64bit
 pci io window
Message-ID: <20221208170139.634adabd@imammedo.users.ipa.redhat.com>
In-Reply-To: <20221123102508.zagkzmxlk3zdln5c@sirius.home.kraxel.org>
References: <20221121103213.1675568-1-kraxel@redhat.com>
 <20221121103213.1675568-5-kraxel@redhat.com>
 <Y30YREAQZY8twJA/@morn>
 <20221123102508.zagkzmxlk3zdln5c@sirius.home.kraxel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Wed, 23 Nov 2022 11:25:08 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Tue, Nov 22, 2022 at 01:43:16PM -0500, Kevin O'Connor wrote:
> > On Mon, Nov 21, 2022 at 11:32:13AM +0100, Gerd Hoffmann wrote:  
> > > Current seabios code will only enable and use the 64bit pci io window in
> > > case it runs out of space in the 32bit pci mmio window below 4G.
> > > 
> > > This patch will also enable the 64bit pci io window when
> > >   (a) RAM above 4G is present, and
> > >   (b) the physical address space size is known, and
> > >   (c) seabios is running on a 64bit capable processor.
> > > 
> > > This operates with the assumption that guests which are ok with memory
> > > above 4G most likely can handle mmio above 4G too.  
> > 
> > Thanks.  In general, the series looks good to me.  Can you elaborate
> > on the background to this change though?  It sounds like there is a
> > (small) risk of a regression, so I think it would be good to have a
> > high level understanding of what is driving this memory reorg.  
> 
> Well, the idea is to adapt to the world moving forward.  Running a
> 64-bit capable OS is standard these days, and the resources needed
> by devices (especially GPUs) are becoming larger and larger.
> 
> Yes, there is the risk that (old) guests are unhappy with their
> PCI bars suddenly being mapped above 4G.  Can happen only in case
> seabios handles pci initialization (i.e. when running on qemu,
> otherwise coreboot initializes the pci bars).  I hope the memory
> check handles the 'old guest' case: when the guest can't handle
> addresses above 4G it is unlikely that qemu is configured to have
> memory mapped above 4G ...

does it break 32-bit PAE enabled guests
(which can have more then 4Gb RAM configured)?

> 
> take care,
>   Gerd
> 
> _______________________________________________
> SeaBIOS mailing list -- seabios@seabios.org
> To unsubscribe send an email to seabios-leave@seabios.org
> 


