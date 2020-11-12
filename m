Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC22B2B07D3
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:52:50 +0100 (CET)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDxx-0005aw-29
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdDv1-0003kl-M3
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdDuz-0006Ts-3C
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605192582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bs/0GTEc9jblJWVx4QgmwZ2gt+QsfH1zqzvOiwogq2Q=;
 b=SYy8C2GYlNaBVKpQj7HR68ug6veVwM7MvOiWgdEB7coXgqgVIUVI4xp8JyJwkUuu+1FWMS
 cl05haT06FjE8f3MFEgJniHsL+TTh5vkpMg1VFcw8/g3KtwH8eoJO37P0L2TI13FWGUe53
 eWlo/3oI7oJI/Pr3H14+9VxzCJMmHk8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-HBOt5A6sNHyutTLXSAAVAw-1; Thu, 12 Nov 2020 09:49:40 -0500
X-MC-Unique: HBOt5A6sNHyutTLXSAAVAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A535C593B2;
 Thu, 12 Nov 2020 14:49:38 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9351D73679;
 Thu, 12 Nov 2020 14:49:36 +0000 (UTC)
Date: Thu, 12 Nov 2020 14:49:33 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v2 5/5] migration: fix uninitialized variable warning in
 migrate_send_rp_req_pages()
Message-ID: <20201112144933.GD13424@work-vm>
References: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
 <20201111142203.2359370-6-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201111142203.2359370-6-kuhn.chenqun@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chen Qun (kuhn.chenqun@huawei.com) wrote:
> After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
>  that the statements in the macro must be executed. As a result, some variables
>  assignment statements in the macro may be considered as unexecuted by the compiler.
> 
> When the -Wmaybe-uninitialized capability is enabled on GCC9,the compiler showed warning:
> migration/migration.c: In function ‘migrate_send_rp_req_pages’:
> migration/migration.c:384:8: warning: ‘received’ may be used uninitialized in this function [-Wmaybe-uninitialized]
>  384 |     if (received) {
>      |        ^
> 
> Add a default value for 'received' to prevented the warning.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Queuing this one via migration

> ---
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> ---
>  migration/migration.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 9bb4fee5ac..de90486a61 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -361,7 +361,7 @@ int migrate_send_rp_req_pages(MigrationIncomingState *mis,
>                                RAMBlock *rb, ram_addr_t start, uint64_t haddr)
>  {
>      void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
> -    bool received;
> +    bool received = false;
>  
>      WITH_QEMU_LOCK_GUARD(&mis->page_request_mutex) {
>          received = ramblock_recv_bitmap_test_byte_offset(rb, start);
> -- 
> 2.27.0
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


