Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE263089BC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:09:40 +0100 (CET)
Received: from localhost ([::1]:59354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5VP1-0007QM-9e
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5VLC-0004tz-Vh
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:05:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5VL9-000254-K4
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611932738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gC8mumBoL8E21yHwH3gQju8GOBDDPa42rbhzEhubpnQ=;
 b=bDj4BvaGzub2i+kK5QS97dOJ9OcsLnoSMJ9Is1tZcU/CIBDds59hrhqA1KTIANNGxa+QxL
 n7oiByZuMxe4j6gbOT8QOFWef/ctiHjUlo0heUda5ky7D2VQiH2IfIlGemjwaqTQuWZVmS
 8IHyV71IOd+lRjW3XKMVylTANrgM8i0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-BwtT7xyoM9CTkQWtYlcjZQ-1; Fri, 29 Jan 2021 10:05:36 -0500
X-MC-Unique: BwtT7xyoM9CTkQWtYlcjZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B25FD107ACE3;
 Fri, 29 Jan 2021 15:05:34 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BCB75C1B4;
 Fri, 29 Jan 2021 15:05:33 +0000 (UTC)
Date: Fri, 29 Jan 2021 15:05:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hafiz Abid Qadeer <abidh@codesourcery.com>
Subject: Re: [PATCH] Fix a typo that can cause slow socket response on Windows.
Message-ID: <20210129150530.GG4008275@redhat.com>
References: <20210129143149.493012-1-abidh@codesourcery.com>
MIME-Version: 1.0
In-Reply-To: <20210129143149.493012-1-abidh@codesourcery.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org,
 Hafiz Abid Qadeer <abid_qadeer@mentor.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 29, 2021 at 02:31:49PM +0000, Hafiz Abid Qadeer wrote:
> We observed slow responses on a host forwarded port on Windows. Investigation revealed that qemu_fd_register was being called with fd=-1 and this caused g_poll in qemu_poll_ns timing out. I tracked this behavior to following commit:
> 748f8f4 slirp: replace qemu_set_nonblock()
> 
> @@ -482,7 +483,8 @@ void tcp_connect(struct socket *inso)
>          tcp_close(sototcpcb(so)); /* This will sofree() as well */
>          return;
>      }
> -    qemu_set_nonblock(s);
> +    slirp_set_nonblock(s);
> +    so->slirp->cb->register_poll_fd(so->s);
> 
> It seems that calling register_poll_fd with so->s instead of s may be a typo. Changing it back to s solves this issue. The commit 748f8f4 made similar change in tcp_fconnect but I have not touched it.
> 
> Signed-off-by: Hafiz Abid Qadeer <abidh@codesourcery.com>
> ---
>  src/tcp_subr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for your suggested patch, however, slirp is now spun off into its
own standalone project. You can submit patches using merge requests at

  https://gitlab.freedesktop.org/slirp/libslirp

QEMU will periodically pull in updates from slirp.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


