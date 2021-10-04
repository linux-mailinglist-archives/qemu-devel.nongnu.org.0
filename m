Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC84207D6
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:05:50 +0200 (CEST)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJuu-00056m-SJ
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJKG-0003Sj-3L
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:27:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXJKB-00009G-Gs
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633336068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wK7iVG3X5Nkn6FIFB80ZzMQZFdwyjX+qi6LS3TDFA2s=;
 b=dz2adUXFd8wlUWQ1hAeEY3Lme4yoIXeSKhulUhF6vlDxI589TMKVWlZKwH0nP58i73mY/H
 ok/iTEVNIOaPVdOKSC3mV/iyO+leuVJ1Ky1rMTId/51qvhAHXl9Jj2XgWMzg/qsRkVZSJe
 CyBioH89yUUaLlcFt8dhkFrnAvPIeQA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-rE0OfcQJP3mNcaVYq1BYBw-1; Mon, 04 Oct 2021 04:27:46 -0400
X-MC-Unique: rE0OfcQJP3mNcaVYq1BYBw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w6-20020a50d786000000b003dabc563406so12027190edi.17
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wK7iVG3X5Nkn6FIFB80ZzMQZFdwyjX+qi6LS3TDFA2s=;
 b=tP/J92/0nD3Tx9mEhSHqhWHAUDKBQKTqcSigYc+KmuZjoFwO/7sfF6nAw3wz5EB51J
 u0QzjoxQBt5NBmuJ4ZGD4DpY6cCVVRhtqAD+Bi0/ydjN14s2TRECsejKjz22GDQ17tW3
 NaUlZHApKYjVR88QbgIBZAfJnmufOAVsHUgavMDYA0vbYIxkL1bFVG0lrmBASANAMDKc
 /EEtkrBKfIMQgoaJSz18oXG4DgKFO/+PJKajsjcdXmAGwbs014txMikJ94Dw2/gCLfSn
 eABIGNjk9N+8ycAJbmx3KJfqfNkuB7A8b7MNkSWAarYmnaP5GHPfhesO4xuT6VPubCS6
 PzWA==
X-Gm-Message-State: AOAM53318wjIqmadFD4yhjH+4oM9BTmcexUO4eivkHW9AWB3Pah3L7By
 5he5vlWtjd7UeSU5i+WVu0scKkJXk4cztJUa9ikjP88/zbSr7Zsb1aIyQq5Urb37TNWxAazNkY6
 Sf+TuZTonnXFBt/Y=
X-Received: by 2002:aa7:d2c7:: with SMTP id k7mr1317906edr.184.1633336065234; 
 Mon, 04 Oct 2021 01:27:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY02lVJBnKorGLl2PWBGTR1dEDE4AxRdfvtnJ4jf+oajyjVLgkM26STSJKrSxd7qx0g45HnA==
X-Received: by 2002:aa7:d2c7:: with SMTP id k7mr1317888edr.184.1633336065018; 
 Mon, 04 Oct 2021 01:27:45 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id i6sm6128749ejd.57.2021.10.04.01.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:27:44 -0700 (PDT)
Message-ID: <420639d4-7608-acbe-4a7f-db164ec2f7a5@redhat.com>
Date: Mon, 4 Oct 2021 10:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 00/22] target/i386/sev: Housekeeping SEV + measured
 Linux SEV guest
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:52, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> While testing James & Dov patch:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg810571.html
> I wasted some time trying to figure out how OVMF was supposed to
> behave until realizing the binary I was using was built without SEV
> support... Then wrote this series to help other developers to not
> hit the same problem.
> 
> Since v2:
> - Rebased on top of SGX
> - Addressed review comments from Markus / David
> - Included/rebased 'Measured Linux SEV guest' from Dov [1]
> - Added orphean MAINTAINERS section

I have queued Dov's patches already, but apart from that the changes 
from v3 to v4 should be minimal.

Thanks for this work!

Paolo

> [1] https://lore.kernel.org/qemu-devel/20210825073538.959525-1-dovmurik@linux.ibm.com/
> 
> Supersedes: <20210616204328.2611406-1-philmd@redhat.com>
> 
> Dov Murik (2):
>    sev/i386: Introduce sev_add_kernel_loader_hashes for measured linux
>      boot
>    x86/sev: generate SEV kernel loader hashes in x86_load_linux
> 
> Dr. David Alan Gilbert (1):
>    target/i386/sev: sev_get_attestation_report use g_autofree
> 
> Philippe Mathieu-Daudé (19):
>    qapi/misc-target: Wrap long 'SEV Attestation Report' long lines
>    qapi/misc-target: Group SEV QAPI definitions
>    target/i386/kvm: Introduce i386_softmmu_kvm Meson source set
>    target/i386/kvm: Restrict SEV stubs to x86 architecture
>    target/i386/monitor: Return QMP error when SEV is disabled in build
>    target/i386/cpu: Add missing 'qapi/error.h' header
>    target/i386/sev_i386.h: Remove unused headers
>    target/i386/sev: Remove sev_get_me_mask()
>    target/i386/sev: Mark unreachable code with g_assert_not_reached()
>    target/i386/sev: Restrict SEV to system emulation
>    target/i386/sev: Declare system-specific functions in 'sev_i386.h'
>    target/i386/sev: Remove stubs by using code elision
>    target/i386/sev: Move qmp_query_sev_attestation_report() to sev.c
>    target/i386/sev: Move qmp_sev_inject_launch_secret() to sev.c
>    target/i386/sev: Move qmp_query_sev_capabilities() to sev.c
>    target/i386/sev: Move qmp_query_sev_launch_measure() to sev.c
>    target/i386/sev: Move qmp_query_sev() & hmp_info_sev() to sev.c
>    monitor: Restrict 'info sev' to x86 targets
>    MAINTAINERS: Cover AMD SEV files
> 
>   qapi/misc-target.json                 |  77 ++++----
>   include/monitor/hmp-target.h          |   1 +
>   include/monitor/hmp.h                 |   1 -
>   include/sysemu/sev.h                  |  20 +-
>   target/i386/sev_i386.h                |  32 +--
>   hw/i386/pc_sysfw.c                    |   2 +-
>   hw/i386/x86.c                         |  25 ++-
>   target/i386/cpu.c                     |  17 +-
>   {accel => target/i386}/kvm/sev-stub.c |   0
>   target/i386/monitor.c                 |  92 +--------
>   target/i386/sev-stub.c                |  83 --------
>   target/i386/sev-sysemu-stub.c         |  70 +++++++
>   target/i386/sev.c                     | 268 +++++++++++++++++++++++---
>   MAINTAINERS                           |   7 +
>   accel/kvm/meson.build                 |   1 -
>   target/i386/kvm/meson.build           |   8 +-
>   target/i386/meson.build               |   4 +-
>   17 files changed, 438 insertions(+), 270 deletions(-)
>   rename {accel => target/i386}/kvm/sev-stub.c (100%)
>   delete mode 100644 target/i386/sev-stub.c
>   create mode 100644 target/i386/sev-sysemu-stub.c
> 


