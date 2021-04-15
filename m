Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B1E361043
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:37:25 +0200 (CEST)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4zc-0004o9-F2
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lX4tA-0001pT-L1
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lX4t7-00054X-8y
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0AFROuHVd5HwJkHT/bjlp5ZVaLvGGXhsepomNt1v6Zw=;
 b=JU/ZztSvRgR46i1y2zhA0p+SQF1giLcYASrQCngQvf0qphEAVoQeXXbYLAGF9AAIngHoUG
 y7IvUxJHlaoGwcguqM5HtY7CR7Ukem2JOnY7y/gdnq5RZR+wqu8N0MXYBMm3nN36Ebt8kg
 o2KfmM3iC3Pi3kcqba7aYHVLaLeotmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-Yk0QYXuUNc-Ixv1GZlvqLA-1; Thu, 15 Apr 2021 12:30:38 -0400
X-MC-Unique: Yk0QYXuUNc-Ixv1GZlvqLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 502BF8030D6;
 Thu, 15 Apr 2021 16:30:36 +0000 (UTC)
Received: from work-vm (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 249046064B;
 Thu, 15 Apr 2021 16:30:30 +0000 (UTC)
Date: Thu, 15 Apr 2021 17:30:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/5] migration: add trace point when vm_stop_force_state
 fails
Message-ID: <YHhqJBbNcGnng7J1@work-vm>
References: <20210415135851.862406-1-berrange@redhat.com>
 <20210415135851.862406-2-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210415135851.862406-2-berrange@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> This is a critical failure scenario for migration that is hard to
> diagnose from existing probes. Most likely it is caused by an error
> from bdrv_flush(), but we're not logging the errno anywhere, hence
> this new probe.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c  | 1 +
>  migration/trace-events | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 8ca034136b..bee0dcd501 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3121,6 +3121,7 @@ static void migration_completion(MigrationState *s)
>          if (!ret) {
>              bool inactivate = !migrate_colo_enabled();
>              ret = vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
> +            trace_migration_completion_vm_stop(ret);
>              if (ret >= 0) {
>                  ret = migration_maybe_pause(s, &current_active_state,
>                                              MIGRATION_STATUS_DEVICE);
> diff --git a/migration/trace-events b/migration/trace-events
> index 668c562fed..8ec28432eb 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -149,6 +149,7 @@ migrate_pending(uint64_t size, uint64_t max, uint64_t pre, uint64_t compat, uint
>  migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
>  migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
>  migration_completion_file_err(void) ""
> +migration_completion_vm_stop(int ret) "ret %d"
>  migration_completion_postcopy_end(void) ""
>  migration_completion_postcopy_end_after_complete(void) ""
>  migration_rate_limit_pre(int ms) "%d ms"
> -- 
> 2.30.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


