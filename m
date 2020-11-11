Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C792AF264
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:44:56 +0100 (CET)
Received: from localhost ([::1]:59170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqQg-0006VW-IY
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:44:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kcqPe-00062n-RT
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:43:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kcqPb-0004Gy-Ex
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 08:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605102225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O85oSE3kUrV4DHrlqiVVje6iKE/ivVReXrVpwGwUxS4=;
 b=bYkA/NjkJJOv2J9ybCSYgs4d5NFDnCJ4GKMV3udGq4YyAF0bW5D4Zs1mDNyiG7DVkjuqbj
 CwS7bCkmDh3qbZFWb/8jujO7TR0zeci0i5pfCn1py5bCHm9gY1UuKQQOhuWmI4YT8A96MK
 m6GeytBOGhZZvUMaT23BCl49RFg58d0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-vHrYEWGDNveJBSmpUMySnw-1; Wed, 11 Nov 2020 08:43:44 -0500
X-MC-Unique: vHrYEWGDNveJBSmpUMySnw-1
Received: by mail-wr1-f71.google.com with SMTP id u1so611643wri.6
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 05:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O85oSE3kUrV4DHrlqiVVje6iKE/ivVReXrVpwGwUxS4=;
 b=ItFPbp0Wq+eNV/rm3tTxmaDxstWKPG1Iw/hr0LOyZA1lTOeRW7Fv6kgiWEXlK2+9nq
 wgtFWiuwx4mqG8UL5XZFn0UYk9G9eMHIw3VlpOhmFhlW1MWkG4KbgJopZzetjj5Qcq+f
 pVVdVog9fFucDYFsYP+tSAHTtvZUeEE/TDXlsP1nIgeQt+auAT68D5n4M+FPMWu1B5QM
 TGg37Ju9wW3Aj/uhFNWtC54wyO5iVPgMMC4P6f15rnxb/iAIdnvFSvZygGMnmcxSZGw7
 NU45G7mwvIixkA/+PKT9rJSS9tyd1o04dMt/pno72pYxicZfmpvyZVLrge3IeYp7i23h
 +dEA==
X-Gm-Message-State: AOAM5302UoeqQl2R9KI9pfJ1OpJtUG0VEGkZQuhfx/S0XYHLPRO9cCxC
 fOl/2+ArjO1AVqKdP5P3xjKh+nab4a5V/wduX2Hvh+ArZjpk4e+SRoPwPL6Qpa03Osrb56pK58w
 USf6eCSB2zp8wckw=
X-Received: by 2002:a1c:7213:: with SMTP id n19mr4134654wmc.36.1605102222738; 
 Wed, 11 Nov 2020 05:43:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtNGo0q6FMvRUK2XkF5yEET5/p5hJfWLYdC87qG1Pjj5MS04nP+DBh3wE1MGF7DbUOupE7zg==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr4134629wmc.36.1605102222505; 
 Wed, 11 Nov 2020 05:43:42 -0800 (PST)
Received: from redhat.com (bzq-79-181-34-244.red.bezeqint.net. [79.181.34.244])
 by smtp.gmail.com with ESMTPSA id c2sm2671712wrf.68.2020.11.11.05.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:43:41 -0800 (PST)
Date: Wed, 11 Nov 2020 08:43:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 08/12] tests/acpi: allow updates for expected data files
Message-ID: <20201111082944-mutt-send-email-mst@kernel.org>
References: <20201105133923.23821-1-kraxel@redhat.com>
 <20201105133923.23821-9-kraxel@redhat.com>
 <20201111135015.6af7e1c1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111135015.6af7e1c1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 01:50:15PM +0100, Igor Mammedov wrote:
> On Thu,  5 Nov 2020 14:39:19 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > index dfb8523c8bf4..191ac230b013 100644
> > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > @@ -1 +1,3 @@
> >  /* List of comma-separated changed AML files to ignore */
> > +"tests/data/acpi/microvm/APIC.ioapic2",
> > +"tests/data/acpi/microvm/DSDT.ioapic2",
> 
> does adding 2nd ioapic affects DSDT?
> if not I'd suggest to drop it, test code should fall back to
> use suffix-less DSDT then.

BTW maybe we should add checkpatch code verifying that
identical tables are suffix-less - want to try doing that?

-- 
MST


