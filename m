Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F49406E4D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 17:37:17 +0200 (CEST)
Received: from localhost ([::1]:42620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOiaa-0001KV-VZ
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 11:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mOiYS-0000Ql-PT
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:35:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1mOiYQ-0007ma-O1
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 11:35:04 -0400
Received: by mail-pl1-x632.google.com with SMTP id 5so1381293plo.5
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vK7qo7+CpM+4gkKUlQAEMenFpqaDCkj+JdfDfV7upio=;
 b=drOElpaSBw5bL7lAqqMhmgYOQRBFoiPZbeXy0tZGda2rRGpaQKoD6soFrLZf2DcBbg
 R40rIVGvrpRHkj7cPZqzt10iqWgQueHNnQ4M9w/6pHD+XKtJt3O6qbFvCeZ6Lb7B7FkJ
 PqJfzkTh2XxGCQQxPjcKI2hnHE5XhfUlEGeG1REqiV635jZAwyTBHBQMaUwFquGQj267
 s8iVqXrX7pXV942Ce2gdwuP2LgbxNmH6Lbmwzl1QEGV/vFcBJkPqQ5KrsMcsWamz6sSI
 VnBQ2fMmlPlFI7k9i9mRxixOYHCK6hsssRtwfXw/OodNbr2ZOoc3b4GcYcUH4kstCEi3
 O7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vK7qo7+CpM+4gkKUlQAEMenFpqaDCkj+JdfDfV7upio=;
 b=PJQ//I7Ra8YAhcbXrciWuYLeEZ9lXFLu+8etjAIaiFniikMnc3fP2cW/XeRfA845K4
 dKQrYMP8EkPNaCoLIshSVbRZHTmCrun7EAw5Oe/LaAkvmIdT9gCq5wRxYZwZSAr4KRI/
 tCDSb9RtyvVn4UPSi5T86xoLXZIvxgbUxu8WV7qF4dpP3gfave0pixXpN6djHjztyTrh
 V0NKbM31P3NusQ8ysDBRpHQdJCamb6cE6d06GHj6JtA8Fj/upcutxpVvQwBza/daTWLG
 wr7mcbZxBujEsxBqwabjzm0Co4G4nioeTsuLcXOY5B1LzG9ocZ5OLOGdw3/DlRzHQNdk
 TXGg==
X-Gm-Message-State: AOAM533UNOK+2BzaDEvzIXEcfChodmIrOdUMpF1vSmL5UmHUMLPhT3lo
 iyS8hs70cswb1Z2PMfhLH40R7w==
X-Google-Smtp-Source: ABdhPJzo92E9wzx8kbRIBZ0FZApTutZuYrF98w4REwmrFr+PdvxZLa+OTdyo7l6R02h0wabAOxEurA==
X-Received: by 2002:a17:90b:1e4a:: with SMTP id
 pi10mr10189525pjb.135.1631288099242; 
 Fri, 10 Sep 2021 08:34:59 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id m2sm5804488pgd.70.2021.09.10.08.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 08:34:58 -0700 (PDT)
Date: Fri, 10 Sep 2021 15:34:55 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, jarkko@kernel.org, kai.huang@intel.com,
 eblake@redhat.com, Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v4 22/33] hostmem-epc: Add the reset interface for EPC
 backend reset
Message-ID: <YTt7H9ifqjeOQztl@google.com>
References: <20210719112136.57018-1-yang.zhong@intel.com>
 <20210719112136.57018-23-yang.zhong@intel.com>
 <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc8394c5-52a1-573f-36d3-de8bc43973d3@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=seanjc@google.com; helo=mail-pl1-x632.google.com
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
> On 19/07/21 13:21, Yang Zhong wrote:
> > +void sgx_memory_backend_reset(HostMemoryBackend *backend, int fd,
> > +                              Error **errp)
> > +{
> > +    MemoryRegion *mr = &backend->mr;
> > +
> > +    mr->enabled = false;
> > +
> > +    /* destroy the old memory region if it exist */
> > +    if (fd > 0 && mr->destructor) {
> > +        mr->destructor(mr);
> > +    }
> > +
> > +    sgx_epc_backend_memory_alloc(backend, errp);
> > +}
> > +
> 
> Jarkko, Sean, Kai,
> 
> this I think is problematic because it has a race window while /dev/sgx_vepc
> is closed and then reopened.  First, the vEPC space could be exhausted by
> somebody doing another mmap in the meanwhile.  Second, somebody might (for
> whatever reason) remove /dev/sgx_vepc while QEMU runs.

Yep, both error cases are possible.

> Yang explained to me (offlist) that this is needed because Windows fails to
> reboot without it.  We would need a way to ask Linux to reinitialize the
> vEPC, that doesn't involve munmap/mmap; this could be for example
> fallocate(FALLOC_FL_ZERO_RANGE).
> 
> What do you all think?

Mechanically, FALLOC_FL_ZERO_RANGE could work, but it's definitely a stretch of
the semantics as the underlying memory would not actually be zeroed.

The only other option that comes to mind is a dedicated ioctl().

