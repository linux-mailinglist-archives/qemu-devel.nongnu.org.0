Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29376372DF3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:23:06 +0200 (CEST)
Received: from localhost ([::1]:36358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxpB-0003RD-8w
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ldxmW-0001rp-VM
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:20:21 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1ldxmV-0008Dq-5N
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:20:20 -0400
Received: by mail-pg1-x530.google.com with SMTP id c21so3374823pgg.3
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xXdAn9t4SsUAsHVgRRYlcXap7OL+Ww0ryP6eMbqbcmY=;
 b=doWG6SO5G4D/LfqWAncO2uVORTdDP3Lief4n64wqmuxH5LeasK4ibPbo211IvxOn+g
 SDBZ0jwsUN7Qi1+Til72NUxIvSV7Rwu2GUmo8AFggpNNMGjWTAyHXpYGBCDseo4LYKCY
 /127IrgzpjCEvxv11c4MdT6EZzX2e8ZtAMG8QOfCdxIdBBI+G5vhPS2uSQjVu++Z5Q20
 WFYToi62fVhvOwi9WmpO60JuJNYqa+qT+X6APlbkCGAiDNAiRee9hs0vpD4qrgLuaeZ4
 pZQ0Eyk7TtOebR25shDUnP6O67CdlRUhB+cb2TGON49BREMR+vASi47Ma3KWuFfQL0yn
 vfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xXdAn9t4SsUAsHVgRRYlcXap7OL+Ww0ryP6eMbqbcmY=;
 b=Y5ZAaKw+lxqRRsT75utMR/fuLDvfqzXjmgnSYKycfYTuvd8yd2q7U+KNki2wEHSNyS
 woPRvPc4aeTBDMjCiqfrL+dNWVNrdDaqZaZBBA38rUnfXW/u2hZsEvvkvQHEbwVH0nvq
 ndA8mxDSTSTrtWYDTNxWbMn/QwqGfr3ixLzrW2JOzzPc+3K5IbE0m1SxzlijNdMBDdrp
 2l2NTvp8cq8cXPXf3YdDDAq1HXjzMrT5BMYWb9r+RH95em6o1FRwUSgCs1hQtOugPgcD
 1U5MMxGEpl2uZxgXTR3xoQF5alYSWDKZBCv/3//4AWwSRU2K0JNademzw7qfsPV16+HJ
 Pmbw==
X-Gm-Message-State: AOAM530VWlIrGJm9I23bHd6DiZzy5bX3Fq0ujFG7wcux1673RyCAVCW6
 4qYBypgxuVfbK1WGjizFLe5zmw==
X-Google-Smtp-Source: ABdhPJyOPrW4TvWsDgCiX5eVOB1Ud8lZkPym6E6ofwEPtl3WZhpBnatSVkev6hCAVS5yCyXqI+fo/Q==
X-Received: by 2002:a17:90a:690d:: with SMTP id
 r13mr6303840pjj.19.1620145217407; 
 Tue, 04 May 2021 09:20:17 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com.
 [35.247.111.240])
 by smtp.gmail.com with ESMTPSA id s184sm3899562pgc.29.2021.05.04.09.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 09:20:16 -0700 (PDT)
Date: Tue, 4 May 2021 16:20:13 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org,
 kai.huang@intel.com
Subject: Re: [RESEND PATCH 05/32] vl: Add "sgx-epc" option to expose SGX EPC
 sections to guest
Message-ID: <YJF0PXZc3/X8hJ4P@google.com>
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-6-yang.zhong@intel.com>
 <d772cdd1-69fa-b48f-b8ff-c07cd383b04e@redhat.com>
 <YJCQwXVmS/om2HrW@google.com>
 <d0785500-d007-9d96-1ee1-ce0e4a71c88c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0785500-d007-9d96-1ee1-ce0e4a71c88c@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=seanjc@google.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Tue, May 04, 2021, Paolo Bonzini wrote:
> On 04/05/21 02:09, Sean Christopherson wrote:
> > Is there a way to process "-device sgx-epc..." before vCPUs are realized?  The
> > ordering problem was the only reason I added a dedicated option.
> 
> If it's just CPUID, one possibility could be to mark the EPC sections
> specially in KVM_SET_USER_MEMORY_REGION and synthesize the leaves within
> KVM; or even look inside the VMA structs and detect EPC regions that way.

I experimented with those options, and a few others, and they all lack the
flexibility of making EPC just another memory backend.

For synthesizing CPUID within KVM:
  - Requires a vendor specific memory region flag for all architectures to work
    around a quirk of one userspace VMM.
  - Pushes a lot of complexity into KVM, e.g. KVM needs to update CPUID in
    response to memslot changes, and needs to query memslots in response to
    CPUID changes.
  - Does KVM or userspace define the section attributes, e.g. confidentiality,
    integrity, etc...?  If KVM, are they hardcoded to match the host?  What
    happens if a future Intel platform supports multiple EPC sections with
    different attributes?  If userspace, how does userspace communicate the
    attributes?
  - How does userspace know what KVM enumerated to the guest?  See the whole
    KVM_GET_CPUID2 fiasco...
  - Prevents userspace from enumerating EPC without a memslot, e.g. to trap on
    the first EPC access for tracking purposes.
 
For probing VMAs:
  - In addition to the above issues, requires MMU notifier integration to update
    CPUID in response to a VMA change.
  - Requires SGX subsystem to provide a helper to identify EPC VMAs.

In short, I feel very strongly that this is QEMU's problem to solve.

> Otherwise, the -M solution would work.
> 
> Paolo
> 
> >  From the changelog:
> > 
> >    Because SGX EPC is enumerated through CPUID, EPC "devices" need to be
> >    realized prior to realizing the vCPUs themselves, i.e. long before
> >    generic devices are parsed and realized.
> > 
> >    So even though EPC sections could be realized through the generic
> >    -devices command, they need to be created much earlier for them to
> >    actually be usable by the guest.
> 

