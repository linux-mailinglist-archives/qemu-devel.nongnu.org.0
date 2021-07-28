Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570B3D9653
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:03:20 +0200 (CEST)
Received: from localhost ([::1]:51882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8plu-0003lG-5G
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m8pk7-0002G4-Ns
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:01:30 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m8pk5-0007Z7-V2
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:01:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j18-20020a17090aeb12b029017737e6c349so3653040pjz.0
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5V+3TulVXEpX/pMbaAYmxkuA071az55HT2aQQNzw7t0=;
 b=bSKcByMzvPLm7BSPPR3H4n9NyxqF2iNg0oXrCBrVhce4Nj84UHSbEY4rlJDSPmi3Xn
 phpRFe23OLEKyIkQ4gCWRzrAYct0IyodFdLq37IJJ8yU9hydxE7+JeWLzAFyfj6sPBTw
 7FK+4crJwWQlDIxQeTx05qLAyG06knq0293gXfCAo/DpDspwvYzGbAU/DeLfHMKhDYCB
 9xvuMP9kLkMD8Ni/k3UI10v7uMFFOtJLCs2BWkj4jmLyKxg7gtI+lv7fB9nTBk8n49EY
 xSCKZwFW2XDobOHIaqIqb0xcD3Rxc9u//VjGhZyYHzXBoMit6hvGqsba2KwLP+OOIknA
 W8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5V+3TulVXEpX/pMbaAYmxkuA071az55HT2aQQNzw7t0=;
 b=K6y5UULQcwA4Ja3Ldip8PaiaLrEwmoSLnonPYzTt3ag4FpddaCxOkzptJ4mFZbt3aY
 e0YjgXQrtWHNKhpoW6SQejdyWCM1609AQyOxxkfA+8O52d7FEaBMU6e4ZkQZFfHcXM7I
 YqnaukirnP01u+Wt5LXyHcGIKriRwU67RYDh+DJCEIiWaqBmqZxxoTyCgQELT7XIomlS
 jh5rUcIMzfGENgCXq78GkIK8b3O0RU4DUqSDh/MyMY5ANlB+eYX089ARGgM1wCXjdC9f
 heLGXD7TxPUQOOgv/iL114ZCOezjq2aDY6U+8SML3QfYdblY3nOs5ye76OvvdWUJrGaA
 aaRw==
X-Gm-Message-State: AOAM531QgiyN31P8MxtEZHytSmCPneC87zUIhT7Ou1NuLeeaODNJxd7z
 5bjWHnb23lWHLKfyjjjM9vpqeg==
X-Google-Smtp-Source: ABdhPJzOYCEbSuawoSYEZLeDPr383fnT41sSJYHqTkot1VEMVQ+3sJU9slGWbeKrG6TyJvglvWdlIg==
X-Received: by 2002:a63:5f87:: with SMTP id t129mr541168pgb.85.1627502483188; 
 Wed, 28 Jul 2021 13:01:23 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id b184sm856993pfg.72.2021.07.28.13.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:01:22 -0700 (PDT)
Date: Wed, 28 Jul 2021 20:01:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: harry harry <hiharryharryharry@gmail.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, stefanha@redhat.com,
 mathieu.tarral@protonmail.com
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
Message-ID: <YQG3jg9kSqfzmbPB@google.com>
References: <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
 <YOxYM+8qCIyV+rTJ@google.com>
 <CA+-xGqOSd0yhU4fEcobf3tW0mLb0TmLGycTwXNVUteyvvnXjdw@mail.gmail.com>
 <YO8jPvScgCmtj0JP@google.com>
 <CA+-xGqOkH-hU1guGx=t-qtjsRdO92oX+8HhcO1eXnCigMc+NPw@mail.gmail.com>
 <YPC1lgV5dZC0CyG0@google.com>
 <CA+-xGqN75O37cr9uh++dyPj57tKcYm0fD=+-GBErki8nGNcemQ@mail.gmail.com>
 <YPiLBLA2IjwovNCP@google.com>
 <CA+-xGqP7=m47cLD65DhTumOF8+sWZvc81gh+04aKMS56WWkVtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+-xGqP7=m47cLD65DhTumOF8+sWZvc81gh+04aKMS56WWkVtA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=seanjc@google.com; helo=mail-pj1-x1033.google.com
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

On Wed, Jul 28, 2021, harry harry wrote:
> Sean, sorry for the late reply. Thanks for your careful explanations.
> 
> > For emulation of any instruction/flow that starts with a guest virtual address.
> > On Intel CPUs, that includes quite literally any "full" instruction emulation,
> > since KVM needs to translate CS:RIP to a guest physical address in order to fetch
> > the guest's code stream.  KVM can't avoid "full" emulation unless the guest is
> > heavily enlightened, e.g. to avoid string I/O, among many other things.
> 
> Do you mean the emulated MMU is needed when it *only* wants to
> translate GVAs to GPAs in the guest level?

Not quite, though gva_to_gpa() is the main use.  The emulated MMU is also used to
inject guest #PF and to load/store guest PDTPRs.  

> In such cases, the hardware MMU cannot be used because hardware MMU
> can only translate GVAs to HPAs, right?

Sort of.  The hardware MMU does translate GVA to GPA, but the GPA value is not
visible to software (unless the GPA->HPA translation faults).  That's also true
for VA to PA (and GVA to HPA).  Irrespective of virtualization, x86 ISA doesn't
provide an instruction to retrive the PA for a given VA.

If such an instruction did exist, and it was to be usable for a VMM to do a
GVA->GPA translation, the magic instruction would need to take all MMU params as
operands, e.g. CR0, CR3, CR4, and EFER.  When KVM is active (not the guest), the
hardware MMU is loaded with the host MMU configuration, not the guest.  In both
VMX and SVM, vCPU state is mostly ephemeral in the sense that it ceases to exist
in hardware when the vCPU exits to the host.  Some state is retained in hardware,
e.g. TLB and cache entries, but those are associated with select properties of
the vCPU, e.g. EPTP, CR3, etc..., not with the vCPU itself, i.e. not with the
VMCS (VMX) / VMCB (SVM).

