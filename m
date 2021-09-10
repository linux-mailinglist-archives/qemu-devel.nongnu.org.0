Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BC4407273
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 22:22:36 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOn2h-0006xS-1Z
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 16:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mOn1K-0006B3-RX
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 16:21:10 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mOn1G-0004Eb-Ue
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 16:21:10 -0400
Received: by mail-pg1-x52f.google.com with SMTP id e7so2876168pgk.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Qpq3lEFF1YHW5gnBTjZSoRGtx24jhImKCoz7zuDBUXM=;
 b=oaCAemCxmnsUhujrFcU+dNuPEoKXCj3jxoZIFmuDWxL+I2KXGOdHn3K8iH6g5lKOLc
 AcBoxiplSu9H0OcFCWhvJapWjetoLy/09Cd6yVn+BjXRAS9gERHWzsLGx7HOEeo2Kd2k
 JlhCgyo5G4A8wd/ia8jd3SCSTVzJ7W95H8jmDSBp/QKfZlSdyLcAho5KGzU3nHG5YmXu
 gliZt2EFZi7yabtCrit/JH2KJSYd3EovYI2DN2kqKZH1eLGlX2V5vQXOgy1DkdQtI3Z3
 I0l8U7P7mWWaaXaePdgqi8bCwovJRGs0IGVHx+pbmV7PdpJ3akeNCVshTqkBBuaCcjP+
 dJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Qpq3lEFF1YHW5gnBTjZSoRGtx24jhImKCoz7zuDBUXM=;
 b=XqdweRfzVEQAeFd/OAb3hsnaLLenjLjhf6gSdoxszmJkkgINbb+lAqec7fRFo/6iuO
 PvWBYoLrZW9MKOddNdxbhi2OaJfAr9DOratyDR1rUBmAsyWxmzrCQoYIjR9gaDNRPTxu
 D4VgLeISlHADyrlqqASO55Hso/McAr/Aj6GiN+vBJmTGvAm6kkl1ZNU9DlX+/hRcJlVl
 9On4YFxho+drpTwCfrDNHjNfl76RZbZS0WB0ROjgYpF9ySckQ5trWJhe8UCupHBP1ha1
 +99XIXridc6Ms9ayd5Y4PQpA7p0dLRDHb9VdACtoHTl1XnBN9mYN5IyBX3zYXuowhGhp
 QD/g==
X-Gm-Message-State: AOAM531fOXPLJFLbXuQURYyHIkCqqk0LCyO1JLyZGOzWlxtMrBmXKB/w
 XGZL3ccjXRhb6VKJswFWwr6zpg==
X-Google-Smtp-Source: ABdhPJw/9aJ8xFJ6kzmSlKRfwYM4uUEfoGPhRAUceevHb/26CQu1+h3CLVCPAoNp1P+MzclDGVzI5w==
X-Received: by 2002:a05:6a00:ac8:b029:320:a6bb:880d with SMTP id
 c8-20020a056a000ac8b0290320a6bb880dmr9506384pfl.41.1631305264742; 
 Fri, 10 Sep 2021 13:21:04 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id c4sm5868307pji.51.2021.09.10.13.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 13:21:04 -0700 (PDT)
Date: Fri, 10 Sep 2021 20:21:00 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jarkko@kernel.org, kai.huang@intel.com,
 eblake@redhat.com, Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
Message-ID: <YTu+LG8v6eOhQBzi@google.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
 <YTt7H9ifqjeOQztl@google.com>
 <b940de84-7eac-59de-7b15-15060c31de52@redhat.com>
 <YTuXJUjR8noe34h6@google.com>
 <cfcf6570-79c2-f351-d651-2cb25f691165@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfcf6570-79c2-f351-d651-2cb25f691165@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=seanjc@google.com; helo=mail-pg1-x52f.google.com
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

On Fri, Sep 10, 2021, Paolo Bonzini wrote:
> On 10/09/21 19:34, Sean Christopherson wrote:
> > On Fri, Sep 10, 2021, Paolo Bonzini wrote:
> > > On 10/09/21 17:34, Sean Christopherson wrote:
> > > > The only other option that comes to mind is a dedicated ioctl().
> > > 
> > > If it is not too restrictive to do it for the whole mapping at once,
> > > that would be fine.
> > 
> > Oooh, rats.  That reminds me of a complication.  If QEMU creates multiple EPC
> > sections, e.g. for a vNUMA setup, resetting each section individually will fail
> > if the guest did an unclean RESET and a given enclaves has EPC pages from multiple
> > sections.  E.g. an SECS in vEPC[X] can have children in vEPC[0..N-1], and all
> > those children need to be removed before the SECS can be removed.  Yay SGX!
> > 
> > There are two options: 1) QEMU has to handle "failure", or 2) the kernel provides
> > an ioctl() that takes multiple vEPC fds and handles the SECS dependencies.  #1 is
> > probably the least awful option.  For #2, in addition to the kernel having to deal
> > with multiple fds, it would also need a second list_head object in each page so
> > that it could track which pages failed to be removed.  Using the existing list_head
> > would work for now, but it won't work if/when an EPC cgroup is added.
> > 
> > Note, for #1, QEMU would have to potentially do three passes.
> > 
> >    1. Remove child pages for a given vEPC.
> >    2. Remove SECS for a given vEPC that were pinned by children in the same vEPC.
> >    3. Remove SECS for all vEPC that were pinned by children in different vEPC.
> 
> It's also possible that QEMU handles failure, but the kernel does two
> passes; then QEMU can just do two passes.  The kernel will overall do four
> passes, but:
> 
> 1) the second (SECS pinned by children in the same vEPC) would be cheaper
> than a full second pass

The problem is that this would require a list_head (or temp allocations) to track
the SECS pages that failed the first time 'round.  For vEPC destruction, the kernel
can use sgx_epc_page.list because it can take the pages off the active/allocated
list, but that's not an option in this case because the presumably-upcoming EPC
cgroup needs to keep pages on the list to handle OOM.

The kernel's ioctl/syscall/whatever could return the number of pages that were
not freed, or maybe just -EAGAIN, and userspace could use that to know it needs
to do another reset to free everything.

My thought for QEMU was to do (bad pseudocode):

	/* Retry to EREMOVE pinned SECS pages if necessary. */
	ret = ioctl(SGX_VEPC_RESET, ...);
	if (ret)
		ret = ioctl(SGX_VEPC_RESET, ...);

	/*
	 * Tag the VM as needed yet another round of resets to ERMOVE SECS pages
	 * that were pinned across vEPC sections.
	 */
	vm->sgx_epc_final_reset_needed = !!ret;

> 2) the fourth would actually do nothing, because there would be no pages
> failing the EREMOV'al.
> 
> A hypothetical other SGX client that only uses one vEPC will do the right
> thing with a single pass.

