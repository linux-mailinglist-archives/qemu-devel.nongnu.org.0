Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17E668F7F6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:23:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPq2H-0004Uu-Ci; Wed, 08 Feb 2023 14:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPq28-0004TX-3P
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPq24-0005KQ-LO
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675884183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/94s6I4YbTxjC01lGBt97XzQLm6hN9JfLajFzidXVjY=;
 b=hyOJx56d3ABGr1WX3R+1F/M2vnDqdY3Wr7sO+pG0NIPNwUobvrDJ7qMQb92ur5t+EKTNvD
 nxMfC/3WNw6jzQ5oFzFOwIDjTrPUQgg0IjNft2KkWXmYCXtwRHeejMZcAUTQEa3LGbd+Vt
 u+tDxcsLppdetQrB+TbQ6G+0WY/HGiA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-AyOk-6aCOkyHMGiLt58KNQ-1; Wed, 08 Feb 2023 14:23:02 -0500
X-MC-Unique: AyOk-6aCOkyHMGiLt58KNQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 a24-20020ac84d98000000b003b9a4958f0cso11251722qtw.3
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/94s6I4YbTxjC01lGBt97XzQLm6hN9JfLajFzidXVjY=;
 b=huWfsBDHafhmaSFUDyqNgvHQ87VCtjmeKhiPYpHcC+wHotQz8e8qrcg2M86MZ2CA4b
 uVsYc06NA3XwVCwR1vSBi3PgebF314vskTRa7vMX2lfub9ZbR2mIE1ysDDQ71ks+Pc6D
 /wQFMMhDuBZY7ipC1t0aORQLHVEkdKjJ5DJxF57JCyk9Q16pUvr/8iPCru55wVRYpJx9
 T7eKreVPusS6Vyw+a3apakz894ce5Ys+TJ3E1kMLyTg9m1kq9znLfk9T036esBpG43GB
 mzL6ioiHY8qjScKV00D1SSKXPKHTGs9jvjHwMwg1APoU1pwg0GOR/9L6/cemeyCw1ZPk
 S3Ow==
X-Gm-Message-State: AO0yUKUZRr9EJ/1G/iU88pqqUM9k2uwcl+fOGRXXLb//2iVGAZPOQsZ4
 DB76LkOB31N5DYTz+MWl/+9wpZyZHUZi2oeQ2jlP3FTyF7l3NwNTQ/+TpbGg2dCl2aOaDb2CM9N
 OwHuZTZloJQ6Brqo=
X-Received: by 2002:a05:622a:1744:b0:3b8:5dfe:c3dc with SMTP id
 l4-20020a05622a174400b003b85dfec3dcmr16420081qtk.3.1675884181430; 
 Wed, 08 Feb 2023 11:23:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9JiU5QU1ZOfg5hh25K81aKYz0ExQVwGCJ6vHplef0R9xj//C+78MsP3r+B06v3nDzbuPg2zg==
X-Received: by 2002:a05:622a:1744:b0:3b8:5dfe:c3dc with SMTP id
 l4-20020a05622a174400b003b85dfec3dcmr16420042qtk.3.1675884181165; 
 Wed, 08 Feb 2023 11:23:01 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 d11-20020ac8614b000000b003b856b73e8bsm12015197qtm.16.2023.02.08.11.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:23:00 -0800 (PST)
Date: Wed, 8 Feb 2023 14:22:59 -0500
From: Peter Xu <peterx@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH V2] memory: RAM_NAMED_FILE flag
Message-ID: <Y+P2k6iDQc0x0xtT@x1n>
References: <1675796613-235716-1-git-send-email-steven.sistare@oracle.com>
 <Y+KzMDdc+F9zHMh2@x1n>
 <25b316ac-18da-cd63-fd36-472db6ae9b51@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25b316ac-18da-cd63-fd36-472db6ae9b51@oracle.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

On Wed, Feb 08, 2023 at 01:34:18PM -0500, Steven Sistare wrote:
> On 2/7/2023 3:23 PM, Peter Xu wrote:
> > On Tue, Feb 07, 2023 at 11:03:33AM -0800, Steve Sistare wrote:
> >> migrate_ignore_shared() is an optimization that avoids copying memory
> >> that is visible and can be mapped on the target.  However, a
> >> memory-backend-ram or a memory-backend-memfd block with the RAM_SHARED
> >> flag set is not migrated when migrate_ignore_shared() is true.  This is
> >> wrong, because the block has no named backing store, and its contents will
> >> be lost.  To fix, ignore shared memory iff it is a named file.  Define a
> >> new flag RAM_NAMED_FILE to distinguish this case.
> > 
> > There's also TYPE_MEMORY_BACKEND_EPC.  Reading the commit message it seems
> > it can still be used in similar ways.  Pasting commit message from c6c0232:
> > 
> >     Because of its unique requirements, Linux manages EPC separately from
> >     normal memory.  Similar to memfd, the device /dev/sgx_vepc can be
> >     opened to obtain a file descriptor which can in turn be used to mmap()
> >     EPC memory.
> > 
> > I'm not sure whether it means that should apply for RAM_NAMED_FILE too,
> > neither do I think it's super important..  Still better to define it
> > properly.
> 
> The RAM_NAMED_FILE flag will be false for TYPE_MEMORY_BACKEND_EPC, so 
> ramblock_is_ignored will return false, and the contents will be copied
> over the socket to the target, and the segment will be recreated there.
> 
> However, perhaps I do not understand your point.

My point was it looked like it should apply RAM_NAMED_FILE too, because
it's also a named file.

But..  I don't think another QEMU can share the same data if opening the
same file.  Based on my zero knowledge on it... I quickly looked up
sgx_vepc_open() in the Linux impl where sgx_vepc.page_array plays a role of
page cache iiuc, while it's private per vma even if VM_SHARED.

So please ignore my comment..

> 
> > Another comment is, AFAIK this patch will modify senamtics of the old
> > capability "x-ignore-shared".  But I'd say in a sensible way.  Maybe worth
> > directly modify qapi/migration.json to reflect it (especially it's x-
> > prefixed) to something like:
> > 
> > # @x-ignore-shared: If enabled, QEMU will not migrate named shared memory
> > #                   (since 4.0) 
> 
> Good idea.  I propose:
> 
> # @x-ignore-shared: If enabled, QEMU will not migrate shared memory that is
> #                   accessible on the target. (since 4.0)

I would use s/target/destination host/ because target can be misread as the
VM itself (at least a general term in migration code base).  Other than
that looks good to me.

Thanks,

-- 
Peter Xu


