Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C3523AB62
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 19:11:16 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2dzX-00060s-IX
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 13:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k2dyh-0005UX-R0
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 13:10:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52760
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k2dye-0002LF-PL
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 13:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596474618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZAfq2w+PhUIjmF8i4bDwuAIZc0gnmCGnNX3Y9goVHFo=;
 b=YRrlPfUoMNdxS3ob4LUaS/dpoPJuclKV67GtijIj3hnQag+OBODdKG2z+5GNU2GE8MI1bJ
 gBvpJY6gxAscYXNaKdzYyKxegJXIuwFnMbUPGa5F60T5EJdW6+cl4VACOgJebH82GD9XIT
 +XY9olaHClGs5ztSjXUKRSQAZ7ramC8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-B2CU-C-_McKnEJvFIHjH1w-1; Mon, 03 Aug 2020 13:10:13 -0400
X-MC-Unique: B2CU-C-_McKnEJvFIHjH1w-1
Received: by mail-wr1-f71.google.com with SMTP id b8so2254192wrr.2
 for <qemu-devel@nongnu.org>; Mon, 03 Aug 2020 10:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZAfq2w+PhUIjmF8i4bDwuAIZc0gnmCGnNX3Y9goVHFo=;
 b=iVE8R67heB2IK+UhS2OiEexLbKn73Ai6VldTs49l3cM41XgY+DUENsgNJp2ZoU79p1
 rX2Z1EErw1je7qBwu8yHZ8BpSFBuxHFUjCS7rNHwd81hyCXBhFbbNFAyHyuyXEwm1AXE
 zzuwmkfr8DpgDiyty4z4Ur9Ur3XQrXYz6u1uZM7dSztU/eC2pqGEQZZDIrJrGptCdTFe
 mhVObxzq3BYNBli5y4VY6zbbcUwtoDllAv7j6vLm1jifFmp+nLIFmNgDEqyrxyedPAoj
 3HYm2oci+R6GDnBXzMU5aYBu9R10rTQi93rsiMzyzNGq0KudKAPDVHfGiAyf7lfxutGv
 3YCg==
X-Gm-Message-State: AOAM533Msg/I6+Bc6/JrpJircH4xrh+W3YE8neJ0O5R+/RyVj0TcQauc
 Kcm55bhdnpiMEoABePmFAs1uuff/xwKO97kyJOv1qH29jySJbnyWcCjVA1n2ut6CqJOmhGQdo2K
 Ih7cu2YNd8k+ST0o=
X-Received: by 2002:a1c:660a:: with SMTP id a10mr180369wmc.115.1596474612892; 
 Mon, 03 Aug 2020 10:10:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPWUHc9Z/acb+/3jJAhZwn6V5cDvBdThlBRUOqFnRbR5OKPOnxgPQs2Hcp/y+P+LjHwUOV5Q==
X-Received: by 2002:a1c:660a:: with SMTP id a10mr180350wmc.115.1596474612644; 
 Mon, 03 Aug 2020 10:10:12 -0700 (PDT)
Received: from [192.168.1.43] (214.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.214])
 by smtp.gmail.com with ESMTPSA id t13sm24926193wru.65.2020.08.03.10.10.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 10:10:12 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 1/2] hw/acpi/piix4: Add 'system-hotplug-support'
 property
To: Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200318221531.22910-1-philmd@redhat.com>
 <20200318221531.22910-2-philmd@redhat.com>
 <20200319114424.5723e777@office.mammed.net>
 <4d42697e-ba84-e5af-3a17-a2cc52cf0dbc@redhat.com>
 <20200319160800.614de5fb@redhat.com>
 <d6c0dc2f-5b0f-2e34-6c12-e9d9cd7402c6@redhat.com>
 <3f70d63d-e9ae-6676-edd5-20613b4b8856@redhat.com>
 <20200323110452.GA14031@fuller.cnet>
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
Message-ID: <f8a17eb5-7c70-4deb-82b3-54bc097dcfd6@redhat.com>
Date: Mon, 3 Aug 2020 19:10:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323110452.GA14031@fuller.cnet>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 02:37:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor, Paolo.

On 3/23/20 12:04 PM, Marcelo Tosatti wrote:
> On Mon, Mar 23, 2020 at 09:05:06AM +0100, Paolo Bonzini wrote:
>> On 22/03/20 17:27, Philippe Mathieu-Daudé wrote:
>>>>>
>>>> That 'ugly' is typically used within QEMU to deal with such things
>>>> probably due to its low complexity.
>>>
>>> OK. Can you point me to the documentation for this feature? I can find
>>> reference of GPE in the ICH9, but I can't find where this IO address on
>>> the PIIX4 comes from:
>>>
>>> #define GPE_BASE 0xafe0
>>
>> It's made up.  The implementation is placed in PIIX4_PM because it is
>> referenced by the ACPI tables.  Real hardware would probably place this
>> in the ACPI embedded controller or in the BMC.
>>
>> Paolo
> 
> Yes, there was nothing at 0xafe0 at the time ACPI support was written.
> 

Igor earlier said:
"it's already pretty twisted code and adding one more knob
to workaround other compat knobs makes it worse."

Is that OK to rename this file "hw/acpi/piix4_twisted.c" and
copy/paste the same content to "hw/acpi/piix4.c" but remove the
non-PIIX4 code (GPE from ICH9)?

This seems counterproductive from a maintenance PoV, but the PIIX4 bug
(https://bugs.launchpad.net/qemu/+bug/1835865) is more than 1 year old
now...

If someone has a clever idea, I'm open to listen and implement it, but
keeping ignoring this issue is not good.

Note there is a similar issue with the LPC bus not existing on the
PIIX, so maybe renaming this to something like "piix_virt.c" and having
someone writing the specs (or differences with the physical datasheet)
is not a such bad idea.

Thanks,

Phil.


