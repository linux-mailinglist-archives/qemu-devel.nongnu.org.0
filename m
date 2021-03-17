Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8673233EFFB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:07:22 +0100 (CET)
Received: from localhost ([::1]:37072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUxN-0006FF-KF
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMUw9-0005VQ-1H
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:06:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMUw3-0001Fs-MD
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615982758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wqoYDe4u8tWAFuuGYUEttXqsfduj4CFsJtbCQ65xFQ=;
 b=L2RKV08nWCNmzvBR4EDyoM2aRmcVOJux4UG1oC+WKTbVFtyS2tQ8us/jSAQ4g6hKtjNeTD
 JD6mWUN1GSbMs/eCebAnyFlPtZSG0AyrZSnV1I5JLhmJ5H6WlB2tiBCzpwS+lsIXs9nT6v
 rKGPC+4P1qwX9rMLolSbcDeWwePIN6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-KEYksKQ_N7usbxbvQyCwsw-1; Wed, 17 Mar 2021 08:05:57 -0400
X-MC-Unique: KEYksKQ_N7usbxbvQyCwsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17D9C92516;
 Wed, 17 Mar 2021 12:05:32 +0000 (UTC)
Received: from work-vm (ovpn-114-138.ams2.redhat.com [10.36.114.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC0295D6A1;
 Wed, 17 Mar 2021 12:05:29 +0000 (UTC)
Date: Wed, 17 Mar 2021 12:05:27 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v4 1/2] migration/ram: Reduce unnecessary rate limiting
Message-ID: <YFHwh7bIr3Mua6Pe@work-vm>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
 <20210316125716.1243-2-jiangkunkun@huawei.com>
 <20210316213906.GF395976@xz-x1>
 <cbbe92e2-4ebf-476a-3733-8e1c7893702e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <cbbe92e2-4ebf-476a-3733-8e1c7893702e@huawei.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kunkun Jiang (jiangkunkun@huawei.com) wrote:
> Hi  Peter,
> 
> On 2021/3/17 5:39, Peter Xu wrote:
> > On Tue, Mar 16, 2021 at 08:57:15PM +0800, Kunkun Jiang wrote:
> > > When the host page is a huge page and something is sent in the
> > > current iteration, migration_rate_limit() should be executed.
> > > If not, it can be omitted.
> > > 
> > > Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> > > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> > > Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> > > ---
> > >   migration/ram.c | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index 72143da0ac..3eb5b0d7a7 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -2015,8 +2015,13 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
> > >           pages += tmppages;
> > >           pss->page++;
> > > -        /* Allow rate limiting to happen in the middle of huge pages */
> > > -        migration_rate_limit();
> > > +        /*
> > > +         * Allow rate limiting to happen in the middle of huge pages if
> > > +         * something is sent in the current iteration.
> > > +         */
> > > +        if (pagesize_bits > 1 && tmppages > 0) {
> > > +            migration_rate_limit();
> > > +        }
> > Sorry I'm still not a fan of this - I'd even prefer calling that once more just
> > to make sure it won't be forgotten to be called..  Not to say it's merely a noop.
> > 
> > I'll leave this to Dave..  Maybe I'm too harsh! :)
> > 
> You are very serious and meticulous. I like your character very much.😉
> This patch was used to reviewed by David. So, I want to know what
> his opinion is.
> 
> @David
> Hi David, what is your opinion on this patch?

Yes, I think this is OK;
  a) The qemu_file_rate_limit in the loop in ram_save_iterate still
     gets called, so that covers the 'pagesize_bits > 1' part of the if
  b) As soon as we send any part of the hugepage the 'tmppages > 0'
     triggers and we get the check back again.

So I guess this mostly helps the case where we have big huge pages
which are mostly not-dirty, and we spend a lot of time in
ram_save_host_page searching for the target page to send.



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Thanks,
> Kunkun Jiang
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


