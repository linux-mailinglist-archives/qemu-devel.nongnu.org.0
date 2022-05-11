Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5BE523AF4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 18:56:17 +0200 (CEST)
Received: from localhost ([::1]:40064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nopdI-0002kx-Kb
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 12:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nopc8-0001uM-FJ
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nopc5-0004JT-VK
 for qemu-devel@nongnu.org; Wed, 11 May 2022 12:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652288101;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cllM1PCmkpCWtAXRj9fdH8QtTg/HOV2HkHXFNzDgJCE=;
 b=HUax8dodSTjUhqsLZBdoNhruKbr4q7Sxv8oo0vKOwu+dkrFitqzjbn4I882OIMMjZhUe6f
 hytJE41kZmA3GEMDCNxUBym24JVx1c8fRw9og43F4Mc1XXnobO6NqR5/U8CsDYMOWtljuH
 vtOwYP8Svhr91w05UnQeIY/EZ7UriZw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-KUbQEM8DO0a-SfRu3CakDA-1; Wed, 11 May 2022 12:55:00 -0400
X-MC-Unique: KUbQEM8DO0a-SfRu3CakDA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC7453C161AB
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 16:54:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F316654C74F;
 Wed, 11 May 2022 16:54:58 +0000 (UTC)
Date: Wed, 11 May 2022 17:54:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <YnvqYO8p/Z/7/DrO@redhat.com>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
 <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
 <YnuDONrdbMcJT08p@redhat.com>
 <a11ca582-3d17-b064-6736-bd66ed5a5ec4@redhat.com>
 <YnuLe7cVlEYsw78o@redhat.com>
 <5374a249-8389-3d11-1b30-b0b6e6910a51@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5374a249-8389-3d11-1b30-b0b6e6910a51@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 01:07:47PM +0200, Paolo Bonzini wrote:
> On 5/11/22 12:10, Daniel P. Berrangé wrote:
> > If all we needs is NUMA affinity, not CPU affinity, then it would
> > be sufficient to create 1 I/O thread per host NUMA node that the
> > VM needs to use. The job running in the I/O can spawn further
> > threads and inherit the NUMA affinity.  This might be more clever
> > than it is needed though.
> > 
> > I expect creating/deleting I/O threads is cheap in comparison to
> > the work done for preallocation. If libvirt is using -preconfig
> > and object-add to create the memory backend, then we could have
> > option of creating the I/O threads dynamically in -preconfig mode,
> > create the memory backend, and then delete the I/O threads again.
> 
> I think this is very overengineered.  Michal's patch is doing the obvious
> thing and if it doesn't work that's because Libvirt is trying to micromanage
> QEMU.

Calling it micromanaging is putting a very negative connotation on
this. What we're trying todo is enforce a host resource policy for
QEMU, in a way that a compromised QEMU can't escape, which is a
valuable protection. 

> As mentioned on IRC, if the reason is to prevent moving around threads in
> realtime (SCHED_FIFO, SCHED_RR) classes, that should be fixed at the kernel
> level.

We use cgroups where it is available to us, but we don't always have
the freedom that we'd like. Sometimes the deployment scenario of
libvirt means that we're stuck with whatever cgroup libvirtd is
launched in and sched_setaffinity is our only way to confine QEMU,
so wanting to prevent use of sched_setaffinity is reasonable IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


