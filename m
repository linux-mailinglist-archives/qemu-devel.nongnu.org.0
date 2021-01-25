Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBC302818
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:44:08 +0100 (CET)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44yF-0000dJ-K2
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l44wE-0007cL-1K
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:42:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l44wB-0002CU-PP
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611592919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dKaKuvFTiS9+2ySO3L8kehnHSDk2qIJJBFd8MhI8yik=;
 b=YDDEmkMIOCw0LZRcLk11DZiqi3chhsRh3VOO3pW8YNCxL3hQQtqQQR/MTGlVXLxqNYQq9V
 A/f9S0BKKgcfCopzZAbgeY/ClDrkv/9CRYf8Oa44WSOanTsWKwuQiBADWfArA7mG5t5yqX
 hhKhpVVNDy5K1ZQ0YpLEX6A8szQU8uY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-T5Y-vKnoPuy0RjsnNiC1Nw-1; Mon, 25 Jan 2021 11:41:57 -0500
X-MC-Unique: T5Y-vKnoPuy0RjsnNiC1Nw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B2C710051BB;
 Mon, 25 Jan 2021 16:41:56 +0000 (UTC)
Received: from work-vm (ovpn-114-3.ams2.redhat.com [10.36.114.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB6E5D9E2;
 Mon, 25 Jan 2021 16:41:30 +0000 (UTC)
Date: Mon, 25 Jan 2021 16:41:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v9 02/11] migration: Make save_snapshot() return bool,
 not 0/-1
Message-ID: <20210125164128.GM2925@work-vm>
References: <20210120104411.3084801-1-berrange@redhat.com>
 <20210120104411.3084801-3-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210120104411.3084801-3-berrange@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Just for consistency, following the example documented since
> commit e3fe3988d7 ("error: Document Error API usage rules"),
> return a boolean value indicating an error is set or not.
> 
> Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/migration/snapshot.h |  9 ++++++++-
>  migration/savevm.c           | 16 ++++++++--------
>  replay/replay-debugging.c    |  2 +-
>  replay/replay-snapshot.c     |  2 +-
>  4 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/include/migration/snapshot.h b/include/migration/snapshot.h
> index c85b6ec75b..0eaf1ba0b1 100644
> --- a/include/migration/snapshot.h
> +++ b/include/migration/snapshot.h
> @@ -15,7 +15,14 @@
>  #ifndef QEMU_MIGRATION_SNAPSHOT_H
>  #define QEMU_MIGRATION_SNAPSHOT_H
>  
> -int save_snapshot(const char *name, Error **errp);
> +/**
> + * save_snapshot: Save an internal snapshot.
> + * @name: name of internal snapshot
> + * @errp: pointer to error object
> + * On success, return %true.
> + * On failure, store an error through @errp and return %false.
> + */
> +bool save_snapshot(const char *name, Error **errp);
>  int load_snapshot(const char *name, Error **errp);
>  
>  #endif
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 4a7237337e..ef7963f6c9 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2729,7 +2729,7 @@ int qemu_load_device_state(QEMUFile *f)
>      return 0;
>  }
>  
> -int save_snapshot(const char *name, Error **errp)
> +bool save_snapshot(const char *name, Error **errp)
>  {
>      BlockDriverState *bs;
>      QEMUSnapshotInfo sn1, *sn = &sn1;
> @@ -2742,29 +2742,29 @@ int save_snapshot(const char *name, Error **errp)
>      AioContext *aio_context;
>  
>      if (migration_is_blocked(errp)) {
> -        return ret;
> +        return false;
>      }
>  
>      if (!replay_can_snapshot()) {
>          error_setg(errp, "Record/replay does not allow making snapshot "
>                     "right now. Try once more later.");
> -        return ret;
> +        return false;
>      }
>  
>      if (!bdrv_all_can_snapshot(errp)) {
> -        return ret;
> +        return false;
>      }
>  
>      /* Delete old snapshots of the same name */
>      if (name) {
>          if (bdrv_all_delete_snapshot(name, errp) < 0) {
> -            return ret;
> +            return false;
>          }
>      }
>  
>      bs = bdrv_all_find_vmstate_bs(errp);
>      if (bs == NULL) {
> -        return ret;
> +        return false;
>      }
>      aio_context = bdrv_get_aio_context(bs);
>  
> @@ -2773,7 +2773,7 @@ int save_snapshot(const char *name, Error **errp)
>      ret = global_state_store();
>      if (ret) {
>          error_setg(errp, "Error saving global state");
> -        return ret;
> +        return false;
>      }
>      vm_stop(RUN_STATE_SAVE_VM);
>  
> @@ -2845,7 +2845,7 @@ int save_snapshot(const char *name, Error **errp)
>      if (saved_vm_running) {
>          vm_start();
>      }
> -    return ret;
> +    return ret == 0;
>  }
>  
>  void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
> diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
> index 3a9b609e62..8e0050915d 100644
> --- a/replay/replay-debugging.c
> +++ b/replay/replay-debugging.c
> @@ -323,7 +323,7 @@ void replay_gdb_attached(void)
>       */
>      if (replay_mode == REPLAY_MODE_PLAY
>          && !replay_snapshot) {
> -        if (save_snapshot("start_debugging", NULL) != 0) {
> +        if (!save_snapshot("start_debugging", NULL)) {
>              /* Can't create the snapshot. Continue conventional debugging. */
>          }
>      }
> diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
> index e26fa4c892..4f2560d156 100644
> --- a/replay/replay-snapshot.c
> +++ b/replay/replay-snapshot.c
> @@ -77,7 +77,7 @@ void replay_vmstate_init(void)
>  
>      if (replay_snapshot) {
>          if (replay_mode == REPLAY_MODE_RECORD) {
> -            if (save_snapshot(replay_snapshot, &err) != 0) {
> +            if (!save_snapshot(replay_snapshot, &err)) {
>                  error_report_err(err);
>                  error_report("Could not create snapshot for icount record");
>                  exit(1);
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


