Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7096433D43B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:51:29 +0100 (CET)
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9AW-0003io-Fw
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM99A-0003HS-Af
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:50:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM998-0004Tq-NK
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615899002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6gJ6lDP82zWTItJ7E+Q8bG74Sl+AFGFXeVIizf4u50=;
 b=VrJDTKHmkwXq8IjydXRkcoFnzl/pDpNFiNkfcGpw8LCK51i0sWlWwVLi2hs3vH4rtnOlJo
 7CWi/xzZr5KBMm/cSZzUDZ3U3kdMC/aepag3OaFSYY3LSTIIb1s4xwgl6ZrYCPP+epc0fl
 yHX1jbv5MAcQN5zVhlzVOlQbRJdosy0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-TXOlI4ksP1iHLUKwKY7RTw-1; Tue, 16 Mar 2021 08:50:00 -0400
X-MC-Unique: TXOlI4ksP1iHLUKwKY7RTw-1
Received: by mail-wr1-f71.google.com with SMTP id 75so16489892wrl.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g6gJ6lDP82zWTItJ7E+Q8bG74Sl+AFGFXeVIizf4u50=;
 b=kG1yVbrbzoNXwuy0bhJLqPM8tLJrDkF+8nJ+Z5rsJnvv4dU1V84H1qeIzNY6Mkaf13
 8eOjj7EfT0//KOVZuMT2Oab+EClmfrNafmOSk/EJXCE8eZBiTneM81Ts4VFl7g0YbYFl
 om4Tz0x0AEZk05qBKbWA1172gIyqkF165Na2+d9hyvxaTkHlFRxWktRVCgH+T0Uf6jM4
 GEM9pd0Ke85UV8tRmsv8elYROWv+OGrGJPKykPvSRtP9KSzxb0r72KzrY0TNqFfMOpna
 lKw6ThWj5wDBVzvsZEtBgVGplEEHhGg6oDZxuox8Ttz2JjxdBP5OdbKCkgKqbVnKk+Zl
 zHkA==
X-Gm-Message-State: AOAM531RnJEUweN5K/UinAUGfWjjD6sc4TBvNSDGQPBngbVIhPhjzfn6
 z5yb2/5CmNVijOSuquWFgIe9kE5q6njOeXv/u8eZC02eHKk8rK2mZy4a8sh1M3n1TM0Q6VQqt/2
 C/FHHlplan0BBItlFiv+oCYbnfVnfOED5VeA22/hjaWwlwgbpllieFapnEO5+RycPgS8=
X-Received: by 2002:a5d:4688:: with SMTP id u8mr4733227wrq.39.1615898998977;
 Tue, 16 Mar 2021 05:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIv+X7umhegw/W2ekhB1671nzPR/xwMITgi20A4OyCf6vR5vcGgBz4SaWUOyJTuhtPYReQig==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr4733206wrq.39.1615898998764;
 Tue, 16 Mar 2021 05:49:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k24sm2881465wmr.48.2021.03.16.05.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 05:49:58 -0700 (PDT)
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
To: Igor Mammedov <imammedo@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com> <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316015503.GA1008366@private.email.ne.jp>
 <20210316131304.220a53b9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9e2e1d83-29c1-053a-fd43-187f6f824b39@redhat.com>
Date: Tue, 16 Mar 2021 13:49:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316131304.220a53b9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/21 13:13, Igor Mammedov wrote:
>>> Surprisingly without accelerator ie with tcg the default machine does seem to
>>> get to the login prompt. Is the ACPI data tailored to indicate an
>>> accelerator/VM or is it static? Could it be that the CPU reported by my
>>> machine is causing the issue? With the NVMM accelerator it passes on the hosts
>>
>> I think tcg case can be explained by x86_machine_is_smm_enabled()
>>
>>    bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
>>    ...
>>        if (tcg_enabled() || qtest_enabled()) {
>>            smm_available = true;
>>        } else if (kvm_enabled()) {
>>            smm_available = kvm_has_smm();
>>        }
>>    ...
>>
>> Although I don't know about nvmm case, this function also needs to be updated
>> if smi isn't supported.
> can you submit a patch for this please?

nvmm is not part of upstream yet, so I guess it's up to Reinoud to fix 
it.  Still, reproducing his testing conditions with KVM and -M smm=off 
is probably interesting because it also affects HAX, HVF and WHPX which 
are supported upstream.

Paolo


