Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E123F1FD
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 19:36:02 +0200 (CEST)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k46Hh-000347-Fv
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 13:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k46GW-0002Qo-6l
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 13:34:48 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55715
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k46GT-0000up-Es
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 13:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596821682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bPt27istGEKRTs6lAWuY2WpgaIlHL7dNDl3/fjkPjm0=;
 b=J7QeFclRkNrL5n5m556dxjMB62dWjyjJbv79pu7yUtemhFbmmYXJ/Uxh31jXJjk11OBMXw
 JsU1r0Ij1FfEoKhS9q2fF3ZliSTwh7Si1RQEWqvVG2RXnpvLbkTeR2f44qH6XPLxTuYn11
 nCgq/aKT/AS8CbgvmE8UPZnkCI8WRtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-JRuyRYfUMSe2zvmvdQR7WQ-1; Fri, 07 Aug 2020 13:34:41 -0400
X-MC-Unique: JRuyRYfUMSe2zvmvdQR7WQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2216C18FF662
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 17:34:40 +0000 (UTC)
Received: from work-vm (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C80D965C7F;
 Fri,  7 Aug 2020 17:34:32 +0000 (UTC)
Date: Fri, 7 Aug 2020 18:34:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v2 2/5] virtiofsd: create lock/pid file in per user cache
 dir
Message-ID: <20200807173430.GI2780@work-vm>
References: <20200730194736.173994-1-vgoyal@redhat.com>
 <20200730194736.173994-3-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200730194736.173994-3-vgoyal@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 02:53:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, vromanso@redhat.com, dwalsh@redhat.com,
 qemu-devel@nongnu.org, virtio-fs@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Right now we create lock/pid file in /usr/local/var/... and unprivliged
> user does not have access to create files there.

I *think* the /usr/local there is coming from the build config of your
qemu; but I'm not 100% sure whether it's just it's --preifx

> Hence, in unprivileged mode, create this file in per user cache dir
> as specified by environment variable XDG_RUNTIME_DIR.

Yes; it's interesting that qemu daemons are somewhat inconsistent in
this; most of them ask for a --pidfile to say where you want it;
but not all.

> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 6b21a93841..1551a94757 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -972,8 +972,21 @@ static bool fv_socket_lock(struct fuse_session *se)
>      g_autofree gchar *pidfile = NULL;
>      g_autofree gchar *dir = NULL;
>      Error *local_err = NULL;
> +    gboolean unprivileged = false;
>  
> -    dir = qemu_get_local_state_pathname("run/virtiofsd");
> +    if (geteuid() != 0)
> +        unprivileged = true;

Note qemu style guides need {'s on that.

> +    /*
> +     * Unpriviliged users don't have access to /usr/local/var. Hence
> +     * store lock/pid file in per user cache directory. Use environment
> +     * variable XDG_RUNTIME_DIR.
> +     */
> +    if (unprivileged) {
> +        dir = g_strdup_printf("%s/virtiofsd", g_get_user_runtime_dir());
> +    } else {
> +        dir = qemu_get_local_state_pathname("run/virtiofsd");
> +    }

Yeh that's OK, so with the  { fixed;

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

A few other possible thoughts:
  a) Just always use g_get_runtime_dir as the top; even for root - it
seems to come out as /root/.cache for root, which isn't terrible.
  b) Maybe put this code in qemu_get_local_state_pathname?

Dave


>  
>      if (g_mkdir_with_parents(dir, S_IRWXU) < 0) {
>          fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s",
> -- 
> 2.25.4
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


