Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99841351722
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 19:15:35 +0200 (CEST)
Received: from localhost ([::1]:34816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS0us-0002VQ-M9
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 13:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lS0qd-0000hJ-Tq
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lS0qZ-0001xk-SA
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 13:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617297067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVLqapItOA/EaVZeXNlebDO6Dltek96tn/+vGZSaHts=;
 b=GtHz6aYiaaFlSNbikAA64cN8VX5jFbP/+eIy80XfJ/Aw2DLAsk0C49t3ZKUDDFYdAT67c6
 HX8UkHGp22efV1xSkYvUE/nWbZ/bXfxWS99PQV60KLgkYRAWCVtAHdpNvZF5dlKrlnunA7
 MvzMtI/38LGcmW4xILyudN6/qCXH6Yk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-TujzzwuYMh-MopBdyoSh5w-1; Thu, 01 Apr 2021 13:11:04 -0400
X-MC-Unique: TujzzwuYMh-MopBdyoSh5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08DA681744F;
 Thu,  1 Apr 2021 17:11:04 +0000 (UTC)
Received: from starship (unknown [10.35.206.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 166885D6D1;
 Thu,  1 Apr 2021 17:10:57 +0000 (UTC)
Message-ID: <6db4acb8ce2d1ddb271cd7de465f1db4744ed1d4.camel@redhat.com>
Subject: Re: [PATCH 2/2] KVM: use KVM_{GET|SET}_SREGS2 when supported by kvm.
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Thu, 01 Apr 2021 20:10:56 +0300
In-Reply-To: <d221fa13-8e3b-0666-ff15-8c86d4e08237@redhat.com>
References: <20210401144545.1031704-1-mlevitsk@redhat.com>
 <20210401144545.1031704-3-mlevitsk@redhat.com>
 <d221fa13-8e3b-0666-ff15-8c86d4e08237@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-04-01 at 18:09 +0200, Paolo Bonzini wrote:
> On 01/04/21 16:45, Maxim Levitsky wrote:
> > +
> > +    for (i = 0; i < 4; i++) {
> > +        sregs.pdptrs[i] = env->pdptrs[i];
> > +    }
> > +
> > +    sregs.flags = 0;
> > +    sregs.padding = 0;
> > +
> > +    return kvm_vcpu_ioctl(CPU(cpu), KVM_SET_SREGS2, &sregs);
> > +}
> > +
> 
> This breaks when migrating from old to new kernel, because in that case 
> the PDPTRs are not initialized.

True, I haven't thought about it!
I'll fix this in the next version.

Best regards,
	Maxim Levitsky


> 
> Paolo
> 



