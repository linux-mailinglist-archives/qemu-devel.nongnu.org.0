Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4354A9A66
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 14:54:40 +0100 (CET)
Received: from localhost ([::1]:37028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFz2r-0007Uf-3r
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 08:54:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFyzr-0006aP-Uw
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:51:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFyzo-00032b-1T
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643982679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yOfmi1e4N3cuHy4uMQqPnABwHDOAXVx5evc05yrTlYs=;
 b=aJN/7cL1dWCkLUlQUiEtb95o76lex7f/XfzK9pddHWxGyEcSnZSTDZ75kM/AtTsSBdL5Rh
 fPSIBNwIed4gYcrtulHKRPsy8B1hNjPch1b8JtqF8yKPZ8klZtvtbEnsHZukg3wiktkT8b
 YYgivulC13eXKgyCXxmIt69JxvKqXSQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-VNKkFEOLPa6xXZZQKcxdKA-1; Fri, 04 Feb 2022 08:51:18 -0500
X-MC-Unique: VNKkFEOLPa6xXZZQKcxdKA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l16-20020a1c7910000000b0034e4206ecb7so2403353wme.7
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 05:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yOfmi1e4N3cuHy4uMQqPnABwHDOAXVx5evc05yrTlYs=;
 b=6KQKvEbExxoFE8pdCaNcrJaGn3DS1kNyO7Kf9fAEnaHrRFJuhi+TnIBsAFpcOclKOF
 KYefbPlAesWVO8Ju5dZ7eL+yAXm3rIKIZzCEacocL/Xsn3ozwumoNtkt2OtkMygsGX6+
 NcKiYnz6zlzwljHVDY9pHOdLRzlvQOTADfFDh6zJCqHb2YgmgqT7hGtWCN4gILsf54Xh
 BSH9rONCL2ZygluRxC2X8D9X48PRHh+ThgwxsU12aSdYUHa1DGAqVZgt/QQuvB1rIhMF
 PlAlaCP45n+PLzgFxpheXKSP0tNgRMuTLseQBGCAEOXctT/vVd574qL7HDuijSprABkN
 GXQQ==
X-Gm-Message-State: AOAM531N2JBD087rm0C8i2uZs08Pw7SE+xsJpOwFLN42+8rXOpoh36Q4
 CdZFdoi3iMDVXktQgvgExHsn84pEtQ9CDjlCK1LKQyGOkN4Nxpm6t8+3pFHJ+xy4iuXtl+liKe0
 KfszvUE8z2ZRtEd8=
X-Received: by 2002:a5d:47c2:: with SMTP id o2mr2553130wrc.143.1643982677493; 
 Fri, 04 Feb 2022 05:51:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylfJUYFeFTyB3+1MAYQd4Dmu/I9bRQxkb0I8YmWzq4ame6gZxkHttoRo2ui0sdetDtKbkZ1Q==
X-Received: by 2002:a5d:47c2:: with SMTP id o2mr2553111wrc.143.1643982677291; 
 Fri, 04 Feb 2022 05:51:17 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id c10sm1914819wrq.11.2022.02.04.05.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 05:51:16 -0800 (PST)
Date: Fri, 4 Feb 2022 08:51:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2] hw/smbios: fix memory corruption for large guests due
 to handle overlap
Message-ID: <20220204085001-mutt-send-email-mst@kernel.org>
References: <20220203130957.2248949-1-ani@anisinha.ca>
 <20220204103423.71ec5c6b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220204103423.71ec5c6b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, gsomlo@gmail.com, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 04, 2022 at 10:34:23AM +0100, Igor Mammedov wrote:
> > @@ -982,7 +986,7 @@ void smbios_get_tables(MachineState *ms,
> >                         uint8_t **anchor, size_t *anchor_len,
> >                         Error **errp)
> >  {
> > -    unsigned i, dimm_cnt;
> > +    unsigned i, dimm_cnt, offset;
> >  
> >      if (smbios_legacy) {
> >          *tables = *anchor = NULL;
> > @@ -1012,6 +1016,19 @@ void smbios_get_tables(MachineState *ms,
> >  
> >          dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;
> 
> Michael, Gerd,
> 
> Another question is why we split memory on 16Gb chunks, to begin with.
> Maybe instead of doing so, we should just add 1 type17 entry describing
> whole system RAM size. In which case we don't need this dance around
> handle offsets anymore.

I'm not sure - could be some guests just get confused if a chunk
is too big ... we'd need a lot of testing if we change that ...

-- 
MST


