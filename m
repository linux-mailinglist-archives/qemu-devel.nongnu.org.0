Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C81409E45
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 22:38:53 +0200 (CEST)
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPsj5-00061v-Qp
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 16:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mPshZ-0005LT-OX
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:37:17 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mPshY-0001rt-7e
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:37:17 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so371763pjc.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 13:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ui9GYn4av0dABISNGLzIoAzEBPKnYr2TlgTEY6KHMFw=;
 b=LeU5jXXyIfrcOVz0wRQxr+hAeTyUM8y/GuFPyHR9f8RfjjzSepzVX+Ozu93VnuNuOE
 apauioVVQunnf6k+tIep/qn7zzjPHzO0nu0wwQP7aF1Csm6dwuE4MJ88YGQ97+b5KccB
 HSik5FirZqjyJApjfjwnvGYmA1ClAI4Er1tHqppbO8rwx/EMX6Hcem9Az4i/+r7L8GOo
 X4hdQ1xbtmhUskwtOSGXQd3kL1MrL9SS0qzZcQEAQi4Bpxed5MHUjuBJgxih3T2BiKDe
 AkCWVcJlyizV/7WCml1yCWolMGKcJMSfDRmizn9MZmZJC9ZtR3PlQE2UMuevar0tVjDy
 reew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ui9GYn4av0dABISNGLzIoAzEBPKnYr2TlgTEY6KHMFw=;
 b=bmWP3uPhBwXzhVQQvhCEf0rS14RWCXZ83H9IfGCRyzwGtvIJlckOD0rllYs/l/GCmr
 cMisL/1owrsYJcPc7bPkFHF/3uYkYbFW9OlK1JPGP0w4a5/MY888A7rM4re+PIOdWkAD
 RV2O9RKc7SqAzVuCSWMKzs1Z32DJ8qUaFHQUPiVg+ARMicusAtZK8TrCOU5QNnEIFtYx
 gnh02FSx9tX6RmGaWAX2B51BuIIg9FC9OMePM9BRa/4pMy/sMiLpvyvZze6K+0vTwd8/
 s5zl/gWn/RBapxX0Xt5K+oWNB82NAp3gMzuzFRiS/AKCL/byFpxHl5ohAmkMm7wbjPTu
 1DOQ==
X-Gm-Message-State: AOAM532REJnvAZqEvWtExIudiRceUZYAdH+GYBr/2T32wwI68jQhy1xi
 Xmhtg8i8YnEHSDRfVGXspj9WZg==
X-Google-Smtp-Source: ABdhPJxoAucJ7uRM0Ui+7eiDDeaOAPjNIyqTC972deLZN9nYjPSEmNrqn8Q+tE/golzyAeMfPCklJA==
X-Received: by 2002:a17:90a:6c97:: with SMTP id
 y23mr1431951pjj.117.1631565433574; 
 Mon, 13 Sep 2021 13:37:13 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id r8sm9166625pgp.30.2021.09.13.13.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 13:37:12 -0700 (PDT)
Date: Mon, 13 Sep 2021 20:37:09 +0000
From: Sean Christopherson <seanjc@google.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 kai.huang@intel.com, eblake@redhat.com, Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
Message-ID: <YT+2ddfdb+6u83Jq@google.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
 <0ec706b694f8e9451452b23c76c8a39155baf357.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec706b694f8e9451452b23c76c8a39155baf357.camel@kernel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102b.google.com
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

On Mon, Sep 13, 2021, Jarkko Sakkinen wrote:
> On Fri, 2021-09-10 at 17:10 +0200, Paolo Bonzini wrote:
> > On 19/07/21 13:21, Yang Zhong wrote:
> > > +void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
> > > +                              Error **errp)
> > > +{
> > > +    MemoryRegion *mr = &backend->mr;
> > > +
> > > +    mr->enabled = false;
> > > +
> > > +    /* destroy the old memory region if it exist */
> > > +    if (fd > 0 && mr->destructor) {
> > > +        mr->destructor(mr);
> > > +    }
> > > +
> > > +    sgx_epc_backend_memory_alloc(backend, errp);
> > > +}
> > > +
> > 
> > Jarkko, Sean, Kai,
> > 
> > this I think is problematic because it has a race window while 
> > /dev/sgx_vepc is closed and then reopened.  First, the vEPC space could 
> > be exhausted by somebody doing another mmap in the meanwhile.  Second, 
> > somebody might (for whatever reason) remove /dev/sgx_vepc while QEMU runs.
> 
> 1: Why is it a problem that mmap() could fail?

The flow in question is QEMU's emulation of a guest RESET.  If mmap() fails, QEMU
either has to kill the VM or disable SGX.  In either case, it's fatal to a running
workload/VM.

> 2: Are you speaking about removing device node? If you have succesfully
>    mapped /dev/sgx_vepc, that should not have much effect (file refcount).

Paolo was calling out that doing munmap() before mmap() would allow /dev/sgx_vepc
to be removed because QEMU would no longer hold a reference to /dev/sgx_vepc.  That
would again be fatal to the VM as QEMU would not be able to re-mmap() guest EPC.

