Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291ED3CAF18
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 00:25:31 +0200 (CEST)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m49nN-00019d-Oa
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 18:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m49mR-0000Ad-ES
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 18:24:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m49mP-0008Eb-Os
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 18:24:31 -0400
Received: by mail-pf1-x435.google.com with SMTP id j9so6946974pfc.5
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 15:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2lQDk68Sg2ZcVfZoZUpcNk+B0eVf8vhZQYIFh/6ss3c=;
 b=oxwBnn1jSOaB6+KZAq7l+6dV6lmn2zeQyJ69rrNgm+dKEY+pzQZQ62yxFpf4m1G6jZ
 itXUe2AvaJ3SumTdAArdH6qy5jsvFVDJs4Y4bDQd4AmRsjm6B91BUyMlAzMREMJ4FHaF
 db9GBUCph88kknuQbH2as6UB+FBPUUw+gZvaxvBmVXB1wGIIx0yXcNpbcFcgkt38SRCE
 z+jxc8mxLxiRViX62tml0U7r8ArkYPlLX24ZLdL4gZdPgC5+T3MUp67jotAGqw0RLpHN
 1YxSy2VL0OZjwMW3L5nB4tEdYn2NmOBmvWkomOyxF8kyicvBWkoiLYbJs0qC9J4Klevv
 UGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2lQDk68Sg2ZcVfZoZUpcNk+B0eVf8vhZQYIFh/6ss3c=;
 b=sYJ7nbIbasM1I64XqNMa/T4IzudwwKN4a+kIxHlvvZO4+0O+9h6WJKAteT7jbEbXbe
 B/4wNFnajePlhlap9tV27XF2diAsqRSi4VGNcCLmbWy4BJgPRn02oDwdLO54bPnsuM4p
 Owrwa20uEE4iHG7yLL9LSJZNlpC6EFS6anLtTZIsDhgek7SR9tZUYOT7VSLZbzYw7sV6
 YH/XA57cizwihuLALl6TCi+GXq2+C/detuLSBCUHGlM/ZJiCsawN4euMFbh7nGh6grHY
 JYBJbOnLmSEEfLBKZ+eMibz0b9Pzn+bIqvt2T4/VTu94e4wDmfMdnVOzZ6TpITst67L4
 fEug==
X-Gm-Message-State: AOAM531Yx0znM1rAqiMx6WfhKDSrES0cESYCbeWaKfXNpk5VwMb6lrol
 QoO+ud5XVDqkpW0uVKpE07dQWQ==
X-Google-Smtp-Source: ABdhPJzPCzT3r4sxyQ8lS3dX63H0wq99U0HEg0khmmtGLlGyV2wHrFFVp+loksaPbmyCezZbvpkHZA==
X-Received: by 2002:a63:2b91:: with SMTP id r139mr6606926pgr.242.1626387867089; 
 Thu, 15 Jul 2021 15:24:27 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id c7sm8073897pgq.22.2021.07.15.15.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 15:24:26 -0700 (PDT)
Date: Thu, 15 Jul 2021 22:24:22 +0000
From: Sean Christopherson <seanjc@google.com>
To: harry harry <hiharryharryharry@gmail.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, stefanha@redhat.com,
 mathieu.tarral@protonmail.com
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
Message-ID: <YPC1lgV5dZC0CyG0@google.com>
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
 <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
 <YO8jPvScgCmtj0JP@google.com>
 <CA+-xGqOkH-hU1guGx=t-qtjsRdO92oX+8HhcO1eXnCigMc+NPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+-xGqOkH-hU1guGx=t-qtjsRdO92oX+8HhcO1eXnCigMc+NPw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=seanjc@google.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -146
X-Spam_score: -14.7
X-Spam_bar: --------------
X-Spam_report: (-14.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=2.896, RCVD_IN_DNSWL_NONE=-0.0001,
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
> > No, each vCPU has its own MMU instance, where an "MMU instance" is (mostly) a KVM
> > construct.  Per-vCPU MMU instances are necessary because each vCPU has its own
> > relevant state, e.g. CR0, CR4, EFER, etc..., that affects the MMU instance in
> > some way.  E.g. the MMU instance is used to walk guest page tables when
> > translating GVA->GPA for emulation, so per-vCPU MMUs are necessary even when
> > using TDP.
> >
> > However, shadow/TDP PTEs are shared between compatible MMU instances.  E.g. in
> > the common case where all vCPUs in a VM use identical settings, there will
> > effectively be a single set of TDP page tables shared by all vCPUs.
> 
> What do you mean by "MMU instance"? Do you mean VMCS? MMU is hardware.

No, an MMU is not a hardware-exclusive term, e.g. a software emulator will have
an MMU to emulate the MMU of the target hardware.

The terminology we use in KVM is roughly that a KVM MMU is KVM's presentation of
a hardware MMU to the guest.  E.g. when shadow paging is used, there is both the
hardware MMU that is stuffed with KVM's shadow PTEs, and the KVM MMU that models
the guest's MMU (the guest thinks its configuring a hardware MMU, but in reality
KVM is intercepting (some) guest PTE modifications).  When TDP (EPT) is used, the
hardware MMU has two parts: the TDP PTEs that are controlled by KVM, and the IA32
PTEs that are controlled by the guest.  And there's still a KVM MMU for the guest;
the KVM MMU in that case knows how to connfigure the TDP PTEs in hardware _and_
walk the guest IA32 PTEs, e.g. to handle memory accesses during emulation.

Even more fun, when nested TDP is used, there is a KVM MMU for L1, a KVM MMU for
L1's EPT for L2, a KVM MMU for L2 (L2's legacy page tables), and the hardware MMU.

> Could you please share me the code of the MMU instance in KVM? Thanks!

struct kvm_mmu, and generally speaking everything under arch/x86/kvm/mmu/.

