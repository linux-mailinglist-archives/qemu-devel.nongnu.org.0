Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9734CD83A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:46:19 +0100 (CET)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQA8I-00043R-8M
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:46:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ9Ku-0007sN-El
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQ9Kq-0001OG-4x
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646405710;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgreucLTjookwPRM2Y7KD82jxXNHl5D+/lU9NcUKkAg=;
 b=EK+QZctomVHCvy4ziD6L/uoqlHmXQwBv2p21FA027/xjRvHgZlnlOpJ+FxLPUKWXWCvftA
 I5tJMCIx4UnRJ0AMFsQsG5CGanJjXc94yNkci9JfD323jbln4uZE9RQY0IOl8RyfasiX0m
 YPNkLFqUS8zKR3GCR5OIK2y60DxLbgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-L0ueIgxENACASxE600MR-Q-1; Fri, 04 Mar 2022 09:55:01 -0500
X-MC-Unique: L0ueIgxENACASxE600MR-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF6781091DA0;
 Fri,  4 Mar 2022 14:55:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FE447DE59;
 Fri,  4 Mar 2022 14:54:57 +0000 (UTC)
Date: Fri, 4 Mar 2022 14:54:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] softmmu: move parsing of -runas, -chroot and
 -daemonize code
Message-ID: <YiIoPrLctNqySk4n@redhat.com>
References: <20220304115657.3177925-1-berrange@redhat.com>
 <20220304115657.3177925-5-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304115657.3177925-5-berrange@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com,
 Stefan Weil <sw@weilnetz.de>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 04, 2022 at 11:56:57AM +0000, Daniel P. Berrangé wrote:
> With the future intent to try to move to a fully QAPI driven
> configuration system, we want to have any current command
> parsing well isolated from logic that applies the resulting
> configuration.
> 
> We also don't want os-posix.c to contain code that is specific
> to the system emulators, as this file is linked to other binaries
> too.
> 
> To satisfy these goals, we move parsing of the -runas, -chroot and
> -daemonize code out of the os-posix.c helper code, and pass the
> parsed data into APIs in os-posix.c.
> 
> As a side benefit the 'os_daemonize()' function now lives upto to
> its name and will always daemonize, instead of using global state
> to decide to be a no-op sometimes.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  include/sysemu/os-posix.h |   4 +-
>  include/sysemu/os-win32.h |   1 -
>  os-posix.c                | 148 +++++++++++---------------------------
>  os-win32.c                |   9 ---
>  softmmu/vl.c              |  76 ++++++++++++++++++--
>  5 files changed, 113 insertions(+), 125 deletions(-)


> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1fe028800f..cdf27b6027 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2602,11 +2602,13 @@ static void qemu_process_help_options(void)
>      }
>  }
>  
> -static void qemu_maybe_daemonize(const char *pid_file)
> +static void qemu_maybe_daemonize(bool daemonize, const char *pid_file)
>  {
>      Error *err = NULL;
>  
> -    os_daemonize();
> +    if (daemonize) {
> +        os_daemonize();
> +    }
>      rcu_disable_atfork();
>  
>      if (pid_file && !qemu_write_pidfile(pid_file, &err)) {


> @@ -3683,7 +3743,7 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_process_early_options();
>  
>      qemu_process_help_options();
> -    qemu_maybe_daemonize(pid_file);
> +    qemu_maybe_daemonize(daemonize, pid_file);

This commit is a bit flawed, because we're until we call the
os_daemonize() method, the is_daemonized() method won't return
true. Unfortunately some callers rely is_daemonized() returning
true merely for the request, even though we've not yet put it
into action. ie the method would have been better called
is_daemonize_requested()

The upshot is that we fail to properly close stderr.

I'll send a v2 that handles this by fully removing the
is_daemonize() method.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


