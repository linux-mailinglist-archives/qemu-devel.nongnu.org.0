Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F7F3D188C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:02:23 +0200 (CEST)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6JME-00046N-7w
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m6JKw-0003Ml-1g
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:01:02 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m6JKu-000525-F8
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:01:01 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so893894pja.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 14:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6I5eiKz5LAQKzf8N+kryXVb/CNI9CVp9Q8lPmoR5Lz4=;
 b=i9o71rvDTCCzPsaaON5fGSVCSnVCFl1Vdr+IV1L4Cr8GZzTps7Yun21O0Co9SK8spB
 pSiwUN5FaksWku9iCFTusHBmiVeiymNCUnDEjvu38GhcKq2P6ZofbDNLvRBq1zdxZ4UU
 CDNWhKejD4whsJpqem1krybCTAEBmtku3cM61D+NoOu4o1Gi5cY0QLyR2uZpPQqEpl+r
 1t5tx/LLPlUeeHzF5zzYwkvhNBuwZ3q7DH598/xBJ9FsMvmWsQ+Amn/0KoxgBGx0QTx2
 rPP134JqP+2uGzvWnsFcnivFperrPjvUEaY+NUbwJb8/Uwm+hq16LiMufjLS3wK2IwFd
 uWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6I5eiKz5LAQKzf8N+kryXVb/CNI9CVp9Q8lPmoR5Lz4=;
 b=GuYIO5YlyDr6Gpryh7IiDP+rWOoRoFku4ecLrnrlkzMXciOcqBZ7FELJ6iOCAZ0YAl
 GUwApG4SEBZlC2ZQPuH+/5hAuXlf0blkpaVsAiSB9xBG/DBT9MfIyWFc3kGjDUYWWWw4
 fd61gky/mlGU2cGMVDrqcMvUggGTAji4MYGrPJQLebiilp7qO5MUqknz/R/IJYV3dyL4
 jSEoSIGF3E5xP1fVCVv8MMy7M1p/myWxUq93nE1Y5P53FdS7ASzlriIn+igOkDArypJB
 kj4pjX9/wTuEH8eTPyrkwg05uosZY/YZNziVVIhe/DQ7UM/H7ckUD93JprxohfdyF2qj
 2ENA==
X-Gm-Message-State: AOAM53281Rf+zRlMgTGPYHKU3mvA6mUDfMJhLm8leiI5uDcl4J2K/jJM
 G7UFagyQuINwQft8xobuoi+8Bw==
X-Google-Smtp-Source: ABdhPJwTCs1d5J7wRhGKPUQ54pjj0xJ1Xw2lMyhxxlaxbwFgYvvm9uDOXGyA0h/hW+m/zWJxMO5YpQ==
X-Received: by 2002:a17:90a:4d04:: with SMTP id
 c4mr5488398pjg.148.1626901256629; 
 Wed, 21 Jul 2021 14:00:56 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id g2sm23561340pjt.51.2021.07.21.14.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 14:00:55 -0700 (PDT)
Date: Wed, 21 Jul 2021 21:00:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: harry harry <hiharryharryharry@gmail.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, stefanha@redhat.com,
 mathieu.tarral@protonmail.com
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
Message-ID: <YPiLBLA2IjwovNCP@google.com>
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
 <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
 <YO8jPvScgCmtj0JP@google.com>
 <CA+-xGqOkH-hU1guGx=t-qtjsRdO92oX+8HhcO1eXnCigMc+NPw@mail.gmail.com>
 <YPC1lgV5dZC0CyG0@google.com>
 <CA+-xGqN75O37cr9uh++dyPj57tKcYm0fD=+-GBErki8nGNcemQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+-xGqN75O37cr9uh++dyPj57tKcYm0fD=+-GBErki8nGNcemQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -158
X-Spam_score: -15.9
X-Spam_bar: ---------------
X-Spam_report: (-15.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=1.668, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Thu, Jul 15, 2021, harry harry wrote:
> Hi Sean,
> 
> Thanks for the explanations. Please see my comments below. Thanks!
> 
> >  When TDP (EPT) is used, the hardware MMU has two parts: the TDP PTEs that
> >  are controlled by KVM, and the IA32 PTEs that are controlled by the guest.
> >  And there's still a KVM MMU for the guest; the KVM MMU in that case knows
> >  how to connfigure the TDP PTEs in hardware _and_ walk the guest IA32 PTEs,
> >  e.g. to handle memory accesses during emulation.
> 
> Sorry, I could not understand why the emulated MMU is still needed
> when TDP (e.g., Intel EPT) is used?
> In particular, in what situations, we need the emulated MMU to
> configure the TDP PTEs in hardware and walk the guest IA32 PTEs?

Ignoring some weird corner cases that blur the lines between emulation and
hardware configuration, the emulated IA32 MMU isn't used to configure TDP PTEs in
hardware, it's only used to walk the the guest page tables.

> Why do we need the emulated MMU in these situations?

For emulation of any instruction/flow that starts with a guest virtual address.
On Intel CPUs, that includes quite literally any "full" instruction emulation,
since KVM needs to translate CS:RIP to a guest physical address in order to fetch
the guest's code stream.  KVM can't avoid "full" emulation unless the guest is
heavily enlightened, e.g. to avoid string I/O, among many other things.

