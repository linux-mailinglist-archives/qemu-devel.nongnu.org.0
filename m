Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA743CFBFB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:25:24 +0200 (CEST)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qgV-0006X9-Vr
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5qeW-00058e-Kf
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:23:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5qeT-0002cG-8F
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626790995;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SFSIUMMw2WLblhUMezLwJHivM7tgn9JZppM04w6PxTM=;
 b=YcZtRKoA9maW3q5uLUSFE4ti02sz4MVl1QWlVslHEuy96s1g8sFSbqdHg9GHmqcj991qXQ
 9wQypj/rsDvyOk9/7OkJbi0v76wFxqHAC9eXD1UZulsqRSi4/LtcnsfJ2JLa2pcxBNJQG+
 rufASU/wGYmIB7qy5EZcpTRD2TUdWDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-YATznu3xOO2NL_r45w6bUA-1; Tue, 20 Jul 2021 10:23:11 -0400
X-MC-Unique: YATznu3xOO2NL_r45w6bUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A3101084F4B;
 Tue, 20 Jul 2021 14:23:10 +0000 (UTC)
Received: from redhat.com (ovpn-113-31.ams2.redhat.com [10.36.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A20415C1D1;
 Tue, 20 Jul 2021 14:23:00 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:22:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/3] util/oslib-posix: Support concurrent
 os_mem_prealloc() invocation
Message-ID: <YPbcQmgAY+GdsIfb@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
 <20210714112306.67793-4-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210714112306.67793-4-david@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 01:23:06PM +0200, David Hildenbrand wrote:
> Add a mutext to protect the SIGBUS case, as we cannot mess concurrently

typo  s/mutext/mutex/

> with the sigbus handler and we have to manage the global variable
> sigbus_memset_context. The MADV_POPULATE_WRITE path can run
> concurrently.
> 
> Note that page_mutex and page_cond are shared between concurrent
> invocations, which shouldn't be a problem.
> 
> This is a preparation for future virtio-mem prealloc code, which will call
> os_mem_prealloc() asynchronously from an iothread when handling guest
> requests.

Hmm, I'm wondering how the need to temporarily play with SIGBUS
at runtime for mem preallocation will interact with the SIGBUS
handler installed by softmmu/cpus.c.

The SIGBUS handler the preallocation code is installed just
blindly assumes the SIGBUS is related to the preallocation
work being done. This is a fine assumption during initially
startup where we're single threaded and not running guest
CPUs. I'm less clear on whether that's a valid assumption
at runtime once guest CPUs are running.

If the sigbus_handler method in softmmu/cpus.c is doing
something important for QEMU, then why is it ok for us to
periodically disable that handler and replace it with
something else that takes a completely different action ?

Of course with the madvise impl we're bypassing the SIGBUS
dance entirely. This is good for people with new kernels,
but is this SIGBUS stuff safe for older kernels ?

> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 60d1da2d6c..181f6bbf1a 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -94,6 +94,7 @@ typedef struct MemsetThread MemsetThread;
>  
>  /* used by sigbus_handler() */
>  static MemsetContext *sigbus_memset_context;
> +static QemuMutex sigbus_mutex;
>  
>  static QemuMutex page_mutex;
>  static QemuCond page_cond;
> @@ -605,12 +606,17 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
>  void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
>                       Error **errp)
>  {
> +    static gsize initialized;
>      int ret;
>      struct sigaction act, oldact;
>      size_t hpagesize = qemu_fd_getpagesize(fd);
>      size_t numpages = DIV_ROUND_UP(memory, hpagesize);
>      bool use_madv_populate_write;
>  
> +    if (g_once_init_enter(&initialized)) {
> +        qemu_mutex_init(&sigbus_mutex);
> +    }
> +
>      /*
>       * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
>       * some special mappings, such as mapping /dev/mem.
> @@ -620,6 +626,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
>      }
>  
>      if (!use_madv_populate_write) {
> +        qemu_mutex_lock(&sigbus_mutex);
>          memset(&act, 0, sizeof(act));
>          act.sa_handler = &sigbus_handler;
>          act.sa_flags = 0;
> @@ -646,6 +653,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
>              perror("os_mem_prealloc: failed to reinstall signal handler");
>              exit(1);
>          }
> +        qemu_mutex_unlock(&sigbus_mutex);
>      }
>  }



>  
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


