Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD463BEA82
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:16:27 +0200 (CEST)
Received: from localhost ([::1]:33804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19Hm-0002Ne-Qa
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m19Cg-0003zs-AO
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m19Cb-0007dt-6Q
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0m5lJuaoSCGNbF3I3vXvrsB1NZ7O+DJtEdGruxHpop0=;
 b=cw2O823Ff85zlkgi4LP+lulP4vyi+VBoRrwVmnvZHL5y4aIvSHhkIY/UNTPC6LNk+Lc8sS
 koiMv/zcQqfefXx047ar3eOyzUCQxUj2c+q/Wsz3x5NfoTDNigxrm3s+RnUsguygHYIGQC
 6qIH9+BhTfY4HTjl/yA66dSgad+1Im0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-JHzpQuyCNSaZAVuPhd20zQ-1; Wed, 07 Jul 2021 11:11:01 -0400
X-MC-Unique: JHzpQuyCNSaZAVuPhd20zQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66B9DA40C1;
 Wed,  7 Jul 2021 15:11:00 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B69EA84A01;
 Wed,  7 Jul 2021 15:10:59 +0000 (UTC)
Date: Wed, 7 Jul 2021 10:10:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 2/2] qemu-img: Make unallocated part of backing chain
 obvious in map
Message-ID: <20210707151057.n3vpooy4nb3diint@redhat.com>
References: <20210701190655.2131223-1-eblake@redhat.com>
 <20210701190655.2131223-3-eblake@redhat.com>
 <481dc6cf-a353-b4a0-732c-b758f8750ff6@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <481dc6cf-a353-b4a0-732c-b758f8750ff6@virtuozzo.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 nsoffer@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 03, 2021 at 10:25:28AM +0300, Vladimir Sementsov-Ogievskiy wrote:
...
> > An obvious solution is to make 'qemu-img map --output=json' add an
> > additional "present":false designation to any cluster lacking an
> > allocation anywhere in the chain, without any change to the "depth"
> > parameter to avoid breaking existing clients.  The iotests have
> > several examples where this distinction demonstrates the additional
> > accuracy.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>

> > +++ b/docs/tools/qemu-img.rst
> > @@ -597,6 +597,9 @@ Command description:
> >       if false, the sectors are either unallocated or stored as optimized
> >       all-zero clusters);
> >     - whether the data is known to read as zero (boolean field ``zero``);
> > +  - whether the data is actually present (boolean field ``present``);
> > +    if false, rebasing the backing chain onto a deeper file would pick
> > +    up data from the deeper file;
> 
> Preexisting, but rather strange style of documentation, when described option doesn't go first in the paragraph..

Yeah.  I'll send a followup email with a rewording of those paragraphs
for consideration.

> > +++ b/qemu-img.c
> > @@ -2980,8 +2980,9 @@ static int dump_map_entry(OutputFormat output_format, MapEntry *e,
> >           break;
> >       case OFORMAT_JSON:
> >           printf("{ \"start\": %"PRId64", \"length\": %"PRId64","
> > -               " \"depth\": %"PRId64", \"zero\": %s, \"data\": %s",
> > -               e->start, e->length, e->depth,
> > +               " \"depth\": %"PRId64", \"present\": %s, \"zero\": %s,"
> > +               "\"data\": %s", e->start, e->length, e->depth,
> > +               e->present ? "true" : "false",
> 
> Didn't you want to put present at the end? Still, this shouldn't be significant. And it make sense to keep present, zero and data together.

I wanted it before anything optional, which "offset" is, so it already
can't be at the end.  If I understood Nir correctly, it was more
important to always be present (it's easy to write a parser that
searches for terms in the same position, and tolerates a missing term
from an older verseion, but harder to parse a term that might or might
not be present).

> 
> You missied a whitespace after '"zero": %s,', which is obvious from further test diff hunks.
> 
> With it fixed:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks for catching that.  I've updated that, and will queue through
my NBD tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


