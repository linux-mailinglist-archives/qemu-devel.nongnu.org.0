Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F29F405D00
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 20:49:09 +0200 (CEST)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOP6h-0003Ev-9S
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 14:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mOP3S-0001Zc-T9
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 14:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mOP3B-0004tt-TR
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 14:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631213127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlL3i7aLjbTCNV8w6dHeoPvCpP3Y0rLMHrE4Kn6x5oI=;
 b=ZOraNPqIXQjRXxBuxULpzSORwtl8xMm64RwsRENy6CqaNzVv+4Wc6sFUNj/U/P96ukkWMQ
 so5OSsnpsQmnfOLDsVZbtqpQGngh+8pQQiCsj0jnX9qDDoCsQJWXLGnWf1jgl1lJ6v9HZ9
 oJ3YReYY3bukffTNL4mAx53zHr6dv64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-BpmAA2n0MWGi-nGcYVOKCg-1; Thu, 09 Sep 2021 14:45:25 -0400
X-MC-Unique: BpmAA2n0MWGi-nGcYVOKCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C20C28B8D3F;
 Thu,  9 Sep 2021 18:45:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-181.phx2.redhat.com [10.3.112.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892105DA2D;
 Thu,  9 Sep 2021 18:45:05 +0000 (UTC)
Date: Thu, 9 Sep 2021 13:45:03 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 01/10] sysemu: Introduce qemu_security_policy_taint()
 API
Message-ID: <20210909184503.mjg37ckq3ga4fzag@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-2-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 01:20:15AM +0200, Philippe Mathieu-Daudé wrote:
> Introduce qemu_security_policy_taint() which allows unsafe (read
> "not very maintained") code to 'taint' QEMU security policy.
> 
> The "security policy" is the @SecurityPolicy QAPI enum, composed of:
> - "none"   (no policy, current behavior)
> - "warn"   (display a warning when the policy is tainted, keep going)
> - "strict" (once tainted, exit QEMU before starting the VM)
> 
> The qemu_security_policy_is_strict() helper is also provided, which
> will be proved useful once a VM is started (example we do not want

s/be proved/prove/

> to kill a running VM if an unsafe device is hot-added).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qapi/run-state.json   | 16 +++++++++++
>  include/qemu-common.h | 19 ++++++++++++
>  softmmu/vl.c          | 67 +++++++++++++++++++++++++++++++++++++++++++
>  qemu-options.hx       | 17 +++++++++++
>  4 files changed, 119 insertions(+)
> 
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 43d66d700fc..b15a107fa01 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -638,3 +638,19 @@
>  { 'struct': 'MemoryFailureFlags',
>    'data': { 'action-required': 'bool',
>              'recursive': 'bool'} }
> +
> +##
> +# @SecurityPolicy:
> +#
> +# An enumeration of the actions taken when the security policy is tainted.
> +#
> +# @none: do nothing.
> +#
> +# @warn: display a warning.
> +#
> +# @strict: prohibit QEMU to start a VM.

s/to start/from starting/

> +#
> +# Since: 6.2
> +##
> +{ 'enum': 'SecurityPolicy',
> +  'data': [ 'none', 'warn', 'strict' ] }

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


