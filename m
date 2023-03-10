Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97D6B5479
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:31:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1palFE-0007eA-K3; Fri, 10 Mar 2023 17:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1palFB-0007dw-EF
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:29:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1palF9-0007DD-3p
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678487381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w74jaqKNW+gdP11pf3R3Y02lv95BckV90e+m0K+/Afs=;
 b=cfPPIKztlHMO2OE6jER4asHUdN5XJH1P696IICOAIV8aPhr2gffmWQfn6KeyK+S7x4cQur
 Zn8XenSxcFAy0BYWk9DLbr+dM7EjOzB8xUsiMPxVjE2QG7RWpv9j7++15U3povz2psVgL4
 s5oIGS/PBvm8wrqbKRPZvsGT7WFk8kI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-mX4SJD4OOa-t12ja2hyZEw-1; Fri, 10 Mar 2023 17:29:38 -0500
X-MC-Unique: mX4SJD4OOa-t12ja2hyZEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99C5B800050;
 Fri, 10 Mar 2023 22:29:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3592540C83B6;
 Fri, 10 Mar 2023 22:29:36 +0000 (UTC)
Date: Fri, 10 Mar 2023 22:29:36 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, vsementsov@yandex-team.ru,
 hreitz@redhat.com, kwolf@redhat.com
Subject: Re: [PATCH nbd 1/4] nbd: Add multi-conn option
Message-ID: <20230310222935.GU7636@redhat.com>
References: <20230309113946.1528247-1-rjones@redhat.com>
 <20230309113946.1528247-2-rjones@redhat.com>
 <20230310221717.vb2b72e3tkjkpyqi@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310221717.vb2b72e3tkjkpyqi@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
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

On Fri, Mar 10, 2023 at 04:17:17PM -0600, Eric Blake wrote:
> On Thu, Mar 09, 2023 at 11:39:43AM +0000, Richard W.M. Jones wrote:
> > +     * safe for multi-conn, force it to 1.
> > +     */
> > +    if (!(s->info.flags & NBD_FLAG_CAN_MULTI_CONN)) {
> > +        s->multi_conn = 1;
> > +    }
> > +
> >      return 0;
> 
> Is there an intended QAPI counterpart for this command?  We'll need
> that if it is to be set during the command line of
> qemu-storage-daemon.

Does it just need to be added to qapi/block-core.json?

It's a shame we can't add the API in one place and have everything
generated from there.  Like some kind of 'generator' ...

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


