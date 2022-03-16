Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DAE4DB580
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 16:59:29 +0100 (CET)
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUW3c-0001Qy-BD
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 11:59:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nUW26-0000Tg-4n
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 11:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nUW24-0006C7-3j
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 11:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647446270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GoECCSZ2Jg6FE5aB4qSOGx81D5EaUYCe2wX6fVd8hqQ=;
 b=f3bRSmlM8s0cax+El18GHR7kyInwr17YowNktCwvZzms27+zUm2LpYkghHVLaTW5jxsn+n
 ommp/bOAnpbuvvm+BuFv4kkoN9IdjbhyAsoj6jNbaALcBYN8Ew7gaLcn/0YKm2SAl8mIt8
 9ckfmjFZpVjurABhWGC6nVsQ6PE/M4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-Lx-_x8GOOk2h1pvIjBLPGQ-1; Wed, 16 Mar 2022 11:57:47 -0400
X-MC-Unique: Lx-_x8GOOk2h1pvIjBLPGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D73785A5BE;
 Wed, 16 Mar 2022 15:57:47 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85910401053;
 Wed, 16 Mar 2022 15:57:44 +0000 (UTC)
Date: Wed, 16 Mar 2022 16:57:39 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
Message-ID: <YjII86LKWTe0mVED@angien.pipo.sk>
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220308113445.859669-16-pbonzini@redhat.com>
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org,
 Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 12:34:38 +0100, Paolo Bonzini wrote:
> From: Yang Zhong <yang.zhong@intel.com>
> 
> Kernel allocates 4K xstate buffer by default. For XSAVE features
> which require large state component (e.g. AMX), Linux kernel
> dynamically expands the xstate buffer only after the process has
> acquired the necessary permissions. Those are called dynamically-
> enabled XSAVE features (or dynamic xfeatures).
> 
> There are separate permissions for native tasks and guests.
> 
> Qemu should request the guest permissions for dynamic xfeatures
> which will be exposed to the guest. This only needs to be done
> once before the first vcpu is created.
> 
> KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
> get host side supported_xcr0 and Qemu can decide if it can request
> dynamically enabled XSAVE features permission.
> https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target/i386/cpu.c          |  7 +++++
>  target/i386/cpu.h          |  4 +++
>  target/i386/kvm/kvm-cpu.c  | 12 ++++----
>  target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
>  target/i386/kvm/kvm_i386.h |  1 +
>  5 files changed, 75 insertions(+), 6 deletions(-)

With this commit qemu crashes for me when invoking the following
QMP command:

$ ~pipo/git/qemu.git/build/qemu-system-x86_64 -S -no-user-config -nodefaults -nographic -machine none,accel=kvm -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 90, "minor": 2, "major": 6}, "package": "v7.0.0-rc0-8-g1d60bb4b14"}, "capabilities": ["oob"]}}
{'execute':'qmp_capabilities'}
{"return": {}}
{"execute":"qom-list-properties","arguments":{"typename":"max-x86_64-cpu"},"id":"libvirt-41"}
qemu-system-x86_64: ../target/i386/kvm/kvm-cpu.c:105: kvm_cpu_xsave_init: Assertion `esa->size == eax' failed.
Aborted (core dumped)

Note that the above is on a box with an 'AMD Ryzen 9 3900X'.

Curiously on a laptop with an Intel chip (Intel(R) Core(TM) i7-10610U)
it seems to work.


