Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9406741B4AD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:04:19 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVGWg-00051e-Gf
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGTh-00031S-M3
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:01:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVGTf-00024h-Mt
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632848470;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbRnzniSBRl9wjbs9KLfncEkBVLXCzv0sZpT0RJLf/I=;
 b=aO4za3Wayqegbf2Ql0V+DcJ6GneOr5oCCM0z9pQuRkYtdmYVD4cJTol+SuqYsWu6PfgTWH
 WMML9gJgEZhk1bRy74KRJ5xU2ldOoe6ZgqOFSBC7twB0IL0iuPOqO2q6tf+tomWtjwgIz/
 s9B3p9KcBw0ZlAmGfmx/5n1BUKDE4Ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-uM6ePvtnOSmt2_BHXx1MoA-1; Tue, 28 Sep 2021 13:01:09 -0400
X-MC-Unique: uM6ePvtnOSmt2_BHXx1MoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47BAD5721D;
 Tue, 28 Sep 2021 17:01:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 613EF19C79;
 Tue, 28 Sep 2021 17:01:06 +0000 (UTC)
Date: Tue, 28 Sep 2021 18:01:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 6/7] util/oslib-posix: Support concurrent
 os_mem_prealloc() invocation
Message-ID: <YVNKT5sfSKD1nQXT@redhat.com>
References: <20210816094739.21970-1-david@redhat.com>
 <20210816094739.21970-7-david@redhat.com>
 <YVNJSYSP/IVUipc9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVNJSYSP/IVUipc9@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 05:56:41PM +0100, Daniel P. Berrangé wrote:
> On Mon, Aug 16, 2021 at 11:47:38AM +0200, David Hildenbrand wrote:
> > Add a mutex to protect the SIGBUS case, as we cannot mess concurrently
> > with the sigbus handler and we have to manage the global variable
> > sigbus_memset_context. The MADV_POPULATE_WRITE path can run
> > concurrently.
> > 
> > Note that page_mutex and page_cond are shared between concurrent
> > invocations, which shouldn't be a problem.
> > 
> > This is a preparation for future virtio-mem prealloc code, which will call
> > os_mem_prealloc() asynchronously from an iothread when handling guest
> > requests.
> > 
> > Add a comment that messing with the SIGBUS handler is frowned upon and
> > can result in problems we fortunately haven't seen so far. Note that
> > forwarding signals to the already installed SIGBUS handler isn't clean
> > either, as that one might modify the SIGBUS handler again.
> 
> Even with the mutex, messing with SIGBUS post-startup still isn't safe
> as we're clashing with SIGBUS usage in softmmu/cpus.c
> 
> IIUC, the virtio-mem prealloc code is something new that we've not
> shipped yet. With this in mind, how about we simply enforce that
> usage of this new feature is dependant on kernel support for
> MADV_POPULATE_WRITE ?  If users want this feature they'll simply
> need to update to a modern kernel.  This shouldn't break any existing
> deployed QEMU guests IIUC

Oh, I should have read ahead to the next patch where you address
this issue.

With that in mind I'm ok adding

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> > 
> > Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >  util/oslib-posix.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> > index efa4f96d56..9829149e4b 100644
> > --- a/util/oslib-posix.c
> > +++ b/util/oslib-posix.c
> > @@ -95,6 +95,7 @@ typedef struct MemsetThread MemsetThread;
> >  
> >  /* used by sigbus_handler() */
> >  static MemsetContext *sigbus_memset_context;
> > +static QemuMutex sigbus_mutex;
> >  
> >  static QemuMutex page_mutex;
> b>  static QemuCond page_cond;
> > @@ -625,6 +626,7 @@ static bool madv_populate_write_possible(char *area, size_t pagesize)
> >  void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
> >                       Error **errp)
> >  {
> > +    static gsize initialized;
> >      int ret;
> >      struct sigaction act, oldact;
> >      size_t hpagesize = qemu_fd_getpagesize(fd);
> > @@ -638,6 +640,12 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
> >      use_madv_populate_write = madv_populate_write_possible(area, hpagesize);
> >  
> >      if (!use_madv_populate_write) {
> > +        if (g_once_init_enter(&initialized)) {
> > +            qemu_mutex_init(&sigbus_mutex);
> > +            g_once_init_leave(&initialized, 1);
> > +        }
> > +
> > +        qemu_mutex_lock(&sigbus_mutex);
> >          memset(&act, 0, sizeof(act));
> >          act.sa_handler = &sigbus_handler;
> >          act.sa_flags = 0;
> > @@ -665,6 +673,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
> >              perror("os_mem_prealloc: failed to reinstall signal handler");
> >              exit(1);
> >          }
> > +        qemu_mutex_unlock(&sigbus_mutex);
> >      }
> >  }
> >  
> > -- 
> > 2.31.1
> > 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


