Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4166531173
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 16:58:48 +0200 (CEST)
Received: from localhost ([::1]:54410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt9WC-0005dQ-19
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 10:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nt9TI-0004VW-Us
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:55:49 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1nt9TH-0006yj-G0
 for qemu-devel@nongnu.org; Mon, 23 May 2022 10:55:48 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q76so13890880pgq.10
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JHZ+R8Y8nA8S+oeUM4/Av24R+MguK57xUegrXNCI6YY=;
 b=NxGxg7NCKOGD3NgKeUyIl4/81JURx+DfN+SqGO7Hih0+trYAFwZKfWK2SpAqZhPb0G
 UgGIr9LILMs5BpTWkUL2X0X3pjxnOpU6EQmBVRo6pH0w/vxJ64l+0iWKL3UooXkt89+p
 q7ZWfIuzujEkkOmytgb5aCWpH6+z+I87bXJ408ubHX0cYDG4qlhsSIJcNUnI9tANlcTF
 yfcSop4aGCPhqv6/No6omXgcCDwvrBecylukmAIETlu6LcIvg5bB52/XU/AM8R2AznAh
 M0nkyypgkDEbjlnWm7jYLaazKNWHqe7BZlSXkeEzpRqHj2etiosdsTayXhE4VJklfV3l
 2k5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JHZ+R8Y8nA8S+oeUM4/Av24R+MguK57xUegrXNCI6YY=;
 b=nW5EaK9r1Q8CeC7Km/3AsjTMCN0hYW+rBQLeRhAhDKTH+Wei7pMj/wiZjPL0Il7rPs
 3YfZLwVoPy9W8E8D5unnHPaJK0rrWczTaiKriUDX5wDkgdD2+eahBTKhu28BNbj/Tagp
 LjLSvkNpHxy7Zb/Suw/LmHToR3Pdq+bNRWcG/tV7AlS1dQTmnDpTqQ/vD3OhMNnzyutt
 yt3qTk1caw4c5DGCWIZeIH63gyP1MVRRjFLCP3mz1Q48AKkAaHPKxfNR/vkn4rT9KGgH
 251YtHTcAXCVmxSfakPWtn+a1x/XXNvzTcUBFpLunZk5gFqH30nN0uJSzW5/8j2Uo9mP
 4BJA==
X-Gm-Message-State: AOAM532NyngZTAIW3KicVEi7tv7cUKNk1MfRSRIlJxG3LADvB9+QFUEJ
 0joSjLLaeqLPzk9e71XUYMY=
X-Google-Smtp-Source: ABdhPJwTZjM/QwGDJuy8asN+V0scGGfehl7ckOZ+uLX7DFgwp+yyy3GSF1eE8scscN2qlgorO/+Dvw==
X-Received: by 2002:a05:6a00:1582:b0:518:7aa0:d6d8 with SMTP id
 u2-20020a056a00158200b005187aa0d6d8mr13817706pfk.27.1653317745584; 
 Mon, 23 May 2022 07:55:45 -0700 (PDT)
Received: from localhost ([192.55.54.48]) by smtp.gmail.com with ESMTPSA id
 k12-20020a170902d58c00b00160d358a888sm5235975plh.32.2022.05.23.07.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 07:55:45 -0700 (PDT)
Date: Mon, 23 May 2022 07:55:43 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 03/36] target/i386: Implement mc->kvm_type() to
 get VM type
Message-ID: <20220523145543.GA3095181@ls.amr.corp.intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-4-xiaoyao.li@intel.com>
 <20220523083616.uqd5amzbkt627ari@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220523083616.uqd5amzbkt627ari@sirius.home.kraxel.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 23, 2022 at 10:36:16AM +0200,
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > +    if (!(kvm_check_extension(KVM_STATE(ms->accelerator), KVM_CAP_VM_TYPES) & BIT(kvm_type))) {
> > +        error_report("vm-type %s not supported by KVM", vm_type_name[kvm_type]);
> > +        exit(1);
> > +    }
> 
> Not sure why TDX needs a new vm type whereas sev doesn't.  But that's up
> for debate in the kernel tdx patches, not here.  Assuming the kernel
> interface actually merged will look like this the patch makes sense.

Because VM operations, e.g. KVM_CREATE_VCPU, require TDX specific one in KVM
side, we need to tell this VM is TD.
Also it's for consistency.  It's common pattern to specify vm type with
KVM_CREATE_VM when among other archs.  S390, PPC, MIPS, and ARM64.  Only SEV is
an exception.  It makes default VM into confidential VM after KVM_CREATE_VM.

Thanks,

> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> take care,
>   Gerd
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

