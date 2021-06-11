Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F193A462C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:09:09 +0200 (CEST)
Received: from localhost ([::1]:34372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrjiV-0002j1-JZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrjbg-0004Y8-NL
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lrjbd-0004Cg-UU
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623427320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KodckdEdFkiVnhQ3kWeVQWRJntz+7Wxk85hCibed+y8=;
 b=BeRar4kXqSFTiG4Zhzn1wJuUeiNnydo8/aDInHIs35OvEd/YLhxi9pwirkiyHz4W/xcNkA
 RSOzUjrzFwLrmbHZjWc1OSBBAFQrtydCkxoRdKi3lgefdoO548uvpHgRCsS7RFvYaD4k/s
 FSVYPb4+Ii68hWkHMehm6ptpgGZwoCQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-DRTitmLOPeGb6OT3kccLHA-1; Fri, 11 Jun 2021 12:01:59 -0400
X-MC-Unique: DRTitmLOPeGb6OT3kccLHA-1
Received: by mail-wm1-f69.google.com with SMTP id
 a25-20020a7bc1d90000b029019dd2ac7025so4571336wmj.1
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 09:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KodckdEdFkiVnhQ3kWeVQWRJntz+7Wxk85hCibed+y8=;
 b=JlIPVjciGk5Uw3A6heS1P6kolJ78zrAdVac4vqJn/64Umsur43QytxgMN/wNRUXfX4
 ETPEzDsL5KPNdokUdTOLfICPwzbL4dMF2wGY9WGrmeuXuDe6RzVWFA7M/4mMm8As0TSD
 9bAcUUAsYJsSbY+MYAsarimsZk6rvOZqarvRliM9jkJVa6zEtHQhLDBgu97qJ07vEep0
 B8gFedTeMukoRIdsjXVLgaP71DK8+NXmnIJhaEUK7iPmcZNIBCUYjaI5HHI4KykBz3rJ
 K3L8Xv3RZJwQKm0k2h4Iowk+IuJdx2mV63b9XpJj0ryypzTJch73iRLcmj9xCAy7oPRC
 je1A==
X-Gm-Message-State: AOAM530V0ocL+DD4sed/FgGJ2HQ890ZfmFqlAB9B4epmjGkQYzokS9TH
 zBFX2rWjVJyThEWcwbaAsGivlXVeIQs6YKwOmcUJ7xYONp6Hv2VJ1N+jaxdqkj0JkAAvtmePmhh
 ZmKzja9SzqLPD3sM=
X-Received: by 2002:a05:6000:22c:: with SMTP id
 l12mr4838449wrz.329.1623427317874; 
 Fri, 11 Jun 2021 09:01:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkO/4rFB+Bz9cLk6zIBi8aAYZqwvx6oQXfxBfVew8J+fQdIHhS0NRnmI0ob3DFrOtSokAkyg==
X-Received: by 2002:a05:6000:22c:: with SMTP id
 l12mr4838420wrz.329.1623427317678; 
 Fri, 11 Jun 2021 09:01:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m132sm6508982wmf.10.2021.06.11.09.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 09:01:56 -0700 (PDT)
Subject: Re: [RFC PATCH 0/7] Support protection keys in an AMD EPYC-Milan VM
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210520145647.3483809-1-david.edmondson@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <330417d8-9e23-4c90-b825-24329d3e4c66@redhat.com>
Date: Fri, 11 Jun 2021 18:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520145647.3483809-1-david.edmondson@oracle.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Babu Moger <babu.moger@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First of all, sorry for the delayed review.

On 20/05/21 16:56, David Edmondson wrote:
> AMD EPYC-Milan CPUs introduced support for protection keys, previously
> available only with Intel CPUs.
> 
> AMD chose to place the XSAVE state component for the protection keys
> at a different offset in the XSAVE state area than that chosen by
> Intel.
> 
> To accommodate this, modify QEMU to behave appropriately on AMD
> systems, allowing a VM to properly take advantage of the new feature.

Uff, that sucks. :(

If I understand correctly, the problem is that the layout of 
KVM_GET_XSAVE/KVM_SET_XSAVE depends on the host CPUID, which in 
retrospect would be obvious.  Is that correct?  If so, it would make 
sense and might even be easier to drop all usage of X86XSaveArea:

* update ext_save_areas based on CPUID information in kvm_cpu_instance_init

* make x86_cpu_xsave_all_areas and x86_cpu_xrstor_all_areas use the 
ext_save_areas offsets to build pointers to XSaveAVX, XSaveBNDREG, etc.

What do you think?

Paolo

> Further, avoid manipulating XSAVE state components that are not
> present on AMD systems.
> 
> The code in patch 6 that changes the CPUID 0x0d leaf is mostly dumped
> somewhere that seemed to work - I'm not sure where it really belongs.
> 
> David Edmondson (7):
>    target/i386: Declare constants for XSAVE offsets
>    target/i386: Use constants for XSAVE offsets
>    target/i386: Clarify the padding requirements of X86XSaveArea
>    target/i386: Prepare for per-vendor X86XSaveArea layout
>    target/i386: Introduce AMD X86XSaveArea sub-union
>    target/i386: Adjust AMD XSAVE PKRU area offset in CPUID leaf 0xd
>    target/i386: Manipulate only AMD XSAVE state on AMD
> 
>   target/i386/cpu.c            | 19 +++++----
>   target/i386/cpu.h            | 80 ++++++++++++++++++++++++++++--------
>   target/i386/kvm/kvm.c        | 57 +++++++++----------------
>   target/i386/tcg/fpu_helper.c | 20 ++++++---
>   target/i386/xsave_helper.c   | 70 +++++++++++++++++++------------
>   5 files changed, 152 insertions(+), 94 deletions(-)
> 


