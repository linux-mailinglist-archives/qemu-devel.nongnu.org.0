Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71263A2BB9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 14:37:21 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJw0-0001xM-FW
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 08:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrJuo-000184-I5
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrJuk-0007h2-Vd
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 08:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623328561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5WVgpIwtFWZg39+qs+YwHEpx1LsS9T76hlZ+l2gFKNM=;
 b=Xt5n+ny881YwUNodGdFVPF93HFoZifICSDVHpt1yBetZcmlNUd3MOGMtq6XIpEqxmxy+yp
 JF60I6JaWJcBgIsgSMyivdU24MYsB8XhDG1e9pO6E1CIMirTqc0E7kf6cW0yMUhhCNJncw
 fYPID0SS4yBQyW+YMw2C1QLqCP2n4Z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-hE4PgOSyOUOpjhZ6AY5X9Q-1; Thu, 10 Jun 2021 08:35:48 -0400
X-MC-Unique: hE4PgOSyOUOpjhZ6AY5X9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27DC1100C662;
 Thu, 10 Jun 2021 12:35:47 +0000 (UTC)
Received: from redhat.com (ovpn-115-203.ams2.redhat.com [10.36.115.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D39819C45;
 Thu, 10 Jun 2021 12:35:27 +0000 (UTC)
Date: Thu, 10 Jun 2021 13:35:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 17/18] modules: check arch and block load on mismatch
Message-ID: <YMIHDKEGQWKtwEU5@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-18-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610055755.538119-18-kraxel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 07:57:54AM +0200, Gerd Hoffmann wrote:
> Add module_allow_arch() to set the target architecture.
> In case a module is limited to some arch verify arches
> match and ignore the module if not.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/qemu/module.h |  1 +
>  softmmu/vl.c          |  3 +++
>  util/module.c         | 15 +++++++++++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index d3cab3c25a2f..7825f6d8c847 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -72,6 +72,7 @@ void module_call_init(module_init_type type);
>  bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
>  void module_load_qom_one(const char *type);
>  void module_load_qom_all(void);
> +void module_allow_arch(const char *arch);
>  
>  /*
>   * macros to store module metadata in a .modinfo section.
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ba26a042b284..96316774fcc9 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -126,6 +126,8 @@
>  #include "sysemu/iothread.h"
>  #include "qemu/guest-random.h"
>  
> +#include "config-host.h"
> +
>  #define MAX_VIRTIO_CONSOLES 1
>  
>  typedef struct BlockdevOptionsQueueEntry {
> @@ -2723,6 +2725,7 @@ void qemu_init(int argc, char **argv, char **envp)
>      error_init(argv[0]);
>      qemu_init_exec_dir(argv[0]);
>  
> +    module_allow_arch(TARGET_NAME);
>      qemu_init_subsystems();
>  
>      /* first pass of option parsing */
> diff --git a/util/module.c b/util/module.c
> index 6e4199169c41..564b8e3da760 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -122,6 +122,12 @@ void module_call_init(module_init_type type)
>  static Modules *modinfo;
>  static char *module_dirs[5];
>  static int module_ndirs;
> +static const char *module_arch;
> +
> +void module_allow_arch(const char *arch)
> +{
> +    module_arch = arch;
> +}
>  
>  static void module_load_path_init(void)
>  {
> @@ -295,6 +301,14 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>      module_load_modinfo();
>  
>      for (modlist = modinfo->list; modlist != NULL; modlist = modlist->next) {
> +        if (modlist->value->has_arch) {
> +            if (strcmp(modlist->value->name, module_name) == 0) {
> +                if (!module_arch ||
> +                    strcmp(modlist->value->arch, module_arch) != 0) {
> +                    return false;
> +                }
> +            }
> +        }

I have a little hard time following the code paths, but IIUC, with this
change, instead of "module.so" we would have multiple copies of something
like "module-$arch.so" ?  Then we load them all, read their modinfo section
and discard the ones with non-matching arch ?

If that is a correct understanding, then I wonder about the scalability of
it. We have 30 system emulator targets right now, so if we get even a few
arch specific modues, that's going to be alot of modules we're loading,
checking and discarding.

Wouldn't it be simpler if we just made use of the directory layout
/usr/lib64/qemu/$mod.so for common modules and /usr/lib64/qemu/$arch/$mod.so
for arch specific modules. That would let us load only the modules we know
are applicable for the system target arch and not need this post-load
filtering from metadata.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


