Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2967E380DC2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:05:55 +0200 (CEST)
Received: from localhost ([::1]:37452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaK1-00075R-R9
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhaF9-0001DY-Io
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:00:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhaF4-0003nn-Qm
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:00:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8OVHE5Ts8gkv8762R9ETcDsfp0Efuq1dGSL5bvJoSo=;
 b=LUgInJHHbo5k1hejxjRBE4sm16rPdNO8ZhjOyyYt4EHR9kJe6yEvUWQ1+qO5UvOze4VkdR
 MyvRxCh+5Jnz9r3To5efHpCdwBqTm1mYYRkjgxkXDX876E83ZwhtfGCx+koyucaSuIwP6u
 mHlvloR/GbZUlSJBSq1vtVKWN7kDV5g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-VtwVAwVaM76iQl3BlMll1g-1; Fri, 14 May 2021 12:00:41 -0400
X-MC-Unique: VtwVAwVaM76iQl3BlMll1g-1
Received: by mail-ej1-f70.google.com with SMTP id
 h4-20020a1709067184b02903cbbd4c3d8fso4949078ejk.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 09:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y8OVHE5Ts8gkv8762R9ETcDsfp0Efuq1dGSL5bvJoSo=;
 b=rN4mg6qSqtkrP/1LEm6pJFH8qA7Yzy/Wigh8Idqg1diJ14BvoEgbRun0vzh1/Uk2f/
 Rs6iaD2u0SfV/BKSmmwVQTCmUUR4bpoRM5hMG31R8Rp6Oz4X4UhsBUtTu/RNnXiPNIxF
 LWiavYKjZAH2xHiUWYhToaZ/2r6HhVMqowzho8pINnk6mBCGNdt9JY69dXpdldo3Xh70
 BNP4ZVmdWWtxOWSyRhynLHV2uzNoU1D4BYcgoN2jqg8zpKcQSh9yGzjGo9uExvwVWYT2
 AgWNMYR0RP2eN1Si8+1huYYZlpHx7KYFYyrm0FJq8AFnJFHU8n6ncRezEQyZ1oJA2HsP
 7ipQ==
X-Gm-Message-State: AOAM533BeDhUrEhFlWfTh8h1VBUpiluLvW6YNmlSTTVm/a2Og7AtdFZh
 xNCwGunkJPS46OuHK3uoRIfshr3xtAHpRVmpnM+MZ4v+nhbRTUyKyj8wmIR6Tx+jHCIejSTP7U+
 Yy/4q8pEU6qBKJ4Q=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr12885210edu.286.1621008040298; 
 Fri, 14 May 2021 09:00:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqmyDh+WeKe7foWO4ojc4ywWhqNcDiy8xsOk+o0B0G8k6TmVIn+zQLhm6mwaWVy1J7cdGOGg==
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr12885186edu.286.1621008040094; 
 Fri, 14 May 2021 09:00:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q10sm4756992eds.36.2021.05.14.09.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 09:00:38 -0700 (PDT)
Subject: Re: [RFC PATCH 0/9] Initial support for machine creation via QMP
To: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <93ae82d3-f9a7-f347-a013-54ae5cdc95f7@redhat.com>
 <5210646b-c661-882d-6c8d-0fd1772342d2@greensocs.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <61071d36-b700-8546-c19b-09c4e582bdfe@redhat.com>
Date: Fri, 14 May 2021 18:00:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5210646b-c661-882d-6c8d-0fd1772342d2@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 mark.burton@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 14:48, Mirela Grujic wrote:
> 
> With our approach, transitioning to the QMP configuration suppose to 
> happen gradually, i.e. we still specify some configuration options via 
> command line. For your approach to be applicable to our use case we 
> would at least need a QMP equivalent for the following:
> 
> qemu-system-riscv64 \
>      -M sifive_dt \
>      -cpu 
> rv64,i=true,g=false,m=true,a=true,f=true,d=true,c=true,s=false,u=false,x-b=true,pmp=true,mmu=false,num-pmp-regions=8 
> \
>      -smp 1 \
>      -device ...
> 
> AFAIU from the materials you shared, we would need to add -cpu and 
> -device, but I don't see any reason why we wouldn't do this.

-cpu is indeed the big one that I had not looked at so far, while 
-device should be mostly covered by the existing device_add command.

One possibility for -cpu is to make it an argument of machine-set too. 
For example the above would be

{ 'execute': 'machine-set', arguments: {
     'type': 'sifive_dt',
     'smp': { 'cpus': 1 },
     'cpu': { 'model': 'rv64', 'i': true, 'g': false, ... }
}

> Ok, please let me know once you test, then I would run your code and
> play with it to better understand what needs to be done. Then I might
> come back with a couple of questions, so that we align on the TODOs. Is
> that ok with you?

Yes, of course.  I pushed something that at least compiles and passes a 
basic smoke test.

> Btw, when (in which version) did you plan to integrate the
> qemu-qmp-* support? I guess once machine-set/accel-set is implemented,  > but maybe I'm wrong...

Well, the right answer is "when somebody needs it".  The things that I 
was mostly interested in (e.g. compound properties for machines, such as 
smp in the example above) were all enablers for qemu-qmp-* but I was not 
really interested in the new binaries.  I did the qemu-qmp-* patches 
mostly to validate that the 5.2/6.0 refactoring of preconfig was going 
in the right direction.

However, if there is indeed somebody that needs it I'll contribute where 
our interests overlap.  In particular I can take care of converting the 
command line options to properties.

Paolo


