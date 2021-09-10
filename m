Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC7E40709A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:35:43 +0200 (CEST)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOkRD-0003Yo-36
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mOkQ9-0002s7-Tu
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:34:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mOkQ8-0002v2-4p
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:34:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id j6so2170451pfa.4
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nLU4eFhljL6PMypFgwRicNXxnbEWFTNQtPbHbNjVRSk=;
 b=nOv7jsDWQR+I17Iau1EKlcMR79jjYZxguDexsH8o03Qe1jl78RjAQUd71mYSC1FMFC
 WSAnU3epJynpoNClkWuP6Mzk8ntlDpUeca+HchpSnbEaQaEXr9RAFRIhoHdfBN72XO99
 xanoZ1lue6XGh7J3XssWFf+rdPh9C7OPjJoeJpkQMXZgYaD3HZ+y/Z0oDvwkbpvvtlwv
 KCrmvcxyn5Hc39kLlYGX8aSJIzKeNg5+Bc2RVnjM+LsQido3H+aF1xUK/21nJgmVYwnA
 PPidw80wTn3TdOoiWizymgseRstDVmiCQDs70iPFBYmA2pvKV6uf1G4nAkjAFta8uIkf
 zj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nLU4eFhljL6PMypFgwRicNXxnbEWFTNQtPbHbNjVRSk=;
 b=OqSrrKye6hLn0NowT8MjDeSkUEAtUcPBfTGC7sOy8N44jtqFgWBdgiHwBoadBHYnEo
 CbKOw/G94FX4vGfUqdrwrOMlLcdKZk2Kva4rBk4s20DHZGpHaE5jDXrRwMlYsjDrc3J4
 X1HP3yG6gSpCT6b871Oz7b+1V0jC4CCWEcYpoK8DBlhAEzsGLq9p2HTSMMYq6YI/qb98
 0lFojga6mHgq98fHHaLVDIiNlxtbNeUWH2HgpZaGK2Th9WxPd5Nbd57G+lXfQoELm6dn
 VNe4jMaQ1QnTMcx54TERjNp/2DdVfVwT8Nq88di1ByZ5JxdHUj4OKVyNq5wS/iFSP/vV
 7LHg==
X-Gm-Message-State: AOAM533WfXZIORAosWqwA2QJcugzNFhEyIFmwaO6dLkYomshqaNwLWk2
 ev2H2KKW9x7PnCSpU+mY1W5GMw==
X-Google-Smtp-Source: ABdhPJyMBMsU1439uJYb8fibHbS8ipF3YYG/bhK5Gbw0iMy+OhMPITBkWbzw+wJ5xatJCiKikxgrxA==
X-Received: by 2002:a65:5845:: with SMTP id s5mr8187045pgr.227.1631295274186; 
 Fri, 10 Sep 2021 10:34:34 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id i8sm5642214pfo.117.2021.09.10.10.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:34:33 -0700 (PDT)
Date: Fri, 10 Sep 2021 17:34:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jarkko@kernel.org, kai.huang@intel.com,
 eblake@redhat.com, Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
Message-ID: <YTuXJUjR8noe34h6@google.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
 <YTt7H9ifqjeOQztl@google.com>
 <b940de84-7eac-59de-7b15-15060c31de52@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b940de84-7eac-59de-7b15-15060c31de52@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=seanjc@google.com; helo=mail-pf1-x435.google.com
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
> On 10/09/21 17:34, Sean Christopherson wrote:
> > > Yang explained to me (offlist) that this is needed because Windows fails to
> > > reboot without it.  We would need a way to ask Linux to reinitialize the
> > > vEPC, that doesn't involve munmap/mmap; this could be for example
> > > fallocate(FALLOC_FL_ZERO_RANGE).
> > > 
> > > What do you all think?
> > 
> > Mechanically, FALLOC_FL_ZERO_RANGE could work, but it's definitely a stretch of
> > the semantics as the underlying memory would not actually be zeroed.
> 
> The contents are not visible to anyone, so they might well be zero
> (not entirely serious, but also not entirely unserious).

Yeah, it wouldn't be a sticking point, just odd.

> > The only other option that comes to mind is a dedicated ioctl().
> 
> If it is not too restrictive to do it for the whole mapping at once,
> that would be fine.

Oooh, rats.  That reminds me of a complication.  If QEMU creates multiple EPC
sections, e.g. for a vNUMA setup, resetting each section individually will fail
if the guest did an unclean RESET and a given enclaves has EPC pages from multiple
sections.  E.g. an SECS in vEPC[X] can have children in vEPC[0..N-1], and all
those children need to be removed before the SECS can be removed.  Yay SGX!

> If it makes sense to do it for a range, however,
> the effort of defining a ioctl() API is probably not worth it when
> fallocate() is available.
> 
> Either way, I suppose it would be just something like
> 
> 	/* for fallocate; otherwise just use xa_for_each */
> 	size = min_t(unsigned long, size, -start);
> 	end = (start + size - 1) >> PAGE_SHIFT;
> 	start >>= PAGE_SHIFT;
> 
> 	/*
> 	 * Removing in two passes lets us remove SECS pages as well,
> 	 * since they can only be EREMOVE'd after all their child pages.
> 	 * An EREMOVE failure on the second pass means that the SECS
> 	 * page still has children on another instance.  Since it is
> 	 * still in the xarray, bury our head in the sand and ignore
> 	 * it; sgx_vepc_release() will deal with it.
> 	 */
> 	LIST_HEAD(secs_pages);
>         xa_for_each_range(&vepc->page_array, index, entry, start, end) {
>                 if (!sgx_vepc_free_page(entry))
>                         list_add_tail(&epc_page->list, &secs_pages);
>         }
> 
>         list_for_each_entry_safe(epc_page, tmp, &secs_pages, list) {
> 		list_del(&epc_page->list);
>                 sgx_vepc_free_page(epc_page);
>         }
> So another advantage of the ioctl would be e.g. being able to return the
> number of successfully EREMOVEd pages.  But since QEMU would not do
> anything with the return value and _also_ bury its head in the sand,
> that would only be useful if you guys have other uses in mind.

There are two options: 1) QEMU has to handle "failure", or 2) the kernel provides
an ioctl() that takes multiple vEPC fds and handles the SECS dependencies.  #1 is
probably the least awful option.  For #2, in addition to the kernel having to deal
with multiple fds, it would also need a second list_head object in each page so
that it could track which pages failed to be removed.  Using the existing list_head
would work for now, but it won't work if/when an EPC cgroup is added.

Note, for #1, QEMU would have to potentially do three passes.

  1. Remove child pages for a given vEPC.
  2. Remove SECS for a given vEPC that were pinned by children in the same vEPC.
  3. Remove SECS for all vEPC that were pinned by children in different vEPC.

