Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD7C260DD4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 10:44:37 +0200 (CEST)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFZEy-000775-FH
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 04:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFZE7-0006cs-I7
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 04:43:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFZE3-0004I1-1U
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 04:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599554618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YRQMNBN8x1/N2kJst0DQOxntLdKVOgwKrpiNJXsaXqQ=;
 b=baOBEj1sIaXNAjASUoOgbBCeSP5tgZBOpA8d+UAoP+UlJbBq4K0QeSugnyljr3povt3Zvj
 DxpNIRjyK71KDXUHvAWs9ixHN4C5tM62YqLS+NgnC4uxffyZkVp9mbFlDyWksZau3sHKVa
 tsSXhi06cxRyqiZCkL8gMX7zNmI+6ys=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-524aH9CyOaKzOcMjg93KxQ-1; Tue, 08 Sep 2020 04:43:34 -0400
X-MC-Unique: 524aH9CyOaKzOcMjg93KxQ-1
Received: by mail-wm1-f71.google.com with SMTP id m25so4496778wmi.0
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 01:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YRQMNBN8x1/N2kJst0DQOxntLdKVOgwKrpiNJXsaXqQ=;
 b=Q7eu9VrCMldVTj4ORcqP2qPzWpB7ELpq8bPLPKzuc26+sIRKRkdF+Tu4YMrHs8LCFd
 VFKV1Ng9OsqgF+6+Y9LCnTZsvb8ZTcRdk89ncAUUHQiKHzwQXHat96+olaSAVuXyT0aU
 B4N6a5+UQdifoR7Is2qJK6j0cKqR9Q2U0q4KB4LJtRl8aO9c6wBhuk78BI6xNYsMlNA4
 VspF3D6IorXM5EV/BmRh+h9L2pVKROqQfmnL9XrCmVicmFVF7aiwQxUbf1LatMDLywxv
 Bszi4wFdaIyUH4/c09+uLPW73MwMaTcOvKalUttITiozovjNEDPaOgrkr20tbrlNU0Yt
 rHZA==
X-Gm-Message-State: AOAM532QFeERpgaCp9tGdNPvJRK4EdHmzvPLVgL6NIss52wU0D/DbInp
 +h0LyLZfHVd4fFZUkEq8mev1UakPIwf1oynIlbabwC84H+0HjfgfpvTB6Ii5orPhmANLee2z72A
 t7uZXzxVAr85PU/Q=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr7394544wrr.96.1599554613541; 
 Tue, 08 Sep 2020 01:43:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKIklM7O7zntCgeWCh//isQO86nr6SuEDDDHMjy5jDSXZ3nIxvPnqXtApfXfEWMTM8Wi6U9g==
X-Received: by 2002:adf:fd12:: with SMTP id e18mr7394514wrr.96.1599554613295; 
 Tue, 08 Sep 2020 01:43:33 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id n4sm32896228wrp.61.2020.09.08.01.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 01:43:32 -0700 (PDT)
Subject: Re: [PATCH] block/qcow2-cluster: Add missing "fallthrough" annotation
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20200908070028.193298-1-thuth@redhat.com>
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
Message-ID: <1ebff105-2031-7af3-5705-322c73b97f5e@redhat.com>
Date: Tue, 8 Sep 2020 10:43:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908070028.193298-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:11:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.825, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 9/8/20 9:00 AM, Thomas Huth wrote:
> When compiling with -Werror=implicit-fallthrough, the compiler currently
> complains:

Do you know what is missing to add this in configure::warn_flags?

> 
> ../../devel/qemu/block/qcow2-cluster.c: In function ‘cluster_needs_new_alloc’:
> ../../devel/qemu/block/qcow2-cluster.c:1320:12: error: this statement may fall
>  through [-Werror=implicit-fallthrough=]
>          if (l2_entry & QCOW_OFLAG_COPIED) {
>             ^
> ../../devel/qemu/block/qcow2-cluster.c:1323:5: note: here
>      case QCOW2_CLUSTER_UNALLOCATED:
>      ^~~~
> 
> It's quite obvious that the fallthrough is intended here, so let's add
> a comment to silence the compiler warning.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  block/qcow2-cluster.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index 996b3314f4..fcdf7af8e6 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -1320,6 +1320,7 @@ static bool cluster_needs_new_alloc(BlockDriverState *bs, uint64_t l2_entry)
>          if (l2_entry & QCOW_OFLAG_COPIED) {
>              return false;
>          }
> +        /* fallthrough */
>      case QCOW2_CLUSTER_UNALLOCATED:
>      case QCOW2_CLUSTER_COMPRESSED:
>      case QCOW2_CLUSTER_ZERO_PLAIN:
> 


