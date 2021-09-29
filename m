Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F0D41C263
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:13:07 +0200 (CEST)
Received: from localhost ([::1]:34676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWaI-0008Uw-Uz
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVWYD-0006uX-UT
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVWYB-0006u1-QQ
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 06:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632910254;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0SE+YVKjq/dLE7HJt1A3E7Mpvi40CAaZ0qAxAPS0yIc=;
 b=b/U8b/ML1f7FZQgo5ls1SXzkoqnAiU44fZkSh4cZPTciLnhrVOHZ+qdEVRDsyz/B5tmXYR
 U7wctP7KvPSM84ACxbqDm6dAQobjYsllJ1N+5uz24DTFKzD1vWeOGWeGwCV5So2+A7WFLi
 yLR4j3dpFx++oJjEsuD4xsNnF8XILaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-jiX8HXP6NdaC_mA3dJKMIg-1; Wed, 29 Sep 2021 06:10:53 -0400
X-MC-Unique: jiX8HXP6NdaC_mA3dJKMIg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5868835DE4
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 10:10:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 367A460BD8;
 Wed, 29 Sep 2021 10:10:37 +0000 (UTC)
Date: Wed, 29 Sep 2021 11:10:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <YVQ7my3BHi1On/JK@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
 <20210929095719.GH3361@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929095719.GH3361@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 10:57:19AM +0100, Richard W.M. Jones wrote:
> Looking at the qemu code the problem IMHO is:
> 
> https://gitlab.com/qemu-project/qemu/-/blob/6b54a31bf7b403672a798b6443b1930ae6c74dea/docs/specs/vmgenid.txt#L189
> https://gitlab.com/qemu-project/qemu/-/blob/6b54a31bf7b403672a798b6443b1930ae6c74dea/hw/acpi/vmgenid.c#L37
> 
> This byte swapping makes no sense to me.  How do we know that the
> guest is little endian?  What will this code do for BE guests?  I
> think qemu would be better off treating the "GUID" as a list of bytes
> and writing that exactly into the guest memory.

This is an artifact of the HyperV only caring about x86 and thus leaving
endianness unspecified in the spec for GenID. QEMU docs say


Endian-ness Considerations:
---------------------------

Although not specified in Microsoft's document, it is assumed that the
device is expected to use little-endian format.

All GUID passed in via command line or monitor are treated as big-endian.
GUID values displayed via monitor are shown in big-endian format.


So by extension if libvirt is passing the value from its XML straight
to QEMU, then libvirt has effectively defined that the XML is storing
it big-endian too.

This could be where the confusion with VMX config is coming into play,
though the byte re-ordering in v2v seems more complex than just an
endianess-fiddle ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


