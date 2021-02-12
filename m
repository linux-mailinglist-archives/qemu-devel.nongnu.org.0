Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB6C31A25F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 17:09:58 +0100 (CET)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAb14-00012D-2Z
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 11:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAawq-0005kZ-BS
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:05:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAawo-0006Bq-L4
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 11:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613145933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/EJ982m9Kcn0lN1l+VAmQGfXPp5H1MHwizJAbKNsUU=;
 b=GEJbaZVjCW8L0ee0rsZv1AHnRND0dVYfK+gJiGJqQn7vf6rcSjCRsBCZN3diV7gb47wZxd
 lBxPWAdVtUK1De9TcljGED9YHDio7GSJfzaAVTao6nBgjSMNHxMmQPbAu5F+zbSOdn0A24
 0L8C5ad9Ny6nzjrHzhyivO/uNMBXY7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-aJeS4iJcPwyjizV8IgSW7w-1; Fri, 12 Feb 2021 11:05:32 -0500
X-MC-Unique: aJeS4iJcPwyjizV8IgSW7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22DF8801994
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 16:05:31 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52B526F134;
 Fri, 12 Feb 2021 16:05:29 +0000 (UTC)
Date: Fri, 12 Feb 2021 17:05:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Message-ID: <20210212170527.0e93e6b2@redhat.com>
In-Reply-To: <87h7mhl33o.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
 <87tuqhllmn.fsf@vitty.brq.redhat.com>
 <20210212151259.3db7406f@redhat.com>
 <87k0rdl3er.fsf@vitty.brq.redhat.com>
 <87h7mhl33o.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 16:26:03 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Vitaly Kuznetsov <vkuznets@redhat.com> writes:
> 
> > Igor Mammedov <imammedo@redhat.com> writes:
> >  
> >>
> >> Please try reusing scratch CPU approach, see
> >>   kvm_arm_get_host_cpu_features()
> >> for an example. You will very likely end up with simpler series,
> >> compared to reinventing wheel.  
> >
> > Even if I do that (and I serioulsy doubt it's going to be easier than
> > just adding two 'u64's, kvm_arm_get_host_cpu_features() alone is 200
> > lines long) this is not going to give us what we need to distinguish
> > between
> >
> > 'hv-passthrough,hv-evmcs'
> >
> > and 
> >
> > 'hv-passthrough'
> >
> > when 'hv-evmcs' *is* supported by the host. When guest CPU lacks VMX we
> > don't want to enable it unless it was requested explicitly (former but
> > not the later).  
> 
> ... and if for whatever reason we decide that this is also bad/not
> needed, I can just drop patches 16-18 from the series (leaving
> 'hv-passthrough,hv-feature=off' problem to better times).
that's also an option,
we would need to make sure that hv-passthrough is mutually exclusive
with ''all'' other hv- properties to avoid above combination being
ever (mis)used.


