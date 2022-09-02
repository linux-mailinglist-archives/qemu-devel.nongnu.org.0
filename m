Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779BD5AA612
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 04:54:26 +0200 (CEST)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTwp7-0004w6-3V
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 22:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oTwnP-0003Zq-3x
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 22:52:39 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:38826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1oTwnN-00062L-Dy
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 22:52:38 -0400
Received: by mail-pg1-x535.google.com with SMTP id r22so799887pgm.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 19:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=s3rQHrfdU8nh1CYoZCYjP5wlsTj0Ig8apoM3bdaeWY8=;
 b=l4FgH77M91Dsls606bKNlqhKmTFLRa/6fmGLQbKN6rvA6plI7wuVKSRNRV71nGeR/Z
 KLBLKI+eemZyQR2Q8R6rVbcBwlfkEimagzhqvfc3koYgWDKiuRV471WFwJhj6JCwWs0/
 JBzaPFZki8wRW+Wqq+oH8hLnLzY0xDr12g1JzJqbf7tEWEWRneMbzYUC5nqmk9yNDcXh
 jT7qOCR7UqboOKaJ9NFja9CP0c4k5OJ7ZooYNWAy4tBZXthITMnpq6LGqPvhwBZajbHA
 fIq/96Y3+oBhlr4d3S0Z9PAdV0UhWhErY5fwpSDAppvhzdwi07IuE4Y2XUrScqR5REng
 FPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=s3rQHrfdU8nh1CYoZCYjP5wlsTj0Ig8apoM3bdaeWY8=;
 b=8QGnmAVYY7Y1jpi+E1mFEI8g3t+ab2wovSOyMqzCPmlG07KRm/mVZyDshNXnK/B6a8
 5BVzMBvyQfAJKVv36SGgvXdThA+X4Bwf/eV96vd2/0h3Ezc/QM39zu2/Ub8nRbxhD2qm
 eTL9XT6sxJTB1eruLUgy4FcDuVpQNhVbWJBYtUHJfpWKQTuxhybK1QMJpT+qEPKtiJJm
 9QlTTOkiViCTrWlKb1Pr8NgH26pQSbXefMCIZHhvjgSZHsyDPJTnsEkEVvRby6aTbeox
 DTP4kpHI5bBLRhISiYYd/jwOcYNJxlAUTPocSUR408y4DDNW5Up3waZ2ryl33pMMDmv1
 smGw==
X-Gm-Message-State: ACgBeo0UT7PTaqyjKkAXyIsUShXuMJfuzIGnYSe8JHRm9twLo7hTVfxq
 1Fv6pZhRDzSRoNTpC9nChpQQ+Q==
X-Google-Smtp-Source: AA6agR5wb5tUcLrahc75HLtJ2gcPpyN2b0NPDyuE0cW5TEZAXhSqlUwzlKq9UWuKaZGoThkMAFTA+w==
X-Received: by 2002:a05:6a00:4147:b0:52d:fe84:2614 with SMTP id
 bv7-20020a056a00414700b0052dfe842614mr34947193pfb.10.1662087151065; 
 Thu, 01 Sep 2022 19:52:31 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 m15-20020a17090a34cf00b001fb35e4044bsm4019628pjf.40.2022.09.01.19.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 19:52:29 -0700 (PDT)
Date: Fri, 2 Sep 2022 02:52:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 15/40] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Message-ID: <YxFv6RglTOY3Pevj@google.com>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <20220802074750.2581308-16-xiaoyao.li@intel.com>
 <20220825113636.qlqmflxcxemh2lmf@sirius.home.kraxel.org>
 <389a2212-56b8-938b-22e5-24ae2bc73235@intel.com>
 <20220826055711.vbw2oovti2qevzzx@sirius.home.kraxel.org>
 <a700a0c6-7f25-dc45-4c49-f61709808f29@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a700a0c6-7f25-dc45-4c49-f61709808f29@intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=seanjc@google.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Fri, Sep 02, 2022, Xiaoyao Li wrote:
> On 8/26/2022 1:57 PM, Gerd Hoffmann wrote:
> >    Hi,
> > > For TD guest kernel, it has its own reason to turn SEPT_VE on or off. E.g.,
> > > linux TD guest requires SEPT_VE to be disabled to avoid #VE on syscall gap
> > > [1].
> > 
> > Why is that a problem for a TD guest kernel?  Installing exception
> > handlers is done quite early in the boot process, certainly before any
> > userspace code runs.  So I think we should never see a syscall without
> > a #VE handler being installed.  /me is confused.
> > 
> > Or do you want tell me linux has no #VE handler?
> 
> The problem is not "no #VE handler" and Linux does have #VE handler. The
> problem is Linux doesn't want any (or certain) exception occurrence in
> syscall gap, it's not specific to #VE. Frankly, I don't understand the
> reason clearly, it's something related to IST used in x86 Linux kernel.

The SYSCALL gap issue is that because SYSCALL doesn't load RSP, the first instruction
at the SYSCALL entry point runs with a userspaced-controlled RSP.  With TDX, a
malicious hypervisor can induce a #VE on the SYSCALL page and thus get the kernel
to run the #VE handler with a userspace stack.

The "fix" is to use an IST for #VE so that a kernel-controlled RSP is loaded on #VE,
but ISTs are terrible because they don't play nice with re-entrancy (among other
reasons).  The RSP used for IST-based handlers is hardcoded, and so if a #VE
handler triggers another #VE at any point before IRET, the second #VE will clobber
the stack and hose the kernel.

It's possible to workaround this, e.g. change the IST entry at the very beginning
of the handler, but it's a maintenance burden.  Since the only reason to use an IST
is to guard against a malicious hypervisor, Linux decided it would be just as easy
and more beneficial to avoid unexpected #VEs due to unaccepted private pages entirely.

