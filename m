Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DD92404DC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 12:39:21 +0200 (CEST)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k55D6-00051R-V8
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 06:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k55C4-0004MT-6X
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 06:38:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56305
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k55C2-0003LM-Jw
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 06:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597055893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DXoeQG0IWPG6Fy9kWkC4d0OyliokJLddzZuUyEVqTDU=;
 b=LU/v2FqQVBME5RdTnaegFrWf/LtmNeXL9299ekHaS+XSoEd9uLl0Z55sAIacNwRENrQ8ju
 vVGj9AJxqCQdEuHIoFogFVxbEAgK+tw8brXoaMCVcMyiiGULjhojUgYFgUDBCC3gq198KI
 xTYhFUsBIot0nR8eETOdldTSW441j+E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-5tdr5-s6Ppy5qfSG0Lq9fQ-1; Mon, 10 Aug 2020 06:38:12 -0400
X-MC-Unique: 5tdr5-s6Ppy5qfSG0Lq9fQ-1
Received: by mail-wr1-f71.google.com with SMTP id e14so4023632wrr.7
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 03:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=DXoeQG0IWPG6Fy9kWkC4d0OyliokJLddzZuUyEVqTDU=;
 b=ivF2GP+AKq0As5uffCnloPvCEQM72ugsYGY2QDuQ7lvUCt3mSeaAtkfXGHoPwU8suz
 ry94cCv1WuDdFy5kuqfzN/UKx/JVcWIN+6/imRUW3F71gaIFY2Uqr7fvjNbgK86vzg2O
 0yySkN1XldBnFyBMMs5ONfn3YydlNpgSS2szGDpX3P2VNz+PYj+avBTPk8Jxg7pNIqvj
 sPM3VBu8vYOeIJhwSRUk0wXv/VdAhd98RHM0etUUrmzcKyWFhvAgSlu3OVDq5B3ad+wE
 zVw30ftqSG6pUNZOdRwzoAguRePaxytnonXZ3HU/fZkhuoeJ5Z4lAr8BkypSUVAtC1/U
 O+ww==
X-Gm-Message-State: AOAM531inNM01Zaz+U2j4pj1+Ot3yCQmzCexk3PZLgSsOEkuMdBWDaXJ
 AvqKdrSjJPqWsPQaUSuQIs4vQQUhTtkAzMCsiL8R8CKNz3hd257lArRs3SUJmKnDx69J715pxQw
 +FpU9jn0L0eevyiI=
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr24621548wmh.136.1597055890799; 
 Mon, 10 Aug 2020 03:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSJeLQJVculz2cDwvgUN4UAwagP1VzEqDLUrJ0GZUYulSvcMJsXXaaXVknLfl57s3epSo13g==
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr24621536wmh.136.1597055890576; 
 Mon, 10 Aug 2020 03:38:10 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id r206sm20979060wma.6.2020.08.10.03.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 03:38:10 -0700 (PDT)
Subject: Re: [PATCH] docs/system/s390x: Add a chapter about s390x boot devices
To: Cornelia Huck <cohuck@redhat.com>
References: <20200806150507.12073-1-thuth@redhat.com>
 <20200810121847.5ab4e227.cohuck@redhat.com>
 <d94f794a-1fb0-2251-38c2-7828f8cb8d9b@redhat.com>
 <20200810122945.773f0349.cohuck@redhat.com>
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
Message-ID: <2c5eadf9-5a2f-7e1c-938e-6cfd8dbb1958@redhat.com>
Date: Mon, 10 Aug 2020 12:38:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200810122945.773f0349.cohuck@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 05:06:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/20 12:29 PM, Cornelia Huck wrote:
> On Mon, 10 Aug 2020 12:20:53 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 8/10/20 12:18 PM, Cornelia Huck wrote:
>>> On Thu,  6 Aug 2020 17:05:07 +0200
>>> Thomas Huth <thuth@redhat.com> wrote:
>>>   
>>>> Booting on s390x is a little bit different compared to other architectures.
>>>> Let's add some information for people who are not yet used to this.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>  docs/system/s390x/bootdevices.rst | 82 +++++++++++++++++++++++++++++++
>>>>  docs/system/target-s390x.rst      |  1 +
>>>>  2 files changed, 83 insertions(+)
>>>>  create mode 100644 docs/system/s390x/bootdevices.rst
>>>>
>>>> diff --git a/docs/system/s390x/bootdevices.rst b/docs/system/s390x/bootdevices.rst
>>>> new file mode 100644
>>>> index 0000000000..68f0ffd450
>>>> --- /dev/null
>>>> +++ b/docs/system/s390x/bootdevices.rst
>>>> @@ -0,0 +1,82 @@
>>>> +Boot devices on s390x
>>>> +=====================
>>>> +
>>>> +Booting with bootindex parameter
>>>> +--------------------------------
>>>> +
>>>> +For classical mainframe guests (i.e. LPAR or z/VM installations), you always
>>>> +have to exactly specify the disk where you want to boot from (or "IPL" from,  
>>>
>>> s/exactly/explictly/ ?  
>>
>> Or "to explicit the disk ..."?
> 
> Hm, not sure what that means?

Sorry I thought it was a verb, but the verb is explicitize.

"to explicitly specify" sounds good (typo fixed).


