Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE52D3FCC1F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:15:03 +0200 (CEST)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7La-0004ff-UT
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7J8-0002w5-Sp
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:12:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7J2-00065P-GC
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630429934;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=S4Qex5nT3SsG/DvmuaI8zUx4tKniXVohLZLNt2CP5rg=;
 b=KSMZB6NSHgyonXBJ+JCUTFekHDoQKKLRDPf2EeFfeHa3gGOwmEIE1deb3n6HYntR4u8Z61
 SfT4rUx+5KtjiiW48TkJiNm6PzUJM6Nt79aLZVWEMbMxFQxYDmBj7UQaP5Lk0gTqBXcjrJ
 1Bj0PBhK5+gBozQ6elV2U4WrOFIqfTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-vlGVHr5sORmbvfA5UWdB8g-1; Tue, 31 Aug 2021 13:12:08 -0400
X-MC-Unique: vlGVHr5sORmbvfA5UWdB8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F12C21853028;
 Tue, 31 Aug 2021 17:12:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB9ED27C2C;
 Tue, 31 Aug 2021 17:12:06 +0000 (UTC)
Date: Tue, 31 Aug 2021 18:12:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PULL 08/15] target/i386: Added consistency checks for CR4
Message-ID: <YS5i5AfLdc1wubLa@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
 <20210722153612.955537-9-pbonzini@redhat.com>
 <20210831170304.GA24819@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210831170304.GA24819@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Lara Lazier <laramglazier@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 06:03:04PM +0100, Richard W.M. Jones wrote:
> On Thu, Jul 22, 2021 at 05:36:05PM +0200, Paolo Bonzini wrote:
> > From: Lara Lazier <laramglazier@gmail.com>
> > 
> > All MBZ bits in CR4 must be zero. (APM2 15.5)
> > Added reserved bitmask and added checks in both
> > helper_vmrun and helper_write_crN.
> > 
> > Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> > Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> FYI this commit causes a regression with -cpu max (regression analyzed
> by Daniel Berrange).  See:

Specifically this commit breaks the ability to boot current fedora
kernels with --cpu max.   Disabling 'la57' feature makes it work
again. Similarly enabling 'la57' on any named CPU model makes that
then break.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


