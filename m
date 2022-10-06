Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEDA5F6386
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:22:24 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogN5C-0007iK-6j
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogMMi-0007Vc-Aw
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogMMg-0006Uu-Da
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J3ZZ4zBfOqojtBsXzLXXI0eqLfKXeWbtVENNfFGoStg=;
 b=LIbWou/8ox1ozD1GUxccXOec77iuo1wCUakPVkq7DatxO2ubsqe3P1wNJtAbPJnQirBVhw
 T0VrsiWkywcmFinLwzbWPhrIBnpicuxQaS1wBg2tjGAS5fd4xaiMyf9NBvVnBJY1J05k4N
 Xk4I26rCVekVaPXrWM63IYhFRgC/ibQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-Sse_hIr4ML2WAaFKttQUWw-1; Thu, 06 Oct 2022 04:36:20 -0400
X-MC-Unique: Sse_hIr4ML2WAaFKttQUWw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r188-20020a1c44c5000000b003be06269377so759987wma.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 01:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=J3ZZ4zBfOqojtBsXzLXXI0eqLfKXeWbtVENNfFGoStg=;
 b=Kyi4OYc3j+Y312y9GmzKwes58KOCbExho08jCRfhjT21fwE982mA8NddVoaavfCyYJ
 sEJcYlZkTvHDjwlJCuzThlioOOGweEzGYQnKCrHgLr36eOgbwGs4HaN+jDf8QU/dlMUU
 1Il1y3sD268585U+eFg+Ew1vOpiwLtsAOWwK8DpXY8r5lZE2kHPgQtDDkZpB7259Hl0E
 3MHiZkruWwyxVy3Tqzpkf9kYKlukJNTVO/Vd4yND7R/5GEwyeWr9CCmvlCf8o8SSUXdy
 g5JraAaKPsiExQLWuScUJTRel0lwpz19Lq8I3Ex1lWDEWrLnIKbFm1bkvGVcBOW4GSp0
 4o1A==
X-Gm-Message-State: ACrzQf2wdWm22r8ATL84PmpDbu3QyIWGpyCrfKnpjIfwA/D3onofA4M1
 roDbtOhW7kivxpVe4Nr5hjQkGJUAi6wdcu5DzEpWD4Q/hzma6B1zyrpR6+UjFjUEv7PopSHM8SR
 WC1vpUagjhyfbIWw=
X-Received: by 2002:a05:6000:1887:b0:22e:5026:42c3 with SMTP id
 a7-20020a056000188700b0022e502642c3mr2202225wri.687.1665045379129; 
 Thu, 06 Oct 2022 01:36:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6yKMImzwAMO3S+vL/hhVgvEp7PhE22hlcGS2p5+dW3IzapzBjA9qGgpsZh/B4V+GcJ0IgmAQ==
X-Received: by 2002:a05:6000:1887:b0:22e:5026:42c3 with SMTP id
 a7-20020a056000188700b0022e502642c3mr2202203wri.687.1665045378917; 
 Thu, 06 Oct 2022 01:36:18 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c459100b003b4a68645e9sm4374779wmo.34.2022.10.06.01.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 01:36:18 -0700 (PDT)
Date: Thu, 6 Oct 2022 09:36:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 10/14] migration: Make PageSearchStatus part of RAMState
Message-ID: <Yz6TgGrFDH1jyqun@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225221.48999-1-peterx@redhat.com>
 <Yz3SNop10OHtqAfC@work-vm> <Yz3d4FHf4ioBYJnv@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yz3d4FHf4ioBYJnv@x1n>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Oct 05, 2022 at 07:51:34PM +0100, Dr. David Alan Gilbert wrote:
> > >  /* struct contains XBZRLE cache and a static page
> > >     used by the compression */
> > >  static struct {
> > > @@ -319,6 +359,11 @@ typedef struct {
> > >  struct RAMState {
> > >      /* QEMUFile used for this migration */
> > >      QEMUFile *f;
> > > +    /*
> > > +     * PageSearchStatus structures for the channels when send pages.
> > > +     * Protected by the bitmap_mutex.
> > > +     */
> > > +    PageSearchStatus pss[RAM_CHANNEL_MAX];
> > 
> > Why statically size this rather than allocate it in ram_state_init ?
> 
> I don't strongly feel like it needs the complexity? As there're only at
> most 2 channels anyway, so the best chance is we save ~56 bytes on src qemu
> but only during migration (RAMState allocated only in ram setup).
> 
> If you think we should still do the dynamic allcation, definitely doable on
> my side too.

Oh for 2 channels, yes that's fine - what confused me here was
'RAM_CHANNEL_...' - I forgot that was PRE vs POST - I was getting
confused with multifd channel numbering; too many concepts of 'channel'.

Dave

> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


