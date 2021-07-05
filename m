Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C413BC1EF
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:59:31 +0200 (CEST)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RwQ-0004Ex-Et
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0Rur-0002uH-D4
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0Run-00067C-54
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625504268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRt+Adp4e/5DqWeJnNZwJwNekN9wq5BW7MLMJkM77B0=;
 b=ak/2RIxadDtO4P9Cp1DqVflrFFIUD0RuXx6EE+3/YiHi2xJD7R5roJgbnLBZrS/JQuZas9
 J1Qv//hII9ACI2jeAJ57Ft9WS06rF7zY81QDY9et8l6pN8RhGSV5vEOQSO6mnWRlQ7WWb8
 YTCngTGnfaSGPCmFcaA1rt+cZax74e4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-rMjtp1lUPQCZTjLzCPfLCQ-1; Mon, 05 Jul 2021 12:57:45 -0400
X-MC-Unique: rMjtp1lUPQCZTjLzCPfLCQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adff04c0000b029013253c3389dso1973119wro.7
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NRt+Adp4e/5DqWeJnNZwJwNekN9wq5BW7MLMJkM77B0=;
 b=oDnVC/DEsQ86tj3udSFWkcqVjJtwzbA4cn77kHbmvQmohz+A3Fk76s4bPlkDULwIyN
 ucjFF4tqqU1jTi6oN7PGGB+C/xkXb0vUm7hA9t56lhsWlgrnpGQJDh2KtPbwDXCbiT/k
 Uhhefc7L4xAez/zlLVvjLN+XWzsDeI0b87HtCK1u0rPLduQpPzsVV7usLo694BoO5/yB
 JNUAAoWfMwTD+KIaLTTf/O4ob0J7yiTsFGe8kG2BxMuYv8lmbgaFAK7QJOlGKacnbAt7
 YZtB2ikplCB01Bhg68urmrNaOR0WjBr1z35oAoSv2IU99JxFJ+BKZqPazmx2isiaGrWA
 VFow==
X-Gm-Message-State: AOAM532R1ti4cRL1xvfro20qwsZjGtWHPGOdPuuibgirQvc/iDFYPuED
 uD3XatSdzi5SNBB8OkBJrsgzx5Hl3hq/l/W2UAq6RyKjz+iECCUE3wNt9SZhac2ddwTtnIoXI/9
 QMvlpLSy9hE2E4ww=
X-Received: by 2002:adf:fac7:: with SMTP id a7mr16721556wrs.384.1625504263894; 
 Mon, 05 Jul 2021 09:57:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbCyZ+1Tu2rvGrznxgPZJrHO62wYyvyclAmXH8puX+YGe5rKOQwYBSYJq+dGKas0KoJ49L9A==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr16721541wrs.384.1625504263751; 
 Mon, 05 Jul 2021 09:57:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m7sm443159wms.0.2021.07.05.09.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 09:57:43 -0700 (PDT)
Subject: Re: [RFC PATCH 0/8] Derive XSAVE state component offsets from CPUID
 leaf 0xd where possible
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210705104632.2902400-1-david.edmondson@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <811b9dd2-1e9f-d0fc-d3cb-c95671ac09ea@redhat.com>
Date: Mon, 5 Jul 2021 18:57:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705104632.2902400-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, babu.moger@amd.com,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/21 12:46, David Edmondson wrote:
> The offset of XSAVE state components within the XSAVE state area is
> currently hard-coded via reference to the X86XSaveArea structure. This
> structure is accurate for Intel systems at the time of writing, but
> incorrect for newer AMD systems, as the state component for protection
> keys is located differently (offset 0x980 rather than offset 0xa80).
> 
> For KVM and HVF, replace the hard-coding of the state component
> offsets with data derived from CPUID leaf 0xd information.
> 
> TCG still uses the X86XSaveArea structure, as there is no underlying
> CPU to use in determining appropriate values.
> 
> This is a replacement for the changes in
> https://lore.kernel.org/r/20210520145647.3483809-1-david.edmondson@oracle.com,
> which simply modifed the hard-coded offsets for AMD systems.
> 
> Testing on HVF is minimal (it builds and, by observation, the XSAVE
> state component offsets reported to a running VM are accurate on an
> older Intel system).

This looks great, thanks, so I am queuing it.

Paolo

> David Edmondson (8):
>    target/i386: Declare constants for XSAVE offsets
>    target/i386: Consolidate the X86XSaveArea offset checks
>    target/i386: Clarify the padding requirements of X86XSaveArea
>    target/i386: Pass buffer and length to XSAVE helper
>    target/i386: Make x86_ext_save_areas visible outside cpu.c
>    target/i386: Observe XSAVE state area offsets
>    target/i386: Populate x86_ext_save_areas offsets using cpuid where
>      possible
>    target/i386: Move X86XSaveArea into TCG
> 
>   target/i386/cpu.c            |  18 +--
>   target/i386/cpu.h            |  41 ++----
>   target/i386/hvf/hvf-cpu.c    |  34 +++++
>   target/i386/hvf/hvf.c        |   3 +-
>   target/i386/hvf/x86hvf.c     |  19 ++-
>   target/i386/kvm/kvm-cpu.c    |  36 +++++
>   target/i386/kvm/kvm.c        |  52 +------
>   target/i386/tcg/fpu_helper.c |   1 +
>   target/i386/tcg/tcg-cpu.c    |  20 +++
>   target/i386/tcg/tcg-cpu.h    |  57 ++++++++
>   target/i386/xsave_helper.c   | 267 ++++++++++++++++++++++++++---------
>   11 files changed, 381 insertions(+), 167 deletions(-)
> 


