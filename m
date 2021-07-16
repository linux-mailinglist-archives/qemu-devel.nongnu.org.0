Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4C3CB526
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 11:25:02 +0200 (CEST)
Received: from localhost ([::1]:55758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4K5d-0001nx-KN
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 05:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m4K4K-0000fV-Im
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:23:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m4K4I-000852-MF
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626427418;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iziCwMVIe5NEyMoA8FYhe3v4i8vEg2HY1i2+LWRtkqo=;
 b=fWEcLnNVR6BRX9eCyzlXQKDAsKOAIfrw5JEQQ9NGn15oIbH4Qb58ArxnR7z1uXEptFdbo/
 YXXJbY3BsP7rg3bMKLN0sEAzFVvsu0GcIZeMqVyFsk9TL8775hFEsZMOX8Vy046YYRdwFz
 25J4S881V4H0GwWWdCq2vXnB0JpiAs0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-DmJaVE0wPdGbnxcl7eoRbg-1; Fri, 16 Jul 2021 05:23:34 -0400
X-MC-Unique: DmJaVE0wPdGbnxcl7eoRbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A65CB800D62;
 Fri, 16 Jul 2021 09:23:33 +0000 (UTC)
Received: from redhat.com (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EB9C380;
 Fri, 16 Jul 2021 09:23:26 +0000 (UTC)
Date: Fri, 16 Jul 2021 10:23:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
Message-ID: <YPFQDGoRU95gDICW@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87y2a8cda7.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: thuth@redhat.com, ehabkost@redhat.com, Pierre Morel <pmorel@linux.ibm.com>,
 david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 15, 2021 at 08:16:32AM +0200, Markus Armbruster wrote:
> Pierre Morel <pmorel@linux.ibm.com> writes:
> 
> > Drawers and Books are levels 4 and 3 of the S390 CPU
> > topology.
> > We allow the user to define these levels and we will
> > store the values inside the S390CcwMachineState.
> 
> Double-checking: are these members specific to S390?
> 
> >
> > Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> > ---
> 
> [...]
> 
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index c3210ee1fb..98aff804c6 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -883,6 +883,8 @@
>    ##
>    # @CpuInstanceProperties:
>    #
>    # List of properties to be used for hotplugging a CPU instance,
>    # it should be passed by management with device_add command when
>    # a CPU is being hotplugged.
>    #
>    # @node-id: NUMA node ID the CPU belongs to
>    # @socket-id: socket number within node/board the CPU belongs to
> 
> Missing: documentation for your new members.

It is also missing in qemu-options.hx which covers -smp

To quote the lscpu manpage, it seems drawer/book fit inbetween
NUMA node and socket level:

       CPU    The logical CPU number of a CPU as used by the Linux kernel.

       CORE   The logical core number.  A core can contain several CPUs.

       SOCKET The logical socket number.  A socket can contain several cores.

       BOOK   The logical book number.  A book can contain several sockets.

       DRAWER The logical drawer number.  A drawer can contain several books.

       NODE   The logical NUMA node number.  A node can contain several drawers.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


