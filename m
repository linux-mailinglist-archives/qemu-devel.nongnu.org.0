Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C183927FF9D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 14:57:55 +0200 (CEST)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNy9i-00072d-K6
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 08:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNy8W-0006FL-3Q
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 08:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNy8S-0004UF-He
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 08:56:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601556995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0ejfwj+8RHQ1RX1wZ5SqTiwp7wSwR9ydNoNW0mip0tU=;
 b=BSR0bw07s5ghptfXlWk3RVieJoqOiL+bSRvsgFvkWXIOJcehGVpUtl0smagLaUwWnihUHO
 hzB8ik+NjvimVA/fDfx2mnAKkJz2G+5XBzB+w0gSVld5sLQ+HzlN7YARQZUDbSamBlPPDe
 eGYC3hmOS63CEzLvt9cZCSYmrEn342E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-VLQrXaUcOfiP3GKoYbWZPQ-1; Thu, 01 Oct 2020 08:56:33 -0400
X-MC-Unique: VLQrXaUcOfiP3GKoYbWZPQ-1
Received: by mail-wr1-f72.google.com with SMTP id a2so2011010wrp.8
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 05:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0ejfwj+8RHQ1RX1wZ5SqTiwp7wSwR9ydNoNW0mip0tU=;
 b=XZawh227uHVSBqFMamdxqqJhYdwvcVwMn1KhAAMXooTnp39iHGmcuB1n7pX6agDC3h
 O0ARB55NoWiw5p70t+gpJwVYBFZ9q0pb506r+F/E9nIAQms91jtekvtunWCT2TDvf+Kr
 k1vlbixs27rG57Q261ctgMG2jm5OF9NBEBBvRt49ydy7x2VXOzuqI5t1EJCkez5VNumq
 LFeQfA9HEIUvbgA34WRTtsIkUEXeMN0h4v+xdoZjUkLtFNb//EMg3N6LmHGBOOJqNdGY
 2CF+gm86RpBZ38wwYdjnEgzJrurvKha3RgBggvAepYhIJWGWOp1HqhA9kS4XGjbzNAbE
 Affw==
X-Gm-Message-State: AOAM530fJ8hdubGXKtwDVr8gUoc933cQbB+X1gtqshu5fBDmPmubxVRf
 jnKfTkqjcAD/qNnVmIGXlqSFxAw6Ve3G4vxj0NoUgvm0SLTR5mYdi/+ekhDU4GPGC+oeS8wDDPS
 b2m7yAo6+XQnnLg8=
X-Received: by 2002:adf:f58b:: with SMTP id f11mr8830151wro.250.1601556992291; 
 Thu, 01 Oct 2020 05:56:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr6DlEb2pHfrBDonVZD8Q7wIQTZzUa2fYu/rnhErJnd+LryZDx//qMxw2ckR0kwL7cUGBVzw==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr8830112wro.250.1601556992055; 
 Thu, 01 Oct 2020 05:56:32 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id d6sm9439143wrq.67.2020.10.01.05.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 05:56:30 -0700 (PDT)
Subject: Re: [PATCH v3 00/11] user-mode: Prune build dependencies (part 3)
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200930164949.1425294-1-philmd@redhat.com>
 <20200930171529.GR3717385@habkost.net>
 <0c46bedf-9aa6-4ea9-40e1-b0f85a767bb5@redhat.com>
 <20200930172711.GU3717385@habkost.net>
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
Message-ID: <ea6f1c00-1d3f-b252-d274-9407e58f607a@redhat.com>
Date: Thu, 1 Oct 2020 14:56:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930172711.GU3717385@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.26, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/20 7:27 PM, Eduardo Habkost wrote:
> On Wed, Sep 30, 2020 at 07:24:24PM +0200, Paolo Bonzini wrote:
>> On 30/09/20 19:15, Eduardo Habkost wrote:
>>> On Wed, Sep 30, 2020 at 06:49:38PM +0200, Philippe Mathieu-Daudé wrote:
>>>> This is the third part of a series reducing user-mode
>>>> dependencies. By stripping out unused code, the build
>>>> and testing time is reduced (as is space used by objects).
>>> I'm queueing patches 2-9 on machine-next.  Thanks!
>>>
>>> Markus, Eric: I can merge the QAPI patches (1, 11) if I get an
>>> Acked-by.
>>>
>>> I'll send separate comments on patch 10.
>>>
>>
>> 1-8 is fine, but I think 9-11 is too much complication (especially not
>> really future-proof) for the benefit.
> 
> I'll dequeue patch 9 while this is discussed.
Please also dequeue 1 :(

Markus hasn't sent negative comments on 2-8 so these should be OK.


