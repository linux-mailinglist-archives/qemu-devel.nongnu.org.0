Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D833878E2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:35:16 +0200 (CEST)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liywN-0004Tg-93
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liyrb-0008Ph-HE
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liyrV-0006Tc-Ue
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:30:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621341010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YTuImt9yUW5JKgw/3r/EezkXIBFnF0qWCNm6dXgnZ4U=;
 b=bC6IWFHZfkG0zY62NnCPiGP60oGseQA/sX5M6cmC01d07/vEvXi62mmQxCLU1NDNAI/WKs
 kG4CRZb/7UpGJV5xc9F4XGZWt32rrFkU5BYaQAmfbcRvSAV3b460P5ltSAxdm2fCArq3QT
 FE7acQDKPd7iomtXqxeSUqX62YNzoeg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-LNw6wjdTM_2-E3fWNXYx_g-1; Tue, 18 May 2021 08:30:08 -0400
X-MC-Unique: LNw6wjdTM_2-E3fWNXYx_g-1
Received: by mail-wm1-f71.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so260192wmc.7
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YTuImt9yUW5JKgw/3r/EezkXIBFnF0qWCNm6dXgnZ4U=;
 b=RXk3VniNyX9TnTl/q5HFkhjoPNEpDZyEVAReKvjMusISkgGUpa/L+XdE/xLdCjuLqy
 jzPROQmjyNpkAIkVw7/Q4P3iaGohYINR7qVuqIi1eF3KiPgSnhtlkG2EzHr/oqAOq1L5
 68/zLZL9AcO1kS+DFL/kaXAUNhUgz22qfRBe/9icIJqOefo5GenwqTBz+bsWTNjDMcIZ
 1FNZd3Bh+3Ec5JM9KDltZjYJ/Xer9c0KtfVK7fD8ag8QWQof0Xr9SfYSssBXUSoS0//4
 eVkZfkbTe3Pn7q5hlp070/CWdyae8nVoiYhoMNy62J/RHPEM/NWGDzR2a4OVUfahiXEr
 IX/Q==
X-Gm-Message-State: AOAM530gkaRsvr3cVGlVkzZzhEEAtGNDNGDb6akv7o1tP8IWIu6AZmxQ
 RY2nb8PqfRTxhLl/lQUr4Sr5xKL6zY1N9EAPvgoXzubFFmX/FHifKZmBSHkgYBfVu8zQ58tSA6e
 7mY9vr6W01Nljff4=
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr5344336wme.60.1621341006951; 
 Tue, 18 May 2021 05:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlGiE7e7T2nlj/lyi7hxkQRBjWUg0mnZBeXHJlk10Y3xofOSoGj9IMPJIv1lx71bstKB3vxw==
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr5344282wme.60.1621341006366; 
 Tue, 18 May 2021 05:30:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r5sm15580612wrw.96.2021.05.18.05.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 05:30:05 -0700 (PDT)
Subject: Re: [PATCH 2/3] ci: do not use #processors+1 jobs, #processors is
 enough
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210518084139.97957-1-pbonzini@redhat.com>
 <20210518084139.97957-3-pbonzini@redhat.com>
 <40f9d46b-d234-c029-3ba2-f5dcac8b87fc@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7155c55a-1566-d7f0-d59e-ee48707302cf@redhat.com>
Date: Tue, 18 May 2021 14:30:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <40f9d46b-d234-c029-3ba2-f5dcac8b87fc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 12:49, Thomas Huth wrote:
>>
>> -    - JOBS=$(expr $(nproc) + 1)
>> +    - JOBS=$(nproc || echo 1)
> 
> The basic idea of the "+ 1" was to make sure that there is always a 
> thread that runs on a CPU while maybe another one is waiting for I/O to 
> complete.

Ah, I see.  It doesn't make much sense for "make check" jobs however, 
which is where I wanted to get with the next patch.

I'm not sure it's even true anymore with current build machines (which 
tend to have a large buffer cache for headers) and optimizing compilers 
that compilation is I/O bound, so I'll time the two and see if there is 
an actual difference.

Paolo

  This is suggested by various sites on the web, e.g.:
> 
> https://unix.stackexchange.com/questions/519092/what-is-the-logic-of-using-nproc-1-in-make-command 
> 
> So not sure whether this patch here make sense ... I'd rather drop it.


