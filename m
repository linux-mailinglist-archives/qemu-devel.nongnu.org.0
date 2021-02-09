Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F82315169
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:20:02 +0100 (CET)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ts1-0003cM-5p
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9Tl7-0005OP-EX
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:12:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9Tl4-0005Qn-6E
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612879967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cd1FRsJ26IPj+6593J2G2QHgURgAjr3q1PTUo9bgGpI=;
 b=LG/XueXDstYYBYOprocZMBAg6IiiM9aPcXIqw4AV5wb3Ip1NOcEylg61E5YNSWc+1qMZcl
 KIs0J+f6s+4sCtZdHzqZQZVXRWwNy2JTcHfZYfO4hAVynyXMUNckfyT2KuVjlSsrIq+PCb
 CYrS2kS3XKHvzXEWxdxSgm/DUypSl2c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-8oNFV9fTMDi_qEQMg-6t_g-1; Tue, 09 Feb 2021 09:12:44 -0500
X-MC-Unique: 8oNFV9fTMDi_qEQMg-6t_g-1
Received: by mail-wm1-f70.google.com with SMTP id p8so2895367wmq.7
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cd1FRsJ26IPj+6593J2G2QHgURgAjr3q1PTUo9bgGpI=;
 b=GLEA5mwQ8iA5D0FXSFG2xl7/mm3BtDsB5G3Odth5FOq9HTXXxwsdfP/X2rGEN5d8zD
 8JDF8iUJxVjraFoAeagFpZziuoyr8OTTDiRZfqMEu78KrNGDm/78GAW6m+SVo5BPeqBn
 bxVt7J0jA6d2ed0cxJ9T38VVD7Vne7XkA7zL5VmgNmGH10Iko3Um/CzkRWY2LjwHydKF
 ioQ6oqxjBk+7qWDIGonT/qlxVWbFC/feNU7jiLJP5D9+SlhA7T1Qh9CDWYaq+IMMqwt8
 o/jVTPCXOi4v8DNSkl4ehLK07Pp365v9gBKWuNeHSxts0/Ah56YlfKuwhfBP5cqd/e0n
 rc+Q==
X-Gm-Message-State: AOAM530hGfZyTbYNI85Bf0UrovDBA5cUSjgHBoFelSnQpHyE4j1rmCNk
 Kp6dG9asO0ZZP4ocMq5i/dB/8Q3CFzv3WDboTEVdjl7ceMFY0+BySZf5UcwGB/2bm70UbR9Gw8X
 h4ZXnMvmZLSlGY9vaaGvjhxX3tjhobHUBFAbNZIBUdN7m1mavsGo3p4wOIuqqktMOU3U=
X-Received: by 2002:adf:b1cd:: with SMTP id r13mr16432139wra.157.1612879962380; 
 Tue, 09 Feb 2021 06:12:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjP+Ll/Su06CMHx++eDv6WezCXS0ymqFz2A30P47SXdQ8zytOqV6pMSkQIZzHvfOqrcu3HcQ==
X-Received: by 2002:adf:b1cd:: with SMTP id r13mr16432120wra.157.1612879962213; 
 Tue, 09 Feb 2021 06:12:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 64sm25461332wrc.50.2021.02.09.06.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 06:12:41 -0800 (PST)
Subject: Re: [PULL hvf 0/5] HVF updates for 2021-02-09
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20210209135722.4891-1-r.bolshakov@yadro.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6debac88-9e17-8abb-1d8a-4b6225c73ee1@redhat.com>
Date: Tue, 9 Feb 2021 15:12:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209135722.4891-1-r.bolshakov@yadro.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/21 14:57, Roman Bolshakov wrote:
> Hi Paolo,
> 
> Please apply the PR to i386 queue (not for master). It contains bug
> fixes, cleanups and improvements for HVF accel:
>   - Added support of older HW (Hill)
>   - Fixed OSXSAVE reporting in CPUID (Alex)
>   - Improved Darwin-XNU support (Vladislav)
>   - dead code removed (Alex)
> 
> Test results: https://gitlab.com/roolebo/qemu/-/pipelines/253575182
> The patches don't introduce regressions in kvm-unit-tests.
> 
> The following changes since commit d0dddab40e472ba62b5f43f11cc7dba085dabe71:
> 
>    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-02-05 15:27:02 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/roolebo/qemu.git tags/hvf-queue-20210209
> 
> for you to fetch changes up to db7884ccdde5425584bec758f72ed658b6549f8a:
> 
>    hvf: Fetch cr4 before evaluating CPUID(1) (2021-02-09 12:25:09 +0300)
> 
> Thanks,
> Roman
> 
> ----------------------------------------------------------------
> Alexander Graf (2):
>        hvf: x86: Remove unused definitions
>        hvf: Fetch cr4 before evaluating CPUID(1)
> 
> Hill Ma (1):
>        hvf: Guard xgetbv call
> 
> Vladislav Yaroshchuk (2):
>        target/i386/hvf: add vmware-cpuid-freq cpu feature
>        target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT
> 
>   target/i386/cpu.h           |   1 +
>   target/i386/hvf/hvf-i386.h  |  16 -------
>   target/i386/hvf/hvf.c       | 100 +++++++++++++++++++++++++++++++++++++++++++-
>   target/i386/hvf/x86_cpuid.c |  34 +++++++++------
>   target/i386/hvf/x86_emu.c   |   5 +++
>   5 files changed, 127 insertions(+), 29 deletions(-)
> 

Queued, thanks!

Paolo


