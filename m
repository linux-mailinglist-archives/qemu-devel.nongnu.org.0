Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E46D4C8A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 17:50:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMR7-0001f0-1X; Mon, 03 Apr 2023 11:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjMR5-0001eV-3S
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 11:49:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjMR3-0007IR-Fc
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 11:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680536972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/WSdjFcXjgS0GAJGuzUCTNaMTlCE1H6FeUIpAaJgo8k=;
 b=Ho90YeAonUhgSa7Nh7AH9ndjPrm3lKVCs1iVbxVevWXRPt5/Gz2b9Rvu448LuqUFtvq6ux
 9DOLg3iy7iRq/pWs/ykx4lEwq2Z7nS01zVwlduT0SaWw3Mn+zuJRbIYXnjEA5tbKviYEC8
 Ge3FT3trwY081AkZAFxSdczSYAr8rBg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-ad9cNBADMx29rnQJiI0pQQ-1; Mon, 03 Apr 2023 11:49:31 -0400
X-MC-Unique: ad9cNBADMx29rnQJiI0pQQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3e1522cf031so9255901cf.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 08:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680536970;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WSdjFcXjgS0GAJGuzUCTNaMTlCE1H6FeUIpAaJgo8k=;
 b=6dpNV9v/pc1gBKUfs2wQkuUOO2FXqgUTyxmeLclYe3RAQ2TukQGCyzQVaoyJCy+E1P
 RhlG7KhI0rqZJAZpoDSqJjau/L4m3p/R6M68wBMAh8Qv7Jw0nnTtFLpmR2WBChFmYXS2
 2xZ9AHNgy6YZnv2kftfRu5xkXN7bwzbZekKvjdMnZn+xgKHLeoyXO3REBdI0LTTIJlxl
 gvB+uP2iZ9+ZMr+vfBHz1+OTYnHZGRiDFwi7Yh1dzHrNO5F9UBay22p1WwcDzRj4br+4
 loxCpxA2mH6dpb+bYRVJTKfvB5Bqu31Eed3XyL3R7juwQFcL5Uvpy8BNXiUR2A2cDGkL
 ssNQ==
X-Gm-Message-State: AAQBX9cPMLZwaM5PUFmNagIl8wVZ6wNpRXyt/jJXf5lerFVKrYopG/1N
 OPESOf+li7jQiYIYibZPDVeKcfR5im9yFsqAi+y5xHETwip3/UubaKu1VBY523Xy9tl7KMUW/i2
 XAUUrotEUTgv43cc=
X-Received: by 2002:a05:622a:1cf:b0:3e3:98cf:68ae with SMTP id
 t15-20020a05622a01cf00b003e398cf68aemr26691229qtw.2.1680536970444; 
 Mon, 03 Apr 2023 08:49:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350acqF1JS6BYhI5ojFMTnkSjWK/NY8dmrXkV9SJ8Xp8DU6jWB67jhOaADbqNgmPGgBLmdgCPhA==
X-Received: by 2002:a05:622a:1cf:b0:3e3:98cf:68ae with SMTP id
 t15-20020a05622a01cf00b003e398cf68aemr26691203qtw.2.1680536970160; 
 Mon, 03 Apr 2023 08:49:30 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 s194-20020a37a9cb000000b007469b5bc2c4sm2890505qke.13.2023.04.03.08.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 08:49:29 -0700 (PDT)
Date: Mon, 3 Apr 2023 11:49:28 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <graf@amazon.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Philippe Mathieu-Daude <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [PATCH v4] hostmem-file: add offset option
Message-ID: <ZCr1iNzATiThmpXS@x1n>
References: <20230401124257.24537-1-graf@amazon.com>
 <20230401174716.GB154566@fedora>
 <f2e232df-51d4-9cac-557d-329523a69530@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2e232df-51d4-9cac-557d-329523a69530@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Mon, Apr 03, 2023 at 09:13:29AM +0200, David Hildenbrand wrote:
> On 01.04.23 19:47, Stefan Hajnoczi wrote:
> > On Sat, Apr 01, 2023 at 12:42:57PM +0000, Alexander Graf wrote:
> > > Add an option for hostmem-file to start the memory object at an offset
> > > into the target file. This is useful if multiple memory objects reside
> > > inside the same target file, such as a device node.
> > > 
> > > In particular, it's useful to map guest memory directly into /dev/mem
> > > for experimentation.
> > > 
> > > Signed-off-by: Alexander Graf <graf@amazon.com>
> > > Reviewed-by: Stefan Hajnoczi <stefanha@gmail.com>
> > > 
> > > ---
> > > 
> > > v1 -> v2:
> > > 
> > >    - add qom documentation
> > >    - propagate offset into truncate, size and alignment checks
> > > 
> > > v2 -> v3:
> > > 
> > >    - failed attempt at fixing typo
> > > 
> > > v2 -> v4:
> > > 
> > >    - fix typo
> > > ---
> > >   backends/hostmem-file.c | 40 +++++++++++++++++++++++++++++++++++++++-
> > >   include/exec/memory.h   |  2 ++
> > >   include/exec/ram_addr.h |  3 ++-
> > >   qapi/qom.json           |  5 +++++
> > >   qemu-options.hx         |  6 +++++-
> > >   softmmu/memory.c        |  3 ++-
> > >   softmmu/physmem.c       | 14 ++++++++++----
> > >   7 files changed, 65 insertions(+), 8 deletions(-)
> > 
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> 
> The change itself looks good to me, but I do think some other QEMU code that
> ends up working on the RAMBlock is not prepared yet. Most probably, because
> we never ended up using fd with an offset as guest RAM.
> 
> We don't seem to be remembering that offset in the RAMBlock. First, I
> thought block->offset would be used for that, but that's just the offset in
> the ram_addr_t space. Maybe we need a new "block->fd_offset" to remember the
> offset (unless I am missing something).

I think you're right.

> 
> The real offset in the file would be required at least in two cases I can
> see (whenever we essentially end up calling mmap() on the fd again):
> 
> 1) qemu_ram_remap(): We'd have to add the file offset on top of the
> calculated offset.
> 
> 2) vhost-user: most probably whenever we set the mmap_offset. For example,
> in vhost_user_fill_set_mem_table_msg() we'd similarly have to add the
> file_offset on top of the calculated offset. vhost_user_get_mr_data() should
> most probably do that.

I had a patch to add that offset for the upcoming doublemap feature here:

https://lore.kernel.org/all/20230117220914.2062125-8-peterx@redhat.com/

But that was because doublemap wants to map the guest mem twice for other
purposes. I didn't yet notice that the code seem to be already broken if
without offset==0.

While, I _think_ we already have offset!=0 case for a ramblock, since:

        commit ed5d001916dd46ceed6d8850e453bcd7b5db2acb
        Author: Jagannathan Raman <jag.raman@oracle.com>
        Date:   Fri Jan 29 11:46:13 2021 -0500

        multi-process: setup memory manager for remote device

Where there's:

        memory_region_init_ram_from_fd(subregion, NULL,
                                       name, sysmem_info->sizes[region],
                                       RAM_SHARED, msg->fds[region],
                                       sysmem_info->offsets[region],
                                       errp);

Thanks,

-- 
Peter Xu


