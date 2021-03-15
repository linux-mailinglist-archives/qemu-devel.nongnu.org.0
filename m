Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99833C514
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:02:29 +0100 (CET)
Received: from localhost ([::1]:59364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrXw-0000Xk-K0
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLrP0-0000J8-Fh
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLrOy-0004d0-Ma
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615830792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0VyC7mb0ncx9vZyTgRz0lrERwHdADo0CeX2LA1+SLLA=;
 b=DtrVTSzHAT6dRvCGsqh6t05Hq8cwtJjwLmJoSOHCl1iJCxIHQLcs1S6VbEKHwA4y0Th/+O
 SywcL0+j6BpZ43RQGT6DvqrP+u9rPnVOifRYmhlg+hdZYC1OzV/9wTERVBNKaJfGVNaJYO
 g7/f6nIx0Ub9VXDyNZ2OG/uoJp5rE7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-Y60FqUMCPSq21aLkn3VglQ-1; Mon, 15 Mar 2021 13:53:07 -0400
X-MC-Unique: Y60FqUMCPSq21aLkn3VglQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86E5B881280;
 Mon, 15 Mar 2021 17:53:06 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAEF310023AB;
 Mon, 15 Mar 2021 17:53:01 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Message-ID: <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
Date: Mon, 15 Mar 2021 12:53:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311231202.1536040-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerators names.

accelerator names

> 
> - Accelerator is an QAPI enum of all existing accelerators,

is a QAPI enum

> 
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.

Do we expand it later in this series?  If not,...

> 
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
> 
> For example on a KVM-only build we get:
> 
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "type": "qtest"
>             },
>             {
>                 "type": "kvm"
>             }

Inconsistent with the code, already pointed out in other reviews.

>         ]
>     }
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

> +##
> +# @AcceleratorInfo:
> +#
> +# Accelerator information.
> +#
> +# @name: The accelerator name.
> +#
> +# Since: 6.0
> +##
> +{ 'union': 'AcceleratorInfo',
> +  'base': {'name': 'Accelerator'},
> +  'discriminator': 'name',
> +  'data': { } }

...it feels a bit over-engineered (we can turn it into a union later
while still preserving back-compat).  On the other hand, since you are
using conditional compilation...

> +
> +##
> +# @query-accels:
> +#
> +# Get a list of AcceleratorInfo for all built-in accelerators.
> +#
> +# Returns: a list of @AcceleratorInfo describing each accelerator.
> +#
> +# Since: 6.0
> +#
> +# Example:
> +#
> +# -> { "execute": "query-accels" }
> +# <- { "return": [
> +#        {
> +#            "type": "qtest"
> +#        },
> +#        {
> +#            "type": "kvm"

Another inconsistent example.

> +#        }
> +#    ] }
> +#
> +##
> +{ 'command': 'query-accels',
> +  'returns': ['AcceleratorInfo'] }
> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
> new file mode 100644
> index 00000000000..f16e49b8956
> --- /dev/null
> +++ b/accel/accel-qmp.c
> @@ -0,0 +1,47 @@
> +/*
> + * QEMU accelerators, QMP commands
> + *
> + * Copyright (c) 2021 Red Hat Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-commands-machine.h"
> +
> +static const Accelerator accel_list[] = {
> +    ACCELERATOR_QTEST,
> +#ifdef CONFIG_TCG
> +    ACCELERATOR_TCG,
> +#endif
> +#ifdef CONFIG_KVM
> +    ACCELERATOR_KVM,
> +#endif

...would it be worth compiling the enum to only list enum values that
were actually compiled in?  That would change it to:

{ 'enum': 'Accelerator',
  'data': [ 'qtest',
            { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
...


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


