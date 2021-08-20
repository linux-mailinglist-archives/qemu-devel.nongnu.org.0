Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381C53F31F0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:03:48 +0200 (CEST)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH7vn-00073J-BM
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH7uj-0006Md-4V
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mH7uh-0001RY-AU
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629478958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LagweM/QaYmv6EljGDuyPEUbFvyQQYAoqF5e6TYtpSs=;
 b=CZJJ01AeL6qZFwnwxzrHLZYQrYrqo8I55vy4zq48WEg7GVcRmJ39Pc87fOljFrlarAD+aY
 R3RLP8x14GC6BVLf6EROdvtkiDfXFGHBL6DiJlmdM6lbSFEvbZNmWqmvdUh1RIOFxmAh9K
 fjiOxXbwgKJn2j8T9kmAljIegkMsVto=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-q2-z02RiNxGPtU3ZeXrJzQ-1; Fri, 20 Aug 2021 13:02:37 -0400
X-MC-Unique: q2-z02RiNxGPtU3ZeXrJzQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020adfce0a000000b001572d05c970so869183wrn.21
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LagweM/QaYmv6EljGDuyPEUbFvyQQYAoqF5e6TYtpSs=;
 b=a25pZNj5EnHx9iguNGgPHBhcfefDS7J24lfIFKUGAaSWLYZ6DVibdrRH5pqHFuqqgP
 d+IdUnpjDY11Gk/Ux8Vg3H1bzmjzsRG18cgWu9tGxrTty2j2tbarY5+nmfGHOTJiVKfe
 rJO7/FhRqmFW6nxhLvT/EzxJt7L7lLS1QWkhLD3yc8GdevX6HPuJOHRyHcf1T9lqn063
 llrBEu4zItNcyDxyvZl7u0uYalQ6Ou315iDYsJ8Obd30bHyCh1OrVWpQaQJqgGesr4fl
 T+6m516gQ1hGct7epKnd75IAsRuWkLvGN020R2mQ7R8YRLkG2h6sUi6adWW9w3Ip+L1z
 vruw==
X-Gm-Message-State: AOAM532rRsclNghMGpqpAoqkyXfPZmj7Rc85PiQ/yPdSSGe0QLo2DFsx
 YGVM8OhUuBEtDPLXOf0Nu1alKSuT3keIgvK8vmm9j4VTDet8/EhGuBLo2qK2WdErbGrun5NcohR
 xWycnKYi6Uti2sYs=
X-Received: by 2002:a1c:9884:: with SMTP id a126mr5087824wme.153.1629478955371; 
 Fri, 20 Aug 2021 10:02:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD9XNlCPseDUYfT3/omi1tMs+MswGr/wt1FeA6+HaEirdQnam+F1Qwp5PFHl7CRkiAdJznBA==
X-Received: by 2002:a1c:9884:: with SMTP id a126mr5087715wme.153.1629478954298; 
 Fri, 20 Aug 2021 10:02:34 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e17sm6493760wru.7.2021.08.20.10.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 10:02:33 -0700 (PDT)
Subject: Re: [PULL 03/33] i386: split cpu accelerators from cpu.c, using
 AccelCPUClass
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
 <20210511081350.419428-4-pbonzini@redhat.com>
 <CAFEAcA867BUEpCYrXuMTqt55f+18D+ROMuU=h6MzubNrmp=D=g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <54fae2d9-db1e-fbd0-e58a-0c2b5ab0f046@redhat.com>
Date: Fri, 20 Aug 2021 19:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA867BUEpCYrXuMTqt55f+18D+ROMuU=h6MzubNrmp=D=g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/20/21 6:55 PM, Peter Maydell wrote:
> On Tue, 11 May 2021 at 09:22, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> From: Claudio Fontana <cfontana@suse.de>
>>
>> i386 is the first user of AccelCPUClass, allowing to split
>> cpu.c into:
>>
>> cpu.c            cpuid and common x86 cpu functionality
>> host-cpu.c       host x86 cpu functions and "host" cpu type
>> kvm/kvm-cpu.c    KVM x86 AccelCPUClass
>> hvf/hvf-cpu.c    HVF x86 AccelCPUClass
>> tcg/tcg-cpu.c    TCG x86 AccelCPUClass
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> [claudio]:
>> Rebased on commit b8184135 ("target/i386: allow modifying TCG phys-addr-bits")
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Message-Id: <20210322132800.7470-5-cfontana@suse.de>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b692c8fbee..c2723b32cb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -351,7 +351,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
>>  M: Richard Henderson <richard.henderson@linaro.org>
>>  M: Eduardo Habkost <ehabkost@redhat.com>
>>  S: Maintained
>> -F: target/i386/
>> +F: target/i386/tcg/
>>  F: tests/tcg/i386/
>>  F: tests/tcg/x86_64/
>>  F: hw/i386/
> 
> This change to MAINTAINERS has left all the .c files
> in target/i386 that are not in one of the tcg, hvf, whpx,
> kvm, hax, nvmm subdirectories orphaned -- they are no
> longer covered by any MAINTAINERS section.
> 
> Where should those files be listed ?
> 
> (I just discovered this when get_maintainers.pl said it couldn't
> find a maintainer for a change I made to target/i386/sev.c.)

This patch maybe got lost:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg816326.html


