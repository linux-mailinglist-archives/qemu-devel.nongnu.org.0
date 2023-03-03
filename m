Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7996AA413
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 23:19:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYDjE-0006Mf-MU; Fri, 03 Mar 2023 17:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYDjC-0006LZ-Ip
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pYDj8-0001MJ-9B
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 17:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677881866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4jtj7LRv49ez7NJ+K9IudD5hglJEn1EJeRaTSAYJlx0=;
 b=jRYlpnauTuZ3UVeGaXi9s9QJStNj3UpnteiNu/Iuc3TgZdq80g0SXHhiNgyWV5LjA4FZBl
 Yi5tAORh19y8/oYlKoW1R/OyfZLv9FT+x8MuQ+Lm6582CtpF108W4yCb0tumodsyGuqLuu
 N1XCCNWVNUI2LU4uhOfu8kSqOWwX2IE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-qdS-Y_Q_P8GepLiNJMfLuQ-1; Fri, 03 Mar 2023 17:17:43 -0500
X-MC-Unique: qdS-Y_Q_P8GepLiNJMfLuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6DB8185A78B;
 Fri,  3 Mar 2023 22:17:42 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 431092166B26;
 Fri,  3 Mar 2023 22:17:42 +0000 (UTC)
Date: Fri, 3 Mar 2023 16:17:40 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com
Subject: Re: [PATCH v2 1/6] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Message-ID: <20230303221740.pdwc6jtozstntih7@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-2-eblake@redhat.com>
 <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f350f0ec-34b1-dca7-5bb0-344a6832f327@yandex-team.ru>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Dec 16, 2022 at 10:32:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 11/15/22 01:46, Eric Blake wrote:
> > The spec was silent on how many extents a server could reply with.
> > However, both qemu and nbdkit (the two server implementations known to
> > have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
> > cap, and will truncate the amount of extents in a reply to avoid
> > sending a client a reply so large that the client would treat it as a
> > denial of service attack.  Clients currently have no way during
> > negotiation to request such a limit of the server, so it is easier to
> > just document this as a restriction on viable server implementations
> > than to add yet another round of handshaking.  Also, mentioning
> > amplification effects is worthwhile.
> > 
> > When qemu first implemented NBD_CMD_BLOCK_STATUS for the
> > base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
> > as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
> > responded with more than one extent.  Later, when adding its
> > qemu:dirty-bitmap:XYZ context extension (qemu commit 3d068aff16, Jun
> > 2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
> > applied to base:allocation once qemu started sending multiple extents
> > for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
> > extents are never smaller than 512 bytes (other than an exception at
> > the end of a file whose size is not aligned to 512), but even so, a
> > request for just under 4G of block status could produce 8M extents,
> > resulting in a reply of 64M if it were not capped smaller.
> > 
> > When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
> > Mar 2019), it did not impose any restriction on the number of extents
> > in the reply chunk.  But because it allows extents as small as one
> > byte, it is easy to write a server that can amplify a client's request
> > of status over 1M of the image into a reply over 8M in size, and it
> > was very easy to demonstrate that a hard cap was needed to avoid
> > crashing clients or otherwise killing the connection (a bad server
> > impacting the client negatively).  So nbdkit enforced a bound of 1M
> > extents (8M+4 bytes, nbdkit commit 6e0dc839ea, Jun 2019).  [Unrelated
> > to this patch, but worth noting for history: nbdkit's situation also
> > has to deal with the fact that it is designed for plugin server
> > implementations; and not capping the number of extents in a reply also
> > posed a problem to nbdkit as the server, where a plugin could exhaust
> > memory and kill the server, unrelated to any size constraints enforced
> > by a client.]
> > 
> > Since the limit chosen by these two implementations is different, and
> > since nbdkit has versions that were not limited, add this as a SHOULD
> > NOT instead of MUST NOT constraint on servers implementing block
> > status.  It does not matter that qemu picked a smaller limit that it
> > truncates to, since we have already documented that the server may
> > truncate for other reasons (such as it being inefficient to collect
> > that many extents in the first place).  But documenting the limit now
> > becomes even more important in the face of a future addition of 64-bit
> > requests, where a client's request is no longer bounded to 4G and
> > could thereby produce even more than 8M extents for the corner case
> > when every 512 bytes is a new extent, if it were not for this
> > recommendation.
> 
> s-o-b line missed.

I'm not sure if the NBD project has a strict policy on including one,
but I don't mind adding it.

> 
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> -- 
> Best regards,
> Vladimir
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


