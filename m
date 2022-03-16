Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0D4DB9EC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 22:09:55 +0100 (CET)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUau2-0003b5-Gi
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 17:09:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUarm-0002Bc-CI
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:07:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUarf-0004iS-OH
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647464846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LJY4qfpnFysG5eYJdhNLNjmVw3AssJ7XKrbhwDs+2L4=;
 b=GSbWGvzewD1ke/l+olhWpbIvP9oLBRSOyYTuyovs4HRFtvwd635AyAWYjQJhbgAGmBK+Oh
 hFDPJKQt0WEPzP1aQPJF/yJGul5gKcPU2ncFKoswnvEpaqAC6c7+X6mIFklLqJGHt6nA0s
 94SwtvKPVZBL0eUtF3Ai+4nwWFD1lME=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-sFIN_LNCOO2ktURr0nFoMA-1; Wed, 16 Mar 2022 17:07:23 -0400
X-MC-Unique: sFIN_LNCOO2ktURr0nFoMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAA053C1EA4D;
 Wed, 16 Mar 2022 21:07:21 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C2A72156A5A;
 Wed, 16 Mar 2022 21:07:20 +0000 (UTC)
Date: Wed, 16 Mar 2022 16:07:18 -0500
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH v3 3/3] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <20220316210718.yt3xcaqlg2sduyje@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
 <20220314203818.3681277-4-eblake@redhat.com>
 <20220315131441.GD1127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220315131441.GD1127@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 nsoffer@redhat.com, Hanna Reitz <hreitz@redhat.com>, v.sementsov-og@ya.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 01:14:41PM +0000, Richard W.M. Jones wrote:
> The patches seem OK to me, but I don't really know enough about the
> internals of qemu-nbd to give a line-by-line review.  I did however
> build and test qemu-nbd with the patches:
> 
>   $ ./build/qemu-nbd /var/tmp/test.qcow2 
>   $ nbdinfo nbd://localhost
>   ...
> 	can_multi_conn: false
> 
> 
>   $ ./build/qemu-nbd -e 2 /var/tmp/test.qcow2 
>   $ nbdinfo nbd://localhost
>   ...
> 	can_multi_conn: false
> 
> ^^^ Is this expected?  It also happens with -e 0.

Yes, because qemu-nbd defaults to read-write connections, but to be
conservative, this patch defaults '-m auto' to NOT advertise
multi-conn for read-write; you need to be explicit:

> 
> 
>   $ ./build/qemu-nbd -e 2 -m on /var/tmp/test.qcow2 
>   $ nbdinfo nbd://localhost
>   ...
> 	can_multi_conn: true

either with '-m on' as you did here, or with

build/qemu-nbd -r -e 2 /var/tmp/test.qcow2

where the '-m auto' default exposes multi-conn for a readonly client.

> 
> 
>   $ ./build/qemu-nbd -e 2 -m off /var/tmp/test.qcow2 
>   $ nbdinfo nbd://localhost
>   ...
> 	can_multi_conn: false
> 
> 
> Rich.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


