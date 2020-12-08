Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517272D326D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:52:50 +0100 (CET)
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmi6T-0008Un-7H
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmhup-0005lx-Er
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:40:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmhuk-0002By-1U
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607452840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=trZid7ex0ojUZON90DAD0XQF9EOsAIBiNiYbozQtqlg=;
 b=JkKussJVZr8y9x2I82bWA7sWNJVfA0mqQ1aoTxeLkBG+L+hX1UWJm2Vr1sKAaDRJnO/nVi
 y0na3GH0J4o+SjiHCnfwX/xxq3/3QJGBptqrCCRndq89JAnRr6ZcZ9Rhi4YVaG6M//CxiR
 b4an6Z5isjbaSboJuoaPxV6ipKZ3y7s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-mjEfpjrVOFijkTGbTHiWjA-1; Tue, 08 Dec 2020 13:40:38 -0500
X-MC-Unique: mjEfpjrVOFijkTGbTHiWjA-1
Received: by mail-wm1-f69.google.com with SMTP id j62so1227529wma.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=trZid7ex0ojUZON90DAD0XQF9EOsAIBiNiYbozQtqlg=;
 b=h5Rnf5tLeBKNMkzbGfoBq/pqFpIzaaek+8tTa0DuwiGHJ4jXnFAl2dWvK0cOWgP5B/
 zry7CtthIPXi2SvNTxOcTjC0fg5ljf9Qi5BIR+Vz3oD5l6btZ5ius/yunSzNJ2k2BQxS
 baRcBO106L5A7+lEpx2/S+3FjKNj9+aCb2b/qS5idzh6HCTdPpDEajQzfBOek74qINrh
 N5rHEAbG42f6GiwCWXVYG7u7ZSY2ZGqzBNurIUTpB1j5HHVOlTHnj12A6FMjUvymelY0
 AFPIdKL3wszuI2H4uBSJTkxnpHutsZ4BoXiftxbUrETyPqkt5723T1w4qtVcKavK3qCj
 RHJw==
X-Gm-Message-State: AOAM532ZcAjwtnF8nrsWPWQJreRcgxbJDVwSNMJB4Z0YgXxSKbKYLtxQ
 WBoBX523nWivj+0/TBbkU+evoZlSGzXhk0coeC75IUEd5o0OU8N0fGVy5FlrdwQAEETV9Ma0IwM
 mmWvgWZw5SG7DlRE=
X-Received: by 2002:a7b:c385:: with SMTP id s5mr5016499wmj.170.1607452836944; 
 Tue, 08 Dec 2020 10:40:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyruYV2l2liMIzhcaK9boOvkVth14JQj9Ya3wQgXNfrB1JjNIwAydaGYGeIRQRYK7PgnBjW8w==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr5016486wmj.170.1607452836808; 
 Tue, 08 Dec 2020 10:40:36 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id a18sm21471588wrr.20.2020.12.08.10.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:40:36 -0800 (PST)
Date: Tue, 8 Dec 2020 13:40:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] pcie_aer: Fix help message of pcie_aer_inject_error
 command
Message-ID: <20201208134007-mutt-send-email-mst@kernel.org>
References: <20201204030953.837-1-yuzenghui@huawei.com>
 <20201208183753.GC31369@work-vm>
MIME-Version: 1.0
In-Reply-To: <20201208183753.GC31369@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 06:37:53PM +0000, Dr. David Alan Gilbert wrote:
> * Zenghui Yu (yuzenghui@huawei.com) wrote:
> > There is an interesting typo in the help message of pcie_aer_inject_error
> > command. Use 'tlp' instead of 'tlb' to match the PCIe AER term.
> > 
> > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> 
> Queued

Oh I just queued it too ;) should not be a problem ...

> > ---
> >  hmp-commands.hx | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hmp-commands.hx b/hmp-commands.hx
> > index ff2d7aa8f3..dd460eb908 100644
> > --- a/hmp-commands.hx
> > +++ b/hmp-commands.hx
> > @@ -1302,8 +1302,8 @@ ERST
> >  	              " -c for correctable error\n\t\t\t"
> >                        "<id> = qdev device id\n\t\t\t"
> >                        "<error_status> = error string or 32bit\n\t\t\t"
> > -                      "<tlb header> = 32bit x 4\n\t\t\t"
> > -                      "<tlb header prefix> = 32bit x 4",
> > +                      "<tlp header> = 32bit x 4\n\t\t\t"
> > +                      "<tlp header prefix> = 32bit x 4",
> >          .cmd        = hmp_pcie_aer_inject_error,
> >      },
> >  
> > -- 
> > 2.19.1
> > 
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


