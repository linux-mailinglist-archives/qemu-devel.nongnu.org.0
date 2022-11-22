Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86536337C8
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:02:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxP9v-0004aF-5X; Tue, 22 Nov 2022 04:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxP9n-0004YZ-Ac
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:01:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oxP9l-0007bs-A2
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:01:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669107688;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCpLO/q/DZTQudTlj2H8BhbK81FUfU8/Jewxq/ScslU=;
 b=TDPj3GBA78saABQ8IdpAsh+qYUgwzGlREXWkCwRuwh6WNZmvBmY/IdhZvnG1dibjFdXaXH
 Fz/16Gv2A/HC4/7szz+06FQ1nixdeuS5MUVEoAqv/ZGxXj0VVGhKFqlSL1NF7Q4a3pBg8f
 mCKt95eImX2TlEferq2vFHnNJu/rEpE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-qyvLXmRYMCqPgs0DyqY2Ug-1; Tue, 22 Nov 2022 04:01:25 -0500
X-MC-Unique: qyvLXmRYMCqPgs0DyqY2Ug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2055E801585;
 Tue, 22 Nov 2022 09:01:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00016492B17;
 Tue, 22 Nov 2022 09:01:23 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:01:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: qemu-devel@nongnu.org, peterx@redhat.com, prerna.saxena@nutanix.com,
 quintela@redhat.com, dgilbert@redhat.com, lsoaresp@redhat.com
Subject: Re: [PATCH v3 2/2] migration: check magic value for deciding the
 mapping of channels
Message-ID: <Y3yP37hXYdZ0sB7L@redhat.com>
References: <20221119093615.158072-1-manish.mishra@nutanix.com>
 <20221119093615.158072-5-manish.mishra@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221119093615.158072-5-manish.mishra@nutanix.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Nov 19, 2022 at 09:36:15AM +0000, manish.mishra wrote:
> Current logic assumes that channel connections on the destination side are
> always established in the same order as the source and the first one will
> always be the main channel followed by the multifid or post-copy
> preemption channel. This may not be always true, as even if a channel has a
> connection established on the source side it can be in the pending state on
> the destination side and a newer connection can be established first.
> Basically causing out of order mapping of channels on the destination side.
> Currently, all channels except post-copy preempt send a magic number, this
> patch uses that magic number to decide the type of channel. This logic is
> applicable only for precopy(multifd) live migration, as mentioned, the
> post-copy preempt channel does not send any magic number. Also, tls live
> migrations already does tls handshake before creating other channels, so
> this issue is not possible with tls, hence this logic is avoided for tls
> live migrations. This patch uses read peek to check the magic number of
> channels so that current data/control stream management remains
> un-effected.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com
> Signed-off-by: manish.mishra <manish.mishra@nutanix.com>
> ---
>  migration/migration.c    | 44 +++++++++++++++++++++++++++++-----------
>  migration/multifd.c      | 12 ++++-------
>  migration/multifd.h      |  2 +-
>  migration/postcopy-ram.c |  5 +----
>  migration/postcopy-ram.h |  2 +-
>  5 files changed, 39 insertions(+), 26 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


