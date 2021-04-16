Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA813625CC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:39:07 +0200 (CEST)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRUo-0006GW-LQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXRKd-0003Cp-Na
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXRKa-0001IP-5o
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618590511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgcuRFF2jSIKZJnI+h16vksgWmFVyeF2TwcurFEWll4=;
 b=RlYmvPLIGzZWx/9tG9Mwc7TXnIG1R88r5PQhPFlXdLCVByzt8a7eXwdOml4jl+vrB2nE5S
 JBXa2JgIDjKK/sHY0aecgjeEs4mcya1cOwQnWo6hA+IY6Wa5KUm/E1y+7VVRNPHieBHr8t
 w11BADtNdw+zXGjFZVAF8TAkgn7WLgc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-HV2u9ZJ5OuyssoKIb8bvsA-1; Fri, 16 Apr 2021 12:28:29 -0400
X-MC-Unique: HV2u9ZJ5OuyssoKIb8bvsA-1
Received: by mail-ed1-f69.google.com with SMTP id
 l7-20020aa7c3070000b029038502ffe9f2so1535505edq.16
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 09:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QgcuRFF2jSIKZJnI+h16vksgWmFVyeF2TwcurFEWll4=;
 b=IisMGy0ASfZMwQ4jnkW5MjSfocjUc+TY777X5dZx/tcQEVRc5oBuJTvKNWREMLOxwW
 ODRAhIqdu+WyVAtNiooLsEL7viyNrS5ATqULiczCb64tg0oh7GdYp54LXHWQssJl2G0V
 zeUMlasIeODcdhLY96/oEzAUsJuD6Iv0qt0Hq0E1XFbMMXMoXC/5ri5YK8dj/jKBzsF0
 5ZLtbj7uhNVxUlHMYddGaVbfyVRCLABzDUqxMCnGR/u6CqzZ31xRrDc1UuT3GLru2eJ6
 pCgQaXFW+v0CeV73IJFz5f7d50eDwYgCP7/hbhhwLT0QQ7oQOwW41PDRAGGFSl9Z4S8V
 8cbw==
X-Gm-Message-State: AOAM531R64KQPFxByMHcguO3RneyNsul0GmlogCGG9d7YioVRINPjkvz
 r3FcE8EdBgk+lBNg9T4tRvta8yGEZUPW0lABlud3oLJnNsAp05W4ZNr5KAzYtzuKdobz7iuElrv
 hrRrj82CSrSo5ZGY=
X-Received: by 2002:a50:fd99:: with SMTP id o25mr9139802edt.148.1618590508013; 
 Fri, 16 Apr 2021 09:28:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeixKmYO33uYtFz/Tww+V+dylrHmknA/3uQDVFmM3g4QL1PZpGCM82FzA2QKsvASE3CBkqRw==
X-Received: by 2002:a50:fd99:: with SMTP id o25mr9139789edt.148.1618590507844; 
 Fri, 16 Apr 2021 09:28:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id jl8sm621105ejc.122.2021.04.16.09.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 09:28:27 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 0/6] extern "C" overhaul for C++ files
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210416135543.20382-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <63df4bb6-77ae-b8fe-770e-6eb8efa7699d@redhat.com>
Date: Fri, 16 Apr 2021 18:28:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/21 15:55, Peter Maydell wrote:
> Hi; this patchseries is:
>   (1) a respin of Paolo's patches, with the review issue Dan
>       noticed fixed (ie handle arm-a64.cc too)
>   (2) a copy of my "osdep.h: Move system includes to top" patch
>   (3) some new patches which try to more comprehensively address
>       the extern "C" issue
> 
> I've marked this "for-6.0?", but more specifically:
>   * I think patches 1 and 2 should go in if we do an rc4
>     (and maybe we should do an rc4 given various things that
>     have appeared that aren't individually rc4-worthy)
>   * patches 3-6 are definitely 6.1 material
> 
> We have 2 C++ files in the tree which need to include QEMU
> headers: disas/arm-a64.cc and disas/nanomips.cpp. These
> include only osdep.h and dis-asm.h, so it is sufficient to
> extern-C-ify those two files only.
> 
> I'm not wildly enthusiastic about this because it's pretty
> invasive (and needs extending if we ever find we need to
> include further headers from C++), but it seems to be what
> C++ forces upon us...
> 
> Patches 1, 2 and 3 have been reviewed (I kept Dan's r-by on
> patch 1 since the change to it is just fixing the thing he
> noticed). Further review, and opinions on the 6.0-ness, whether
> we should do an rc4, etc, appreciated.

I think at least 1-3 are 6.0 material because build on a supported 
distro (Fedora 34, due for release on April 27) is broken right now.

For 4-6 I'm a bit less sure since there's more to cleanup in 
include/sysemu/os-*.h.  Anyway,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> thanks
> -- PMM
> 
> Paolo Bonzini (2):
>    osdep: include glib-compat.h before other QEMU headers
>    osdep: protect qemu/osdep.h with extern "C"
> 
> Peter Maydell (4):
>    include/qemu/osdep.h: Move system includes to top
>    osdep: Make os-win32.h and os-posix.h handle 'extern "C"' themselves
>    include/qemu/bswap.h: Handle being included outside extern "C" block
>    include/disas/dis-asm.h: Handle being included outside 'extern "C"'
> 
>   include/disas/dis-asm.h   | 12 ++++++++++--
>   include/qemu/bswap.h      | 26 ++++++++++++++++++++++----
>   include/qemu/compiler.h   |  6 ++++++
>   include/qemu/osdep.h      | 34 +++++++++++++++++++++++++++-------
>   include/sysemu/os-posix.h |  8 ++++++++
>   include/sysemu/os-win32.h |  8 ++++++++
>   disas/arm-a64.cc          |  2 --
>   disas/nanomips.cpp        |  2 --
>   8 files changed, 81 insertions(+), 17 deletions(-)
> 


