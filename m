Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC5216663
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 08:31:58 +0200 (CEST)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsh93-00082u-3N
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 02:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jsh89-0007YG-Jd
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 02:31:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30251
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jsh86-0006ml-Jp
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 02:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594103456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TIlOS+fH2+kNcT94DHPhOYCXyRnRJKOh6d8C77P+usQ=;
 b=c5jKvg+wyQPSQI1+r+zSnZxmdxUq56Albw+GeR2H2LgxIDgEELw6ZVFYaP9UU+1cgNQj/C
 Jd3MphxixiB8o57pptC8JEK/+vBlXaGwY7A0/K1WBkTagUUC42vFhKjsstOXmJpvhi9F3r
 N5thD+GddtUr0KjUVKZ1chAalJy11Kk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-pPEayNGuNOu8eeZ4Iyn7ug-1; Tue, 07 Jul 2020 02:30:55 -0400
X-MC-Unique: pPEayNGuNOu8eeZ4Iyn7ug-1
Received: by mail-wr1-f71.google.com with SMTP id j5so47593823wro.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 23:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=TIlOS+fH2+kNcT94DHPhOYCXyRnRJKOh6d8C77P+usQ=;
 b=mcWlhe3KfOg7Hxz9OvqdV4oT9SHUIqMWOs3M6ZayPniYWBFRCkT//u4rg3tNDHIA+f
 ET4Bw91YtpH1RTfD5zXlXfvzqo2rOLG3AnrFU1X+5jHl3TwhrU6ASSGNlQLpu5a0HZz/
 r5bk/i4Ok7L98sa60jAXJEh2zuCC2GflL8w0Uc5wF4R/DX8dr52JdJit8HWN3lDo/Okj
 kMH5NNCe6eBFEi0z0QzNyOfQFJka2lVTwom/VMhAODtsB/IanwijBeLMHQe3OQc7bHIQ
 qIoMsOm7pouZYjfDQnzjpoKMP7ckpxPj5O6QPX9B8uR5LpY/lk8ZVsE9gmH3PVC8qMxI
 u5eA==
X-Gm-Message-State: AOAM532iPSZL7kktrYM6dNJjofqAaxQrIJ556aAX79Wk87cQJvP2bMzV
 KEECxWLHwgWRDuFrUmoDlrhviDNggnOncdxOnKrvPxs6m9KmHRW3TXcJF9zFBqOW759pt26xh6Y
 rIB9O8AfoSF2n42E=
X-Received: by 2002:a1c:e914:: with SMTP id q20mr2429487wmc.145.1594103453866; 
 Mon, 06 Jul 2020 23:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCFzu8rL3EF8tT/iicDRq0gKBECbIBvqwbnYLBMqBmcjd7GVcQa6XLQP+4Il/1b4FJedZMQA==
X-Received: by 2002:a1c:e914:: with SMTP id q20mr2429463wmc.145.1594103453615; 
 Mon, 06 Jul 2020 23:30:53 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id f16sm2031135wmh.27.2020.07.06.23.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 23:30:52 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: update nvme entry
To: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20200706194342.1996219-1-kbusch@kernel.org>
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
Message-ID: <105bd6d0-a67b-e8d2-5a13-27e0f5c81472@redhat.com>
Date: Tue, 7 Jul 2020 08:30:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200706194342.1996219-1-kbusch@kernel.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 23:10:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/20 9:43 PM, Keith Busch wrote:
> The nvme emulated device development pace has increased recently.  Klaus
> has offered to co-maintain, and since we have many new contributions
> coming through, we're adding a repository to accumulate and test new
> features.

Thanks Klaus for helping!

> 
> Cc: Klaus Jensen <its@irrelevant.dk>
> Signed-off-by: Keith Busch <kbusch@kernel.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c31c878c63..fbeba04dc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1793,10 +1793,12 @@ F: include/hw/virtio/virtio-crypto.h
>  
>  nvme
>  M: Keith Busch <kbusch@kernel.org>
> +M: Klaus Jensen <its@irrelevant.dk>

Is that the correct email you want to use?

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  L: qemu-block@nongnu.org
>  S: Supported
>  F: hw/block/nvme*
>  F: tests/qtest/nvme-test.c
> +T: git git://git.infradead.org/qemu-nvme.git nvme-next
>  
>  megasas
>  M: Hannes Reinecke <hare@suse.com>
> 


