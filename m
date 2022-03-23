Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C924E5AE2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:49:39 +0100 (CET)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8rK-0004nk-2q
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:49:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nX8pu-0003Jf-RP
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:48:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nX8ps-0005yX-AJ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:48:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648072084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I8yjyFAC6ZJ2FdL3pF43fXg7uCXfqhTfupPfV/ziaE4=;
 b=RjvIHqN5jshttkjdo7ZhQUMR+K+/+F6NSPZ1J5F0iq7vRTA/5dRXFQmQtoXCalmzpxd7Rr
 vQ6CIlIpZn3NqLpeGI/CjziZ6dLqoa3lPWlFw9n7eezBMZMWBaVY5MVulkjWvaloLi6wje
 mQ+b/ExhDHHul6mO1kONHiHBbSOdOtc=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-Bxtu6WiHPXCvufVMgMV2Fg-1; Wed, 23 Mar 2022 17:48:00 -0400
X-MC-Unique: Bxtu6WiHPXCvufVMgMV2Fg-1
Received: by mail-vs1-f70.google.com with SMTP id
 e9-20020a67c509000000b003255c4cf120so73874vsk.6
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I8yjyFAC6ZJ2FdL3pF43fXg7uCXfqhTfupPfV/ziaE4=;
 b=AejnIoKZ7phoAWANvO3cJFa8UG7HY1RyA7ITsoNqR1g4FE7HMJt0QFG4O/McA6iU3w
 d8ji8jBO+KPWdpvfBHw4yjYvdlExdlpCLB50K8SmKJHjBjXOeNepXr4yVl2ZRU4bkqdj
 jQV7G+n/WW2p4sja6R3ikuv4GqWhFEtWFFdP9UNPWkh14JSVBcfx6Jbr5Z/qQT+7wxv3
 W3v3nA3L21AEbWXmlqMWJ4ouFSh5iPlJOXq+JnYow7AGOCw+Vb8SZbrZJ2Uk8NKKmeTw
 xZdXuLGpVRQpXjMOeIQveK8hZF7RMJX7Qo7i/x+eS/PcUyFtIKONR8CzVbzkCiXV23DL
 8A1w==
X-Gm-Message-State: AOAM531kLZnv5Vriu2JY59N/ZiDLow7Tpsyr1moRGvgCZkDa+JxLBk3I
 dTwnzKy9pB6Kki21a20Wrvw3Vy88z89w8wMyzdFTplImQoxmG7Yc+MKVZ3UY7ozoGuxPYQNK4XM
 HecYUY4h0nN3FoA6KfizFRyK4xealSsM=
X-Received: by 2002:ab0:7c4d:0:b0:34f:3fc0:9b05 with SMTP id
 d13-20020ab07c4d000000b0034f3fc09b05mr1052238uaw.103.1648072079524; 
 Wed, 23 Mar 2022 14:47:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqdUVWuS/nZiQ4ydqJIQet2UOX6BFn+bbsQLdskMNJtETo4NtSn0C0RDp5dlwdrnYWZ6C9U24QJKO2+7B6KCE=
X-Received: by 2002:ab0:7c4d:0:b0:34f:3fc0:9b05 with SMTP id
 d13-20020ab07c4d000000b0034f3fc09b05mr1052221uaw.103.1648072079319; Wed, 23
 Mar 2022 14:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-2-jsnow@redhat.com>
In-Reply-To: <20220321210847.914787-2-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Mar 2022 17:47:48 -0400
Message-ID: <CAFn=p-YM8VoXLMBz4nmkvkAMH8SHa+uT=Wx9F77Q-xKrea9GLg@mail.gmail.com>
Subject: Re: [PATCH 01/10] python/aqmp: add explicit GPLv2 license to legacy.py
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Luiz Capitulino <lcapitulino@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 5:08 PM John Snow <jsnow@redhat.com> wrote:
>
> The legacy.py module is heavily based on the QMP module by Luiz
> Capitulino (et al) which is licensed as explicit GPLv2-only. The async
> QMP package is currently licensed similarly, but I intend to relicense
> the async package to the more flexible GPLv2+.
>
> In preparation for that change, make the license on legacy.py explicit.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/legacy.py | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> index 46026e9fdc..f86cb29804 100644
> --- a/python/qemu/aqmp/legacy.py
> +++ b/python/qemu/aqmp/legacy.py
> @@ -4,6 +4,17 @@
>  This class pretends to be qemu.qmp.QEMUMonitorProtocol.
>  """
>
> +#
> +# Copyright (C) 2009-2022 Red Hat Inc.
> +#
> +# Authors:
> +#  Luiz Capitulino <lcapitulino@redhat.com>
> +#  John Snow <jsnow@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2.  See
> +# the COPYING file in the top-level directory.
> +#
> +
>  import asyncio
>  from typing import (
>      Any,
> --
> 2.34.1
>

Anyone have any strong feelings on me doing this? CC'ing people with
known strong feelings on licenses.

I'm:

(1) Re-affirming that the legacy interface for async QMP is GPLv2
(like the classic QMP library is), because the interface and
docstrings here are largely copy-pasted from that library. It's
heavily remixed and modified, but it is undeniably derivative. (This
patch)

(2) Re-licensing async QMP as GPLv2+. (Next patch)

(3) Someday, eventually, adding a different sync interface that
doesn't re-mix this specific compatibility interface and will provide
better event-waiting primitives and so on. legacy.py will get dropped
at that point and the sub-project will become wholly GPLv2+. Until
then, it will be mixed.

--js


