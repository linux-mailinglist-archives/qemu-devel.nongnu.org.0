Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D713D36A9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:29:45 +0200 (CEST)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qYy-0007aq-Il
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6qXt-0006us-U1
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:28:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6qXr-0008BK-T5
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627028914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L+eOGTQygR3wMZ3nZzSu1OD3GveWoOie0fXQoUkVxqE=;
 b=EWSJS4NxLfZ7yMalyz+GD2y9xvpwQaa6MmtyhEZeWVRjyULSy/zIyKy23UOQwMJrxgMX3D
 kj5vvU/QF9Puo7fLa8QSbtOq2EfcBYGDad9KfJowV3PaRFVbVMF+3fS0zg3LqV/oeiSWPR
 zBag13VoPbLa8gJ0rKUZDnXp2XSgSrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-Kn9f7rB_Ow-nG7juym2cvA-1; Fri, 23 Jul 2021 04:28:33 -0400
X-MC-Unique: Kn9f7rB_Ow-nG7juym2cvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CF931853024;
 Fri, 23 Jul 2021 08:28:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8085D69CBB;
 Fri, 23 Jul 2021 08:28:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 01EC511326B9; Fri, 23 Jul 2021 10:28:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is
 not found
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
Date: Fri, 23 Jul 2021 10:28:26 +0200
In-Reply-To: <20210722220952.17444-2-jziviani@suse.de> (Jose R. Ziviani's
 message of "Thu, 22 Jul 2021 19:09:52 -0300")
Message-ID: <87a6mdcu39.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: pbonzini@redhat.com, cfontana@suse.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Jose R. Ziviani" <jziviani@suse.de> writes:

> When a module is not found, specially accelerators, QEMU displays
> a error message that not easy to understand[1]. This patch improves
> the readability by offering a user-friendly message[2].
>
> This patch also moves the accelerator ops check to runtine (instead
> of the original g_assert) because it works better with dynamic
> modules.
>
> [1] qemu-system-x86_64 -accel tcg
> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed:
> (ops != NULL)
> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces:
> assertion failed: (ops != NULL)
>     31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...

This isn't an error message, it's a crash :)

> [2] qemu-system-x86_64 -accel tcg
> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.

s/config/configure/

Also drop the period.

>
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
>  accel/accel-softmmu.c |  5 ++++-
>  util/module.c         | 14 ++++++++------
>  2 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
> index 67276e4f52..52449ac2d0 100644
> --- a/accel/accel-softmmu.c
> +++ b/accel/accel-softmmu.c
> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
>       * all accelerators need to define ops, providing at least a mandatory
>       * non-NULL create_vcpu_thread operation.
>       */
> -    g_assert(ops != NULL);
> +    if (ops == NULL) {
> +        exit(1);
> +    }
> +

Not your patch's fault: I'm not sure the comment makes sense.

>      if (ops->ops_init) {
>          ops->ops_init(ops);
>      }
> diff --git a/util/module.c b/util/module.c
> index 6bb4ad915a..268a8563fd 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -206,13 +206,10 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
>  out:
>      return ret;
>  }
> -#endif

Why do you need to mess with the ifdeffery?

>  
>  bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>  {
>      bool success = false;
> -
> -#ifdef CONFIG_MODULES
>      char *fname = NULL;
>  #ifdef CONFIG_MODULE_UPGRADES
>      char *version_dir;
> @@ -300,6 +297,9 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>  
>      if (!success) {
>          g_hash_table_remove(loaded_modules, module_name);
> +        fprintf(stderr, "%s module is missing, install the "
> +                        "package or config the library path "
> +                        "correctly.\n", module_name);
>          g_free(module_name);
>      }
>  

Again, not your patch's fault: reporting to stderr with fprintf() is
almost always wrong.

When the thing we report is an error, we should use error_report() for
correct formatting.  Likewise, warn_report() for warnings, info_report()
for informational messages.

When the module load is triggered by a monitor command, we probably want
to report problems to the monitor.  error_report() & friends do the
right thing for HMP.  For QMP, you have to use the Error API, i.e. have
the function take an Error ** argument, which the callers propagate all
the way to the QMP core.

To fix this issue, we first need to decide what kind of message this is:
error, warning, something else.

> @@ -307,12 +307,9 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>          g_free(dirs[i]);
>      }
>  
> -#endif
>      return success;
>  }
>  
> -#ifdef CONFIG_MODULES
> -
>  static bool module_loaded_qom_all;
>  
>  void module_load_qom_one(const char *type)
> @@ -384,4 +381,9 @@ void qemu_load_module_for_opts(const char *group) {}
>  void module_load_qom_one(const char *type) {}
>  void module_load_qom_all(void) {}
>  
> +bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
> +{
> +    return false;
> +}
> +
>  #endif


