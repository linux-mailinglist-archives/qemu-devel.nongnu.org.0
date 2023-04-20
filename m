Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF546E9BDB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 20:45:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppZHN-0004F8-06; Thu, 20 Apr 2023 14:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZHG-0004EW-Lr; Thu, 20 Apr 2023 14:45:07 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ppZGy-0001Ma-Dq; Thu, 20 Apr 2023 14:45:06 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4698B2195D;
 Thu, 20 Apr 2023 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682016285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3gTuWmSp7boL2hwVwSZuqKFxxhbLrN06gu4pRNL4B8w=;
 b=VaIKPdEUJFAsCUkukJTfmouUOJ18tEbDDdI0tmOWq1o6HmiAiBU94eVk2w476b72poeczn
 u0fJLeXhofM1CdpLxEda5tLjaJQHS2IzbeYqhwf70C43AdlLzDyh4VZvtuynJx3CbM65zN
 oVp9BOBEN8qEqocvs5kHdXB25qkcMUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682016285;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3gTuWmSp7boL2hwVwSZuqKFxxhbLrN06gu4pRNL4B8w=;
 b=qwrSAc8M85XOLYJttX6cEDjDReDcQAod+hWxTIhgK5K8sz8r6uXXls1eopQWwwcDp9CVBp
 iliWCAE1fmlwDqCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C71D313584;
 Thu, 20 Apr 2023 18:44:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iASIIxyIQWSaOgAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 20 Apr 2023 18:44:44 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, David Hildenbrand <david@redhat.com>, John
 Snow <jsnow@redhat.com>, Fam Zheng <fam@euphon.net>, Hailiang Zhang
 <zhanghailiang@xfusion.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Leonardo Bras
 <leobras@redhat.com>, Markus Armbruster <armbru@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>, Eric
 Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 03/43] migration: Create migration_cap_set()
In-Reply-To: <20230420134002.29531-4-quintela@redhat.com>
References: <20230420134002.29531-1-quintela@redhat.com>
 <20230420134002.29531-4-quintela@redhat.com>
Date: Thu, 20 Apr 2023 15:44:42 -0300
Message-ID: <87o7ni8kbp.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> And remove the convoluted use of qmp_migrate_set_capabilities() to
> enable disable MIGRATION_CAPABILITY_BLOCK.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 74f28cdca6..4bf5df4778 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1913,25 +1913,24 @@ void migrate_set_state(int *state, int old_state, int new_state)
>      }
>  }
>  
> -static MigrationCapabilityStatus *migrate_cap_add(MigrationCapability index,
> -                                                  bool state)
> +static bool migrate_cap_set(int cap, bool value, Error **errp)

Just a nit, the commit message says migration_cap_set.

Reviewed-by: Fabiano Rosas <farosas@suse.de>

