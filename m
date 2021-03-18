Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20748340298
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:59:03 +0100 (CET)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpQk-0004OK-7e
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lMpP6-0002RG-4f
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lMpP4-0001v4-69
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616061437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ys0nB3v8fnPbAKGcsyHNjjqsaQhh9Lpc4pvqxAPsHV0=;
 b=b2fOGNzNstCaeAdlExdNPKFGNeH9d7F3ewprPykkhZP6/UvXV6OCzS1hzLV352ODJm08Wb
 QIiHwN0WcG/ZSUaXWuuVG+5Atke2r6dJNdyL02IcPMymbByqUGdgBGrUvYi5OMhQ2+bo2t
 EqnVFHsJ7aCViWsOT5vnnM3FSh8gYA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-13WsLSvsPhewUpmzNYE2GQ-1; Thu, 18 Mar 2021 05:57:15 -0400
X-MC-Unique: 13WsLSvsPhewUpmzNYE2GQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5B65A40C0;
 Thu, 18 Mar 2021 09:57:13 +0000 (UTC)
Received: from starship (unknown [10.35.206.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A9D519726;
 Thu, 18 Mar 2021 09:57:08 +0000 (UTC)
Message-ID: <a34aa05dad2117ff4f067ba6bfa811823e5b35c0.camel@redhat.com>
Subject: Re: [PATCH 2/2] qemu-img: align next status sector on destination
 alignment.
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Eric Blake <eblake@redhat.com>, Peter Lieven <pl@kamp.de>, 
 qemu-devel@nongnu.org
Date: Thu, 18 Mar 2021 11:57:07 +0200
In-Reply-To: <621d739815b25f8b6bc1b8cdd266a89a20bdd97a.camel@redhat.com>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
 <20201111153913.41840-3-mlevitsk@redhat.com>
 <2903c8a0-00c9-5f2c-b261-d825ded3042c@kamp.de>
 <b4c49375-451b-1bc2-8c98-9d4e6fc62347@redhat.com>
 <621d739815b25f8b6bc1b8cdd266a89a20bdd97a.camel@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jan Kara <jack@suse.cz>,
 qemu-block@nongnu.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-11-12 at 17:04 +0200, Maxim Levitsky wrote:
> On Thu, 2020-11-12 at 07:45 -0600, Eric Blake wrote:
> > On 11/12/20 6:40 AM, Peter Lieven wrote:
> > 
> > > >          /*
> > > > -         * Avoid that s->sector_next_status becomes unaligned to the source
> > > > -         * request alignment and/or cluster size to avoid unnecessary read
> > > > -         * cycles.
> > > > +         * Avoid that s->sector_next_status becomes unaligned to the
> > > > +         * source/destination request alignment and/or cluster size to avoid
> > > > +         * unnecessary read/write cycles.
> > > >           */
> > > > -        tail = (sector_num - src_cur_offset + n) % s->src_alignment[src_cur];
> > > > +        alignment = MAX(s->src_alignment[src_cur], s->alignment);
> > > > +        assert(is_power_of_2(alignment));
> > > > +
> > > > +        tail = (sector_num - src_cur_offset + n) % alignment;
> > > >          if (n > tail) {
> > > >              n -= tail;
> > > >          }
> > > 
> > > I was also considering including the s->alignment when adding this chance. However, you need the least common multiple of both alignments, not the maximum, otherwise
> > > 
> > > you might get misaligned to either source or destination.
> > > 
> > > 
> > > Why exactly do you need the power of two requirement?
> > 
> > The power of two requirement ensures that you h ave the least common
> > multiple of both alignments ;)
> -
> Yes, and in addition to that both alignments are already power of two because we align them
> to it. The assert I added is just in case.
> 
> This is how we calculate the destination alignment:
>  
> s.alignment = MAX(pow2floor(s.min_sparse),
>                       DIV_ROUND_UP(out_bs->bl.request_alignment,
>                                    BDRV_SECTOR_SIZE));
>  
>  
> This is how we calculate the source alignments (it is possible to have several source files)
>  
> s.src_alignment[bs_i] = DIV_ROUND_UP(src_bs->bl.request_alignment,
>                                              BDRV_SECTOR_SIZE);
> if (!bdrv_get_info(src_bs, &bdi)) {
>     s.src_alignment[bs_i] = MAX(s.src_alignment[bs_i], bdi.cluster_size / BDRV_SECTOR_SIZE);
> }
> 
> 
> The bl.request_alignment comment mentions that it must be power of 2,
> and cluster sizes are also very likely to be power of 2 in all drivers
> we support. An assert for s.src_alignment won't hurt though.
> 
>  
> Note though that we don't really read the discard alignment.
> We have max_pdiscard, and pdiscard_alignment, but max_pdiscard
> is only used to split 'too large' discard requests, and pdiscard_alignment
> is advisory and used only in a couple of places.
> Neither are set by file-posix.
>  
> We do have request_alignment, which file-posix tries to align to the logical block
> size which is still often 512 for backward compatibility on many devices (even nvme)
>  
> Now both source and destination alignments in qemu-img convert are based on request_aligment
> and on min_sparse (which is by default 4K, controlled by qemu-img -S parameter
> (which otherwise controls the minimum number of blocks to be zero, to consider
> discarding them in convert)
>  
> 
> This means that there is no guarantee to have 4K alignment, and besides,
> with sufficiently fragmented source file, the bdrv_block_status_above
> can return arbitrary short and unaligned extents which can't be aligned, 
> thus as I said this patch alone can't guarantee that we won't have 
> write and discard sharing the same page.
>  
> Another thing that can be discussed is why is_allocated_sectors was patched
> to convert short discards to writes. Probably because underlying hardware
> ignores them or something? In theory we should detect this and fail
> back to regular zeroing in this case.
> Again though, while in case of converting an empty file, this is the only
> source of writes, and eliminating it, also 'fixes' this case, with sufficiently
> fragmented source file we can even without this code get a write and discard
> sharing a page.
> 
> 
> Best regards,
> 	Maxim Levitsky
> 
> > However, there ARE devices in practice that have advertised a
> > non-power-of-2 discard granularity, such as 15MiB (see commits 430b26a8,
> > 63188c24).  Which means you probably don't want to assert power-of-2,
> > and in turn need to worry about least common multiple.
> > 

Any update on this patch?

Best regards,
	Maxim Levitsky


