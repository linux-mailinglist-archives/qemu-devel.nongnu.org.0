Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05838C249
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 10:51:20 +0200 (CEST)
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk0sJ-00042x-6b
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 04:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lk0qE-0002tV-0p
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1lk0q5-0000om-GV
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621586940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C+RrPrGVxZisWP0sBdZiifQusgNF1wAFIFuVSD1WN80=;
 b=Xgc1+y5Xkt84wbhy+bMkKjQCsXdL4gPBIKazOWg66tsJJZk3vYkN4cS0oIKF3mpksz4kMH
 gllWeEPhr14Us6at72VWBRSwOaijOTPPnzdBa1xUHK58tsHfw/1cQMcAfbxq8jxNTK8W23
 qIkd+lNpzesR0pYl/Oe01T1usBahLeY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-E6lgFdUsMbmyrH1j-iEMFw-1; Fri, 21 May 2021 04:48:58 -0400
X-MC-Unique: E6lgFdUsMbmyrH1j-iEMFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so9140692wre.18
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 01:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=C+RrPrGVxZisWP0sBdZiifQusgNF1wAFIFuVSD1WN80=;
 b=JoLo7GFQ8Yv53B2dQLvsAwsqnPQt/AkkTgR+lckNAmBMFqK+HBi9xk+nbqGLkGzKnO
 z5L5wqbhtQFO0FbAgS7L8WgZ0ivxAGQbc7oXbZBcq8bqcDcX79pJlDpZFZhmIaCXbqEf
 GHhRscyKgn2UJK5t/EmV4Bwo13IbAV6LiEEeonte3RMhZRFZX9SIzWGn3VYLHfCBUrT2
 IuxEOXbKQfqjvYl+Byf8N63d6Ce7Wv2Cl6VzyY1sNmzrKPRFgwNKuTABMnzVCddb6ZYt
 apzS1Q6lmpUHeiIwmYM73eQBjzVLTgHcQQvzc+BFU0W31vIm7SV5C4ZKM5u/HZWHubFD
 LVIg==
X-Gm-Message-State: AOAM531iUZJ4NMVA5CFqTsg8QOM+diZTAO1ZjvEerEFUuApoH0Ninf4j
 /Osy+Bg/qmb7kzDcKhLckI4dWeZwHCOjAjcpePU+J8rlHwb1i6h7eI0u8SKqCdPwhW0itMbR/8w
 YRz7Mwt3q4WY8RO8=
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr7955099wrq.177.1621586937372; 
 Fri, 21 May 2021 01:48:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx9FKQyrvOPP7boT1WEW/qQzOKlleOxVcg2ZXiXvfEsG7bp5bbEt8GrCAOXSmuZgRMrpaDzQ==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr7955083wrq.177.1621586937185; 
 Fri, 21 May 2021 01:48:57 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id m11sm1226436wri.44.2021.05.21.01.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 01:48:56 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Liang Li <liliang324@gmail.com>
Subject: Re: About the performance of hyper-v
In-Reply-To: <CA+2MQi_LG57KRRFjMR_zPvJBDaH4z16S5J=c+U+-Ss_Z71Ax7g@mail.gmail.com>
References: <CA+2MQi-_06J1cmLhKAmV1vkPEnvDx6+bOnK06OciYmdymaNruw@mail.gmail.com>
 <87cztmkdlp.fsf@vitty.brq.redhat.com>
 <CA+2MQi_LG57KRRFjMR_zPvJBDaH4z16S5J=c+U+-Ss_Z71Ax7g@mail.gmail.com>
Date: Fri, 21 May 2021 10:48:55 +0200
Message-ID: <87y2c8iia0.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Tianyu.Lan@microsoft.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Liang Li <liliang324@gmail.com> writes:

>> > Hi Vitaly,
>> >
>> > I found a case that the virtualization overhead was almost doubled
>> > when turning on Hper-v related features compared to that without any
>> > no hyper-v feature.  It happens when running a 3D game in windows
>> > guest in qemu kvm environment.
>> >
>> > By investigation, I found there are a lot of IPIs triggered by guest,
>> > when turning on the hyer-v related features including stimer, for the
>> > apicv is turned off, at least two vm exits are needed for processing a
>> > single IPI.
>> >
>> >
>> > perf stat will show something like below [recorded for 5 seconds]
>> >
>> > ---------
>> >
>> > Analyze events for all VMs, all VCPUs:
>> >              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
>> > Time         Avg time
>> >   EXTERNAL_INTERRUPT     471831    59.89%    68.58%      0.64us
>> > 65.42us      2.34us ( +-   0.11% )
>> >            MSR_WRITE     238932    30.33%    23.07%      0.48us
>> > 41.05us      1.56us ( +-   0.14% )
>> >
>> > Total Samples:787803, Total events handled time:1611193.84us.
>> >
>> > I tried turning off hyper-v for the same workload and repeat the test,
>> > the overall virtualization overhead reduced by about of 50%:
>> >
>> > -------
>> >
>> > Analyze events for all VMs, all VCPUs:
>> >
>> >              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
>> > Time         Avg time
>> >           APIC_WRITE     255152    74.43%    50.72%      0.49us
>> > 50.01us      1.42us ( +-   0.14% )
>> >        EPT_MISCONFIG      39967    11.66%    40.58%      1.55us
>> > 686.05us      7.27us ( +-   0.43% )
>> >            DR_ACCESS      35003    10.21%     4.64%      0.32us
>> > 40.03us      0.95us ( +-   0.32% )
>> >   EXTERNAL_INTERRUPT       6622     1.93%     2.08%      0.70us
>> > 57.38us      2.25us ( +-   1.42% )
>> >
>> > Total Samples:342788, Total events handled time:715695.62us.
>> >
>> > For this scenario,  hyper-v works really bad.  stimer works better
>> > than hpet, but on the other hand, it relies on SynIC which has
>> > negative effects for IPI intensive workloads.
>> > Do you have any plans for improvement?
>> >
>>
>> Hey,
>>
>> the above can be caused by the fact that when 'hv-synic' is enabled, KVM
>> automatically disables APICv and this can explain the overhead and the
>> fact that you're seeing more vmexits. KVM disables APICv because SynIC's
>> 'AutoEOI' feature is incompatible with it. We can, however, tell Windows
>> to not use AutoEOI ('Recommend deprecating AutoEOI' bit) and only
>> inhibit APICv if the recommendation was ignored. This is implemented in
>> the following KVM patch series:
>> https://lore.kernel.org/kvm/20210518144339.1987982-1-vkuznets@redhat.com/
>>
>> It will, however, require a new 'hv-something' flag to QEMU. For now, it
>> can be tested with 'hv-passthrough'.
>>
>> It would be great if you could give it a spin!
>>
>> --
>> Vitaly
>
> It's great to know that you already have a solution for this. :)
>
> By the way,  is there any requirement for the version of windows or
> windows updates for the new feature to work?

AFAIR, 'Recommend deprecating AutoEOI' bit appeared in WS2012 so I'd
expect WS2008 to ignore it completely (and thus SynIC will always be
disabling APICv for it).

-- 
Vitaly


