Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE804800B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 12:54:57 +0200 (CEST)
Received: from localhost ([::1]:46037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcpHs-0008N1-LU
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 06:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hcpAD-0005T1-JS
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 06:47:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hcpAB-00058H-2s
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 06:47:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41466)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hcpAA-00056m-QR
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 06:46:59 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0F0AA30860A7;
 Mon, 17 Jun 2019 10:46:53 +0000 (UTC)
Received: from work-vm (ovpn-117-216.ams2.redhat.com [10.36.117.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE36318A26;
 Mon, 17 Jun 2019 10:46:50 +0000 (UTC)
Date: Mon, 17 Jun 2019 11:46:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peng Tao <tao.peng@linux.alibaba.com>
Message-ID: <20190617104647.GA2720@work-vm>
References: <1560494113-1141-1-git-send-email-tao.peng@linux.alibaba.com>
 <20190617104601.GA2679@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617104601.GA2679@work-vm>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 17 Jun 2019 10:46:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: allow private destination ram
 with x-ignore-shared
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
Cc: Yury Kotov <yury-kotov@yandex-team.ru>, Xu Wang <xu@hyper.sh>,
 qemu-devel@nongnu.org, Jiangshan Lai <laijs@hyper.sh>,
 kata-dev@lists.katacontainers.io
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Peng Tao (tao.peng@linux.alibaba.com) wrote:
> > By removing the share ram check, qemu is able to migrate
> > to private destination ram when x-ignore-shared capability
> > is on. Then we can create multiple destination VMs based
> > on the same source VM.
> > 
> > This changes the x-ignore-shared migration capability to
> > work similar to Lai's original bypass-shared-memory
> > work(https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg00003.html)
> > which enables kata containers (https://katacontainers.io)
> > to implement the VM templating feature.
> > 
> > An example usage in kata containers(https://katacontainers.io):
> > 1. Start the source VM:
> >    qemu-system-x86 -m 2G \
> >      -object memory-backend-file,id=mem0,size=2G,share=on,mem-path=/tmpfs/template-memory \
> >      -numa node,memdev=mem0
> > 2. Stop the template VM, set migration x-ignore-shared capability,
> >    migrate "exec:cat>/tmpfs/state", quit it
> > 3. Start target VM:
> >    qemu-system-x86 -m 2G \
> >      -object memory-backend-file,id=mem0,size=2G,share=off,mem-path=/tmpfs/template-memory \
> >      -numa node,memdev=mem0 \
> >      -incoming defer
> > 4. connect to target VM qmp, set migration x-ignore-shared capability,
> > migrate_incoming "exec:cat /tmpfs/state"
> > 5. create more target VMs repeating 3 and 4
> > 
> > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Cc: Yury Kotov <yury-kotov@yandex-team.ru>
> > Cc: Jiangshan Lai <laijs@hyper.sh>
> > Cc: Xu Wang <xu@hyper.sh>
> > Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
> 
> I think this is OK, but please post this to qemu-devel.

Oh you did :-)  That's double fine then!

> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> > ---
> >  migration/ram.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 1ca9ba7..cdb82a3 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -3373,7 +3373,6 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
> >          }
> >          if (migrate_ignore_shared()) {
> >              qemu_put_be64(f, block->mr->addr);
> > -            qemu_put_byte(f, ramblock_is_ignored(block) ? 1 : 0);
> >          }
> >      }
> >  
> > @@ -4340,12 +4339,6 @@ static int ram_load(QEMUFile *f, void *opaque, int version_id)
> >                      }
> >                      if (migrate_ignore_shared()) {
> >                          hwaddr addr = qemu_get_be64(f);
> > -                        bool ignored = qemu_get_byte(f);
> > -                        if (ignored != ramblock_is_ignored(block)) {
> > -                            error_report("RAM block %s should %s be migrated",
> > -                                         id, ignored ? "" : "not");
> > -                            ret = -EINVAL;
> > -                        }
> >                          if (ramblock_is_ignored(block) &&
> >                              block->mr->addr != addr) {
> >                              error_report("Mismatched GPAs for block %s "
> > -- 
> > 1.8.3.1
> > 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

