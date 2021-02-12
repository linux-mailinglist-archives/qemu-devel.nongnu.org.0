Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E65931A4D7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 19:58:23 +0100 (CET)
Received: from localhost ([::1]:59148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAde2-0000US-7P
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 13:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAdQi-0005OY-DP
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:44:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lAdQg-0005hM-8C
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613155472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7/IVn+Q21WLxNSSUmrkiv6gbr37zH2owC5JA6bstANo=;
 b=NhnBuk6oi4DTZ1N4T3Ti/WPMv9WeexWSxW9AykBHlgvA46zN26w1fH+wxgVemWIsB21TzX
 ZD9N6VgL2m9hJ2G6mjNzkT2/yf5F1ezXpmMI5abON1nkLtsoa0P9YbRDOggUr1GC5c+4TR
 hXr7vz2UUq8HfOFWCcS2VMx0VShCDhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-SpFoF--WOQ6GJcFwKKsdMQ-1; Fri, 12 Feb 2021 13:44:31 -0500
X-MC-Unique: SpFoF--WOQ6GJcFwKKsdMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22DBC8799F7;
 Fri, 12 Feb 2021 18:44:30 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2055C3E0;
 Fri, 12 Feb 2021 18:44:28 +0000 (UTC)
Date: Fri, 12 Feb 2021 19:44:25 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/3] migration: dirty-bitmap: Convert alias map inner
 members to BitmapMigrationBitmapAlias
Message-ID: <20210212184425.GA2875719@angien.pipo.sk>
References: <cover.1613150869.git.pkrempa@redhat.com>
 <fc5f27e1fe16cb75e08a248c2d938de3997b9bfb.1613150869.git.pkrempa@redhat.com>
 <5dd16c1d-bad1-a445-9dd6-ef2167e0c9ad@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5dd16c1d-bad1-a445-9dd6-ef2167e0c9ad@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 12:38:10 -0600, Eric Blake wrote:
> On 2/12/21 11:34 AM, Peter Krempa wrote:
> 
> Long subject line; if it's okay with you, I'd prefer to use:
> 
> migration: dirty-bitmap: Use struct for alias map inner members
> 
> > Currently the alias mapping hash stores just strings of the target
> > objects internally. In further patches we'll be adding another member
> > which will need to be stored in the map so pass a copy of the whole
> > BitmapMigrationBitmapAlias QAPI struct into the map.
> > 
> > Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> > ---
> >  migration/block-dirty-bitmap.c | 30 +++++++++++++++++++-----------
> >  1 file changed, 19 insertions(+), 11 deletions(-)
> > 
> > Note that there's a very long line but there doesn't seem to be a
> > sensible point where to break it.
> 
> In other words, the patchew warning can be ignored if I can't reformat
> the line.
> 
> > +++ b/migration/block-dirty-bitmap.c
> > @@ -75,6 +75,8 @@
> >  #include "qemu/id.h"
> >  #include "qapi/error.h"
> >  #include "qapi/qapi-commands-migration.h"
> > +#include "qapi/qapi-visit-migration.h"
> > +#include "qapi/clone-visitor.h"
> >  #include "trace.h"
> > 
> >  #define CHUNK_SIZE     (1 << 10)
> > @@ -263,8 +265,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
> >              node_map_to = bmna->node_name;
> >          }
> > 
> > -        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal,
> > -                                            g_free, g_free);
> > +        bitmaps_map = g_hash_table_new_full(g_str_hash, g_str_equal, g_free,
> > +                                            (GDestroyNotify) qapi_free_BitmapMigrationBitmapAlias);
> 
> A possible fix: declare a temporary variable of type GDestroyNotify, so
> that assigning the variable uses a shorter line, then use that variable
> here.
> 
> > @@ -312,7 +312,8 @@ static GHashTable *construct_alias_map(const BitmapMigrationNodeAliasList *bbm,
> >              }
> > 
> >              g_hash_table_insert(bitmaps_map,
> > -                                g_strdup(bmap_map_from), g_strdup(bmap_map_to));
> > +                                g_strdup(bmap_map_from),
> 
> This line could be wrapped with the previous, now.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> If you like, I can squash the following in before queuing.

Anything that gets the patches in :).

But honestly, nowadays 80 colums hard limit seems very prehistoric. I
understand that shorter lines are better but if you need to hack around
it, it IMO defeats the readability of the code anyways.


