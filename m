Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0C25C165
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 14:56:05 +0200 (CEST)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDomb-0001q5-2x
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 08:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDolk-0000ut-7A
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:55:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43220
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDoli-0002qG-La
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599137709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nW2YLL6YTqwqrXOqYzrEQueyuerwCqac4JkAVTAjUJQ=;
 b=W/d7ijanMt9uU7AR3WzX92s2s9s6nV3vUXi+5trglJgMl/o1ee5NF3y/fd90n7hvccN6G+
 9sxLGlSokNy8OPWvwSMSZJOmqA2sEcLbskyn6u4bvOQlsPn8XHnMrO+DvjhEGXrQzvPKaj
 c0YM0tXVxrVHQlpP+RT0kunVaiMDxcY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-MVAocKzHO3WQJlpWMSneMg-1; Thu, 03 Sep 2020 08:55:08 -0400
X-MC-Unique: MVAocKzHO3WQJlpWMSneMg-1
Received: by mail-wr1-f69.google.com with SMTP id l15so1048034wro.10
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 05:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nW2YLL6YTqwqrXOqYzrEQueyuerwCqac4JkAVTAjUJQ=;
 b=WwPJuvOG/EjYan+ozfL3VqoaBEYMzSvBArMigjGtaSLcRfruwE/UCUYzJx3FnlpDrx
 6lqWYhbloVyaVl1P8Tk+6FHH2raWUmJ5n9jwpYq7EoGgYaxA1DKRPpqRxNWkmZoaazdP
 fNSg6r2MiCyGt1Iyd2d7a5lu7XarNEOorqvnNxdKBAdhaCODDmI3E/O3zxSmB7TuixTm
 3u37HJZMCv8mq0OJO4/qqdQNiJQqe3xBUjiLKDA6dOeO9Tjz4SYN8NCJTw/9rQEDRq+y
 M/OgwUaa8iufTVjv4vDUKZNElwq/RFruSVOl+kzD3wy8p8vfcqUQrDXFvoZilmQYWJMl
 hnNA==
X-Gm-Message-State: AOAM531hJG0Lvs1f36BSdELszwK/KceE5DOLz/2xd7kyAsD07jXlsHk+
 EsTI7mh7ePCION0Vnmln4mhkPqI/DwZfngqrettS20e8m34MI0xCRNHeq5zconThzt3tCFpEXlX
 Z71dTUgVM8kR9mw8=
X-Received: by 2002:a5d:4bc6:: with SMTP id l6mr2518882wrt.132.1599137707386; 
 Thu, 03 Sep 2020 05:55:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOTz1O1U1PHlR9iSJzqDk5pVG6vlpz08+ozbOWNtaGeQoHq93p30PLsRaFVqPHKkbqXuVMeg==
X-Received: by 2002:a5d:4bc6:: with SMTP id l6mr2518865wrt.132.1599137707233; 
 Thu, 03 Sep 2020 05:55:07 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id h5sm4648395wrt.31.2020.09.03.05.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 05:55:06 -0700 (PDT)
Subject: Re: [PATCH 24/63] scsi: Rename TYPE_AM53C974_DEVICE to TYPE_PCI_ESP
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-25-ehabkost@redhat.com>
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
Message-ID: <cb06c88c-d6e4-c951-5bcd-e0b029bdce81@redhat.com>
Date: Thu, 3 Sep 2020 14:55:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902224311.1321159-25-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/20 12:42 AM, Eduardo Habkost wrote:
> This will make the type name constant consistent with the name of
> the type checking macro.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Fam Zheng <fam@euphon.net>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/scsi/esp-pci.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
> index 2ce96dc56e..2b1198380b 100644
> --- a/hw/scsi/esp-pci.c
> +++ b/hw/scsi/esp-pci.c
> @@ -35,11 +35,11 @@
>  #include "qemu/module.h"
>  #include "qom/object.h"
>  
> -#define TYPE_AM53C974_DEVICE "am53c974"
> +#define TYPE_PCI_ESP "am53c974"

We are loosing information helpful to reviewers :(


