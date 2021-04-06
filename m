Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAEC355FB3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 01:48:13 +0200 (CEST)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTvQa-0000Bw-Vn
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 19:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1lTtY5-0003W2-RN
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:47:50 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1lTtY4-0004HX-4l
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 17:47:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 z22-20020a17090a0156b029014d4056663fso205386pje.0
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 14:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fcqKGhIrl4188mNZ3hVlP9DuR2h/RaO8Z6p+Nwb4ZQU=;
 b=ISu4UvUrqXV5f8kg/0mlzG5CuSr5VPdA1FOVxNDvyFc0jtMgG9h04erzMjS+DbnZRC
 l9ENlTfwXcrQJ0X3GJor1ckQZGq6eZqgcorNIFmI99hQjA7+k1DUzcA6LDL3U+XEj1rT
 GsMljN3vSvdRrGTbm/BoX24BU6Xm45722VqzPVhamFRf4Fvr8ymov7yv6zlkMx22GqdV
 /SM/fusMQAUZ9/u89EUYGhp5ZTSyPuhjHjUi1XtSXVZ4JwGzpUVan2n69bHXOAaxnyH3
 ZrsPU8GjG5JqsobI65/f6pW8l3+4WjOdOg5oLrVguJvFAfc3jh+ItJGn9x3T/CZiWECb
 YFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fcqKGhIrl4188mNZ3hVlP9DuR2h/RaO8Z6p+Nwb4ZQU=;
 b=kBcOvgrkxjxVKrGimM09uO0hPwbNsZPXf/GtGD2rPTdXQMREXp04qu0F4/oD/1cHvI
 ztNrNd1WwSvVdlu+4XwlgbsyhTE3VqrMPjhMCaHqEIVROoHnvAWuyNrVwGTVr8TdWoul
 V0uF95wxBA7bQj8jSx96WpC3cdG4+VgU5w7py2kgaB6X3FdGQh6UveXwE8nmXwV8rfEx
 quEXROAyapD+tCx0YDp0dtP6p1B9HL54CPCfAPMnk+DaromTIq/BvFoq4BkLYUcQPgUR
 suUB8SZ82hAyuGz00CCoscmFs9lqpmdm5QybfBIW9NLa3Fg2ltUlIMQQRXgVCa32M587
 +r2g==
X-Gm-Message-State: AOAM533shSm7SXJRwp3rQudAC3PwziezwypUzoA+Cxx8kGesLVLSVhM3
 d8miB8Rr8yP/NC6k1wEDgugUxw==
X-Google-Smtp-Source: ABdhPJz1y2gQQsyu5FpE+bnv56hR8SsINwgnPG4t+H/SG21H9py0nQugKZhfkGCk6fr04p1ecNlSoA==
X-Received: by 2002:a17:90b:4c02:: with SMTP id
 na2mr202435pjb.77.1617745665160; 
 Tue, 06 Apr 2021 14:47:45 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com.
 [35.247.111.240])
 by smtp.gmail.com with ESMTPSA id y5sm19127058pfl.191.2021.04.06.14.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 14:47:44 -0700 (PDT)
Date: Tue, 6 Apr 2021 21:47:40 +0000
From: Sean Christopherson <seanjc@google.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org,
 Thomas Gleixner <tglx@linutronix.de>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Commit "x86/kvm: Move context tracking where it belongs" broke
 guest time accounting
Message-ID: <YGzW/Pa/p7svg5Rr@google.com>
References: <36088364-0b3d-d492-0aa4-59ea8f1d1632@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36088364-0b3d-d492-0aa4-59ea8f1d1632@msgid.tls.msk.ru>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=seanjc@google.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Apr 2021 19:47:14 -0400
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

On Tue, Apr 06, 2021, Michael Tokarev wrote:
> Hi!
> 
> It looks like this commit:
> 
> commit 87fa7f3e98a1310ef1ac1900e7ee7f9610a038bc
> Author: Thomas Gleixner <tglx@linutronix.de>
> Date:   Wed Jul 8 21:51:54 2020 +0200
> 
>     x86/kvm: Move context tracking where it belongs
> 
>     Context tracking for KVM happens way too early in the vcpu_run()
>     code. Anything after guest_enter_irqoff() and before guest_exit_irqoff()
>     cannot use RCU and should also be not instrumented.
> 
>     The current way of doing this covers way too much code. Move it closer to
>     the actual vmenter/exit code.
> 
> broke kvm guest cpu time accounting - after this commit, when running
> qemu-system-x86_64 -enable-kvm, the guest time (in /proc/stat and
> elsewhere) is always 0.
> 
> I dunno why it happened, but it happened, and all kernels after 5.9
> are affected by this.
> 
> This commit is found in a (painful) git bisect between kernel 5.8 and 5.10.

Yes :-(

There's a bugzilla[1] and two proposed fixes[2][3].  I don't particularly like
either of the fixes, but an elegant solution hasn't presented itself.

Thomas/Paolo, can you please weigh in?

[1] https://bugzilla.kernel.org/show_bug.cgi?id=209831
[2] https://lkml.kernel.org/r/1617011036-11734-1-git-send-email-wanpengli@tencent.com
[3] https://lkml.kernel.org/r/20210206004218.312023-1-seanjc@google.com

