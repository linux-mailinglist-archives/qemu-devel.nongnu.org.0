Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D1C260D8B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 10:28:21 +0200 (CEST)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFYzE-0007Ll-Ha
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 04:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFYyT-0006wA-PB
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 04:27:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kFYyR-0002MJ-QB
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 04:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599553650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=QoTfp4MxP2aMlwr2l8nQkCY6YxJDAG9o94vkNeZ9GE4=;
 b=iRfSGVf5iDDqKCoOzlfc3Gdt4sZuliUMm3V4PWWiONvs9j8bz7/i6B7oxeNEMr3+vnGP/G
 nFZDqGpthuuNcaPpVHFhAInPPiX2CCVAqiI6NOm4YXYS13cw005kuJOFlQ5ODmlPuZFV3o
 qM6WlSury4WrdYZ5fWqfNdaTtGJDXIY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-FLi-wyc3N9uHjVFfFuoS6A-1; Tue, 08 Sep 2020 04:27:28 -0400
X-MC-Unique: FLi-wyc3N9uHjVFfFuoS6A-1
Received: by mail-wm1-f70.google.com with SMTP id m25so4482290wmi.0
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 01:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QoTfp4MxP2aMlwr2l8nQkCY6YxJDAG9o94vkNeZ9GE4=;
 b=SbGOZ7MAsxVuXay52S/sBjkyqh+LlBnsgbFV8lbFxbhzBxgoxptXGBj/8jZIWA6iZq
 LovpeFS2oylYUSKfQ1aIN3W5UlLWJoMsmOIgriT4YJV+b07i1c7+gi3qtQRYU68TzOJP
 wYV57OaMYicBdGN08lv/emWZ/skw8FThPVhfD+4Ufy2H5xeE7lXRvdXALJYcar8Pqfnj
 KIGVOTdxOLZq6gmgMQlODNWxlIFTUo7Rq5u+QU2aU/eLqHOtTl3Wnwp+kNpOpm17a8m0
 hfJV3edrJGPHbDWuT2D5bLYDErNzVBYop1DZAi+lPaZmRA1HN1v3VjeKNhGzpE8RyCXC
 qGYA==
X-Gm-Message-State: AOAM5308cHy/ypw+eHTlUPF08WCMBJi2VoTbhOXvQNcGJ7/jOxJB6H2n
 esAVFpRuKhB6o057zk8P18BV1+IR+eiVQxvRFI5J/07Ezcoa6B/SbvKe2wn5RxWxsV6xGZl/so8
 z35tvOm9dOEWFvO8=
X-Received: by 2002:adf:e488:: with SMTP id i8mr7211186wrm.116.1599553647728; 
 Tue, 08 Sep 2020 01:27:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb20R8AyM86CiMJvgDssigljcrXfpsMNaNy31aHXwxYGo00doTKq0j2jmvIm8vCg8PD6hdVA==
X-Received: by 2002:adf:e488:: with SMTP id i8mr7211172wrm.116.1599553647581; 
 Tue, 08 Sep 2020 01:27:27 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id g2sm31959116wmg.32.2020.09.08.01.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 01:27:27 -0700 (PDT)
Subject: Re: [PATCH 10/10] tests: acpi: update "virt/SSDT.memhp" for
 edk2-stable202008
To: Laszlo Ersek <lersek@redhat.com>, qemu devel list <qemu-devel@nongnu.org>
References: <20200908072939.30178-1-lersek@redhat.com>
 <20200908072939.30178-11-lersek@redhat.com>
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
Message-ID: <843298f0-049f-b67d-8497-39bd2f00ab11@redhat.com>
Date: Tue, 8 Sep 2020 10:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200908072939.30178-11-lersek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.825, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/20 9:29 AM, Laszlo Ersek wrote:
> The NVDIMM_ACPI_MEM_ADDR dword in "virt/SSDT.memhp" needs an update due to
> the firmware now allocating NVDIMM_DSM_MEM_FILE at a lower address.
> 
>>          }
>>      }
>>
>> -    Name (MEMA, 0x43DD0000)
>> +    Name (MEMA, 0x43D10000)
>>  }
>>

What about also adding (with adapted SHA1):

This reverts commit 120219eef8a ('tests: acpi: tolerate
"virt/SSDT.memhp" mismatch temporarily').

> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Ref: https://bugs.launchpad.net/qemu/+bug/1852196
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  tests/data/acpi/virt/SSDT.memhp             | Bin 736 -> 736 bytes
>  2 files changed, 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index e569098abddc..dfb8523c8bf4 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/SSDT.memhp",
> diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
> index db61d6733284..375d7b6fc85a 100644
> Binary files a/tests/data/acpi/virt/SSDT.memhp and b/tests/data/acpi/virt/SSDT.memhp differ
> 


