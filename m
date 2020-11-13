Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A481F2B20A3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 17:41:01 +0100 (CET)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdc8C-0003rX-Nq
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 11:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdc6o-0003OV-G9
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:39:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdc6m-0007DR-If
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605285570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=46jMfmB0N5ftnRhUDg83vBFQF19Fw3wf5bBGMuou4LI=;
 b=eW5Nf5Jo/grpBMJ4nEpl33iVJPS92BQTBTPWaVy2MZRoJKFvBTeP/pO2Z+5R7skeZhxo67
 AcEzIkD3OerOBy5X31LEocI4eCoVIgPRFlrJZtviLmA/FGREQgL/KjtA2edACg8lfrKMi4
 jnuadRy3SHAkvaMmbtQyTdM+anqO5cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-kYMYjI4sORKbqdzsy_vW2Q-1; Fri, 13 Nov 2020 11:39:27 -0500
X-MC-Unique: kYMYjI4sORKbqdzsy_vW2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5F741009E3E
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 16:39:26 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E562B55785;
 Fri, 13 Nov 2020 16:39:25 +0000 (UTC)
Date: Fri, 13 Nov 2020 16:39:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/6] migration: Check xbzrle-cache-size more carefully
Message-ID: <20201113163923.GR3251@work-vm>
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-5-armbru@redhat.com>
 <20201113105940.GC3251@work-vm> <87pn4hfkgc.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87pn4hfkgc.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> migrate-set-parameters passes the size to xbzrle_cache_resize().
> >> xbzrle_cache_resize() checks it fits into size_t before it passes it
> >> on to cache_init().  cache_init() checks it is a power of two no
> >> smaller than @page_size.
> >> 
> >> cache_init() is also called from xbzrle_init(), bypassing
> >> xbzrle_cache_resize()'s check.
> >> 
> >> Drop xbzrle_cache_resize()'s check, and check more carefully in
> >> cache_init().
> >> 
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  migration/page_cache.c | 15 ++++-----------
> >>  migration/ram.c        |  7 -------
> >>  2 files changed, 4 insertions(+), 18 deletions(-)
> >> 
> >> diff --git a/migration/page_cache.c b/migration/page_cache.c
> >> index b384f265fb..e07f4ad1dc 100644
> >> --- a/migration/page_cache.c
> >> +++ b/migration/page_cache.c
> >> @@ -41,17 +41,10 @@ struct PageCache {
> >>  PageCache *cache_init(uint64_t new_size, size_t page_size, Error **errp)
> >>  {
> >>      int64_t i;
> >> -    size_t num_pages = new_size / page_size;
> >> +    uint64_t num_pages = new_size / page_size;
> >>      PageCache *cache;
> >>  
> >> -    if (new_size < page_size) {
> >> -        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
> >> -                   "is smaller than one target page size");
> >> -        return NULL;
> >> -    }
> >> -
> >> -    /* round down to the nearest power of 2 */
> >> -    if (!is_power_of_2(num_pages)) {
> >> +    if (num_pages != (size_t)num_pages || !is_power_of_2(num_pages)) {
> >>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cache size",
> >>                     "is not a power of two number of pages");
> >
> > That error message is now wrong since it includes a whole bunch of
> > reasons.
> 
> We could argue about "wrong", but I readily concedede it needs
> improvement:
> 
>     Parameter 'cache size' expects is not a power of two number of pages
> 
> is crap.  I fixed similar crap in my "[PATCH 00/10] Chipping away at
> qerror.h"

The wording may be crap, but it does at least talk about the correct
problem.

> but missed this one.
> 
> What about
> 
>     Parameter 'xbzrle-cache-size' expects a power of two larger than $page_size

Yes, although you've also put a too-large check in ther=e with that
size_t cast.

> ?
> 
> > Also, the comparison is now on the divided num_pages, it's not that
> > obvious to me that checking the num_pages makes sense in acomparison to
> > checking the actual cache size.
> 
> Would you accept
> 
>     if (!is_power_of_2(new_size)
>         || !num_pages || num_pages != (size_t)num_pages) {

Well, why is it not  || new_size != (size_t)new_size   like in the
original?

> ?
> 
> If not, please propose something you like better.
> 
> > (Arguably the check should also happen in migrate_params_test_apply)
> 
> Feels like one bridge too far for this patch.

Sure.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


