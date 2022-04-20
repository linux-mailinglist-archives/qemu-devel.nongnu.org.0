Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D273C50861D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:39:57 +0200 (CEST)
Received: from localhost ([::1]:38192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7ka-0006Hc-UN
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh7fE-0001kR-ST
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh7fC-0006uo-DG
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450861;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dtgVqiF3ls6pvCuzoamQXuJUpA0NnEVPwgJ8ix53L8=;
 b=gMmXTAC+J8BsjUGC5UhCDJGCV6+u+afzGwPd/HYLej43YbRBeXYB3MQSsLbJ9KN7j+xQlT
 ZaDPFNdPTOmkMW1jssylhXm3/Q9PW9eOnEhpQlJukgSL3A01Yi0+pERkH4gSPENKMlpxi+
 SXSfsT2BDRaxSkKNXxnlN738FUfXyuE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-i4oRndOlMxy7X4BadJ5kGQ-1; Wed, 20 Apr 2022 06:34:20 -0400
X-MC-Unique: i4oRndOlMxy7X4BadJ5kGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A0C11C05129
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 10:34:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40714145B989;
 Wed, 20 Apr 2022 10:34:19 +0000 (UTC)
Date: Wed, 20 Apr 2022 11:34:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 01/19] migration: Postpone releasing
 MigrationState.hostname
Message-ID: <Yl/hqEu/t7WSEB0N@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-2-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331150857.74406-2-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:39AM -0400, Peter Xu wrote:
> We used to release it right after migrate_fd_connect().  That's not good
> enough when there're more than one socket pair required, because it'll be
> needed to establish TLS connection for the rest channels.
> 
> One example is multifd, where we copied over the hostname for each channel
> but that's actually not needed.
> 
> Keeping the hostname until the cleanup phase of migration.
> 
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/channel.c   | 1 -
>  migration/migration.c | 5 +++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/channel.c b/migration/channel.c
> index c4fc000a1a..c6a8dcf1d7 100644
> --- a/migration/channel.c
> +++ b/migration/channel.c
> @@ -96,6 +96,5 @@ void migration_channel_connect(MigrationState *s,
>          }
>      }
>      migrate_fd_connect(s, error);
> -    g_free(s->hostname);
>      error_free(error);
>  }
> diff --git a/migration/migration.c b/migration/migration.c
> index 695f0f2900..281d33326b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1809,6 +1809,11 @@ static void migrate_fd_cleanup(MigrationState *s)
>      qemu_bh_delete(s->cleanup_bh);
>      s->cleanup_bh = NULL;
>  
> +    if (s->hostname) {
> +        g_free(s->hostname);
> +        s->hostname = NULL;
> +    }

FWIW there's a marginally more concise pattern:

  g_clear_pointer(&s->hostname, g_free)


Either way

   Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


