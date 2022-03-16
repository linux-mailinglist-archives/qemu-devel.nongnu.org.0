Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7284DBACB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 00:02:31 +0100 (CET)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUcez-0000Ae-7w
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 19:02:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nUcdz-0007nO-Ob
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 19:01:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nUcdv-0003hk-Ks
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 19:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647471681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c3TK04KVfyEGC1ZvJX2hcQlWxEMwwQBVvWtjXH4O0S0=;
 b=S1K+QkJ5PY4KsZ1VfuAnd70pbc6SDz2X0R4138K1xJAeV9OEubqCM/nloCZBh5p4mgSi7p
 nO0GnOQ7s6Bd6vcfCNrzMF/AOYQ1DHqNZ6kA+3lpii07nzPj0ufJX+qCqAwE1LVmALh/aq
 7WbO4+cCXJ+i8HebGkO5A0l1QjMQclM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-6MU9bcknOMS9wgTsN-T_rg-1; Wed, 16 Mar 2022 19:01:19 -0400
X-MC-Unique: 6MU9bcknOMS9wgTsN-T_rg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A26313804076;
 Wed, 16 Mar 2022 23:01:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 362A2112C087;
 Wed, 16 Mar 2022 23:01:10 +0000 (UTC)
Date: Wed, 16 Mar 2022 23:01:10 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 3/3] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <20220316230110.GL1127@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
 <20220314203818.3681277-4-eblake@redhat.com>
 <20220315131441.GD1127@redhat.com>
 <20220316210718.yt3xcaqlg2sduyje@redhat.com>
 <20220316211553.5t5vujgu4rh7zpew@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220316211553.5t5vujgu4rh7zpew@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 nsoffer@redhat.com, Hanna Reitz <hreitz@redhat.com>, v.sementsov-og@ya.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 04:15:53PM -0500, Eric Blake wrote:
> On Wed, Mar 16, 2022 at 04:07:21PM -0500, Eric Blake wrote:
> > On Tue, Mar 15, 2022 at 01:14:41PM +0000, Richard W.M. Jones wrote:
> > > The patches seem OK to me, but I don't really know enough about the
> > > internals of qemu-nbd to give a line-by-line review.  I did however
> > > build and test qemu-nbd with the patches:
> > > 
> > >   $ ./build/qemu-nbd /var/tmp/test.qcow2 
> > >   $ nbdinfo nbd://localhost
> > >   ...
> > > 	can_multi_conn: false
> > > 
> > > 
> > >   $ ./build/qemu-nbd -e 2 /var/tmp/test.qcow2 
> > >   $ nbdinfo nbd://localhost
> > >   ...
> > > 	can_multi_conn: false
> > > 
> > > ^^^ Is this expected?  It also happens with -e 0.
> > 
> > Yes, because qemu-nbd defaults to read-write connections, but to be
> > conservative, this patch defaults '-m auto' to NOT advertise
> > multi-conn for read-write; you need to be explicit:
> > 
> > > 
> > > 
> > >   $ ./build/qemu-nbd -e 2 -m on /var/tmp/test.qcow2 
> > >   $ nbdinfo nbd://localhost
> > >   ...
> > > 	can_multi_conn: true
> > 
> > either with '-m on' as you did here, or with
> > 
> > build/qemu-nbd -r -e 2 /var/tmp/test.qcow2
> > 
> > where the '-m auto' default exposes multi-conn for a readonly client.
> 
> I hit send prematurely - one more thought I wanted to make clear.  For
> _this_ series, the behavior of '-m auto' depends solely on readonly
> vs. read-write; that being the most conservative choice of preserving
> pre-existing qemu-nbd behavior (that is, if you don't use -m, the only
> change in behavior should be the fact that --help output now lists
> -m).
> 
> But in future versions of qemu, we might be able to improve '-m auto'
> to also take into consideration whether the backing image of a
> read-write device is known-cache-consistent (such as a local file
> system), where we can then manage to default to advertising multi-conn
> for those writable images, while still avoiding the advertisement when
> exposing other devices such as network-mounted devices where we are
> less confident on whether there are sufficient cache consistency
> guarantees.  Use of explicit '-m off' or '-m on' gives guaranteed
> results no matter the qemu version, so it is only explicit (or
> implied) '-m auto' where we might get smarter defaults over time.
> 
> Thus testing whether advertising multi-conn makes a difference in
> other tools like nbdcopy thus requires checking if qemu-nbd is new
> enough to support -m, and then being explicit that we are opting in to
> using it.

I see.  The commit message of patch 3 confused me because
superficially it seems to say that multi-conn is safe (and therefore I
assumed safe == enabled) when backed by a local filesystem.  Could the
commit message be improved to list the default for common combinations
of flags?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


