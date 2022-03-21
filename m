Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9F74E2223
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 09:24:17 +0100 (CET)
Received: from localhost ([::1]:56460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWDKp-0005MT-Pq
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 04:24:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nWDIj-0004F8-2F
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:22:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nWDIf-0003UQ-V8
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647850920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PjB7jkvgDV3zyNZntj89IXCugbrNysTJ3UTeXcUzSgY=;
 b=dYHK8XZP+TukqS+hiXaXhR2rxi55fmUfVafQBUSHysGE2OAh7ixFkxsAr1FRnjHfeRHsPn
 fOkH2PQxBSI/5dHAvuLyZ9TMXmrcxNvqC8OX1RIh11z6ha0TOpeMjZg/dQUiElCsKJDKZW
 yKrC7cDWbYAbWWrfwRlqFarFr8qURnQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-xSsvaMC5MuGOtSdfOXrmFw-1; Mon, 21 Mar 2022 04:21:59 -0400
X-MC-Unique: xSsvaMC5MuGOtSdfOXrmFw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1876038035AC;
 Mon, 21 Mar 2022 08:21:59 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31148492C14;
 Mon, 21 Mar 2022 08:21:58 +0000 (UTC)
Date: Mon, 21 Mar 2022 09:21:55 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] target/i386: kvm: do not access uninitialized
 variable on older kernels
Message-ID: <Yjg1o3jMMYDo9rYE@angien.pipo.sk>
References: <20220320193914.111356-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220320193914.111356-1-pbonzini@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: vr_qemu@t-online.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 20, 2022 at 20:39:14 +0100, Paolo Bonzini wrote:
> KVM support for AMX includes a new system attribute, KVM_X86_XCOMP_GUEST_SUPP.
> Commit 19db68ca68 ("x86: Grant AMX permission for guest", 2022-03-15) however
> did not fully consider the behavior on older kernels.  First, it warns
> too aggressively.  Second, it invokes the KVM_GET_DEVICE_ATTR ioctl
> unconditionally and then uses the "bitmask" variable, which remains
> uninitialized if the ioctl fails.  Third, kvm_ioctl returns -errno rather
> than -1 on errors.
> 
> While at it, explain why the ioctl is needed and KVM_GET_SUPPORTED_CPUID
> is not enough.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>         v1->v2: for error condition for kvm_ioctl [Volker]
>  target/i386/kvm/kvm.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

Based on the commit message it seems that this is only for the problem
that Michal reported, right?

Because it doesn't still fix the assertion failure on my AMD box:

$  ./build/qemu-system-x86_64 -accel kvm
qemu-system-x86_64: ../target/i386/kvm/kvm-cpu.c:105: kvm_cpu_xsave_init: Assertion `esa->size == eax' failed.
Aborted (core dumped)


