Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89A33160FE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:29:48 +0100 (CET)
Received: from localhost ([::1]:54510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ksd-0000BO-Va
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9krk-0008CR-JJ
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:28:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9kri-0006kw-Hb
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612945729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KYm4f11xkFG0/pj03SohqAVid0geN7LxIE72HLTFsiA=;
 b=Pk07cCL/Il+cxdcsI5EpynajDLha07D5hYEKRG6cUx+nhhz/nUHID5fbcUq4M++Xg2k3Q/
 xikO+OElbk8haGlK5SwIcVqyXA5UrX572Dt5tyif6WGLT4A5j4bO7zSYfOarN9azmWjvUQ
 0ZJjNCpcsycpR71S1xEzWld1b8P+jqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-3LMWGJz_PoWZSZQAtY8irQ-1; Wed, 10 Feb 2021 03:28:48 -0500
X-MC-Unique: 3LMWGJz_PoWZSZQAtY8irQ-1
Received: by mail-wm1-f69.google.com with SMTP id b201so953375wmb.9
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 00:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KYm4f11xkFG0/pj03SohqAVid0geN7LxIE72HLTFsiA=;
 b=BYvVueq9VwjGgDnQU2uePLdavdT9kUM2avexzEq+OGhSazOTHrcOzQmVHSkU7uz69j
 qWX4Kdx56A8UQRHy0rcLZHcONvIArSPwEf/NVyiDPxAn2Mo62wPctUnKs5lfI/IGnx8H
 yKY/64w2q2zpOFjaE5cyZkwv2oUSZuR5hD2mJ2iByG4MXf0zlQws3NsNhEOC68vnjOJN
 VYSpjtwup5Yn730N9a9QFhFcS5KyKdzXwqm8mhiiEcZBh6/V/drpNW/K1ACjG5twovIt
 THdHbeESMeEGgoUuGg/3sbjIzgQk8RCYiDHVDGoATKvINRyEmI2Nw3GTior5bBwXlTYh
 TwHA==
X-Gm-Message-State: AOAM533Gj/7Z0mB2Oxh+mqroqptQknosQkeIN1Syn+lT7O6xEe3xFJI8
 p3JshElJaLBs4njGRf5eYJdqei8N4zseZPwXaD1qmnl4EvDtQM+1h1Q/K9IAq7RBuwTiqIiXOb5
 k46iOwuHhzD207bk=
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr1868289wmf.110.1612945726977; 
 Wed, 10 Feb 2021 00:28:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+G2ubGGBF4Yn0Q46DSnQN+qbvPsf+L08JJ+SY8/E771BhPQx7CTomHXz3BzSkKZrQIabKFg==
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr1868277wmf.110.1612945726798; 
 Wed, 10 Feb 2021 00:28:46 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id h9sm1869543wrc.94.2021.02.10.00.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:28:46 -0800 (PST)
Date: Wed, 10 Feb 2021 03:28:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 6/9] hw/i386: declare ACPI mother board resource for
 MMCONFIG region
Message-ID: <20210210031614-mutt-send-email-mst@kernel.org>
References: <cover.1612821108.git.isaku.yamahata@intel.com>
 <ff52a5969a6666235745d7e067f5fb500a8c70fb.1612821109.git.isaku.yamahata@intel.com>
 <20210209165241.5ba1a953@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209165241.5ba1a953@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 04:52:41PM +0100, Igor Mammedov wrote:
> > ---
> >  hw/i386/acpi-build.c | 172 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 172 insertions(+)
> > 
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index c2f11d95d8..bcb1f65c1d 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1066,6 +1066,177 @@ static void build_q35_pci0_int(Aml *table)
> >      aml_append(table, sb_scope);
> >  }
> >  
> > +static Aml *build_q35_dram_controller(void)
> > +{
> > +    /*
> > +     * DSDT is created with revision 1 which means 32bit integer.
> version 1, is kept for Windows XP sake which is EOLed long ago,
> and it even will boot with v2 as long as AML doesn't contain non v1
> terms or those are hidden behind dynamic method which are not evaluated.

right, this are doing lots of dynamic stuff, generally it is easy to hide
things there.  E.g. 

if (high != 0) return qword else return dword

> Perhaps we should bump dsdt revision to v2.

I agree that bumping up to v2 is likely safe ...

> And anyways with this patch XP probably will trip over, if it tries to parse
> 64bit CRS, but we probably don't care about XP on q35.

Yea I'm not sure why are we using qword here.

-- 
MST


