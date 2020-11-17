Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6082B60C3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:13:19 +0100 (CET)
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf0nO-0004AA-FY
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf0mG-0003jD-Mq
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:12:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kf0mE-000536-Rc
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:12:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605618725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+V9ZCFU+uzTqhYjJgP48CtJ9WjH1j1l6N4Yo8/ZI+XA=;
 b=NShb+iRfZv4rn+jmqk4XavbSbaCHN0Unj0/3mD7tuUi1YNizoK1MXcVR4sLR1JddP6yYbZ
 b4W/G5t1P6rzyujO/bpCOZjWYSg1n+WkpsgmbsJN7CT6UBkWetab4csBXdFpF5iQY8jwvQ
 6qyj0/ph1iUGbyCVuG2A5kQv5+R1o9I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-zCTsxwyFPJ25uTEwqkDzaA-1; Tue, 17 Nov 2020 08:12:04 -0500
X-MC-Unique: zCTsxwyFPJ25uTEwqkDzaA-1
Received: by mail-wm1-f69.google.com with SMTP id g3so1505254wmh.9
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+V9ZCFU+uzTqhYjJgP48CtJ9WjH1j1l6N4Yo8/ZI+XA=;
 b=b3+XjTkfqJY0s1Qvn3eeprpoosjzicTJ5mPfS/ICeUOlpbwwPw9pd08hrPs2bpfdel
 xc3Tco9C/wTmI94vfH4+xuVTFsL3lzGQP+HLBew9dy+yc0a7ZOLaQqciofbL/yanf0A0
 AzEob/iuAL4xsDpKuSxsfbmnjruJYANfj0pSGMuzWJRG3OTvsgHEDHqxRI8fYlCF8nPQ
 7t2ztDKXj62tJFTj4iNTQN4mYfQwjeVuiGP8mEyHIhZADAWnvmYins6B0QinfKfpfef5
 nGU4TKTq3ZUsvTCwY4wSUrSoWTqyaiz/zLG80M69tPEgZwh14VF/iX49uOnxoGIXPxja
 ybIw==
X-Gm-Message-State: AOAM533SaU6kNS+LOYSxPP4/34fp7sz+eT5kk96Hoc/nBmIX7Igqra8+
 OsplHOLQ1hJQzG8a85ISXjSHCdhU8YuvU6hHFz26orR+DnGCgzh+ensO3DDjGiRLH1PTzyq5PH3
 CZHFNFJjZyNdDzIo=
X-Received: by 2002:a5d:474d:: with SMTP id o13mr26275995wrs.178.1605618723007; 
 Tue, 17 Nov 2020 05:12:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyB6HFnnlFRx6qvZBKRv6w+AJ8UiZeFG6TPt2RXCJ4BK3YbW1uyz+Z6YCs/FEb0uYiu78P6g==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr26275968wrs.178.1605618722820; 
 Tue, 17 Nov 2020 05:12:02 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id z7sm2134607wmf.33.2020.11.17.05.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 05:12:01 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201117120115.1234994-1-philmd@redhat.com>
 <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <00719607-a890-6d45-a89f-d261d5029a63@redhat.com>
Date: Tue, 17 Nov 2020 14:12:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 2:00 PM, Peter Maydell wrote:
> On Tue, 17 Nov 2020 at 12:03, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Fix an endianness issue reported by Cornelia:
>>
>>> s390x tcg guest on x86, virtio-pci devices are not detected. The
>>> relevant feature bits are visible to the guest. Same breakage with
>>> different guest kernels.
>>> KVM guests and s390x tcg guests on s390x are fine.
>>
>> Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
>> Reported-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> RFC because review-only patch, untested
>> ---
>>  hw/s390x/s390-pci-inst.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>> index 58cd041d17f..cfb54b4d8ec 100644
>> --- a/hw/s390x/s390-pci-inst.c
>> +++ b/hw/s390x/s390-pci-inst.c
>> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>>          ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
>>          S390PCIGroup *group;
>>
>> -        group = s390_group_find(reqgrp->g);
>> +        group = s390_group_find(ldl_p(&reqgrp->g));
> 
> 'g' in the ClpReqQueryPciGrp struct is a uint32_t, so
> adding the ldl_p() will have no effect unless (a) the
> structure is not 4-aligned and (b) the host will fault on
> unaligned accesses, which isn't the case for x86 hosts.
> 
> Q: is this struct really in host order, or should we
> be using ldl_le_p() or ldl_be_p() and friends here and
> elsewhere?

Now than I had lunch, your comment is obvious...

IIUC we should use ldl_le_p() here and fix all the other
uses.

> 
> thanks
> -- PMM
> 


