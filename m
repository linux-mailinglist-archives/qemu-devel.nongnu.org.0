Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E32730E1AB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:59:51 +0100 (CET)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MRS-0003Ac-C0
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7MI1-0001gm-Ex
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:50:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7MHy-0008FT-5N
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612374601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Yf3bFJksXREX+l79ampbN8bDBjnW0oyws8CXWQq4Rg=;
 b=KaIGw9YWu+mKNVGpfDQQ5Ppv+39SaWu/qmHMDLKtHw92+4P5R8ZKXe29ePEftksNVQHIBV
 TUqc0Q10Ms6u7V/M3nSUQFDY5cSpB25Y+De0YVmG63vGNr8wjfcvi6J0o8MdSKsLFnDYh0
 4X5fCEAA4FktLuPh8RUUjtkpNPnkPG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-l_XW9-rsPOa5gMIgZhBq1g-1; Wed, 03 Feb 2021 12:49:57 -0500
X-MC-Unique: l_XW9-rsPOa5gMIgZhBq1g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A2F6801960;
 Wed,  3 Feb 2021 17:49:56 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 587EB5D9E8;
 Wed,  3 Feb 2021 17:49:54 +0000 (UTC)
Date: Wed, 3 Feb 2021 17:49:51 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 02/18] migration/rdma: judge whether or not the RDMA
 is used for migration
Message-ID: <20210203174951.GM2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-3-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-3-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Add enabled_rdma_migration into MigrationState to judge
> whether or not the RDMA is used for migration.
> 
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>

I'd rather see a separate flag added to each of the MigrationState and
MigrationIncomingState separately for outoging and incoming migration.

It's also probably better to call it 'is_rdma_migration' rather than
enabled.

Dave

> ---
>  migration/migration.c | 13 +++++++++++++
>  migration/migration.h |  6 ++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 447dfb9..129c81a 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -418,11 +418,13 @@ void migrate_add_address(SocketAddress *address)
>  static void qemu_start_incoming_migration(const char *uri, Error **errp)
>  {
>      const char *p = NULL;
> +    MigrationState *s = migrate_get_current();
>  
>      if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
>          return;
>      }
>  
> +    s->enabled_rdma_migration = false;
>      qapi_event_send_migration(MIGRATION_STATUS_SETUP);
>      if (strstart(uri, "tcp:", &p) ||
>          strstart(uri, "unix:", NULL) ||
> @@ -430,6 +432,7 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
>          socket_start_incoming_migration(p ? p : uri, errp);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> +        s->enabled_rdma_migration = true;
>          rdma_start_incoming_migration(p, errp);
>  #endif
>      } else if (strstart(uri, "exec:", &p)) {
> @@ -1921,6 +1924,7 @@ void migrate_init(MigrationState *s)
>      s->start_postcopy = false;
>      s->postcopy_after_devices = false;
>      s->migration_thread_running = false;
> +    s->enabled_rdma_migration = false;
>      error_free(s->error);
>      s->error = NULL;
>      s->hostname = NULL;
> @@ -2162,6 +2166,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>  #ifdef CONFIG_RDMA
>      } else if (strstart(uri, "rdma:", &p)) {
> +        s->enabled_rdma_migration = true;
>          rdma_start_outgoing_migration(s, p, &local_err);
>  #endif
>      } else if (strstart(uri, "exec:", &p)) {
> @@ -2391,6 +2396,14 @@ bool migrate_rdma_pin_all(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_RDMA_PIN_ALL];
>  }
>  
> +bool migrate_use_rdma(void)
> +{
> +    MigrationState *s;
> +    s = migrate_get_current();
> +
> +    return s->enabled_rdma_migration;
> +}
> +
>  bool migrate_use_multifd(void)
>  {
>      MigrationState *s;
> diff --git a/migration/migration.h b/migration/migration.h
> index 22b36f3..da5681b 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -280,6 +280,11 @@ struct MigrationState {
>       * This save hostname when out-going migration starts
>       */
>      char *hostname;
> +
> +    /*
> +     * Enable RDMA migration
> +     */
> +    bool enabled_rdma_migration;
>  };
>  
>  void migrate_set_state(int *state, int old_state, int new_state);
> @@ -317,6 +322,7 @@ bool migrate_validate_uuid(void);
>  
>  bool migrate_auto_converge(void);
>  bool migrate_rdma_pin_all(void);
> +bool migrate_use_rdma(void);
>  bool migrate_use_multifd(void);
>  bool migrate_pause_before_switchover(void);
>  int migrate_multifd_channels(void);
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


