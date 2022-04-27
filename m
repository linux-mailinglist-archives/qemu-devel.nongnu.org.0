Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F55113C9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:50:38 +0200 (CEST)
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdNe-0003u1-1G
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njdJp-0008UZ-E7
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:46:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njdJn-0007ho-N8
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651049199;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwcu194HBvb8Ksff9n2Zlo6tHmrzGq0NNX1/7weJwm4=;
 b=RoR2CmEb+wsO1HIonV0hsvUrT4HAFsFba8FcT4dDr11oBEjyAcKKAQxrhOd9phhtqD7dL9
 W+O1R85c2dmAs78QdyHHAWgloe5K+Ve6lKck42LUCPAqoRAGhf4wjh/L3CSrId8KOqKtSg
 oJjPupWXpm0xNNNR/NocLNFHkh4rtuQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-TUrxAD42MMCtFNEAVluv3w-1; Wed, 27 Apr 2022 04:46:35 -0400
X-MC-Unique: TUrxAD42MMCtFNEAVluv3w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73B563C0F086;
 Wed, 27 Apr 2022 08:46:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 744AC5690E5;
 Wed, 27 Apr 2022 08:46:33 +0000 (UTC)
Date: Wed, 27 Apr 2022 09:46:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v10 7/7] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
Message-ID: <YmkC51KEA1+SOoc9@redhat.com>
References: <20220426230654.637939-1-leobras@redhat.com>
 <20220426230654.637939-8-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426230654.637939-8-leobras@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 08:06:56PM -0300, Leonardo Bras wrote:
> Implement zero copy send on nocomp_send_write(), by making use of QIOChannel
> writev + flags & flush interface.
> 
> Change multifd_send_sync_main() so flush_zero_copy() can be called
> after each iteration in order to make sure all dirty pages are sent before
> a new iteration is started. It will also flush at the beginning and at the
> end of migration.
> 
> Also make it return -1 if flush_zero_copy() fails, in order to cancel
> the migration process, and avoid resuming the guest in the target host
> without receiving all current RAM.
> 
> This will work fine on RAM migration because the RAM pages are not usually freed,
> and there is no problem on changing the pages content between writev_zero_copy() and
> the actual sending of the buffer, because this change will dirty the page and
> cause it to be re-sent on a next iteration anyway.
> 
> A lot of locked memory may be needed in order to use multifd migration
> with zero-copy enabled, so disabling the feature should be necessary for
> low-privileged users trying to perform multifd migrations.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  migration/multifd.h   |  2 ++
>  migration/migration.c | 11 ++++++++++-
>  migration/multifd.c   | 37 +++++++++++++++++++++++++++++++++++--
>  migration/socket.c    |  5 +++--
>  4 files changed, 50 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


