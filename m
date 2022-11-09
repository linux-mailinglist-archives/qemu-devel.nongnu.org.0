Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE12622972
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 12:01:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osioZ-0006u3-32; Wed, 09 Nov 2022 06:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1osioW-0006t4-62
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 06:00:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1osioU-0005O2-Ae
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 06:00:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667991609;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UgWhmr2xsss2KoKk79uZrVK3rt8fTvXjDSBM/IviGOs=;
 b=S8qYn0SA8ObUQKBYWt/jK7Fu5wqJFxfdqiftvEkq/hucFZhqnDYyVg8TZUKqsOIHorsNFm
 X5UbXdHs4Oj4aXEF/80R4+t4YNpIK33Ewl/QzI4xU8iiRzLgaRY7cQLBpbwejATZ2dcNiq
 df4RJqpuUBsSU032s6OUr8nR6pDZzPw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-OXNaLBwiPS6nM7DRiGM03w-1; Wed, 09 Nov 2022 06:00:06 -0500
X-MC-Unique: OXNaLBwiPS6nM7DRiGM03w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90718833A2A;
 Wed,  9 Nov 2022 11:00:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F34FC16922;
 Wed,  9 Nov 2022 11:00:01 +0000 (UTC)
Date: Wed, 9 Nov 2022 10:59:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>,
 Maksim Davydov <davydov-max@yandex-team.ru>, qemu-devel@nongnu.org,
 vsementsov@yandex-team.ru, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, crosa@redhat.com, bleal@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pbonzini@redhat.com,
 alxndr@bu.edu, bsd@redhat.com, stefanha@redhat.com,
 thuth@redhat.com, darren.kenny@oracle.com, Qiuhao.Li@outlook.com,
 lvivier@redhat.com
Subject: Re: [PATCH v3 2/4] python/qmp: increase read buffer size
Message-ID: <Y2uIL3XkmuiXXSGT@redhat.com>
References: <20221103102741.11201-1-davydov-max@yandex-team.ru>
 <20221103102741.11201-3-davydov-max@yandex-team.ru>
 <CAFn=p-aMT7Z3ybbuLvpZb2dphn5ybhwN=OBnKP23PYWb5KshVg@mail.gmail.com>
 <Y2t1QlBAhqhG9Oaq@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y2t1QlBAhqhG9Oaq@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Nov 09, 2022 at 09:39:14AM +0000, Daniel P. Berrangé wrote:
> On Tue, Nov 08, 2022 at 03:38:21PM -0500, John Snow wrote:
> > On Thu, Nov 3, 2022 at 6:29 AM Maksim Davydov
> > <davydov-max@yandex-team.ru> wrote:
> > >
> > > After modification of "query-machines" command the buffer size should be
> > > more than 452kB to contain output with compat-props.
> > >
> > > Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
> > > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > > ---
> > >  python/qemu/qmp/qmp_client.py | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
> > > index 5dcda04a75..659fe4d98c 100644
> > > --- a/python/qemu/qmp/qmp_client.py
> > > +++ b/python/qemu/qmp/qmp_client.py
> > > @@ -197,8 +197,8 @@ async def run(self, address='/tmp/qemu.socket'):
> > >      #: Logger object used for debugging messages.
> > >      logger = logging.getLogger(__name__)
> > >
> > > -    # Read buffer limit; large enough to accept query-qmp-schema
> > > -    _limit = (256 * 1024)
> > > +    # Read buffer limit; large enough to accept query-machines
> > > +    _limit = (512 * 1024)
> > 
> > wow :)
> 
> Meanwhile over in python/qemu/qmp/protocol.py the read buffer limit is
> set to just 64 kb.
> 
> If the current output of a particular command is known to 450 kb, then
> setting this limit to 512 kb is waaaaaaay to conservative, and we'll
> inevitably have to change it again when someone finds the next command
> that overflows.
> 
> Recall this thread
> 
>    https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg01060.html
> 
> In fact, let me be the someone who demonstrates a real case where 512kb
> is not enough....

Another example...

Create a guest with 255 vCPUs (current RHEL downstream vCPU limit),
and run

  {"execute":"query-stats","arguments":{"target": "vcpu"}}

it'll get back a 0.38 MB  QMP reply.  RHEL raised the limit to 710
vCPUs, giving a little over 1 MB QMP reply. There is a strong desire
to go even higher. With 4096 vCPUs it'd get an ~6 MB QMP reply.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


