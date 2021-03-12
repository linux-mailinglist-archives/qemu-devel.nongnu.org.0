Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3493633944E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 18:09:55 +0100 (CET)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKlIP-0004WK-KS
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 12:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlDC-0000lH-Ug
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:04:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlD8-0007kz-MW
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615568661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ih93EsPlPCpcNbLhPYAmIHrs+7H7ug+x8bsgCt1nXCY=;
 b=KSvZm1VNiYSzoNOhzNGG0wojeZMkERKGEGjmy3bTCZSqR53yMeMcbk5/M8dspS2F/j9oYO
 AXguRvSSLbmiHTzCLw1eB5zqmAz14nPbhr+L1D5+2Legs6g6AKFRhGw/z/oGkmhVHFUVn1
 jPuapsDaTXCDBx+ByrbS7cUdBUanLzE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-4bWqWoBMM1KKBiPsm6tWDA-1; Fri, 12 Mar 2021 12:04:19 -0500
X-MC-Unique: 4bWqWoBMM1KKBiPsm6tWDA-1
Received: by mail-wr1-f72.google.com with SMTP id x9so11329408wro.9
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ih93EsPlPCpcNbLhPYAmIHrs+7H7ug+x8bsgCt1nXCY=;
 b=t3an191SPYl8itDpP4Q4Kn65puTUBClaSezg1V6bS4TuInaqdPpfabZGbZiFi8HAOJ
 7in6IRwy+3ixyShfdlDwBfLYQQ0fU8o1ILBg+vsE3csMrsdtZDIaDc9G2sCJwziCoXMl
 Soq5eERTG8PABCQAbR/jCLbpZQhnG6Ru/RTEnYojoHlaY+D0ik5/iK1Y8RuDgSwfmovy
 6zi88qeo6BSD6TH2uS1o+57zTy7K7FDRxyQ4pojCc/7TK3ssEAw4Y5uMff9guHfzLjJb
 LF/VdWSLX03xjwOJNXADY6aYLNBPcxOFvCj2l5lCU8naqt6j5IDWDo/VPEde1wWyT4XP
 qeJw==
X-Gm-Message-State: AOAM531kx7AioOo51SeYWhF/SAXUZFnBYo/6LDu5VU1GN1Jqoq37/dy6
 qOQWrej/olAjtPE08b9ngQ9FV6T95h045ro3rZTyKAL2T5GM6anx0RI70DN4w2HNVHRZaqxGr+y
 6f84tBzH1vOEwOAtzukbNkmBygnHFCv4KpNQqxhV1CP3Z2fz/vNiTBhMKHqZnDbz04MQ=
X-Received: by 2002:a1c:cc04:: with SMTP id h4mr13799784wmb.142.1615568657721; 
 Fri, 12 Mar 2021 09:04:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV6CpMlOZFlyIxrysHimwil1L7M62AIEbU08tE4+P34mTD+KZf4a8xxTqh3AgIY2Q1LtrICA==
X-Received: by 2002:a1c:cc04:: with SMTP id h4mr13799707wmb.142.1615568656843; 
 Fri, 12 Mar 2021 09:04:16 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d85sm2821243wmd.15.2021.03.12.09.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 09:04:16 -0800 (PST)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
 <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
 <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
 <26c2b88b-4c9e-09a0-a1c0-350a01e9a697@redhat.com>
 <d66078f1-9fa0-c3ed-d54c-3d3ada2027e5@suse.de>
 <683d1ccc-503d-3218-2539-a3ed48fee5fb@redhat.com>
 <8ca3a983-05ad-a0de-31e9-65b6c41a2b4c@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6f2e5a50-c548-28c5-1ce0-e583bf90eaf1@redhat.com>
Date: Fri, 12 Mar 2021 18:04:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8ca3a983-05ad-a0de-31e9-65b6c41a2b4c@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 14:40, Claudio Fontana wrote:
>      /*
>       * double dispatch. The first callback allows the accel cpu
>       * to run initializations for the CPU,
>       * the second one allows the CPU to customize the accel cpu
>       * behavior according to the CPU.
>       *
>       * The second is currently only used by TCG, to specialize the
>       * TCGCPUOps depending on the CPU type.
>       */
>      cc->accel_cpu = accel_cpu;
>      if (accel_cpu->cpu_class_init) {
>          accel_cpu->cpu_class_init(cc);
>      }
>      if (cc->init_accel_cpu) {
>          cc->init_accel_cpu(accel_cpu, cc);
>      }
> }
> 
> .. but maybe this is premature, and should wait for actual users of this beyond TCG on ARM?

I prefer to single out TCG and have the call in cpu_class_init.  The 
idea of double dispatch (as opposed to an if/else chain with checks on 
the class of the argument) is that the first caller uses different 
"method names" to tell its type name to the target.

See for example 
https://en.wikipedia.org/wiki/Double_dispatch#Example_in_Ruby.

Paolo


