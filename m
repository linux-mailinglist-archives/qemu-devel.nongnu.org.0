Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0030D3B74B1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:49:41 +0200 (CEST)
Received: from localhost ([::1]:44938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyF3P-0000rE-Nh
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lyEun-0003uU-MH
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lyEul-0008AX-TH
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624977638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JjDIMLLsBfABKh/xX/phtl52HKaLwAGax+urcAPocWs=;
 b=Lfe0ejyl7ExWzWQEvC9c34mP8SfKGh6LIDwYZQ0upuS9dX6Csc/M+LOcsOhhtx/mi1NtXA
 V2139UBhMW3YP2I24uK/IYlL8OpK1YEBHGGZsTYXB+XUmOr5lqmhlcYD4WY5DqRdVetVv5
 IPIMraKlvafxdAPqvXkEWz/tZrnqoEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-7wP5G6TbOhaktPPgRR8fyw-1; Tue, 29 Jun 2021 10:40:35 -0400
X-MC-Unique: 7wP5G6TbOhaktPPgRR8fyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ECB6804143;
 Tue, 29 Jun 2021 14:40:34 +0000 (UTC)
Received: from redhat.com (ovpn-114-170.ams2.redhat.com [10.36.114.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF62E18A77;
 Tue, 29 Jun 2021 14:40:32 +0000 (UTC)
Date: Tue, 29 Jun 2021 16:40:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 2/1] qemu-img: Add "backing":true to unallocated map
 segments
Message-ID: <YNsw3wRF2Zo+w9k1@redhat.com>
References: <20210611140157.1366738-1-eblake@redhat.com>
 <20210611190316.1424729-1-eblake@redhat.com>
 <YNID9rbo+RdwklCf@redhat.com>
 <CAMRbyyt5qsVan8dOF=HHvqqo92zwTBRucnfA_UEOOmRMqiyaAQ@mail.gmail.com>
 <YNL3kpqnhi15glTC@redhat.com>
 <CAMRbyyuik1Q=WMSpePz6T+0bEnau0CFWbA4VA9GBf6+mrCZS3Q@mail.gmail.com>
 <YNNbg6jU2dD8VNiU@redhat.com>
 <20210628174216.25ybfzmtbiymgd6s@redhat.com>
 <a22c25e6-e44a-7be6-f173-ddff8da7551b@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <a22c25e6-e44a-7be6-f173-ddff8da7551b@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: "open list:Block layer core" <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.06.2021 um 09:23 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 28.06.2021 20:42, Eric Blake wrote:
> > On Wed, Jun 23, 2021 at 06:04:19PM +0200, Kevin Wolf wrote:
> > > > This is fine, but it means that this flag will present in all ranges,
> > > > instead of only in unallocated ranges (what this patch is doing).
> > > 
> > > An argument for always having the flag would be that it's probably
> > > useful for a tool to know whether a given block is actually absent or
> > > whether it's just running an old qemu-img.
> > > 
> > > If we didn't care about this, I would still define the actual value, but
> > > also document a default.
> > 
> > So to summarize, it looks like my v3 will have the best chance of
> > approval if I go with always outputting the new field (instead of only
> > on one of its two boolean values), and put it at the end of the JSON
> > output.  It also looks like we have consensus on spelling the new
> > field "present":true for data found in the backing chain, and
> > "present":false for places where we would defer to another file if a
> > backing file is later added.
> > 
> 
> I didn't follow the discussion carefully, but that sounds good to me.

To me, too.

> What's the decision about patch 1?

I think we won't need patch 1 (and the potential backwards compatibility
problems it would introduce) when we have this one.

Kevin


