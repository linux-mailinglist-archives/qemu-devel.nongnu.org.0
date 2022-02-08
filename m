Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B24ADC39
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:17:57 +0100 (CET)
Received: from localhost ([::1]:48232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSFg-0008II-2k
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:17:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nHQEq-0004pR-OV
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:09:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nHQEm-0000Z2-3R
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644325729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3ABLpRQN5miU1fDjcMJCf3vM/oOO/3WZwgiJQGz9q+Y=;
 b=jLm3CS9wddj/grVKzr1wHigwBx++leay7GAZkcTCPLoHMvEYODh3Fd/nne0+Qo6S0R+ZeJ
 fT3sk/3onrJ6CeHrFWyndXiFp0oHgvM6695ha83npeEwd5OKRtJNaeMNGCYWV3nSJhTcPA
 Fo/ELuH5T6DfB+4Yfds+q/hjHsgIro8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-0ZUm7QZ6NreEJqP6in3szw-1; Tue, 08 Feb 2022 08:08:42 -0500
X-MC-Unique: 0ZUm7QZ6NreEJqP6in3szw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758BD85EE62;
 Tue,  8 Feb 2022 13:08:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A1776E214;
 Tue,  8 Feb 2022 13:08:13 +0000 (UTC)
Date: Tue, 8 Feb 2022 14:08:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 00/33] block layer: split block APIs in global state
 and I/O
Message-ID: <YgJrPL7k+D1t1Ubm@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <YgFlQrmGXcOO9P/4@redhat.com>
 <1f3d2562-c355-4295-77b5-088d2ed49023@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1f3d2562-c355-4295-77b5-088d2ed49023@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
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
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.2022 um 12:42 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> On 07/02/2022 19:30, Kevin Wolf wrote:
> > Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
> >> Each function in the GS API will have an assertion, checking
> >> that it is always running under BQL.
> >> I/O functions are instead thread safe (or so should be), meaning
> >> that they *can* run under BQL, but also in an iothread in another
> >> AioContext. Therefore they do not provide any assertion, and
> >> need to be audited manually to verify the correctness.
> > 
> > I wonder if we could actually do something to catch at least some kinds
> > of bugs. The first conclusion from thinking about it is that we probably
> > shouldn't open-code assert(qemu_in_main_thread()) everywhere, but have a
> > macro or inline function for each category to be called in each function.
> > 
> > So an IO_CODE() macro could increase a counter in the coroutine object
> > (that is decreased again at the end of the function with g_auto), and
> > then GLOBAL_STATE_CODE() could not only assert that we're holding the
> > BQL, but also that the counter is still 0, i.e. it is not (indirectly)
> > called by an I/O function.
> > 
> > We may want to enable this only in debug builds, but maybe still worth a
> > thought anyway?
> 
> I don't understand what is the point of the counter, do you want to use
> it as a boolean flag?

It would only be checked as a boolean flag, but it needs to be a counter
because of nesting where e.g. one I/O function calls another I/O
function.

> Would a single counter work in a multi-threaded context? Shouldn't we
> have it per-thread? And why you increase it only in coroutines?

I don't mean increasing it only in coroutine context, but having a
per-coroutine counter, including the leader coroutine which exists for
non-coroutine context in every thread.

Kevin


