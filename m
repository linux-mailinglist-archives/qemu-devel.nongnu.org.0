Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5FE24A313
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 17:29:00 +0200 (CEST)
Received: from localhost ([::1]:44304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Q1L-0006Cw-QP
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 11:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8Pzr-0004Qj-TT
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 11:27:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56656
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8Pzq-0000xu-4U
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 11:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597850845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=F9GK7ZmZtHRJs5v+cqBEq7hL863rx3yBY2CvvPbti1g=;
 b=LqXf3vbWn5VvfUSlW+PXzD1maPrBsUWEpEj5DX4GASbrmkdzEv3LRZnKGBQW2Ump2XYasB
 4nUz5J1TRJ6KKJDLVJ1Ekg7uc71nohYby8PCiHCYeK6vHRlY6v2x3/CC/55On7vF5KRsWV
 44HsaQvdH/PqdnVrRrscDq6tgVfVFJo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334--aoP9fdmMmmg3lFcEXvLLQ-1; Wed, 19 Aug 2020 11:27:20 -0400
X-MC-Unique: -aoP9fdmMmmg3lFcEXvLLQ-1
Received: by mail-wm1-f71.google.com with SMTP id z10so1049888wmi.8
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 08:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=F9GK7ZmZtHRJs5v+cqBEq7hL863rx3yBY2CvvPbti1g=;
 b=HlOYdDqtRu5TYWUDZAf4P4s87c2k9O/dUsOGZ+puUV9sFyiHtqpCW6AqZPNA2RlJRI
 6+M7/brfmJA4j9RLVZUi5MtQ0m9Qmwp9JrGcfWjpVJPG+S0PmBg84+xh+AGPQF/WtPtF
 eZT8H1L4KnEOCELkflv8UGLXRjEdWX1FaWeCkZV6LhM4mg4gSO55GDDnUofm5ccB5gHe
 w7cORm5cyAV+sI9CXRzxtweuXCmG66exmrDYKOmzPQWHTSiJ4hBvUm76B2StEuCcA2gL
 SzQcwSXvjuKSfy2wBefYlLCB5QYi6X/0bgM/IUDKSlHxsDwIT2M3hJyO1USHOW05HhTx
 +5zw==
X-Gm-Message-State: AOAM532t+9sIDRTbHyESq1fK25mFq+hYFBDOu2+UZ/KPl32wsFDESBjl
 /AP/Ecy2hHkku8rxMn0mTUNaWr77skDOjG9SUImNfYlizv6sPWiv42QMOESsdbUq+lYZZznKcGv
 SW0xNPB9HJgc2CyQ=
X-Received: by 2002:a5d:4b0c:: with SMTP id v12mr4586403wrq.199.1597850839656; 
 Wed, 19 Aug 2020 08:27:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWl2ujjtGV+DPthgLlEwfec/b2LCcS+dQ6OzIDl+wmuOsRB+QSJaYFy+xDV6Ot7z7AZo6QQw==
X-Received: by 2002:a5d:4b0c:: with SMTP id v12mr4586362wrq.199.1597850839389; 
 Wed, 19 Aug 2020 08:27:19 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id w1sm5787064wmc.18.2020.08.19.08.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 08:27:17 -0700 (PDT)
Subject: Re: [PATCH v6 2/7] hw: add 5.2 machine types and 5.1 compat options
To: Laszlo Ersek <lersek@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
 <20200818143348.310613-3-stefanha@redhat.com>
 <20200818171132.551e2c72.cohuck@redhat.com>
 <20200819141259.GD366841@stefanha-x1.localdomain>
 <96e4819a-1570-9b38-90eb-0c7bac2016e7@redhat.com>
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
Message-ID: <b0456491-9093-722e-ea91-3fcf2ab441f0@redhat.com>
Date: Wed, 19 Aug 2020 17:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <96e4819a-1570-9b38-90eb-0c7bac2016e7@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:05:17
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
Cc: Kevin Wolf <kwolf@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Max Reitz <mreitz@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/20 4:38 PM, Laszlo Ersek wrote:
> On 08/19/20 16:12, Stefan Hajnoczi wrote:
>> On Tue, Aug 18, 2020 at 05:11:32PM +0200, Cornelia Huck wrote:
>>> On Tue, 18 Aug 2020 15:33:43 +0100
>>> Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>>
>>>> arm, i386, ppc, and s390x have versioned machine types and associated
>>>> compatibility options. Introduce new ones now that QEMU 5.1 has been
>>>> released.
>>>>
>>>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>>>> ---
>>>>  include/hw/boards.h        |  3 +++
>>>>  include/hw/i386/pc.h       |  3 +++
>>>>  hw/arm/virt.c              |  9 ++++++++-
>>>>  hw/core/machine.c          |  4 ++++
>>>>  hw/i386/pc.c               |  4 ++++
>>>>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>>>>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>>>>  hw/ppc/spapr.c             | 15 +++++++++++++--
>>>>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>>>>  9 files changed, 73 insertions(+), 6 deletions(-)
>>>
>>> https://lore.kernel.org/qemu-devel/20200728094645.272149-1-cohuck@redhat.com/
>>> is already out there :)
>>
>> You're too quick! :)
>>
>> Next time I'll write a script and monitor qemu.git for the release tag
>> so I can be first!!!!!!111
> 
> You're joking, but a template patch or some other automatism that opens
> the next development tree *BY* introducing new machine types would be
> nothing to frown at.
> 
> Another option would be for Peter to delay opening up the next
> development tree until he could immediately merge a patch with the new
> machine types (posted by whoever, near the end of the HFF or something).

Or this can be the "Open the tree for development" first patch :)

> 
> Thanks
> Laszlo
> 
> 


