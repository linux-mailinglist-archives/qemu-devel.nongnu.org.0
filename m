Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8A32DDB9F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 23:54:46 +0100 (CET)
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq2AX-0008DW-0a
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 17:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kq29D-0007ls-8O
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:53:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kq29A-0006nW-II
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:53:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608245598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lyMPtD00gxGLJYOZ60KuMOiw6aW3NS7PYUpRJJLkqJI=;
 b=VLcUFOxfTOGB+uJBywIjKEVsSH2WjPoMUv9IwoU/Ix1+1Flz9PMQaN3q9wrbxAdLM98DLS
 2ZTnzBrdMj+ZKOqVDqKBu7LpykswdILdm2b+5sxyd4EnJ8TDkx1C/lBTe4j75O0WqKICPt
 t4svg1ylGMNEwlgvbj/x46wV/UA9cnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-3vVQd5gqNVeS4CZiLbsN0g-1; Thu, 17 Dec 2020 17:53:16 -0500
X-MC-Unique: 3vVQd5gqNVeS4CZiLbsN0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD6B803627;
 Thu, 17 Dec 2020 22:53:15 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B93960BE5;
 Thu, 17 Dec 2020 22:53:15 +0000 (UTC)
Date: Thu, 17 Dec 2020 17:53:13 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PULL 07/17] i386: move hyperv_vendor_id initialization to
 x86_cpu_realizefn()
Message-ID: <20201217225313.GO3140057@habkost.net>
References: <20201217184620.3945917-1-ehabkost@redhat.com>
 <20201217184620.3945917-8-ehabkost@redhat.com>
 <e3168f16-b338-d758-34f6-ee5bff41e918@suse.de>
MIME-Version: 1.0
In-Reply-To: <e3168f16-b338-d758-34f6-ee5bff41e918@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 11:33:57PM +0100, Claudio Fontana wrote:
> Hello all,
> 
> On 12/17/20 7:46 PM, Eduardo Habkost wrote:
> > From: Vitaly Kuznetsov <vkuznets@redhat.com>
> > 
> > As a preparation to expanding Hyper-V CPU features early, move
> > hyperv_vendor_id initialization to x86_cpu_realizefn(). Introduce
> > x86_cpu_hyperv_realize() to not not pollute x86_cpu_realizefn()
> > itself.
> 
> this seems to fit very well the ongoing work on separating accelerator specific realize functions;
> 
> related to the previous discussions about the class hierarchies,
> do you think that we should have a separate class in target/i386/kvm/ for a hyperv variant of the kvm-cpu.c?
> 
> Should it be a separate class or a subclass of "kvm-accel-x86_64-cpu" ?

I don't see how a separate QOM class for Hyper-V would be helpful
here.  What would be the problem you are trying to solve in this
case?

Note that the Hyper-V features here are just a set of
configurable VCPU features that appear on CPUID.  This is not a
different kind of hypervisor and/or a different kind of
accelerator.

-- 
Eduardo


