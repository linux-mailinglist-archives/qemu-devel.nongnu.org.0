Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D981D3387E2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:50:50 +0100 (CET)
Received: from localhost ([::1]:49434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdVR-0002Y6-TS
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKdTI-00013m-SE
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lKdTH-0000mz-Dn
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615538914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BK0Nadw45FAHRhV6w2U63Kl4duAX0yHcXNgk+TF/aCw=;
 b=bhSkNbYzUGnKBwv8zN9jtoqrZA7JWH0/AFlw6wBhJJgyI4w+84rEomuwDxbYXaiEk2A/r/
 DL/lhDdH82yhcVWAs9hOdN4M7bxyLVKI8Xr5B8bUGJQ+HpuC8uUi/LxWshLad364yjbIFd
 ipDPjd0UITRFZ752MnH9dxiGgp/R2kM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-8HkytJwZOj-TgoJ7mBngIQ-1; Fri, 12 Mar 2021 03:48:30 -0500
X-MC-Unique: 8HkytJwZOj-TgoJ7mBngIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75F49100C66A;
 Fri, 12 Mar 2021 08:48:29 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEAFE5D9F2;
 Fri, 12 Mar 2021 08:48:19 +0000 (UTC)
Date: Fri, 12 Mar 2021 09:48:16 +0100
From: Andrew Jones <drjones@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Message-ID: <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
MIME-Version: 1.0
In-Reply-To: <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 09:11:45AM +0100, Thomas Huth wrote:
> On 12/03/2021 08.42, Marc-André Lureau wrote:
> > 
> > 
> > On Fri, Mar 12, 2021 at 3:14 AM Philippe Mathieu-Daudé
> > <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> > 
> [...]
> >     +##
> >     +# @AcceleratorInfo:
> >     +#
> >     +# Accelerator information.
> >     +#
> >     +# @name: The accelerator name.
> >     +#
> >     +# Since: 6.0
> >     +##
> >     +{ 'union': 'AcceleratorInfo',
> >     +  'base': {'name': 'Accelerator'},
> >     +  'discriminator': 'name',
> >     +  'data': { } }
> > 
> >     +
> > 
> > 
> > Making room for future details, why not.
> 
> I think we definitely need the additional data section here: For KVM on
> POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on
> MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE,
> for KVM on x86 whether it's the AMD flavor or Intel, ...

Could also pre-expand all of these and list them individually.

> 
> >     +##
> >     +# @query-accels:
> >     +#
> >     +# Get a list of AcceleratorInfo for all built-in accelerators.
> >     +#
> >     +# Returns: a list of @AcceleratorInfo describing each accelerator.
> >     +#
> >     +# Since: 6.0
> >     +#
> >     +# Example:
> >     +#
> >     +# -> { "execute": "query-accels" }
> >     +# <- { "return": [
> >     +#        {
> >     +#            "type": "qtest"
> >     +#        },
> >     +#        {
> >     +#            "type": "kvm"
> >     +#        }
> >     +#    ] }
> >     +#
> >     +##
> >     +{ 'command': 'query-accels',
> >     +  'returns': ['AcceleratorInfo'] }
> > 
> > 
> > That's nice, but how do you know which accels are actually enabled?
> 
> I guess we need two commands in the end, one for querying which accelerators
> are available, and one for querying the data from the currently active
> accelerator...?
>

If we listed each accelerator individually, then we could use booleans
for them, where only the active one would be true. If we can't come up
with another need for the accelerator-specific info now, then I'd leave
it to be added at a later time when it is needed.

Thanks,
drew


