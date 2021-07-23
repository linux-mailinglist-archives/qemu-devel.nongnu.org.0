Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEF53D4300
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 00:36:24 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m73mJ-0005Kc-UP
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 18:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73lA-0004aR-U2
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:35:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73l9-0004rv-79
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627079710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HTle8yDscDrBnEvQ7DvXju1g15qumTzjNqz8lwL+ryk=;
 b=gCr/TfoTeiquFF584duCrVMgSYH78+JUWziqEgOqsq0zeNgTHlpFBFLFVwFtyYfClmw4S8
 p6aM238oI1LsEnccANBTIbVfDGYCzJcVS316iVj6TIWIbjVhuKhG40xBoekLamgYHtEdZk
 93cIcHaLjDagtNS5m2XQYyMM3JGzvdY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-JlygR6G9PeayVNjSjUJPTA-1; Fri, 23 Jul 2021 18:35:09 -0400
X-MC-Unique: JlygR6G9PeayVNjSjUJPTA-1
Received: by mail-qk1-f199.google.com with SMTP id
 x12-20020a05620a14acb02903b8f9d28c19so2170610qkj.23
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 15:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HTle8yDscDrBnEvQ7DvXju1g15qumTzjNqz8lwL+ryk=;
 b=EdwwCOozxhCDcrkeWxT5fnGIcIlf9njAgiralur1JWoPbDGfqt1+rGrTzznLZwEKF3
 POdxJQsOk+QlwGP8cCee4IckPO5DRlzF5BnjV+aMg3D6Y8jv5fiSkjXQKWKg59RgnzF2
 RjHoNeuCIqGNGlnudMYfT1b0xBW556duWGrGIveF7eyZfZXh+DrpQtAV7iXVsw78z4jo
 dZC4zQfWbA4uvJNW33mM6pGwSAc0wqCmcCm81oRAnjCT5RIYU5XWQuddqrAbdOo+6iVF
 /dhKzQk8c8Q6KetuBIPXrg5p6nalM8LBXo2riWB7BUWR1pnV1PKErvmfAPGk8RpsWgXp
 4rIQ==
X-Gm-Message-State: AOAM532CxmwuvteT7U6+qJrxOCNqalNhip5N68m6rj2taKNxxM2k/YhR
 IsiDAcV3R3FuahmnZQuxmdvzpn3TdMos5P2T+OZ/GuVCD894JVRVv9Ap3muqrlgoECAwWx/fiXt
 5R//399DpXpXAx+4=
X-Received: by 2002:a05:6214:20ac:: with SMTP id
 12mr6681976qvd.7.1627079709186; 
 Fri, 23 Jul 2021 15:35:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlVN5RIJRVoJgwhgDClF88itHtmcUUfZwyVWm40oUOqCshZJTEVVsuP4h7XoCdUwYFfHJU4Q==
X-Received: by 2002:a05:6214:20ac:: with SMTP id
 12mr6681956qvd.7.1627079708974; 
 Fri, 23 Jul 2021 15:35:08 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 74sm10541409qkh.42.2021.07.23.15.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:35:08 -0700 (PDT)
Date: Fri, 23 Jul 2021 18:35:06 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 1/5] tpm: mark correct memory region range
 dirty when clearing RAM
Message-ID: <YPtEGpcLd4bT/5sD@t490s>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-2-david@redhat.com> <YPrXutNkup2E4k6k@t490s>
 <c4bc5d98-7a34-6a9c-3c07-10e5b52cd06a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c4bc5d98-7a34-6a9c-3c07-10e5b52cd06a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 09:15:43PM +0200, David Hildenbrand wrote:
> On 23.07.21 16:52, Peter Xu wrote:
> > On Tue, Jul 20, 2021 at 03:03:00PM +0200, David Hildenbrand wrote:
> > > @@ -30,11 +30,13 @@ void tpm_ppi_reset(TPMPPI *tpmppi)
> > >           guest_phys_blocks_init(&guest_phys_blocks);
> > >           guest_phys_blocks_append(&guest_phys_blocks);
> > >           QTAILQ_FOREACH(block, &guest_phys_blocks.head, next) {
> > > +            ram_addr_t mr_start = memory_region_get_ram_addr(block->mr);
> > > +
> > >               trace_tpm_ppi_memset(block->host_addr,
> > >                                    block->target_end - block->target_start);
> > >               memset(block->host_addr, 0,
> > >                      block->target_end - block->target_start);
> > > -            memory_region_set_dirty(block->mr, 0,
> > > +            memory_region_set_dirty(block->mr, block->target_start - mr_start,
> > >                                       block->target_end - block->target_start);
> > 
> > target_start should falls in gpa range, while mr_start is ram_addr_t.  I am not
> > sure whether this is right..
> 
> When I wrote that code I was under the impression that
> memory_region_get_ram_addr() would give the GPA where the memory region
> starts, but ... that's not correct as you point out. "offset" confusion :)
> 
> > 
> > Neither do I know how to get correct mr offset with the existing info we've got
> > from GuestPhysBlock.  Maybe we need to teach guest_phys_blocks_region_add() to
> > also record section->offset_within_region?
> 
> We might actually want offset_within_address_space + offset_within_region,
> so we can calculate the GPA difference to see where inside the ramblock we
> end up.

I still think offset_within_region is exactly what we want to fill in here, but
you can do a double check.

> 
> I'll have a look next week, thanks for noticing!

Sure!

-- 
Peter Xu


