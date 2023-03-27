Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD26C9F24
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 11:15:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgiwg-00037i-9I; Mon, 27 Mar 2023 05:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgiwd-00037I-Jj
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pgiwb-000100-Lw
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 05:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679908512;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXRsBTxAMpae02Fl8JHlmQYQEXrTXhCun5JjyBJjFiQ=;
 b=HLrVQFny6F3gejGo/dcOlIF2mm7/3CSvk/NXorQNLKHWv8lv5mxthaXoPQP2TzSXjSIgKz
 7ylbV2LfJ6iz3nvhJwVJv7F3h7upVVZVc/105IM+baVOpvIQyp6BkDqZdm9Xf2PP4uC+JF
 g98rQZ6zu7FrWGK+FQN2MnAPNh029f8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-f_IE3EzGPoOHLJxzOV2OMA-1; Mon, 27 Mar 2023 05:15:10 -0400
X-MC-Unique: f_IE3EzGPoOHLJxzOV2OMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 486DB85530C
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 09:15:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.173])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A8F492B01;
 Mon, 27 Mar 2023 09:15:09 +0000 (UTC)
Date: Mon, 27 Mar 2023 10:15:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] systemd: Also clear LISTEN_FDNAMES during systemd socket
 activation
Message-ID: <ZCFempFOjEgqyBXJ@redhat.com>
References: <20230324153349.1123774-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230324153349.1123774-1-eblake@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Mar 24, 2023 at 10:33:49AM -0500, Eric Blake wrote:
> Some time after systemd documented LISTEN_PID and LISTEN_FDS for
> socket activation, they later added LISTEN_FDNAMES; now documented at:
> https://www.freedesktop.org/software/systemd/man/sd_listen_fds.html
> 
> In particular, look at the implementation of sd_listen_fds_with_names():
> https://github.com/systemd/systemd/blob/main/src/libsystemd/sd-daemon/sd-daemon.c
> 
> If we ever pass LISTEN_PID=xxx and LISTEN_FDS=n to a child process,
> but leave LISTEN_FDNAMES=... unchanged as inherited from our parent
> process, then our child process using sd_listen_fds_with_names() might
> see a mismatch in the number of names (unexpected -EINVAL failure), or
> even if the number of names matches the values of those names may be
> unexpected (with even less predictable results).
> 
> Usually, this is not an issue - the point of LISTEN_PID is to tell
> systemd socket activation to ignore all other LISTEN_* if they were
> not directed to this particular pid.  But if we end up consuming a
> socket directed to this qemu process, and later decide to spawn a
> child process that also needs systemd socket activation, we must
> ensure we are not leaking any stale systemd variables through to that
> child.  The easiest way to do this is to wipe ALL LISTEN_* variables
> at the time we consume a socket, even if we do not yet care about a
> LISTEN_FDNAMES passed in from the parent process.
> 
> See also https://lists.freedesktop.org/archives/systemd-devel/2023-March/048920.html
> 
> Thanks: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  util/systemd.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


