Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F6E6F713C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:40:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucof-0007B5-8U; Thu, 04 May 2023 13:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pucMR-0007Qh-HH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:03:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pucMP-0007TY-Pi
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683219797;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBrZoYNzFMinYrru8Yfm8u2ybuA53P1Si5FXDjUoPhg=;
 b=hnm8sXG+zxfigWLB5mupIWd0P1GkmNlJ1Q7W6U+AogJw4sIks6o+8D+V+44GlMDZqRszco
 CV/BbuLofDCw4QFWJ2299oUjJQbIhUFfsnfxXOztLG9ikk2yN2fgG9ceF2isagyuZZ7TE1
 cHvXumvfzT8Sd62O6IERNCSUXVfDYM4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-T11GsADOPGudYIjU4BcX_A-1; Thu, 04 May 2023 13:03:14 -0400
X-MC-Unique: T11GsADOPGudYIjU4BcX_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1582485A588
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 17:03:14 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 472F02026D16;
 Thu,  4 May 2023 17:03:13 +0000 (UTC)
Date: Thu, 4 May 2023 18:03:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/5] migration: Make RAM_SAVE_FLAG_HOOK a normal case entry
Message-ID: <ZFPlT/5JWepQAojn@redhat.com>
References: <20230504114443.23891-1-quintela@redhat.com>
 <20230504114443.23891-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230504114443.23891-2-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 04, 2023 at 01:44:39PM +0200, Juan Quintela wrote:
> Fixes this commit, clearly a bad merge after a rebase or similar, it
> should have been its own case since that point.
> 
> commit 5b0e9dd46fbda5152566a4a26fd96bc0d0452bf7
> Author: Peter Lieven <pl@kamp.de>
> Date:   Tue Jun 24 11:32:36 2014 +0200
> 
>     migration: catch unknown flag combinations in ram_load
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/ram.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 7d81c4a39e..43338e1f5b 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -4445,14 +4445,12 @@ static int ram_load_precopy(QEMUFile *f)
>                  multifd_recv_sync_main();
>              }
>              break;
> +        case RAM_SAVE_FLAG_HOOK:
> +            ram_control_load_hook(f, RAM_CONTROL_HOOK, NULL);
> +            break;
>          default:
> -            if (flags & RAM_SAVE_FLAG_HOOK) {
> -                ram_control_load_hook(f, RAM_CONTROL_HOOK, NULL);

The only use of this flag is

  rdma.c:    qemu_put_be64(f, RAM_SAVE_FLAG_HOOK);

so its is impossible for 'flags' to have other bits set when
we see RAM_SAVE_FLAG_HOOK, so although this change is not
semantically equivalent in the general case, it is equivalent
given our current usage.


Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


