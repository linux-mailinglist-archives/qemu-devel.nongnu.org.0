Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8121EDF1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 12:27:44 +0200 (CEST)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvIA3-0003xf-M6
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 06:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jvI9C-0003Vj-AG
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:26:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40456
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jvI9A-0000Vz-Lm
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:26:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594722407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xh+zvtbEq76blazqEzvubzPZ0BcWE5+JJ1l+TKOqXO0=;
 b=dSaa1NX4x2MUkJxr4s7r8M2SPOUsMmBbZRyVuGxYgkOBDkoJhfAnwViPdlqEvLWInrvcQD
 5eJ/B/lxbqjVYQ3y/QUDBZ1m+qDe5ll0ZJmBW2694D6uablZi9G548CG8zkSRIcyYa6MR2
 t/rC8XPdNLjPPJEVWC5J7BEnJ8y+DMk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-lojQu0XdM26W0Ba4eXi9OA-1; Tue, 14 Jul 2020 06:26:44 -0400
X-MC-Unique: lojQu0XdM26W0Ba4eXi9OA-1
Received: by mail-wm1-f69.google.com with SMTP id z11so3250931wmg.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jul 2020 03:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xh+zvtbEq76blazqEzvubzPZ0BcWE5+JJ1l+TKOqXO0=;
 b=jeV7R/F0aTNlzshcC3ol33y7EVvnWdh/u1mpgMwpQ9T8aVQHEQ4nX6vA85zV7V2wkY
 xuhVIli1ezQOS8rcFzdHCUxZ71mW0rx0MYxD8Hei0r9/nMAlXJeHtaWb/CiknfM6UR4w
 3GQorR05bBTgzuIzdrWNfTzv5YP13oVw/8AbvbbXYhJL7NQpEcX2dGthBdtT543qn44R
 POumes5YUkWt009jBQjtenfI9dP+gGHH/jhZvIwY9JQwRqorCESt9hqdjat+FFPErUQu
 FMHcgkB8LquEOxOGNzgJsM8jtZ4A8o9jx/vqX+/Agv8HDilCcUg6j2LtKpNM+P7GGPid
 qzOQ==
X-Gm-Message-State: AOAM5309TRG8vvzWgq5cNPt10T2FLVpYOnt/Tc5ElBpMCTpW1ne6az1H
 yUldU4p2WY1uWhzbhAw4czDMHM+/Pb35htl4lYEKHZsh5WyNsQ02AYqZtJhk4N2hFNp4b76ojrf
 yK7KmkQExwuQUiWk=
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr4254446wro.126.1594722402979; 
 Tue, 14 Jul 2020 03:26:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxk78X9P+sy0U/AtVZXkOTsFDjMyCUuYTO0xjzb9/x35om3ymHOX4emL1VZwexIIrPNL0j9Q==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr4254428wro.126.1594722402792; 
 Tue, 14 Jul 2020 03:26:42 -0700 (PDT)
Received: from [192.168.1.43] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id f15sm26762735wrx.91.2020.07.14.03.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 03:26:42 -0700 (PDT)
Subject: Re: [PATCH for-5.1] acpi-pm-tmr: allow 2-byte reads
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20200714095518.16241-1-mjt@msgid.tls.msk.ru>
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
Message-ID: <464386eb-ad88-2fe8-d943-6febe511eb6a@redhat.com>
Date: Tue, 14 Jul 2020 12:26:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200714095518.16241-1-mjt@msgid.tls.msk.ru>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 21:44:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Simon John <git@the-jedi.co.uk>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/20 11:55 AM, Michael Tokarev wrote:
> As found in LP#964247, MacOS Catalina performs 2-byte reads
> on the acpi timer address space while the spec says it should
> be 4-byte. Allow 2-byte reads.

https://bugs.launchpad.net/qemu/+bug/964247 is about Unity-2D shell...

What is the target hardware used here?

> 
> Reported-By: Simon John <git@the-jedi.co.uk>
> Signed-Off-By: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/acpi/core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> I'm applying this to debian qemu package, need the fix
> faster in order to release security updates for other
> branches.
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 45cbed49ab..9be38aa2ac 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -530,7 +530,9 @@ static void acpi_pm_tmr_write(void *opaque, hwaddr addr, uint64_t val,
>  static const MemoryRegionOps acpi_pm_tmr_ops = {
>      .read = acpi_pm_tmr_read,
>      .write = acpi_pm_tmr_write,
> -    .valid.min_access_size = 4,
> +    .impl.min_access_size = 4,
> +     /* at least MacOS Catalina reads 2 bytes and fails if it doesn't work */
> +    .valid.min_access_size = 2,
>      .valid.max_access_size = 4,
>      .endianness = DEVICE_LITTLE_ENDIAN,
>  };
> 


