Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D3622B78
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:23:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osk69-0001X1-Ns; Wed, 09 Nov 2022 07:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osk66-0001Ut-St
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osk62-0004gC-2t
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 07:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667996539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S4WIxkShsBo4VGB8MX8DueIkqaqkNxnMTUTLumNEkCA=;
 b=bJtn2lsPQmSL2qV+K3ZOWDtGHU2Mc5Uycb5WrJbySXxp7q+bMDihJYRC6ICSrcIaXYTO2p
 9LqJpSrzHI2A7pUkiphNCyX6taEjpjgqTJR8TOZT2yCc1njfyxNc8b0Qr+hoqGYXMhUAfn
 X2aEln5COyQixKyUu+j+JwO/Z6m/DK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-07txKwzBPSuZJ8KwTms9-Q-1; Wed, 09 Nov 2022 07:22:16 -0500
X-MC-Unique: 07txKwzBPSuZJ8KwTms9-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07825811E75;
 Wed,  9 Nov 2022 12:22:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD5F9141511E;
 Wed,  9 Nov 2022 12:22:14 +0000 (UTC)
Date: Wed, 9 Nov 2022 13:22:13 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/13] qed: Don't yield in bdrv_qed_co_drain_begin()
Message-ID: <Y2ubdQZkc9yDso+M@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-2-kwolf@redhat.com>
 <5ed80ab4-0272-e3b9-411c-0c95f8e52a43@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ed80ab4-0272-e3b9-411c-0c95f8e52a43@yandex-team.ru>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 09.11.2022 um 10:27 hat Vladimir Sementsov-Ogievskiy geschrieben:
> On 11/8/22 15:37, Kevin Wolf wrote:
> >       int ret;
> >       trace_qed_need_check_timer_cb(s);
> > @@ -310,9 +309,20 @@ static void coroutine_fn qed_need_check_timer_entry(void *opaque)
> >       (void) ret;
> >   }
> > +static void coroutine_fn qed_need_check_timer_entry(void *opaque)
> > +{
> > +    BDRVQEDState *s = opaque;
> > +
> > +    qed_need_check_timer(opaque);
> > +    bdrv_dec_in_flight(s->bs);
> 
> hmm, one question: don't we need aio_wait_kick() call here?

bdrv_dec_in_flight() already calls aio_wait_kick() internally, so any
places that use it don't need a separate aio_wait_kick().

Kevin


