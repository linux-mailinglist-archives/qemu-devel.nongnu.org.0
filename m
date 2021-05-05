Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F370373DDE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:44:55 +0200 (CEST)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIli-0006zK-NJ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leIjs-0005WZ-2E
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:43:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1leIjo-0006Th-N5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:42:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620225776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSXhK+w1jWGsxfVC9YAS7uk3bfdKVeAz6CRPjFuHvEE=;
 b=GalcFaJ+6gpgzz6bj5zdMfZGxTcMg2f4ZkBR3i0dqAYsvMePcQuYO9ulwnwupc+9HwkXqB
 5QhKO15r0/QRMcdGhZmlcp6e8XG4AoiKWETWRUb45KR6LC6kEbmVbJunIvRtsasdIcTlXD
 60925UDfQh1TioTPTwu0qjzxFidVfj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-2Et-4VXsOC6yzgaGCGDPhQ-1; Wed, 05 May 2021 10:42:54 -0400
X-MC-Unique: 2Et-4VXsOC6yzgaGCGDPhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FD6D107ACC7;
 Wed,  5 May 2021 14:42:52 +0000 (UTC)
Received: from work-vm (ovpn-115-97.ams2.redhat.com [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39EAA39A50;
 Wed,  5 May 2021 14:42:49 +0000 (UTC)
Date: Wed, 5 May 2021 15:42:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/7] migration: use GDateTime for formatting timestamp in
 snapshot names
Message-ID: <YJKu5jfOeu5ubDXZ@work-vm>
References: <20210505103702.521457-1-berrange@redhat.com>
 <20210505103702.521457-2-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210505103702.521457-2-berrange@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 virtio-fs@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> The GDateTime APIs provided by GLib avoid portability pitfalls, such
> as some platforms where 'struct timeval.tv_sec' field is still 'long'
> instead of 'time_t'. When combined with automatic cleanup, GDateTime
> often results in simpler code too.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/savevm.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 52e2d72e4b..72848b946c 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2775,8 +2775,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>      QEMUFile *f;
>      int saved_vm_running;
>      uint64_t vm_state_size;
> -    qemu_timeval tv;
> -    struct tm tm;
> +    g_autoptr(GDateTime) now = g_date_time_new_now_local();
>      AioContext *aio_context;
>  
>      if (migration_is_blocked(errp)) {
> @@ -2836,9 +2835,8 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>      memset(sn, 0, sizeof(*sn));
>  
>      /* fill auxiliary fields */
> -    qemu_gettimeofday(&tv);
> -    sn->date_sec = tv.tv_sec;
> -    sn->date_nsec = tv.tv_usec * 1000;
> +    sn->date_sec = g_date_time_to_unix(now);
> +    sn->date_nsec = g_date_time_get_microsecond(now) * 1000;
>      sn->vm_clock_nsec = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      if (replay_mode != REPLAY_MODE_NONE) {
>          sn->icount = replay_get_current_icount();
> @@ -2849,9 +2847,8 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
>      if (name) {
>          pstrcpy(sn->name, sizeof(sn->name), name);
>      } else {
> -        /* cast below needed for OpenBSD where tv_sec is still 'long' */
> -        localtime_r((const time_t *)&tv.tv_sec, &tm);
> -        strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
> +        g_autofree char *autoname = g_date_time_format(now,  "vm-%Y%m%d%H%M%S");
> +        pstrcpy(sn->name, sizeof(sn->name), autoname);
>      }
>  
>      /* save the VM state */
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


