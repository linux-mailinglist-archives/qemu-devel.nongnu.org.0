Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B7F3CFC5D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:34:11 +0200 (CEST)
Received: from localhost ([::1]:51612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qp0-0001ej-W2
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5qnN-0007dP-6v
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:32:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5qnL-0007t9-4o
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626791539;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJKAhG7+4ni6ArQPJPutIR8ForI6fcNkQN+9/ndFybA=;
 b=VXCgBsg20roy4yXFWmsToSeIs0VqvEZn6lwON6lI+Ine/JqmRja+WeniQV9eZQBpEoQzlc
 7zZ54wLEkx5csMc3AfYq1yF6Meq9XzqAtMqMVPe+QLpAIpKZ7fWiqYKEZyEx4OXAIcYwaE
 H4UuimHO+p5DZtRmg7pMjlbQoeLZj0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-cixJGfErM0ePthnwWZwWaA-1; Tue, 20 Jul 2021 10:32:16 -0400
X-MC-Unique: cixJGfErM0ePthnwWZwWaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A773250758;
 Tue, 20 Jul 2021 14:32:15 +0000 (UTC)
Received: from redhat.com (ovpn-113-31.ams2.redhat.com [10.36.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CC4E369A;
 Tue, 20 Jul 2021 14:32:02 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:31:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/3] util/oslib-posix: Support concurrent
 os_mem_prealloc() invocation
Message-ID: <YPbeX8XASYP4eZTk@redhat.com>
References: <20210714112306.67793-1-david@redhat.com>
 <20210714112306.67793-4-david@redhat.com>
 <YPbcQmgAY+GdsIfb@redhat.com>
 <a8b2e7c8-9c95-ea23-c1f0-f74387647809@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a8b2e7c8-9c95-ea23-c1f0-f74387647809@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Tue, Jul 20, 2021 at 04:27:32PM +0200, David Hildenbrand wrote:
> On 20.07.21 16:22, Daniel P. Berrangé wrote:
> > On Wed, Jul 14, 2021 at 01:23:06PM +0200, David Hildenbrand wrote:
> > > Add a mutext to protect the SIGBUS case, as we cannot mess concurrently
> > 
> > typo  s/mutext/mutex/
> > 
> > > with the sigbus handler and we have to manage the global variable
> > > sigbus_memset_context. The MADV_POPULATE_WRITE path can run
> > > concurrently.
> > > 
> > > Note that page_mutex and page_cond are shared between concurrent
> > > invocations, which shouldn't be a problem.
> > > 
> > > This is a preparation for future virtio-mem prealloc code, which will call
> > > os_mem_prealloc() asynchronously from an iothread when handling guest
> > > requests.
> > 
> > Hmm, I'm wondering how the need to temporarily play with SIGBUS
> > at runtime for mem preallocation will interact with the SIGBUS
> > handler installed by softmmu/cpus.c.
> 
> That's exactly why I came up with MADV_POPULATE_WRITE, to avoid having to
> mess with different kinds of sigbus at the same time. You can only get it
> wrong.
> 
> > 
> > The SIGBUS handler the preallocation code is installed just
> > blindly assumes the SIGBUS is related to the preallocation
> > work being done. This is a fine assumption during initially
> > startup where we're single threaded and not running guest
> > CPUs. I'm less clear on whether that's a valid assumption
> > at runtime once guest CPUs are running.
> 
> I assume it's quite broken, for example, already when hotplugging a DIMM and
> prallocating memory for the memory backend.
> 
> > 
> > If the sigbus_handler method in softmmu/cpus.c is doing
> > something important for QEMU, then why is it ok for us to
> > periodically disable that handler and replace it with
> > something else that takes a completely different action ?
> 
> I don't think it is ok. I assume it has been broken for a long time, just
> nobody ever ran into that race.
> 
> > 
> > Of course with the madvise impl we're bypassing the SIGBUS
> > dance entirely. This is good for people with new kernels,
> > but is this SIGBUS stuff safe for older kernels ?
> 
> It remains broken with old kernels I guess. There isn't too much that we can
> do: disabling prealloc=on once the VM is running breaks existing use cases.

Ok, while refactoring this, could you add a scary warning next to the
sigaction calls mentioning that this code is not likely to play well
with qemu's other handling of sigbus, as a reminder to future reviewers.

> Fortunately, running into that race seems to be rare, at least I never hear
> reports.

The failure mode is likely to be silent or easily mis-interpreted

Is there any value in emitting a one-time per process warning message
on stderr if we take the old codepath post-startup ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


