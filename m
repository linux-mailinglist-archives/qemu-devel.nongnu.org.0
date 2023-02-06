Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC368BD44
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:49:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0w0-00029e-Mo; Mon, 06 Feb 2023 07:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pP0vs-0001tA-2H
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pP0vp-0003Ul-IF
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 07:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675687752;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X5ecGObh+Ix2p1TiaCThbROvfT36JcK1+DZ9dqHAZBw=;
 b=GHasWgUS/JzJ5BREh3E3OvvXv+38gdk2btItzR7VrrgN5pIlHXleLG66YAn4FvQfL8SRVQ
 DNX6VgFkuX9MgiN4/PXcRcvOPgNPI5SuMC82QMs+EJ0dSVUy5H8Xv5LKKXbjcXuRDCRgVL
 rPIh99JURVEJWJ6OuRkpP7zoE6mEsBQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-ix81AwATPEO7-KzbcM8o6w-1; Mon, 06 Feb 2023 07:49:08 -0500
X-MC-Unique: ix81AwATPEO7-KzbcM8o6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4BC5185A794;
 Mon,  6 Feb 2023 12:49:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4C62C15BA0;
 Mon,  6 Feb 2023 12:49:04 +0000 (UTC)
Date: Mon, 6 Feb 2023 12:49:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, clg@kaod.org
Subject: Re: [PATCH v15 09/11] machine: adding s390 topology to query-cpu-fast
Message-ID: <Y+D3PH0EkUPshIMO@redhat.com>
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-10-pmorel@linux.ibm.com>
 <a7a235d5-4ded-b83d-dcb6-2cf81ad5f283@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a7a235d5-4ded-b83d-dcb6-2cf81ad5f283@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 06, 2023 at 01:41:44PM +0100, Thomas Huth wrote:
> On 01/02/2023 14.20, Pierre Morel wrote:
> > S390x provides two more topology containers above the sockets,
> > books and drawers.
> > 
> > Let's add these CPU attributes to the QAPI command query-cpu-fast.
> > 
> > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > ---
> >   qapi/machine.json          | 13 ++++++++++---
> >   hw/core/machine-qmp-cmds.c |  2 ++
> >   2 files changed, 12 insertions(+), 3 deletions(-)
> > 
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 3036117059..e36c39e258 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -53,11 +53,18 @@
> >   #
> >   # Additional information about a virtual S390 CPU
> >   #
> > -# @cpu-state: the virtual CPU's state
> > +# @cpu-state: the virtual CPU's state (since 2.12)
> > +# @dedicated: the virtual CPU's dedication (since 8.0)
> > +# @polarity: the virtual CPU's polarity (since 8.0)
> >   #
> >   # Since: 2.12
> >   ##
> > -{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
> > +{ 'struct': 'CpuInfoS390',
> > +    'data': { 'cpu-state': 'CpuS390State',
> > +              'dedicated': 'bool',
> > +              'polarity': 'int'
> 
> I think it would also be better to mark the new fields as optional and only
> return them if the guest has the topology enabled, to avoid confusing
> clients that were written before this change.

FWIW, I would say that the general expectation of QMP clients is that
they must *always* expect new fields to appear in dicts that are
returned in QMP replies. We add new fields at will on a frequent basis.

So personally I'd keep life simple and unconditionally report the new
fields.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


