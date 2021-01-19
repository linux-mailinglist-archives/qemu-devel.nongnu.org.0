Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7958B2FC335
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:20:30 +0100 (CET)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1zMT-0008M5-HV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:20:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l1zLB-0007r1-Gd
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:19:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l1zL9-000607-1m
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611094744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=6SFzbx7gLawgiINUV5uEmeEtIkhqKPanrGUELXJ4qR8=;
 b=bJMN+Df6JmLBtHbuJ01KLMX//3skBfy+t5wysNOdAqxvvwwDT4UMkML8e212yQUgOASXI6
 2VZ/nVwEPm4yHe9bYK3GGI2nhyrMmu05KiqpKIVr4LruFKrOMZz6Rq0zcMxbRHm6PdIzP8
 Bqv/F1aUOzRmpBzim9KYpL6X14TJSns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-9-TCTYVaOOSCuu8-Edtoig-1; Tue, 19 Jan 2021 17:19:02 -0500
X-MC-Unique: 9-TCTYVaOOSCuu8-Edtoig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8470CE642;
 Tue, 19 Jan 2021 22:19:01 +0000 (UTC)
Received: from horse.redhat.com (ovpn-117-170.rdu2.redhat.com [10.10.117.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0DBC27C58;
 Tue, 19 Jan 2021 22:18:49 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 2C27922054F; Tue, 19 Jan 2021 17:18:49 -0500 (EST)
Date: Tue, 19 Jan 2021 17:18:49 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org
Subject: What are libvhost-user locking requirements
Message-ID: <20210119221849.GC77840@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: gkurz@redhat.com, johannes.berg@intel.com, slp@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Current virtiofsd code uses libvhost-user and I am assuming virtiofsd-rs
uses it too. I am wondering what are the locking requirements for
this library.

Looking at it it does not look like thread safe. Well parts of of kind
of look thread safe. For example, David Gilbert introduced a slave_mutex
to control reading/writeing on slave_fd. But dev->slave_fd can be modified
vu_set_slave_req_fd() without any locks. Similiarly _vu_queue_notify()
uses dev->slave_fd but  does not take any lock. May be these are just
bugs and we can take slave_mutex in those paths so not a big deal.

But this library does not talk about locking at all. Of course there
are many shared data structures like "struct VuDev" and helpers which
access this structure. Is client supposed to provide locking and
make sure not more than one thread is calling into the library
at one point of time.

But in virtiofsd I see that we seem to be in mixed mode. In some cases
we are holding ->vu_dispatch_rwlock in read-only mode. So that will
allow multipler threads to call into library for one queue.

In other places like lo_setupmapping() and lo_removemapping(), we are
not holding ->vu_dispatch_rwlock() at all and simply call into
library vu_fs_cache_request(VHOST_USER_SLAVE_FS_MAP/...). So multiple
threads can call in. I think precisely for this use case dev->slave_mutex
has been introduced in library.

So few queries.

- what's the locking model needed to use libvhost-user. Is there one? 

- Is it ok to selectively add locking for some data structures in
  libvhost-user. As slave_mutex has been added. So user will have to
  go through the code to figure out which paths can be called without
  locks and which paths can't be.

/me is confused and trying to wrap my head around the locking requirements
while using libvhost-user.

Vivek


