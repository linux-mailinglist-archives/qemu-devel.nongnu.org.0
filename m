Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E283422C258
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 11:33:52 +0200 (CEST)
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyu5P-0001mk-E1
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 05:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jyu4L-00016L-Kl
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 05:32:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32955
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jyu4I-0007Sa-Ab
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 05:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595583160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aan701PP+nodsJ7P3ZpZuOl4fTCE2/rpzlhyqmP9qwU=;
 b=E7TLCfkBpMbROsHtqg/NqRGk/4Fm7e72kB8aWrolh2EhCjv6kLqbZBViSqSrZxIEv/Y05x
 Mi+Tg4IFuEzNe723wz5EFfJEIPn8I1FMYjfkiw1okVhnrs+23as5omxXK6EjZTlJqqomZY
 GgQZj++EtBWess60GRuEn2vzpBJaNGM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-Rdr-oXi3NtiwVPsLa257dA-1; Fri, 24 Jul 2020 05:32:35 -0400
X-MC-Unique: Rdr-oXi3NtiwVPsLa257dA-1
Received: by mail-wr1-f69.google.com with SMTP id z1so1988277wrn.18
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 02:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aan701PP+nodsJ7P3ZpZuOl4fTCE2/rpzlhyqmP9qwU=;
 b=QP0/uQy9M1DYHa7OV8/m2XAQZ9AQziD2TxxZ4Ew+MDFrZvUztKeyOCUQx4UIbKQouE
 TPDDD7rD0V2vVqCkhAl/W3GVWIbOt0xJQhwCtTtt/kV1Tw0xV8jLpDTdCSspl1KmikO+
 b2HuFlVu4jHABI/TSZAUb+X+49Nlt2Neq7xCbLkCQnXKOj04DEB/dY/5GAw/M2ouJn7K
 60+cegzEgL1hW4I3mA5ggQGdFDD0OBawj6UUFPlbR5Gp/q7LnsVB8Zq6XGxalDdyBIPu
 AWAVw98WdUynutzOcYzYUm3gqK/92NRbeXdT76q+p3QIHNkwF+pIBS8VTzjN+LGIh68J
 Oy4w==
X-Gm-Message-State: AOAM531XbZ/p3xOrq7pUqyA7y/ZbjSNHDIphsbKI+OtiD7/mu1+2kzym
 1QM8zviVyL1+j4jZf/CJYramUsK/5B9rCCePTa53se8DkuXBX2CXYUZNT84KcbO0zI58Sv2gZOc
 0Dgp5U/DXft2yqFw=
X-Received: by 2002:a7b:ca52:: with SMTP id m18mr7856095wml.92.1595583154198; 
 Fri, 24 Jul 2020 02:32:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUbJyYjYRsb+KP9ERnsCV9Urywkf2gmCTSZDusnA3S39f5bV2ArD1zHPS8zA+I0AOyfCG7sg==
X-Received: by 2002:a7b:ca52:: with SMTP id m18mr7856079wml.92.1595583153984; 
 Fri, 24 Jul 2020 02:32:33 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id t141sm6663710wmt.26.2020.07.24.02.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 02:32:33 -0700 (PDT)
Subject: Re: [PATCH for-5.1] iotests: Select a default machine for the rx and
 avr targets
To: Max Reitz <mreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20200722161908.25383-1-thuth@redhat.com>
 <4224587f-2d68-53a4-5ff4-ac3d6279a29b@redhat.com>
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
Message-ID: <f471c61f-1a87-5bf4-2e6c-e504d5493bff@redhat.com>
Date: Fri, 24 Jul 2020 11:32:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4224587f-2d68-53a4-5ff4-ac3d6279a29b@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 01:23:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Max/Kevin,

On 7/24/20 10:24 AM, Max Reitz wrote:
> On 22.07.20 18:19, Thomas Huth wrote:
>> If you are building only with either the new rx-softmmu or avr-softmmu
>> target, "make check-block" fails a couple of tests since there is no
>> default machine defined in these new targets. We have to select a machine
>> in the "check" script for these, just like we already do for the arm- and
>> tricore-softmmu targets.

I guess remember I already asked on IRC but can't find the log,
so better ask again on the list.

Why can't we use the 'none' machine for the block tests? What
part of the machines is required? I was thinking maybe busses,
but apparently not (example with these 2 machines).

Thanks,

Phil.

>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  tests/qemu-iotests/check | 14 +++++++++-----
>>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> Thanks, applied to my block branch:
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
> 


