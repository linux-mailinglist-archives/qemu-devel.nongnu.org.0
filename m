Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F2214771
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 18:37:20 +0200 (CEST)
Received: from localhost ([::1]:50570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrlAF-00067Z-Ch
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 12:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrl9E-00052Y-O2
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 12:36:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41743
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrl9D-0004U4-8V
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 12:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593880574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SqXz38wdz/FD+LnrCe+KuV6IAZbK6L/A1oUQpL8mo44=;
 b=OE9D2gJO4RXBY9MpxpMxfvnKjoRJFGWP2j/3SM7dtXoGcU/c72Ln/Ia6wMyZ7lY79Ano4D
 6Pjqsv27zaow/JfmE7EGysCiEYBZ9Bga7e8G/lkNj+/2dJnq9ZKT20k61Hmo4rqgPAq1Z6
 fBrsO5u2HTwVBXS/bNT4Ucdu7WyS950=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-gosUtmDBMYCT2V8BWR2Bow-1; Sat, 04 Jul 2020 12:36:10 -0400
X-MC-Unique: gosUtmDBMYCT2V8BWR2Bow-1
Received: by mail-wr1-f70.google.com with SMTP id j3so16484944wrq.9
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 09:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SqXz38wdz/FD+LnrCe+KuV6IAZbK6L/A1oUQpL8mo44=;
 b=aR/dxQrbfzz+9n94MEBmTgKSzARucCavof1Y4VrleipKz8G4vSNDO/kPJeLt6GY9yr
 3ACKB3dT0t0+eTy+LEwIZYWn9H0TH7e5JgkdgwB3heQ/aHRQ1irIcjTO86MHREYvfByQ
 GKPT56ZUXOUTlNHFRGxCqAgCKAM9Usg323o4jnsPlVLRi/VVVNlVFGN5JTG2952syIJ6
 8dZY3sHFvsH4mILyzg1Rr85V2Xq1Bb6veFkcFrMXQUoD19zsGliuhVgVO3kQpV1pGCHc
 0cHUarSbaDwkIegNrpEjO67zSWaSZ/ac+/yEHRtxTT67kJuMUBpaT9oYnhWiPrE12dhL
 8nfg==
X-Gm-Message-State: AOAM5334TYmWO3YJJfRZL8SJSHzegcdiLyLcqIPvViSAt+7AkzsNVHvM
 WMrEliSe/Ctj95Kh91wQc/LJf1BlGqB4fMu1LgMeIseREjWn+okErW1HJf/4mdEBRpTg+88YEgK
 7tASNQKWW3ynMynM=
X-Received: by 2002:a05:6000:d0:: with SMTP id
 q16mr8556956wrx.166.1593880569211; 
 Sat, 04 Jul 2020 09:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwOJi6CsXPd0bz+EEZxRlnsYFe4x67mZFFceVXWJFwu9AHH7lmdGkjXYPqrDUEAhIfJcjFGQ==
X-Received: by 2002:a05:6000:d0:: with SMTP id
 q16mr8556917wrx.166.1593880568935; 
 Sat, 04 Jul 2020 09:36:08 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r11sm16595203wmh.1.2020.07.04.09.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 09:36:08 -0700 (PDT)
Subject: Re: [PATCH v11 8/8] xen: introduce ERRP_AUTO_PROPAGATE
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200703090816.3295-1-vsementsov@virtuozzo.com>
 <20200703090816.3295-9-vsementsov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <e2b4f10a-162c-ebb8-3232-381c4d820f9f@redhat.com>
Date: Sat, 4 Jul 2020 18:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200703090816.3295-9-vsementsov@virtuozzo.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:14
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, groug@kaod.org,
 armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/20 11:08 AM, Vladimir Sementsov-Ogievskiy wrote:
> If we want to add some info to errp (by error_prepend() or
> error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
> Otherwise, this info will not be added when errp == &error_fatal
> (the program will exit prior to the error_append_hint() or
> error_prepend() call).  Fix such cases.
> 
> If we want to check error after errp-function call, we need to
> introduce local_err and then propagate it to errp. Instead, use
> ERRP_AUTO_PROPAGATE macro, benefits are:
> 1. No need of explicit error_propagate call
> 2. No need of explicit local_err variable: use errp directly
> 3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
>    &error_fatal, this means that we don't break error_abort
>    (we'll abort on error_set, not on error_propagate)
> 
> This commit is generated by command
> 
>     sed -n '/^X86 Xen CPUs$/,/^$/{s/^F: //p}' MAINTAINERS | \
>     xargs git ls-files | grep '\.[hc]$' | \
>     xargs spatch \
>         --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>         --macro-file scripts/cocci-macro-file.h \
>         --in-place --no-show-diff --max-width 80
> 
> Reported-by: Kevin Wolf <kwolf@redhat.com>
> Reported-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  hw/block/dataplane/xen-block.c |  17 +++---
>  hw/block/xen-block.c           | 102 ++++++++++++++-------------------
>  hw/pci-host/xen_igd_pt.c       |   7 +--
>  hw/xen/xen-backend.c           |   7 +--
>  hw/xen/xen-bus.c               |  92 +++++++++++++----------------
>  hw/xen/xen-host-pci-device.c   |  27 +++++----
>  hw/xen/xen_pt.c                |  25 ++++----
>  hw/xen/xen_pt_config_init.c    |  17 +++---
>  8 files changed, 128 insertions(+), 166 deletions(-)

Without the description, this patch has 800 lines of diff...
It killed me, I don't have the energy to review patch #7 of this
series after that, sorry.
Consider splitting such mechanical patches next time. Here it
could have been hw/block, hw/pci-host, hw/xen.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


