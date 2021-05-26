Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D093920FB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:34:42 +0200 (CEST)
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzIf-0007o7-QT
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llzFd-0005yj-Gp
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:31:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1llzFZ-0000j2-My
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622057488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D+LuNWb/R86PfqCYfQWkUTX1fIAzSSjEXwSi/bSULZA=;
 b=PzZSxHfwA3YbJ0ncNiIRgOhd8jj+dgNA923QLTOeAtutcvMkb/XAn+N86Y8uH8yBILywSO
 IHolPjGVMTLkMLLP5+BcUGYTozMQEdg4zVojGfTgtku1W2kwtt3BBOBHr8W5Vq75hNXP/D
 zlgOAJ0NbI1C2enH2d2k30dlxJxeGjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-J7X1ltKZP2STFxjSXmmYHQ-1; Wed, 26 May 2021 15:31:26 -0400
X-MC-Unique: J7X1ltKZP2STFxjSXmmYHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74472501E3;
 Wed, 26 May 2021 19:31:25 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B96DC59440;
 Wed, 26 May 2021 19:31:21 +0000 (UTC)
Date: Wed, 26 May 2021 15:31:21 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 1/2] i386: use better matching family/model/stepping for
 'qemu64' CPU
Message-ID: <20210526193121.ie4vkxzdbqw2paet@habkost.net>
References: <20210507133650.645526-1-berrange@redhat.com>
 <20210507133650.645526-2-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210507133650.645526-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 07, 2021 at 02:36:49PM +0100, Daniel P. Berrangé wrote:
> The 'qemu64' CPUID currently reports a family/model/stepping that
> approximately corresponds to an AMD K7 vintage architecture.
> The K7 series predates the introduction of 64-bit support by AMD
> in the K8 series. This has been reported to lead to LLVM complaints
> about generating 64-bit code for a 32-bit CPU target
> 
>   LLVM ERROR: 64-bit code requested on a subtarget that doesn't support it!
> 
> It appears LLVM looks at the family/model/stepping, despite qemu64
> reporting it is 64-bit capable.
> 
> This patch changes 'qemu64' to report a CPUID with the family, model
> and stepping taken from a
> 
>  AMD Athlon(tm) 64 X2 Dual Core Processor 4000+
> 
> which is one of the first 64-bit AMD CPUs.
> 
> Closes https://gitlab.com/qemu-project/qemu/-/issues/191
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/i386/pc.c      | 6 +++++-
>  target/i386/cpu.c | 6 +++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 364816efc9..35d7a8122a 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -96,7 +96,11 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
>  
> -GlobalProperty pc_compat_6_0[] = {};
> +GlobalProperty pc_compat_6_0[] = {
> +    { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
> +    { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
> +    { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },

I wish we could have done this using a new CPU model version, but
the new version wouldn't be very useful unless the default CPU
model version to CPU_VERSION_LATEST[1], so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

[1] We still can't do that without breaking libvirt expectations
    about machine types.

> +};
>  const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
>  
>  GlobalProperty pc_compat_5_2[] = {
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ad99cad0e7..99caa3deae 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1881,9 +1881,9 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .name = "qemu64",
>          .level = 0xd,
>          .vendor = CPUID_VENDOR_AMD,
> -        .family = 6,
> -        .model = 6,
> -        .stepping = 3,
> +        .family = 15,
> +        .model = 107,
> +        .stepping = 1,
>          .features[FEAT_1_EDX] =
>              PPRO_FEATURES |
>              CPUID_MTRR | CPUID_CLFLUSH | CPUID_MCA |
> -- 
> 2.31.1
> 

-- 
Eduardo


