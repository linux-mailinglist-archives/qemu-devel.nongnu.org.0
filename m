Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81674E527F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:50:41 +0100 (CET)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0Rk-0005ox-GS
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:50:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWzWd-0004Fh-Iz
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:51:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWzWb-00046w-F3
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648036293;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tkKwmFwqNBo6pAux6I3M9nhVT4fWgWcED5VfR5NPMmA=;
 b=ejZf4dEsj33ZVAiEfU7GTYCri8l5BW+kmn+BbG8koeg+XkOXoP2XFtWDmK/AaUL5AizJMv
 /fUT5Y/6v/QcU/CSEVuvzr4AFqp8xxe8v4+qWEbRwQHhH8r4O9VoC4+YmBdivZUknNhZ6P
 nV5PnePskHAftQaeZ+SgKOpTRwZid98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-XTroCT2TO_i0h64gwkiiQg-1; Wed, 23 Mar 2022 07:51:25 -0400
X-MC-Unique: XTroCT2TO_i0h64gwkiiQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DAB2185A79C;
 Wed, 23 Mar 2022 11:51:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED81C15D49;
 Wed, 23 Mar 2022 11:51:24 +0000 (UTC)
Date: Wed, 23 Mar 2022 11:51:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] KVM: x86: workaround invalid CPUID[0xD,9] info on some
 AMD processors
Message-ID: <YjsJuuGPMMFvuz+6@redhat.com>
References: <20220323114315.22594-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220323114315.22594-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 12:43:15PM +0100, Paolo Bonzini wrote:
> Some AMD processors expose the PKRU extended save state even if they do not have
> the related PKU feature in CPUID.  Worse, when they do they report a size of
> 64, whereas the expected size of the PKRU extended save state is 8, therefore
> the esa->size == eax assertion does not hold.
> 
> The state is already ignored by KVM_GET_SUPPORTED_CPUID because it
> was not enabled in the host XCR0.  However, QEMU kvm_cpu_xsave_init()
> runs before QEMU invokes arch_prctl() to enable dynamically-enabled
> save states such as XTILEDATA, and KVM_GET_SUPPORTED_CPUID hides save
> states that have yet to be enabled.  Therefore, kvm_cpu_xsave_init()
> needs to consult the host CPUID instead of KVM_GET_SUPPORTED_CPUID,
> and dies with an assertion failure.
> 
> When setting up the ExtSaveArea array to match the host, ignore features that
> KVM does not report as supported.  This will cause QEMU to skip the incorrect
> CPUID leaf instead of tripping the assertion.

  Closes: https://gitlab.com/qemu-project/qemu/-/issues/916

> 
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>

Also credit

  Reported-by: Peter Krempa <pkrempa@redhat.com>

> Analyzed-by: Yang Zhong <yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/cpu.c         |  4 ++--
>  target/i386/cpu.h         |  2 ++
>  target/i386/kvm/kvm-cpu.c | 19 ++++++++++++-------
>  3 files changed, 16 insertions(+), 9 deletions(-)

  Tested-by: Daniel P. Berrangé <berrange@redhat.com>

no longer crashes on the AMD machine I have to hand.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


