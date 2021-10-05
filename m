Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D664230CE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 21:31:56 +0200 (CEST)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXqAN-0003tw-39
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 15:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXq6u-0001Ya-OJ
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:28:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXq6t-0004Jd-0m
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 15:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633462098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jC+1kiktBG3er4ykHLKgAl6S2jt3Yf8Jwr0nc0CkQGQ=;
 b=NhWK7aR3jtfP6wEh4BxMjDOlabPcxeAyuVuquu18QX52RyPZZTURNwrhMhf75asc/NMuKo
 1vqM1KQEC0ENd0U22ofOuV7N4ezCqZG7UqaS0t9boWh/WZqJnVrYkgTonAZg/wQ/whk08X
 nD8ZyTH3MRre0VeAbJb40BP3oKd7LZA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-_ndcDVvnP06jhNMjhFnFfA-1; Tue, 05 Oct 2021 15:28:16 -0400
X-MC-Unique: _ndcDVvnP06jhNMjhFnFfA-1
Received: by mail-ed1-f69.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso233678edt.11
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 12:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jC+1kiktBG3er4ykHLKgAl6S2jt3Yf8Jwr0nc0CkQGQ=;
 b=F4VuTDBQ4nAc7zczeC5qWIIWjp7tU7PN2NWFPbGX1YG3bLRjF0ha3JcRd5rSgCfHWr
 ywfsMXeyQPdfna2n960ugkflmVbNTNdx0TXu1wlVH76//nvhtmXS8MS4nDLVmsZRaqp0
 oXcww5PwZ1h7QSt/wldTl/7DBSv/QldIW2L9StUlsvXI7N0OTF93+0aFnQqZ2SW/xnDI
 7sL7zHgEXRR4kgFicl02GWe352OEsvGsz9m1Gez36JULVz2WrHsmEEE/i5rG4hLTbC8B
 a8CvfnxkIlve6l5PbcHy3DHzd0GuYIH3e6saeZNf8v96+Yao3rXKuXx0nIwvU45mspAK
 L9HA==
X-Gm-Message-State: AOAM530rFuW2ArIL5VyrNh3MukVxDvfljHYIOgsqk34aRgZuR2w5ineC
 cR/Ut3zm3eUM+dMvBy0KJL09KroJ5teyV+dXwAbCyyethjyvS1IR2lVmQpZuQ5ajGRzP17S10Rv
 lebk8GKBQLHjRCtI=
X-Received: by 2002:a50:d803:: with SMTP id o3mr27932272edj.91.1633462094922; 
 Tue, 05 Oct 2021 12:28:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOrAULIiwXve0cUEmuFFJG2pxv9ZC7AS3OaNaTELXqScywUDguUU7FlgGijEXOx81IaQE1VQ==
X-Received: by 2002:a50:d803:: with SMTP id o3mr27932259edj.91.1633462094737; 
 Tue, 05 Oct 2021 12:28:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l23sm8070531ejn.15.2021.10.05.12.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:28:14 -0700 (PDT)
Message-ID: <ac94f409-266a-5be6-a016-1940edfb05be@redhat.com>
Date: Tue, 5 Oct 2021 21:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH] meson.build: don't include libbpf in the common
 source set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20211005182443.2954499-1-alex.bennee@linaro.org>
 <2f0c158c-9f1e-0ab6-168d-24ec033931fd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <2f0c158c-9f1e-0ab6-168d-24ec033931fd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/21 21:00, Philippe Mathieu-Daudé wrote:
> On 10/5/21 20:24, Alex Bennée wrote:
>> This library is only needed for the softmmu targets and as such
>> break static *-user builds where libbpf is detected and it tries to
>> link it into the user binaries.
>>
>> Fixes: 46627f41b6 ("ebpf: Added eBPF RSS loader.")
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 60f4f45165..d8bcf13b21 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2307,7 +2307,7 @@ subdir('bsd-user')
>>   subdir('linux-user')
>>   subdir('ebpf')
>>   
>> -common_ss.add(libbpf)
>> +softmmu_ss.add(libbpf)
>>   
>>   bsd_user_ss.add(files('gdbstub.c'))
>>   specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>>
> 
> Patch already pending on the list:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg834876.html

Not the same patch, that one is already in.

Paolo


