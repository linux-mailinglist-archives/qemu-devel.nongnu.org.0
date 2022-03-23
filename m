Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997324E5487
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:48:34 +0100 (CET)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX2Hp-0004Pq-CB
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:48:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nX2Ev-0001M0-6a
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:45:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nX2BS-0005uu-6U
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648046513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Chyzq+wrxljD6EgN1jPXpIFUiTmuQ68WGf05XEGrFw=;
 b=DgO5hsWnzNaLUgDDzMl4h0jBYjlmhKzbX5b4IC5KwuWWGtR1jcj9jRTNE5EhJ5egp1KxW6
 jnCmmvd8WfgPs5S26YsjJ5YXLSilcAOdk6dNB7gJzRaxBFQcGRl84+X3Ca6qaWsewCMhRC
 98cLzGPWGwWwQdR73I9PJXSxQck8DDA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-F9bVVr0rOgyZQzlE6vA0zw-1; Wed, 23 Mar 2022 10:41:50 -0400
X-MC-Unique: F9bVVr0rOgyZQzlE6vA0zw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBD8E1044568;
 Wed, 23 Mar 2022 14:41:48 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D42409B3E1;
 Wed, 23 Mar 2022 14:41:47 +0000 (UTC)
Date: Wed, 23 Mar 2022 15:41:44 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] KVM: x86: workaround invalid CPUID[0xD, 9] info on some
 AMD processors
Message-ID: <YjsxqPDhGVZVYKEc@angien.pipo.sk>
References: <20220323114315.22594-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220323114315.22594-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 12:43:15 +0100, Paolo Bonzini wrote:
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
> 
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Analyzed-by: Yang Zhong <yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/cpu.c         |  4 ++--
>  target/i386/cpu.h         |  2 ++
>  target/i386/kvm/kvm-cpu.c | 19 ++++++++++++-------
>  3 files changed, 16 insertions(+), 9 deletions(-)

Tested-by: Peter Krempa <pkrempa@redhat.com>

With this patch it no longer abort()s on my Ryzen 3900X


