Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC74207301
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 14:14:18 +0200 (CEST)
Received: from localhost ([::1]:33822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo4ID-0005aL-5S
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 08:14:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jo4HQ-00058g-KG
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:13:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27092
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jo4HO-0001cZ-5L
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 08:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593000804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUi1n0qfjFSkYnlGaY4UfyiNEpwHVEdFpNe0mQI3Nao=;
 b=cst2b2gdWlncFm2XlYrSH/GeG3/fRH62jxpFB5JFteFihto/eNSEaXd3tyjRDnZLnQ24PA
 ecPnscE6TlgGFA3ErnPpVT8P/JCzWKhu3zCiYnXnoxBHiWHtnYnCybIhTqVsbnl71c1ees
 xhbWp55fRWu5niw6a2YMLJdCHSiU3v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-mntkSjrcOQKRveBdVEDYpQ-1; Wed, 24 Jun 2020 08:13:19 -0400
X-MC-Unique: mntkSjrcOQKRveBdVEDYpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5352805EE1
 for <qemu-devel@nongnu.org>; Wed, 24 Jun 2020 12:13:18 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96858891D8;
 Wed, 24 Jun 2020 12:13:18 +0000 (UTC)
Subject: Re: [PULL 25/31] osdep: Make MIN/MAX evaluate arguments only once
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200624104917.375143-1-pbonzini@redhat.com>
 <20200624105048.375353-25-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1101afa3-7523-4408-8918-265b1f2dbc3b@redhat.com>
Date: Wed, 24 Jun 2020 07:13:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624105048.375353-25-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/20 5:50 AM, Paolo Bonzini wrote:
> From: Eric Blake <eblake@redhat.com>
> 
> I'm not aware of any immediate bugs in qemu where a second runtime
> evalution of the arguments to MIN() or MAX() causes a problem, but

evaluation

> Update the MIN/MAX macros to only evaluate their argument once at
> runtime;

> Use of MIN when MIN_CONST is needed:
> 
> In file included from /home/eblake/qemu/qemu-img.c:25:
> /home/eblake/qemu/include/qemu/osdep.h:249:5: error: braced-group within expression allowed only inside a function
>    249 |     ({                                                  \
>        |     ^
> /home/eblake/qemu/qemu-img.c:92:12: note: in expansion of macro â€˜MINâ€™

UTF-8 mojibake in the commit message ;(


> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> Message-Id: <20200604215236.2798244-1-eblake@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

> +#define MIN_CONST(a, b)                                         \
> +    __builtin_choose_expr(                                      \
> +        __builtin_constant_p(a) && __builtin_constant_p(b),     \
> +        (a) < (b) ? (a) : (b),                                  \
> +        ((void)0))

This one is correct...

> +#undef MAX
> +#define MAX(a, b)                                       \
> +    ({                                                  \
> +        typeof(1 ? (a) : (b)) _a = (a), _b = (b);       \
> +        _a > _b ? _a : _b;                              \
> +    })
> +#define MAX_CONST(a, b)                                         \
> +    __builtin_choose_expr(                                      \
> +        __builtin_constant_p(a) && __builtin_constant_p(b),     \
> +        (a) > (b) ? (a) : (b),                                  \
> +        __builtin_unreachable())

...but this one should also use ((void)0), to match the commit message.

> +
> +/* Minimum function that returns zero only if both values are zero.
>    * Intended for use with unsigned values only. */

And checkpatch complains about the formatting here.

Ah well.  I had all these things fixed in my tree, but failed to post a 
v5.  Not worth holding up this pull request in isolation, but if there 
are any other build issues, I'll post a v5 of this patch, otherwise a 
followup.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


