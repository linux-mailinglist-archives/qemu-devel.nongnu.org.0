Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601CF4A78CF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:39:57 +0100 (CET)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLTv-0002DE-Vr
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:39:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFKLr-0002XW-L9
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:27:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFKLn-00066w-DD
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643826445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f5qYFPMjtYkAUE9Qa0NU8b8mGdM0TlpjBtYLXIva0Jw=;
 b=iKorghC/aBr0w/uAii9hfV01FajsmkTlx/p2ynWovLQAjFH5yVMlLBBGTZWjgXcbLAngf3
 gq1cwsVuqSOPQCFn1NmWOMGZEfK4gsSS8vyYBZAbjA96nBl+DsVW0Ck+FSG6LVG+RdF9aa
 OMb9IIqZJ4OI6C3XsRJSylSy5KXEd5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-p1DrynA8MKy5aB4OtFIs0g-1; Wed, 02 Feb 2022 13:27:25 -0500
X-MC-Unique: p1DrynA8MKy5aB4OtFIs0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 671EC18252A2;
 Wed,  2 Feb 2022 18:27:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7581B77465;
 Wed,  2 Feb 2022 18:27:05 +0000 (UTC)
Date: Wed, 2 Feb 2022 19:27:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 21/33] block: move BQL logic of
 bdrv_co_invalidate_cache in bdrv_activate
Message-ID: <YfrM93kYJq4Eh7ED@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-22-eesposit@redhat.com>
 <YfJ79zaea6yFFh4w@redhat.com>
 <dbb3943a-ebb7-5979-8199-8808fa6953b7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dbb3943a-ebb7-5979-8199-8808fa6953b7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.02.2022 um 18:27 hat Paolo Bonzini geschrieben:
> On 1/27/22 12:03, Kevin Wolf wrote:
> > > +int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
> > > +{
> > > +    Error *local_err = NULL;
> > > +
> > > +    if (bs->drv->bdrv_co_invalidate_cache) {
> > > +        bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
> > > +        if (local_err) {
> > > +            bs->open_flags |= BDRV_O_INACTIVE;
> > 
> > This doesn't feel like the right place. The flag is cleared by the
> > caller, so it should also be set again on failure by the caller and not
> > by this function.
> > 
> > What bdrv_co_invalidate_cache() could do is assert that BDRV_O_INACTIVE
> > is cleared when it's called.
> 
> Do you think this would be handled more easily into its own series?
> 
> In general, the work in this series is more incremental than its size
> suggests.  Perhaps it should be flushed out in smaller pieces.

Smaller pieces are always easier to handle, so if things make sense
independently, splitting them off is usually a good idea.

Kevin


