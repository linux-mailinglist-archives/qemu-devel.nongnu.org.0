Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527465664B6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:10:33 +0200 (CEST)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ddg-0003vl-ET
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8dZ6-0007jk-CA
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:05:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o8dZ4-0008QW-Ai
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657008345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+quiQ6Yfy4DtOgdMyQoOkZrWCr+Wa70UHPy3Vx9m94=;
 b=QUaug0licpUkRXpOfpJvz8dEsApr/s2lJgjpkxpCpXJTa3iqNxJ71yP2J2Sku+ysGQxfQw
 0J/RPv6IaLqYTav+AnOxCPk7JI6HX2YWXutIqgsK1q2DkxBNYPzRrYQ3dBBea9GQJYu4Fd
 XlpFpbkXENtV/xyRKF3ixDwyL+RZq0k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-07Zo-mhKO425RazzMgmaRg-1; Tue, 05 Jul 2022 04:05:44 -0400
X-MC-Unique: 07Zo-mhKO425RazzMgmaRg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C6F1801231
 for <qemu-devel@nongnu.org>; Tue,  5 Jul 2022 08:05:44 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3CF64619F4;
 Tue,  5 Jul 2022 08:05:42 +0000 (UTC)
Date: Tue, 5 Jul 2022 09:05:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/3] migration/multifd: Warn user when zerocopy not
 working
Message-ID: <YsPw1OEKi7y/sZKO@redhat.com>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-4-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220704202315.507145-4-leobras@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 04, 2022 at 05:23:15PM -0300, Leonardo Bras wrote:
> Some errors, like the lack of Scatter-Gather support by the network
> interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> zero-copy, which causes it to fall back to the default copying mechanism.
> 
> After each full dirty-bitmap scan there should be a zero-copy flush
> happening, which checks for errors each of the previous calls to
> sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> increment dirty_sync_missed_zero_copy migration stat to let the user know
> about it.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/ram.h     | 2 ++
>  migration/multifd.c | 2 ++
>  migration/ram.c     | 5 +++++
>  3 files changed, 9 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


