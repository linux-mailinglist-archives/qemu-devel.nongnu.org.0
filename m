Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2431444599
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 17:12:22 +0100 (CET)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIs9-0005lR-Ml
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 12:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miIrH-00053G-KU
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:11:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miIrD-0003vX-7J
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 12:11:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635955881;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ByOggNdQRm6wA6nZc0BF2QxYpXM9SdY5Pqctx1CTcwA=;
 b=dgf/LfG7k+6NF31eII5RngzKbNa7GlMWn3Av63qIzFWMV+VBfWaKVJfdStZHgK+2xgKB8t
 jCECm+vm7LYHJ16o08AAXfYEoxzGKoFg0Y7d9azYkTrVrZMFnhyzHDGW9O53YZK+INoO7p
 zJ3QZdzklsrvuOAw/Vx7nmC7b8oVU0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-9TjStLlaN6GCzOrZOWR4_w-1; Wed, 03 Nov 2021 12:11:20 -0400
X-MC-Unique: 9TjStLlaN6GCzOrZOWR4_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F83510247BE;
 Wed,  3 Nov 2021 16:10:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53A99101E591;
 Wed,  3 Nov 2021 16:10:45 +0000 (UTC)
Date: Wed, 3 Nov 2021 16:10:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 0/3] SEV: fixes for -kernel launch with incompatible OVMF
Message-ID: <YYK0giDFEo3Y70Qx@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <0291b6fc-b613-5eae-77a0-b344020a8376@amd.com>
 <39de4c3a-4351-3705-0962-7bb8d496fe28@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <39de4c3a-4351-3705-0962-7bb8d496fe28@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 03:22:24PM +0200, Dov Murik wrote:
> 
> 
> On 02/11/2021 12:52, Brijesh Singh wrote:
> > Hi Dov,
> > 
> > Overall the patch looks good, only question I have is that now we are
> > enforce qemu to hash the kernel, initrd and cmdline unconditionally for
> > any of the SEV guest launches. This requires anyone wanting to
> > calculating the expected measurement need to account for it. Should we
> > make the hash page build optional ?
> > 
> 
> The problem with adding a -enable-add-kernel-hashes QEMU option (or
> suboption) is yet another complexity for the user.

I don't view that as complexity - rather it is the user being explicit
about what their requirements are. If they ask for the kernel hashes
and we can't honour that, we can now give them a clear error and
exit instead of carrying on with a broken setup.

If they don't ask for kernel hashes, we can skip the whole bit and
not have a problem with bogus warnings or back compatibilty worries.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


