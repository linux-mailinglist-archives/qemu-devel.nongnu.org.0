Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E902C5F5AB6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 21:44:32 +0200 (CEST)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogAJj-0004zC-Ey
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 15:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ogAGr-0001Jt-2W
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 15:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ogAGn-0000cT-Gc
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 15:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664998886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=49Qm1gEWi+IQVN6AWqd5H5utYmEviM2Zg1OrFOa/Dlo=;
 b=XBlnqjsgsGcbY7waH6636VFTqWQ+zAZa926l4PHCH09ZtpUcXXlOKjJmLxl/XdEX5vJYkd
 yYuSBIbabUf6IRHde7QYXfAGlEsrVauLz933efTxALUPHissnmEtsG1tNRfxi73T0GOWfb
 XLGgJSTHkFROwEanU69C4aVWfz7IRQ8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-7ZH_2PmWPd-CigXfMEKYVg-1; Wed, 05 Oct 2022 15:41:22 -0400
X-MC-Unique: 7ZH_2PmWPd-CigXfMEKYVg-1
Received: by mail-qk1-f197.google.com with SMTP id
 u20-20020a05620a455400b006ce5151968dso14917482qkp.11
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 12:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=49Qm1gEWi+IQVN6AWqd5H5utYmEviM2Zg1OrFOa/Dlo=;
 b=iSsA95kTwewn5JDQ1R3sS1M2JBB5YIhdoQwns6pi+o0s8TWqS30TcRVRzAHZSwbGu1
 5695oxpwW6ghs5AAT9JBoXgTVFZInatGZKdb2XrraCmG9R3w8B7b5B5TUQxwD+ULf/kn
 1hSOjZ0+fcY1pRzn9O3c8Nb9UDxhK1ebjVE0UsJRNle82J3WSaqd40S33GNltjtXGgw2
 /ugGkdedMyNSISp4M/sIwXehfUm+r7LIOUilISkZtTvwXT42r9m85xaSwijjUzm6Bhra
 qn/svG1lPmu9eZoZLtT+BslL/8EFJcDPh2Wm2fjjck+LA2d8MiQ9TfQ2ZvbkuAoWg/2y
 W7rw==
X-Gm-Message-State: ACrzQf2Y6AECjeeHeAxs4OMB9o4MD65TfgfWK4O+7DLUV9A4eMmQLfG7
 +H8dUGmnV8hw2UFWCr9eauC1nrULBNEqFbQFPaawYXspcdh8ax6sc9TkwlKiYj/ro3oJWBjL1BO
 KdsRM57wPW+oLbyI=
X-Received: by 2002:a05:6214:21ee:b0:4ac:7107:4c23 with SMTP id
 p14-20020a05621421ee00b004ac71074c23mr1152904qvj.86.1664998882240; 
 Wed, 05 Oct 2022 12:41:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65sdh+ogUPssHSPrDZcGsJmcx9eDOw1T8Zsmad0tFaf3kIs+N6Je0QOzMY+Mpy2lRIgYeaAA==
X-Received: by 2002:a05:6214:21ee:b0:4ac:7107:4c23 with SMTP id
 p14-20020a05621421ee00b004ac71074c23mr1152888qvj.86.1664998881948; 
 Wed, 05 Oct 2022 12:41:21 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 a16-20020a05620a16d000b006b58d8f6181sm16973234qkn.72.2022.10.05.12.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 12:41:21 -0700 (PDT)
Date: Wed, 5 Oct 2022 15:41:20 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 10/14] migration: Make PageSearchStatus part of RAMState
Message-ID: <Yz3d4FHf4ioBYJnv@x1n>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225221.48999-1-peterx@redhat.com>
 <Yz3SNop10OHtqAfC@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yz3SNop10OHtqAfC@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Wed, Oct 05, 2022 at 07:51:34PM +0100, Dr. David Alan Gilbert wrote:
> >  /* struct contains XBZRLE cache and a static page
> >     used by the compression */
> >  static struct {
> > @@ -319,6 +359,11 @@ typedef struct {
> >  struct RAMState {
> >      /* QEMUFile used for this migration */
> >      QEMUFile *f;
> > +    /*
> > +     * PageSearchStatus structures for the channels when send pages.
> > +     * Protected by the bitmap_mutex.
> > +     */
> > +    PageSearchStatus pss[RAM_CHANNEL_MAX];
> 
> Why statically size this rather than allocate it in ram_state_init ?

I don't strongly feel like it needs the complexity? As there're only at
most 2 channels anyway, so the best chance is we save ~56 bytes on src qemu
but only during migration (RAMState allocated only in ram setup).

If you think we should still do the dynamic allcation, definitely doable on
my side too.

-- 
Peter Xu


