Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFDA316C05
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:04:15 +0100 (CET)
Received: from localhost ([::1]:33260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9suU-0005Xn-Eb
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9smp-0005nx-Gr
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:56:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9smm-0003mS-Jo
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gwKuY17jRFYqsQJ9p/dWNQ1xb0/o3CTVyPSvPYzeBxI=;
 b=FSAZITwt43C12fbxKxA4VdqwxwywjjLm6l3zI/mH9g3PN/vX2kFiaxr+dZSYvBXkr3nKh4
 hymUr+1xqG7TI4bUEJVvRJjUlJUEdvfB0u1xBcB/l+91doDmYagtdvKzfzr6+zjTE0NhDI
 yq2tyYPWCqfO8c98sTkqYDtEi9g+vAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-9tmEjV9KNtyHYoxcJFTdrg-1; Wed, 10 Feb 2021 11:56:13 -0500
X-MC-Unique: 9tmEjV9KNtyHYoxcJFTdrg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F268D835E20
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 16:56:11 +0000 (UTC)
Received: from redhat.com (ovpn-115-94.ams2.redhat.com [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF1DA5D71B;
 Wed, 10 Feb 2021 16:56:09 +0000 (UTC)
Date: Wed, 10 Feb 2021 16:56:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 00/19] i386: KVM: expand Hyper-V features early and
 provide simple 'hv-default=on' option
Message-ID: <20210210165606.GM1240644@redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210210164033.607612-1-vkuznets@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 05:40:12PM +0100, Vitaly Kuznetsov wrote:
> Changes since v3:
> - Make 'hv-default' override 'hv-*' options which were already set 
>   (e.g. 'hv-feature=on,hv-default' case) [Igor]. Make 'hv-passthrough'
>   behave the same way.
> - Add "i386: be more picky about implicit 'hv-evmcs' enablement" patch to avoid
>   enabling 'hv-evmcs' with hv-default/hv-passthrough when guest CPU lacks VMX.
> - Add "i386: support 'hv-passthrough,hv-feature=off' on the command line" patch
>   to make 'hv-passthrough' semantics match the newly introduced 'hv-default'.
> - Add "i386: track explicit 'hv-*' features enablement/disablement" patch to
>   support the above mentioned changes.
> - Expand qtest to check the above mentioned improvements.
> 
> Original description:
> 
> Upper layer tools like libvirt want to figure out which Hyper-V features are
> supported by the underlying stack (QEMU/KVM) but currently they are unable to
> do so. We have a nice 'hv_passthrough' CPU flag supported by QEMU but it has
> no effect on e.g. QMP's 
> 
> query-cpu-model-expansion type=full model={"name":"host","props":{"hv-passthrough":true}}
> 
> command as we parse Hyper-V features after creating KVM vCPUs and not at
> feature expansion time. To support the use-case we first need to make 
> KVM_GET_SUPPORTED_HV_CPUID ioctl a system-wide ioctl as the existing
> vCPU version can't be used that early. This is what KVM part does. With
> that done, we can make early Hyper-V feature expansion (this series).
> 
> In addition, provide a simple 'hv-default' option which enables (and
> requires from KVM) all currently supported Hyper-V enlightenments.
> Unlike 'hv-passthrough' mode, this is going to be migratable.

How is it going to be migratable if the semantics vary depending on
the host kernel KVM reporting features, because different kernels
will expose different features ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


