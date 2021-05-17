Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE63829B0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:19:42 +0200 (CEST)
Received: from localhost ([::1]:41174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaLd-00032Z-FX
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lia2q-00021S-JR
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lia2j-0006ND-7L
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621245607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MVL+ek65z1i4YeP9AcsZBlbIjDCrno+XZDU/rAKvDHU=;
 b=csijqQ8MpmQfEsMK7Rrb3kgHTVJgYBncZSEDvpw+eANPBxK/fvF5MY1DgN5mJgVoAqHZ8R
 FJv9MxaFElsFau8zkIaT0Hg5ZVADWvKhOZZb/JYEz9gjOHscIyjDbyFfZ3c4Uhq0PYO8T2
 sIlzLUXXCwyQMqWQB2m+gFH79SqOsnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-aq0uyQptN6aoriPEWu1obQ-1; Mon, 17 May 2021 06:00:04 -0400
X-MC-Unique: aq0uyQptN6aoriPEWu1obQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D49C10082E1;
 Mon, 17 May 2021 10:00:03 +0000 (UTC)
Received: from work-vm (ovpn-114-233.ams2.redhat.com [10.36.114.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A460429692;
 Mon, 17 May 2021 10:00:02 +0000 (UTC)
Date: Mon, 17 May 2021 11:00:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
Subject: Re: [PATCH] migration/rdma: Fix cm_event used before being initialized
Message-ID: <YKI+oJBc1ZT1AlC+@work-vm>
References: <20210513113750.22970-1-lizhijian@cn.fujitsu.com>
 <YJ1ew79TeJ4pPz1K@work-vm>
 <1496057b-6a44-71a3-ca16-97c4d9e9650a@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1496057b-6a44-71a3-ca16-97c4d9e9650a@fujitsu.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* lizhijian@fujitsu.com (lizhijian@fujitsu.com) wrote:
> 
> 
> On 14/05/2021 01.15, Dr. David Alan Gilbert wrote:
> > * Li Zhijian (lizhijian@cn.fujitsu.com) wrote:
> >> A segmentation fault was triggered when i try to abort a postcopy + rdma
> >> migration.
> >>
> >> since rdma_ack_cm_event releases a uninitialized cm_event in thise case.
> >>
> >> like below:
> >> 2496     ret = rdma_get_cm_event(rdma->channel, &cm_event);
> >> 2497     if (ret) {
> >> 2498         perror("rdma_get_cm_event after rdma_connect");
> >> 2499         ERROR(errp, "connecting to destination!");
> >> 2500         rdma_ack_cm_event(cm_event); <<<< cause segmentation fault
> >> 2501         goto err_rdma_source_connect;
> >> 2502     }
> >>
> >> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> > OK, that's an easy fix then; but I wonder if we should perhaps remove
> > that rdma_ack_cm_event, if it's the get_cm_event that's failed?
> 
> I also wondered, i checked the man page get_cm_event(3) which has not documented
> 
> and checked some rdma examples, some of them try to ack it[1],  but some not[2].

I think they're actually consistent:

> [1]: https://github.com/linux-rdma/rdma-core/blob/e381334c2915a5290565694947790d4aebaf2222/librdmacm/examples/mckey.c#L451

                ret = rdma_get_cm_event(test.channel, &event);
                if (!ret) {
                        ret = cma_handler(event->id, event);
                        rdma_ack_cm_event(event);
                }
Note it's '!ret' - so it's only doing the ack if the get_cm_event
succeeded.

> [2]: https://github.com/linux-rdma/rdma-core/blob/e381334c2915a5290565694947790d4aebaf2222/librdmacm/examples/mckey.c#L342

                ret = rdma_get_cm_event(test.channel, &event);
                if (ret) {
                        perror("rdma_get_cm_event");
                        break;
                }

that exits the loop (and skips the ack) in the (ret) - i.e.
only on error - no !

Dave


> Thanks
> 
> >
> > Still,
> >
> >
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> >> ---
> >>   migration/rdma.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/migration/rdma.c b/migration/rdma.c
> >> index 00eac34232..2dadb62aed 100644
> >> --- a/migration/rdma.c
> >> +++ b/migration/rdma.c
> >> @@ -2466,7 +2466,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
> >>                                             .private_data = &cap,
> >>                                             .private_data_len = sizeof(cap),
> >>                                           };
> >> -    struct rdma_cm_event *cm_event;
> >> +    struct rdma_cm_event *cm_event = NULL;
> >>       int ret;
> >>   
> >>       /*
> >> -- 
> >> 2.30.2
> >>
> >>
> >>
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


