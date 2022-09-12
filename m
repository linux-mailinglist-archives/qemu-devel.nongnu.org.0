Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D275B5D8F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 17:44:02 +0200 (CEST)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXlbN-000113-1i
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oXlZX-0006mN-2o
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 11:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oXlZO-0005r3-RA
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 11:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662997317;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=sS4id3iscsQ32DEvakDNQcNA+mhyAyw3NSm9yVpe79k=;
 b=OFB5bMyJIpU/wAo62QirNZKutgfIF8WkiQ8QEOie6nJoHxtia7t9fWx/3g/NzvfmWgyiyv
 jhjBESzUQEl/0P0CV6mQPN+9fB8IUx6hEI0jBYITunwchp5Eqdltkz4qu4ZWYpQnRe7MT+
 UuoT7TG8KWMbEewuIuVqTI1D/e9Cm1w=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-2QMUJKVBOVSJ5e4BB-GOsQ-1; Mon, 12 Sep 2022 11:41:54 -0400
X-MC-Unique: 2QMUJKVBOVSJ5e4BB-GOsQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 008A73801143;
 Mon, 12 Sep 2022 15:41:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D2421121314;
 Mon, 12 Sep 2022 15:41:50 +0000 (UTC)
Date: Mon, 12 Sep 2022 16:41:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, jfehlig@suse.com,
 Claudio.Fontana@suse.com, quintela@redhat.com
Subject: Re: [PATCH] migration: support file: uri for source migration
Message-ID: <Yx9TO61m1tyUU5oy@redhat.com>
References: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
 <20220908102633.123536-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220908102633.123536-1-nborisov@suse.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

On Thu, Sep 08, 2022 at 01:26:32PM +0300, Nikolay Borisov wrote:
> This is a prototype of supporting a 'file:' based uri protocol for
> writing out the migration stream of qemu. Currently the code always
> opens the file in DIO mode and adheres to an alignment of 64k to be
> generic enough. However this comes with a problem - it requires copying
> all data that we are writing (qemu metadata + guest ram pages) to a
> bounce buffer so that we adhere to this alignment.

The adhoc device metadata clearly needs bounce buffers since it
is splattered all over RAM with no concern of alignemnt. THe use
of bounce buffers for this shouldn't be a performance issue though
as metadata is small relative to the size of the snapshot as a whole.

The guest RAM pages should not need bounce buffers at all when using
huge pages, as alignment will already be way larger than we required.
Guests with huge pages are the ones which are likely to have huge
RAM sizes and thus need the DIO mode, so we should be sorted for that.

When using small pages for guest RAM, if it is not already allocated
with suitable alignment, I feel like we should be able to make it
so that we allocate the RAM block with good alignemnt to avoid the
need for bounce buffers. This would address the less common case of
a guest with huge RAM size but not huge pages.

Thus if we assume guest RAM is suitably aligned, then we can avoid
bounce buffers for RAM pages, while still using bounce buffers for
the metadata.

>                                                    With this code I get
> the following performance results:
> 
>       DIO              exec: cat > file         virsh --bypass-cache
>       82		     		77							81
>       82		    	    78							80
>       80		    	    80							82
>       82		    	    82							77
>       77		    	    79							77
> 
> AVG:  80.6		     		79.2						79.4
> stddev: 1.959		     	1.720						2.05
> 
> All numbers are in seconds.
> 
> Those results are somewhat surprising to me as I'd expected doing the
> writeout directly within qemu and avoiding copying between qemu and
> virsh's iohelper process would result in a speed up. Clearly that's not
> the case, I attribute this to the fact that all memory pages have to be
> copied into the bounce buffer. There are more measurements/profiling
> work that I'd have to do in order to (dis)prove this hypotheses and will
> report back when I have the data.

When using the libvirt iohelper we have mutliple CPUs involved. IOW the
bounce buffer copy is taking place on a separate CPU from the QEMU
migration loop. This ability to use multiple CPUs may well have balanced
out any benefit from doing DIO on the QEMU side.

If you eliminate bounce buffers for guest RAM and write it directly to
the fixed location on disk, then we should see the benefit - and if not
then something is really wrong in our thoughts.

> However I'm sending the code now as I'd like to facilitate a discussion
> as to whether this is an approach that would be acceptable to upstream
> merging. Any ideas/comments would be much appreciated.

AFAICT this impl is still using the existing on-disk format, where RAM
pages are just written inline to the stream. For DIO benefit to be
maximised we need the on-disk format to be changed, so that the guest
RAM regions can be directly associated with fixed locations on disk.
This also means that if guest dirties RAM while its saving, then we
overwrite the existing content on disk, such that restore only ever
needs to restore each RAM page once, instead of restoring every
dirtied version.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


