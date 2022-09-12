Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17105B5E7C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 18:46:07 +0200 (CEST)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXmZN-00021w-EU
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 12:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oXmX2-0000DW-Jx
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 12:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oXmWx-0006uG-UB
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 12:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663001010;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BErffXn08NDnCLE908VJM83gknkH0+6TlM6okcIcdZM=;
 b=KEqXB2SjJyW9vyRDNqGPgOS0mczD8wrHQp+9tDL+CyPShVSLsLy+ZaGY0/O+zT8HPanoGX
 qWdTr/AnYl/TH2dp9d3fCfN3YLXm3FVdfKBoKIIX6mphn/O8PGkSbT+DugLOSYEU9Wd4xy
 nYK5mQ1NSTdnFODAJxgT4/uUiKd8fs4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-MoDWie-bOwW2NjyKF6cLzA-1; Mon, 12 Sep 2022 12:43:27 -0400
X-MC-Unique: MoDWie-bOwW2NjyKF6cLzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A6488037B7;
 Mon, 12 Sep 2022 16:43:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0A6440C2064;
 Mon, 12 Sep 2022 16:43:25 +0000 (UTC)
Date: Mon, 12 Sep 2022 17:43:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, jfehlig@suse.com,
 Claudio.Fontana@suse.com, quintela@redhat.com
Subject: Re: [PATCH] migration: support file: uri for source migration
Message-ID: <Yx9hqjMHYufYOlg3@redhat.com>
References: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
 <20220908102633.123536-1-nborisov@suse.com>
 <Yx9TO61m1tyUU5oy@redhat.com>
 <a0ba7e7c-f5c4-4772-154a-7e09d540ff9d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0ba7e7c-f5c4-4772-154a-7e09d540ff9d@suse.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 12, 2022 at 07:30:50PM +0300, Nikolay Borisov wrote:
> 
> 
> On 12.09.22 г. 18:41 ч., Daniel P. Berrangé wrote:
> > On Thu, Sep 08, 2022 at 01:26:32PM +0300, Nikolay Borisov wrote:
> > > This is a prototype of supporting a 'file:' based uri protocol for
> > > writing out the migration stream of qemu. Currently the code always
> > > opens the file in DIO mode and adheres to an alignment of 64k to be
> > > generic enough. However this comes with a problem - it requires copying
> > > all data that we are writing (qemu metadata + guest ram pages) to a
> > > bounce buffer so that we adhere to this alignment.
> > 
> > The adhoc device metadata clearly needs bounce buffers since it
> > is splattered all over RAM with no concern of alignemnt. THe use
> > of bounce buffers for this shouldn't be a performance issue though
> > as metadata is small relative to the size of the snapshot as a whole.
> 
> Bounce buffers can be eliminated altogether so long as we simply switch
> between buffered/DIO mode via fcntl.
> 
> > 
> > The guest RAM pages should not need bounce buffers at all when using
> > huge pages, as alignment will already be way larger than we required.
> > Guests with huge pages are the ones which are likely to have huge
> > RAM sizes and thus need the DIO mode, so we should be sorted for that.
> > 
> > When using small pages for guest RAM, if it is not already allocated
> > with suitable alignment, I feel like we should be able to make it
> > so that we allocate the RAM block with good alignemnt to avoid the
> > need for bounce buffers. This would address the less common case of
> > a guest with huge RAM size but not huge pages.
> 
> Ram blocks are generally allocated with good alignment due to them being
> mmaped(), however as I was toying with eliminating bounce buffers for ram I
> hit an issue where the page headers being written (8 bytes each) aren't
> aligned (naturally). Imo I think the on-disk format can be changed the
> following way:
> 
> 
> <ramblock header, containing base address of ramblock>, each subsequent page
> is then written at an offset from the base address of the ramblock, that is
> it's index would be :
> 
> page_offset = page_addr - ramblock_base, Then the page is written at
> ramblock_base (in the file) + page_offset. This would eliminate the page
> headers altogether. This leaves aligning the initial ramblock header
> initially. However, this would lead to us potentially having to issue 1
> lseek per page to write - to adjust the the file position, which might not
> be a problem in itself but who knows. How dooes that sound to you?

Yes, definitely. We don't want the headers on front of each page,
just one single large block. Looking forward to multi-fd, we don't
want to be using lseek at all, because that changes the file offset
for all threads using the FD. Instead we need to be able to use
pread/pwrite for writing the RAM blocks.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


