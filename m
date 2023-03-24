Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A96C867F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 21:05:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfndW-0006R0-8c; Fri, 24 Mar 2023 16:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pfndS-0006Ot-MO
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 16:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pfndQ-00010A-R2
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 16:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679688214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7LgN31sKOjMfrZHM058NriMuoobm3RCow3VLp8Wz7uc=;
 b=NNf3ZW/Ydpm7dcydeLca3Ojc3zMxgTq5s6rSjoVjkbHcB4B1/33I0gOblsrEev1cIs7HOE
 bjN9ZcbdbSAVAZoXv9g9gImev+SuLI5OxMiGAhAoBcvXJ3pXzAsR7YyYGnR6zM+9yDfKJZ
 kYybrHRvzqE6pJj6Tq3uMpJO2oCOjsA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-W-mHyOWhNbqYxeMi5_8Rfg-1; Fri, 24 Mar 2023 16:03:31 -0400
X-MC-Unique: W-mHyOWhNbqYxeMi5_8Rfg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7648885C064;
 Fri, 24 Mar 2023 20:03:31 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 419A8492C3E;
 Fri, 24 Mar 2023 20:03:25 +0000 (UTC)
Date: Fri, 24 Mar 2023 15:03:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Florian Westphal <fw@strlen.de>
Cc: libguestfs@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 vsementsov@yandex-team.ru
Subject: Re: [Libguestfs] [PATCH 1/1] nbd/server: push pending frames after
 sending reply
Message-ID: <spo7scw4pvcloaoezcfdmssgg34unwqewoavs32tvaxuht3vns@4kjvbzlmuer5>
References: <20230324104720.2498-1-fw@strlen.de>
 <ervljl6tt35qenv3z5lrjbklxuwezjvqpbwghtdntddpwa3glb@czoajnfpuxaa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ervljl6tt35qenv3z5lrjbklxuwezjvqpbwghtdntddpwa3glb@czoajnfpuxaa>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 24, 2023 at 02:41:20PM -0500, Eric Blake wrote:
> On Fri, Mar 24, 2023 at 11:47:20AM +0100, Florian Westphal wrote:
> > qemu-nbd doesn't set TCP_NODELAY on the tcp socket.

Replying to myself, WHY aren't we setting TCP_NODELAY on the socket?

> 
> And surprisingly, qemu IS using corking on the client side:
> https://gitlab.com/qemu-project/qemu/-/blob/master/block/nbd.c#L525
> just not on the server side, before your patch.

Corking matters more when TCP_NODELAY is enabled.  The entire reason
Nagle's algorithm exists (and is default on unless you enable
TCP_NODELAY) is that the benefits of merging smaller piecemeal packets
into larger traffic is a lot easier to do in a common location for
code that isn't super-sensitive to latency and message boundaries.
But once you get to the point where corking or MSG_MORE makes a
difference, then it is obvious you know your message boundaries, and
will benefit from TCP_NODELAY, at the expense of potentially more
network traffic overhead.  One more code search, and I find that we
use TCP_NODELAY in all of:

qemu client: https://gitlab.com/qemu-project/qemu/-/blob/master/nbd/client-connection.c#L143
nbdkit: https://gitlab.com/nbdkit/nbdkit/-/blob/master/server/sockets.c#L430
libnbd: https://gitlab.com/nbdkit/libnbd/-/blob/master/generator/states-connect.c#L41

so I think we _should_ be calling qio_channel_set_delay(false) for
qemu-nbd as well.  That doesn't negate your patch, but rather argues
that we can go for even better performance with TCP_NODELAY also
turned on.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


