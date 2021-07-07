Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083CE3BECA1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 18:55:47 +0200 (CEST)
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Apt-0000Ha-RA
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 12:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Aow-00082x-Ff
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m1Aou-0007s7-MF
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625676883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYdqBvt5AmnqP2PGPfsTbcupbow3ltEOHwa6agZWkKs=;
 b=gt6ZHrce8yCsiNiYOy3ZikyJ3tJNHMjlEbMSBnv+AxIRtLNhSqlBTcFq2KXDNZOs1G3oS4
 NsV5vzrtNC+zvKNQmes6zZNVqBcVb34nyy6G9QbJcnrvhOjnPHzsQfHx+j6LajZ+1RpTk6
 c7NvL3zSxpD1r7qsGoF8juDGA4XCXrs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-7A88DuxAPYep-yGRRG4HpQ-1; Wed, 07 Jul 2021 12:54:42 -0400
X-MC-Unique: 7A88DuxAPYep-yGRRG4HpQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 n77-20020a3740500000b02903b496f6f425so1986193qka.1
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 09:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jYdqBvt5AmnqP2PGPfsTbcupbow3ltEOHwa6agZWkKs=;
 b=dHrrXel1io+3UvH0BM6qTDavvxr1rG/cIxi2RJtjfSOst2VfoEbV9iUyq8C9zU6hLX
 TLxHspEpTzByh6ray9Ae59P2mktX0c548EVg3welOF6EFb3cO+J4LfYk3PdvNRQeLy55
 sJEliz1/43OxDny6d6omuKfodFKun0Yvq5200Zq5JzkH5byXpfJN1VBjGRSPwP1cY133
 r6icEsJjHXRwwF4Pu5WZQxgOvmHz4wwbAPpLvXKGG4hfygCQZRDBAilPkXRj94sR+Pbx
 a7UwDYQ7eYCOsOjOJr6FoPtwH/hsprwO2AdzpYxeaa5YJni/QtShrI7RSrHoFxqBEZGl
 MBuQ==
X-Gm-Message-State: AOAM531+8g9nGNJm3DAOCZG4UVvqxqGV11wIuqEXFpdnp5VAj566zIIe
 QhGbyohyDAmNUKlOCWRUOG1eFp4u4sETPnbXqd0WJQLmfGmBEvSobMNuCxfJ5nWrqnoy+Iq3snS
 Y1zAOuIKaVLApJM8=
X-Received: by 2002:a05:620a:150c:: with SMTP id
 i12mr26097371qkk.458.1625676882421; 
 Wed, 07 Jul 2021 09:54:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydHrsrgUiDjks1UDVQ90/D5PS7In4lnlm5Tn2GV7gKTy6C4qQKg85Bbiww+kn/1epe2dzHgQ==
X-Received: by 2002:a05:620a:150c:: with SMTP id
 i12mr26097348qkk.458.1625676882234; 
 Wed, 07 Jul 2021 09:54:42 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d11sm3641108qtx.37.2021.07.07.09.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 09:54:41 -0700 (PDT)
Date: Wed, 7 Jul 2021 12:54:40 -0400
From: Peter Xu <peterx@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH] migration: Move bitmap_mutex out of
 migration_bitmap_clear_dirty()
Message-ID: <YOXcUNG3CaR43yrV@t490s>
References: <20210630200805.280905-1-peterx@redhat.com>
 <33f137dae5c346078a3a7a658bb5f1ab@intel.com>
 <YN26SDxZS1aShbHi@t490s>
 <304fc749-03a0-b58d-05cc-f0d78350e015@redhat.com>
 <604935aa45114d889800f6ccc23c6b13@intel.com>
 <824a1d77-eab0-239f-5104-49c49d6ad285@redhat.com>
 <562b42cbd5674853af21be3297fbaada@intel.com>
 <YOSXGpEB323VWepM@t490s>
 <bf763c28d0254cafbdfb7f7485106ae3@intel.com>
MIME-Version: 1.0
In-Reply-To: <bf763c28d0254cafbdfb7f7485106ae3@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 08:34:50AM +0000, Wang, Wei W wrote:
> On Wednesday, July 7, 2021 1:47 AM, Peter Xu wrote:
> > On Sat, Jul 03, 2021 at 02:53:27AM +0000, Wang, Wei W wrote:
> > > +       do {
> > > +            page_to_clear = start + (i++ << block->clear_bmap_shift);
> > 
> > Why "i" needs to be shifted?
> 
> Just move to the next clear chunk, no?
> For example, (1 << 18) pages chunk (i.e. 1GB).

But migration_clear_memory_region_dirty_bitmap() has done the shifting?

> 
> > 
> > > +            migration_clear_memory_region_dirty_bitmap(ram_state,
> > > +                                                       block,
> > > +
> > page_to_clear);
> > > +       } while (i <= npages >> block->clear_bmap_shift);
> > 
> > I agree with David that this should be better put into the mutex section, if so
> > we'd also touch up comment for bitmap_mutex.  Or is it a reason to explicitly
> > not do so?
> 
> clear_bmap_test_and_clear already uses atomic operation on clear_bmap.
> But it's also OK to me if you guys feel safer to move it under the lock.

I see, yes seems ok to be out of the lock.  Or we use mutex to protect all of
them, then make clear_bmap* helpers non-atomic too, just like dirty bmap.

Thanks,

-- 
Peter Xu


