Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379A50B7DC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:04:46 +0200 (CEST)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsxo-000646-9U
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhsey-0003vs-Fl
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:45:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhses-0006Tn-8X
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650631509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UitfYTi9zMjVnfJ0quB6Jlhd/NW+DmuYzWYUkEcFa4M=;
 b=Qsh9VBDCP5NsSx/3ees87w8TviwVzHEeDGR/k6UabRxRFmymSPjxzX0p1omJdZKGmmSOvq
 +niy7BN3xFnihaxKKclqNLmZpo1WHQAz5J2d7WqtLJLI9BgUjZpCy8mw2kqLOYx8e7VKjz
 l8rnZYG39oevQXx4s4zDTKblkIU3FC8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-FneHtU1KOQaUJcjSx1GZPg-1; Fri, 22 Apr 2022 08:45:04 -0400
X-MC-Unique: FneHtU1KOQaUJcjSx1GZPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59F963820F6D;
 Fri, 22 Apr 2022 12:45:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BCF3416171;
 Fri, 22 Apr 2022 12:45:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0E04221E6A1F; Fri, 22 Apr 2022 14:45:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v4 3/3] util/event-loop-base: Introduce options to set
 the thread pool size
References: <20220401093523.873508-1-nsaenzju@redhat.com>
 <20220401093523.873508-4-nsaenzju@redhat.com>
 <87ilr1z7vg.fsf@pond.sub.org>
 <5b30180257e769d17ae429b6b5bc0d65a78c30f3.camel@redhat.com>
Date: Fri, 22 Apr 2022 14:45:03 +0200
In-Reply-To: <5b30180257e769d17ae429b6b5bc0d65a78c30f3.camel@redhat.com>
 (Nicolas Saenz Julienne's message of "Fri, 22 Apr 2022 13:51:34
 +0200")
Message-ID: <87ee1pxp68.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, eduardo@habkost.net, hreitz@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:

> On Fri, 2022-04-22 at 13:15 +0200, Markus Armbruster wrote:
>> Nicolas Saenz Julienne <nsaenzju@redhat.com> writes:
>> 
>> > The thread pool regulates itself: when idle, it kills threads until
>> > empty, when in demand, it creates new threads until full. This behaviour
>> > doesn't play well with latency sensitive workloads where the price of
>> > creating a new thread is too high. For example, when paired with qemu's
>> > '-mlock', or using safety features like SafeStack, creating a new thread
>> > has been measured take multiple milliseconds.
>> > 
>> > In order to mitigate this let's introduce a new 'EventLoopBase'
>> > property to set the thread pool size. The threads will be created during
>> > the pool's initialization or upon updating the property's value, remain
>> > available during its lifetime regardless of demand, and destroyed upon
>> > freeing it. A properly characterized workload will then be able to
>> > configure the pool to avoid any latency spikes.
>> > 
>> > Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
>> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> 
>> [...]
>> 
>> > diff --git a/qapi/qom.json b/qapi/qom.json
>> > index e5f31c4469..06b8c3d10b 100644
>> > --- a/qapi/qom.json
>> > +++ b/qapi/qom.json
>> > @@ -506,9 +506,17 @@
>> >  #
>> >  # @aio-max-batch: maximum number of requests in a batch for the AIO engine,
>> >  #                 0 means that the engine will use its default.
>> > +#
>> > +# @thread-pool-min: minimum number of threads readily available in the thread
>> > +#                   pool (default:0, since 7.1)
>> 
>> What do you mean by "readily available in the thread pool"?
>
> How about "minimum number of threads reserved in the thread pool"?

Works for me, thanks!

>> > +#
>> > +# @thread-pool-max: maximum number of threads the thread pool can contain
>> > +#                   (default:64, since 7.1)
>> >  ##
>> 
>> If you add "Since: 7.1" in the previous patch, then the "since 7.1" here
>> need to go.
>
> Noted.


