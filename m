Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D124676C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 15:37:03 +0200 (CEST)
Received: from localhost ([::1]:52490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7fJs-0001bV-PF
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 09:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k7fJ3-0001A7-S0
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 09:36:09 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51060
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k7fJ0-00076d-Re
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 09:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597671365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SdGeddxCsUjs/rLzHwPEQuzcDIDzSYlSxaaSCwwnASE=;
 b=BVjchvEjFMzA/QiVcQCHY83fviSko6WfoU6SUXGO4jWLf80fLnLo/KTqY2qHSNBE5oWDPs
 +gekSQWLbCE1JpHFrxKX9nL4+OkjEMWKSiahyNN0sySW9EM6Y0L2hIxJNh+aCM3q7rJ4hT
 DeE6nxRKXBGixD/v04ArkfbDSlpVSXs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-AWsIlwffNU2aYa5xIxU6jw-1; Mon, 17 Aug 2020 09:36:04 -0400
X-MC-Unique: AWsIlwffNU2aYa5xIxU6jw-1
Received: by mail-wr1-f69.google.com with SMTP id t3so7075296wrr.5
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 06:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SdGeddxCsUjs/rLzHwPEQuzcDIDzSYlSxaaSCwwnASE=;
 b=nGtd+QKR6DrnE50NXmEK56Fimp9GGPI1Zm6EO4Y+mBMj7Xn278boF/DXUGyzwQ7Z8T
 rtEA2zH7OsSZu4L5ts3fRYIxyOrgIw66Lwe4/fB+RW9SEwGq8YldK5fXjhbW1qKQUxeX
 gCueBvyfKm6vZQzzQ2dB08eAZysdoXMbkkoYLWGgjnUxohuWZkTKTJWrvM7T6rI8E/Hr
 9GBvnDUC+p9difMezMRJbOktkb61yzQUf8czdexQsc2D1pxgdb/GEKSt4xoy7wbE7FpP
 1GLwvZl3NwFME0UbkYbBMqCW3uV+56xn5QreT4OMfLLlsHlrC6w52HW86ajB/x0l8zWM
 YHAQ==
X-Gm-Message-State: AOAM532TXuPumFuynVqO5bi9ZosR56/EzY5ATIm+FbjVhzNnwwKYV1rN
 NN37Vwu0JV/5O9KGEVL1xkxa8vqiyMN1+TNG3gshJb/kLOJOWSZqKzyPhgMRh7tmWYSXiEveK9m
 rIdO2oqxsJxNeGqY=
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr15301732wrx.354.1597671361672; 
 Mon, 17 Aug 2020 06:36:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJCVfImP9MHjShgFwjjGpHuK9DgU2aPLRjiTWGKHpCL/p6lMs0UJxe+aAuq3Adi6mATPkYQg==
X-Received: by 2002:a05:6000:120c:: with SMTP id
 e12mr15301716wrx.354.1597671361465; 
 Mon, 17 Aug 2020 06:36:01 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id v8sm30288583wmb.24.2020.08.17.06.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 06:36:00 -0700 (PDT)
Subject: Re: [PATCH v2 000/150] Meson integration for 5.2
To: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <20200814091326.16173-1-pbonzini@redhat.com>
 <20200817110254.GA98227@SPB-NB-133.local>
 <f8a9f236-7017-01a7-0a6d-06a2e18f95f1@redhat.com>
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
Message-ID: <44308a0f-8f09-84c9-fb59-bbb0bb580e1b@redhat.com>
Date: Mon, 17 Aug 2020 15:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f8a9f236-7017-01a7-0a6d-06a2e18f95f1@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/17 00:24:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 1:24 PM, Paolo Bonzini wrote:
> On 17/08/20 13:02, Roman Bolshakov wrote:
>>
>> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>
>> On the next step, it might be good to drop configure in favor of meson
>> configuration, so configure, build and test commands would be similar to
>> libvirt:
>>
>> meson build
>> ninja -C build
>> meson test -C build
> 
> Well, there are quite a few steps needed to get there:
> 
[...]
> 
> 2) moving the rest of "make install" to Meson is even more of a
> no-brainer.  Marc-André has patches there.  They also include a
> conversion of the ROM build.

There was a discussion last year, IIRC QEMU isn't supposed to build
ROMs, the repositories are provided for the source code and licenses.

QEMU might provide a compiled ROM and describe in the commit how it
was built, but isn't responsible of providing buildsys to build all
the roms jungle.

Maybe its time to say "we kept that up to now, let's make a change".

Thoughts?


