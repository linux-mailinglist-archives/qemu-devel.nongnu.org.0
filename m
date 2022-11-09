Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4818C622747
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 10:40:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oshYY-0001EU-P5; Wed, 09 Nov 2022 04:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oshYX-0001EL-4b
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 04:39:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oshYM-0006QK-9F
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 04:39:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667986764;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OXvQOW6H4Neui0UZ3gi9ZKwnHDZ60S+x1QVVDJt1GDA=;
 b=gOI2z6VqS9zlOLkfOk+wN05MxhQgouAGOUkSAQ9lKccLxAu0XNQKvWcMcE+wlL7u7/6chw
 8k9aBSuIYMxZ47Zi7QYgNK2ttJUs3wj2OYJDKf5VSs3VaDObhyOlEBxgRYfkyySyMz5MeX
 UDoNCYT8D03HXckewGo+3gvMJQe3er0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-F-u9tzE6NSmKIcHGQLmLPA-1; Wed, 09 Nov 2022 04:39:21 -0500
X-MC-Unique: F-u9tzE6NSmKIcHGQLmLPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B73E1C0896D;
 Wed,  9 Nov 2022 09:39:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54D16112131B;
 Wed,  9 Nov 2022 09:39:17 +0000 (UTC)
Date: Wed, 9 Nov 2022 09:39:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Maksim Davydov <davydov-max@yandex-team.ru>, qemu-devel@nongnu.org,
 vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, crosa@redhat.com, bleal@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 alxndr@bu.edu, bsd@redhat.com, stefanha@redhat.com,
 thuth@redhat.com, darren.kenny@oracle.com, Qiuhao.Li@outlook.com,
 lvivier@redhat.com
Subject: Re: [PATCH v3 2/4] python/qmp: increase read buffer size
Message-ID: <Y2t1QlBAhqhG9Oaq@redhat.com>
References: <20221103102741.11201-1-davydov-max@yandex-team.ru>
 <20221103102741.11201-3-davydov-max@yandex-team.ru>
 <CAFn=p-aMT7Z3ybbuLvpZb2dphn5ybhwN=OBnKP23PYWb5KshVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFn=p-aMT7Z3ybbuLvpZb2dphn5ybhwN=OBnKP23PYWb5KshVg@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 08, 2022 at 03:38:21PM -0500, John Snow wrote:
> On Thu, Nov 3, 2022 at 6:29 AM Maksim Davydov
> <davydov-max@yandex-team.ru> wrote:
> >
> > After modification of "query-machines" command the buffer size should be
> > more than 452kB to contain output with compat-props.
> >
> > Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > ---
> >  python/qemu/qmp/qmp_client.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
> > index 5dcda04a75..659fe4d98c 100644
> > --- a/python/qemu/qmp/qmp_client.py
> > +++ b/python/qemu/qmp/qmp_client.py
> > @@ -197,8 +197,8 @@ async def run(self, address='/tmp/qemu.socket'):
> >      #: Logger object used for debugging messages.
> >      logger = logging.getLogger(__name__)
> >
> > -    # Read buffer limit; large enough to accept query-qmp-schema
> > -    _limit = (256 * 1024)
> > +    # Read buffer limit; large enough to accept query-machines
> > +    _limit = (512 * 1024)
> 
> wow :)

Meanwhile over in python/qemu/qmp/protocol.py the read buffer limit is
set to just 64 kb.

If the current output of a particular command is known to 450 kb, then
setting this limit to 512 kb is waaaaaaay to conservative, and we'll
inevitably have to change it again when someone finds the next command
that overflows.

Recall this thread

   https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg01060.html

In fact, let me be the someone who demonstrates a real case where 512kb
is not enough....

Create a 200 deep chain of qcow2 files

   qemu-img create -f qcow2 demo0.img 1G
   j=0
   for i in `seq 1 200`
   do
     qemu-img create -f qcow2 -o backing_file=demo$j.qcow2 \
                              -o backing_fmt=qcow2 demo$i.qcow2
     j=$i
   done

Launch qemu with that, and then run

  "query-named-block-nodes"

and (many minutes later) you'll get an 86 MB  QMP reply.

Now, a bare no-arg "query-named-block-nodes" is known to be a bad
command as it returns data which is a combinatorial expansion of
the number of block nodes.  Essentially it is broken by design,
and no one should use it, without setting flat=true.


If we repeat it with flat=true, then we can get a 2.7 MB QMP
reply.  This is large, but a valid reply. Basically 13 KB of
data per qcow2 file.

Libvirt caps the backing chain depth it is willing to accept at 200
qcow2 files, but allows multiple disks. So with 4 disks, each with
200 deep chain, you'll get 10.8 MB of json back. Opps....

...Libvirt's QMP reply limit is 10 MB, so even libvirt will break
quite quickly. Libvirt can cope with around 787 qcow2 files in
at 13 kb per file. NB I'm assuming paths under the dir
/var/lib/libvirt/images/, shorter paths will allow for more.


The 64 KB limit will only cope with 4 qcow2 files before breaking,
while a 512 KB limit will only cope with 39 files before breaking.
Neither is anywhere near sufficient.

I'd suggest following libvirt here and setting the read limits to
10 MB.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


