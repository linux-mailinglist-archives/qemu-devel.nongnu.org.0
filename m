Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FECA20739C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 14:43:59 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo4kw-0004Sk-LC
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 08:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jo4js-0003wk-Kh
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:42:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47432
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jo4jr-0008QK-73
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593002570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=heckdSvscLlWFLOgaeuphmvQ8XCTcmZk5n5LB93sWXk=;
 b=ZKFjoN3ZSu85cLs8ztxERnPN9zx6xDfHqUd3OWHi5Cmfrh9U8F1yEjVNvAvD5gKwVeEwO7
 6WaORZ2QqyYPAXEZ6jh2RDgIfTXupbvPXs74PmnC8/xGtU+dqaoLFf1m81a8jcUgw0WpPe
 kQcne3Nhl5R4uMvwTlQRvZPjebR/9Z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Epz4UNt1NJOF5YMYhdGwnw-1; Wed, 24 Jun 2020 08:42:47 -0400
X-MC-Unique: Epz4UNt1NJOF5YMYhdGwnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE6F280400B;
 Wed, 24 Jun 2020 12:42:45 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45BC101E247;
 Wed, 24 Jun 2020 12:42:44 +0000 (UTC)
Date: Wed, 24 Jun 2020 14:42:43 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/2] vvfat: Fix array_remove_slice()
Message-ID: <20200624124243.GC9253@linux.fritz.box>
References: <20200623175534.38286-1-kwolf@redhat.com>
 <20200623175534.38286-3-kwolf@redhat.com>
 <ca89d6ae-734f-66b0-3862-e41ab4ce6455@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ca89d6ae-734f-66b0-3862-e41ab4ce6455@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: nhuck15@gmail.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.06.2020 um 20:30 hat Eric Blake geschrieben:
> On 6/23/20 12:55 PM, Kevin Wolf wrote:
> > array_remove_slice() calls array_roll() with array->next - 1 as the
> > destination index. This is only correct for count == 1, otherwise we're
> > writing past the end of the array. array->next - count would be correct.
> > 
> > However, this is the only place ever calling array_roll(), so this
> > rather complicated operation isn't even necessary.
> > 
> > Fix the problem and simplify the code by replacing it with a single
> > memmove() call. array_roll() can now be removed.
> > 
> > Reported-by: Nathan Huckleberry <nhuck15@gmail.com>
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   block/vvfat.c | 42 +++++-------------------------------------
> >   1 file changed, 5 insertions(+), 37 deletions(-)
> > 
> > diff --git a/block/vvfat.c b/block/vvfat.c
> > index 2fab371258..d6e464c595 100644
> > --- a/block/vvfat.c
> > +++ b/block/vvfat.c
> > @@ -140,48 +140,16 @@ static inline void* array_insert(array_t* array,unsigned int index,unsigned int
> >       return array->pointer+index*array->item_size;
> >   }
> > -/* this performs a "roll", so that the element which was at index_from becomes
> > - * index_to, but the order of all other elements is preserved. */
> > -static inline int array_roll(array_t* array,int index_to,int index_from,int count)
> 
> If I understand the intent from just the comment, the old code would take a
> directory listing of six files:
> 
> ABCDEF
> 
> and on the request to delete file C, would produce:
> 
> ABFDE
> 
> by moving just F, instead of all of DEF.

I think what the old code did was actually moving C, not F, so you get:

ABDEFC

And then you reduce the array size by one so that C isn't visible any
more. My code preserves this behaviour, except that the invisible final
element is a copy of F instead C now.

Kevin


