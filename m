Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C5B3D1105
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:18:14 +0200 (CEST)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6D37-0006Kf-Hj
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6D0w-00041i-7N
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6D0p-0006Jb-NF
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626876951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+YPox9A40uDLQBLWmt48gtSVWWNfMI8NRVWq1/JnNAw=;
 b=RsK6r1S7I9B2b5ltLA1B9+jZKqliE+mNcoZxdNLQW6K+38sxfDUg+NVk7W8kLZnGGXIwpq
 9WoA/MVOeD2dDOan5tOVNzfkKnhSGUPFoFVjwQjNhY0FgoMMXfVToONw0E47TMMvvjADf5
 waGyLqTqE2T1IM7m4kWAPx/fdaX0LU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-lIgAheT1MUCkeZzOVDsS-w-1; Wed, 21 Jul 2021 10:15:47 -0400
X-MC-Unique: lIgAheT1MUCkeZzOVDsS-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C944F10060E1
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 14:15:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9622A10013D7;
 Wed, 21 Jul 2021 14:15:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3F54F11326B9; Wed, 21 Jul 2021 16:15:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/2] Revert "qxl: add migration blocker to avoid
 pre-save assert"
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-3-kraxel@redhat.com>
Date: Wed, 21 Jul 2021 16:15:45 +0200
In-Reply-To: <20210721093347.338536-3-kraxel@redhat.com> (Gerd Hoffmann's
 message of "Wed, 21 Jul 2021 11:33:47 +0200")
Message-ID: <87eebrah2m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

> This reverts commit 86dbcdd9c7590d06db89ca256c5eaf0b4aba8858.
>
> The pre-save assert is gone now, so the migration blocker
> is not needed any more.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl.h |  1 -
>  hw/display/qxl.c | 31 -------------------------------
>  2 files changed, 32 deletions(-)
>
> diff --git a/hw/display/qxl.h b/hw/display/qxl.h
> index 379d3304abc1..30d21f4d0bdc 100644
> --- a/hw/display/qxl.h
> +++ b/hw/display/qxl.h
> @@ -39,7 +39,6 @@ struct PCIQXLDevice {
>      uint32_t           cmdlog;
>  
>      uint32_t           guest_bug;
> -    Error              *migration_blocker;
>  
>      enum qxl_mode      mode;
>      uint32_t           cmdflags;
> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> index 3867b94fe236..43482d4364ba 100644
> --- a/hw/display/qxl.c
> +++ b/hw/display/qxl.c
> @@ -30,7 +30,6 @@
>  #include "qemu/module.h"
>  #include "hw/qdev-properties.h"
>  #include "sysemu/runstate.h"
> -#include "migration/blocker.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
>  
> @@ -666,30 +665,6 @@ static int interface_get_command(QXLInstance *sin, struct QXLCommandExt *ext)
>          qxl->guest_primary.commands++;
>          qxl_track_command(qxl, ext);
>          qxl_log_command(qxl, "cmd", ext);
> -        {
> -            /*
> -             * Windows 8 drivers place qxl commands in the vram
> -             * (instead of the ram) bar.  We can't live migrate such a
> -             * guest, so add a migration blocker in case we detect
> -             * this, to avoid triggering the assert in pre_save().
> -             *
> -             * https://cgit.freedesktop.org/spice/win32/qxl-wddm-dod/commit/?id=f6e099db39e7d0787f294d5fd0dce328b5210faa
> -             */
> -            void *msg = qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
> -            if (msg != NULL && (
> -                    msg < (void *)qxl->vga.vram_ptr ||
> -                    msg > ((void *)qxl->vga.vram_ptr + qxl->vga.vram_size))) {
> -                if (!qxl->migration_blocker) {
> -                    Error *local_err = NULL;
> -                    error_setg(&qxl->migration_blocker,
> -                               "qxl: guest bug: command not in ram bar");
> -                    migrate_add_blocker(qxl->migration_blocker, &local_err);
> -                    if (local_err) {
> -                        error_report_err(local_err);
> -                    }
> -                }
> -            }
> -        }
>          trace_qxl_ring_command_get(qxl->id, qxl_mode_to_string(qxl->mode));
>          return true;
>      default:

Conflicts with my "[PATCH 09/16] migration: Unify failure check for
migrate_add_blocker()".  Easy to resolve: your patch goes first, I drop
the hunk from mine.

> @@ -1283,12 +1258,6 @@ static void qxl_hard_reset(PCIQXLDevice *d, int loadvm)
>      qemu_spice_create_host_memslot(&d->ssd);
>      qxl_soft_reset(d);
>  
> -    if (d->migration_blocker) {
> -        migrate_del_blocker(d->migration_blocker);
> -        error_free(d->migration_blocker);
> -        d->migration_blocker = NULL;
> -    }
> -
>      if (startstop) {
>          qemu_spice_display_start();
>      }


