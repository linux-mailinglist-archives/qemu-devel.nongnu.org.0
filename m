Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D931D7B2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 11:50:50 +0100 (CET)
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKPu-0006rD-6T
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 05:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lCKOH-00068A-DK
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lCKOF-0005tK-8A
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 05:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613558941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ae2Zi0IWqCWaaJjmQMrgrHoDwktDIlKwOkB6WDn7z3Q=;
 b=ADP9tyIH7hvwj0fvh6i0fafSfalgpe7rMVheVw8FPWxi0XvaL6cr4a3BmqIvJIcM6UFcuc
 DqAsaoFUAbV6853BtBs92KF5h39+sMO0wwqg1k4hSkcMlKdQqUzYKv+D0dK0QN2R7tjJTO
 5NyEwANGYTEURnIivpiR/NWVqlL+kMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-kcJVICfSPy2bZMx5Lj2vdg-1; Wed, 17 Feb 2021 05:48:56 -0500
X-MC-Unique: kcJVICfSPy2bZMx5Lj2vdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CF30107ACC7;
 Wed, 17 Feb 2021 10:48:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-175.ams2.redhat.com [10.36.115.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D8DA60C62;
 Wed, 17 Feb 2021 10:48:41 +0000 (UTC)
Date: Wed, 17 Feb 2021 10:48:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH] util: fix use-after-free in module_load_one
Message-ID: <YCz0hteZzJXwp1zM@redhat.com>
References: <20210217082403.2414858-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210217082403.2414858-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pbonzini@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 17, 2021 at 12:24:03PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Spotted by ASAN:
> 
> ==2407186==ERROR: AddressSanitizer: heap-use-after-free on address 0x6020003ac4f0 at pc 0x7ffff766659c bp 0x7fffffffd1d0 sp 0x7fffffffc980
> READ of size 1 at 0x6020003ac4f0 thread T0
>     #0 0x7ffff766659b  (/lib64/libasan.so.6+0x8a59b)
>     #1 0x7ffff6bfa843 in g_str_equal ../glib/ghash.c:2303
>     #2 0x7ffff6bf8167 in g_hash_table_lookup_node ../glib/ghash.c:493
>     #3 0x7ffff6bf9b78 in g_hash_table_insert_internal ../glib/ghash.c:1598
>     #4 0x7ffff6bf9c32 in g_hash_table_add ../glib/ghash.c:1689
>     #5 0x5555596caad4 in module_load_one ../util/module.c:233
>     #6 0x5555596ca949 in module_load_one ../util/module.c:225
>     #7 0x5555596ca949 in module_load_one ../util/module.c:225
>     #8 0x5555596cbdf4 in module_load_qom_all ../util/module.c:349
>     #9 0x5555593c6bbc in qmp_qom_list_types ../qom/qom-qmp-cmds.c:114
>     #10 0x5555595576df in qmp_marshal_qom_list_types qapi/qapi-commands-qom.c:194
>     #11 0x555559772868 in do_qmp_dispatch_bh ../qapi/qmp-dispatch.c:110
>     #12 0x5555596f8786 in aio_bh_call ../util/async.c:136
>     #13 0x5555596f8e9b in aio_bh_poll ../util/async.c:164
>     #14 0x555559685803 in aio_dispatch ../util/aio-posix.c:381
>     #15 0x5555596fa324 in aio_ctx_dispatch ../util/async.c:306
>     #16 0x7ffff6c0deda in g_main_dispatch ../glib/gmain.c:3337
>     #17 0x7ffff6c0edfd in g_main_context_dispatch ../glib/gmain.c:4055
>     #18 0x555559726c66 in glib_pollfds_poll ../util/main-loop.c:232
>     #19 0x555559726e43 in os_host_main_loop_wait ../util/main-loop.c:255
>     #20 0x555559727139 in main_loop_wait ../util/main-loop.c:531
>     #21 0x555558fb46fc in qemu_main_loop ../softmmu/runstate.c:722
>     #22 0x555557d45065 in main ../softmmu/main.c:50
>     #23 0x7ffff59611e1 in __libc_start_main (/lib64/libc.so.6+0x281e1)
>     #24 0x555557d44f7d in _start (/home/elmarco/src/qemu/build/qemu-system-x86_64+0x27f0f7d)
> 
> 0x6020003ac4f0 is located 0 bytes inside of 10-byte region [0x6020003ac4f0,0x6020003ac4fa)
> freed by thread T0 here:
>     #0 0x7ffff76870c7 in __interceptor_free (/lib64/libasan.so.6+0xab0c7)
>     #1 0x7ffff6c16d94 in g_free ../glib/gmem.c:199
>     #2 0x5555596caae7 in module_load_one ../util/module.c:234
>     #3 0x5555596ca949 in module_load_one ../util/module.c:225
>     #4 0x5555596ca949 in module_load_one ../util/module.c:225
>     #5 0x5555596cbdf4 in module_load_qom_all ../util/module.c:349
>     #6 0x5555593c6bbc in qmp_qom_list_types ../qom/qom-qmp-cmds.c:114
>     #7 0x5555595576df in qmp_marshal_qom_list_types qapi/qapi-commands-qom.c:194
>     #8 0x555559772868 in do_qmp_dispatch_bh ../qapi/qmp-dispatch.c:110
>     #9 0x5555596f8786 in aio_bh_call ../util/async.c:136
>     #10 0x5555596f8e9b in aio_bh_poll ../util/async.c:164
>     #11 0x555559685803 in aio_dispatch ../util/aio-posix.c:381
>     #12 0x5555596fa324 in aio_ctx_dispatch ../util/async.c:306
>     #13 0x7ffff6c0deda in g_main_dispatch ../glib/gmain.c:3337
>     #14 0x7ffff6c0edfd in g_main_context_dispatch ../glib/gmain.c:4055
>     #15 0x555559726c66 in glib_pollfds_poll ../util/main-loop.c:232
>     #16 0x555559726e43 in os_host_main_loop_wait ../util/main-loop.c:255
>     #17 0x555559727139 in main_loop_wait ../util/main-loop.c:531
>     #18 0x555558fb46fc in qemu_main_loop ../softmmu/runstate.c:722
>     #19 0x555557d45065 in main ../softmmu/main.c:50
>     #20 0x7ffff59611e1 in __libc_start_main (/lib64/libc.so.6+0x281e1)
> 
> Typical C bug...

This commit message isn't really helping explain the problem.
Rather than this huge trace which readers have to then debug,
can we actually say what is wrong.

After reading the docs it seems the problem is as follows:

  "g_hash_table_add always retains ownership of the pointer
   passed in as the key. Its return status merely indicates
   whether the added entry was new, or replaced an existing
   entry. Thus key must never be freed after this method
   returns."

> 
> Fixes: 90629122d2e ("module: use g_hash_table_add()")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  util/module.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/util/module.c b/util/module.c
> index c65060c167..a2ab0bcdbc 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -230,10 +230,11 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>          }
>      }
>  
> -    if (!g_hash_table_add(loaded_modules, module_name)) {
> +    if (g_hash_table_contains(loaded_modules, module_name)) {
>          g_free(module_name);
>          return true;
>      }
> +    g_hash_table_add(loaded_modules, module_name);
>  
>      search_dir = getenv("QEMU_MODULE_DIR");
>      if (search_dir != NULL) {

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


