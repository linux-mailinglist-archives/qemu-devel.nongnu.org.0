Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA130C40D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:40:15 +0100 (CET)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xmo-0005n9-BW
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6xk3-0003Sg-R4
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:37:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l6xjw-0001LV-B5
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612280235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P0uRb4QSgR3WFNjFl4KnyfxwV5bRrkssg7vSVj9PWH4=;
 b=dS0K2gXafzj3E+ayxDpbKeot2gSATLgnOyNvpNajU96yW4TJpVxDvX1MCfHqfpllYub1iW
 Erm4eHdl/FTlMXVVrBsw+Ov2a1sXwbY3qkzAAXo8UW3JL9/7vTDe4z+vco3Ofvv/7zikSz
 Nlw7jCk7ocj0DRLKdk20DCb1dpl81+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-r-ObEFbvPDKAL8ESYva1cw-1; Tue, 02 Feb 2021 10:37:13 -0500
X-MC-Unique: r-ObEFbvPDKAL8ESYva1cw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AEE315723
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 15:37:12 +0000 (UTC)
Received: from work-vm (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E96A5C5FC;
 Tue,  2 Feb 2021 15:37:04 +0000 (UTC)
Date: Tue, 2 Feb 2021 15:37:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 3/4] migration: Fix cache_init()'s "Failed to
 allocate" error messages
Message-ID: <20210202153702.GF3030@work-vm>
References: <20210202141734.2488076-1-armbru@redhat.com>
 <20210202141734.2488076-4-armbru@redhat.com>
 <00a237bc-0d15-a27b-cd2f-e8dad4cccab3@redhat.com>
 <87wnvq4hsc.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87wnvq4hsc.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
> > On 2/2/21 8:17 AM, Markus Armbruster wrote:
> >> cache_init() attempts to handle allocation failure..  The two error
> >
> > The double . looks odd.
> 
> Typo.  Perhaps the maintainer can take care of it.

Yeh I can try and remember to take it out on the merge.

> >> messages are garbage, as untested error messages commonly are:
> >> 
> >>     Parameter 'cache size' expects Failed to allocate cache
> >>     Parameter 'cache size' expects Failed to allocate page cache
> >> 
> >> Fix them to just
> >> 
> >>     Failed to allocate cache
> >>     Failed to allocate page cache
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> ---
> >>  migration/page_cache.c | 6 ++----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


