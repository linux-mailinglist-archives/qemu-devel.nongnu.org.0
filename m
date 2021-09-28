Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC8441B473
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 18:51:59 +0200 (CEST)
Received: from localhost ([::1]:43532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGKj-0005Xm-HR
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 12:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGEw-0006bb-PI
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:45:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGEu-00061m-9a
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 12:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632847554;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJKkjNFxDpWMQHhGdG7oyibzPBzpg2/Ad5Y5MM4Qx0U=;
 b=Bu9/GHxeF17IzK0XydsK7CzzeHoZmTD0cyl0w3z/tGPH9+KTBx8LFWAnpQx+EVdi+yC4OQ
 4Xrzz2DIRMcVerO5lN7GoZ7V9LNfdP3wpwvo8z4QFuzDGOti7vfRCN4KbTCdgShuwUvTj7
 fRK/jQIXJjCPkPfbYlxD7jxiS0PlfGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-BBJzxJiVO6ahrjimwevDUA-1; Tue, 28 Sep 2021 12:45:53 -0400
X-MC-Unique: BBJzxJiVO6ahrjimwevDUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4878E4ABA;
 Tue, 28 Sep 2021 16:45:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 506AC60C81;
 Tue, 28 Sep 2021 16:45:16 +0000 (UTC)
Date: Tue, 28 Sep 2021 17:45:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/7] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Message-ID: <YVNGmrK2R2D6BFlA@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
 <20210816094739.21970-3-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816094739.21970-3-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 11:47:34AM +0200, David Hildenbrand wrote:
> Let's sense support and use it for preallocation. MADV_POPULATE_WRITE
> does not require a SIGBUS handler, doesn't actually touch page content,
> and avoids context switches; it is, therefore, faster and easier to handle
> than our current approach.
> 
> While MADV_POPULATE_WRITE is, in general, faster than manual
> prefaulting, and especially faster with 4k pages, there is still value in
> prefaulting using multiple threads to speed up preallocation.
> 
> More details on MADV_POPULATE_WRITE can be found in the Linux commits
> 4ca9b3859dac ("mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to prefault
> page tables") and eb2faa513c24 ("mm/madvise: report SIGBUS as -EFAULT for
> MADV_POPULATE_(READ|WRITE)"), and in the man page proposal [1].
> 
> This resolves the TODO in do_touch_pages().
> 
> In the future, we might want to look into using fallocate(), eventually
> combined with MADV_POPULATE_READ, when dealing with shared file/fd
> mappings and not caring about memory bindings.
> 
> [1] https://lkml.kernel.org/r/20210816081922.5155-1-david@redhat.com
> 
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/qemu/osdep.h |  7 ++++
>  util/oslib-posix.c   | 83 +++++++++++++++++++++++++++++++++-----------
>  2 files changed, 69 insertions(+), 21 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


