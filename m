Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D1D687348
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 03:15:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNP6m-00077h-Ch; Wed, 01 Feb 2023 21:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1pNP6k-00077S-DA
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 21:13:50 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1pNP6i-00082p-Gb
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 21:13:49 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id q10so214450qvt.10
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 18:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mqmz7hu2G9r/RJV/8jS2mx0R656hA6RTcJf6/8HTqaY=;
 b=baI0Ri1uaTAy7OVcrgqlkjfEVxnbv/d/D57DrefkM6vzmBFg5cMAFSunTAKp3qNWSF
 0rb5BWRrxTsAX3ih7Ln+hhctf7eRxPFKVT+V0CmQ/GIbejuBhxNXgIBNu4MZc0jAW6e9
 NK0wp3ROS8bNgUAhpDS98ROaEGLM0zGqVCO5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mqmz7hu2G9r/RJV/8jS2mx0R656hA6RTcJf6/8HTqaY=;
 b=FIWmf8YzMrgAL+E2qOUakrvekBc/EfZoL6kg1d4H6VKWjvnCovAOsbIBRTwIBbXIhN
 bQdvifFEWDoQeJ7xGIsbNYkHq0FRPgAiV2nPzMHnw0WkX5Bx6Dhq65S1qV5iSPHaGS1N
 OZXr2/B+BUE5D2v0eVlZDLvmbNcyfwX7HGwwiyBp9io64UpHcItCjTeeXXI0ABjbqEBj
 qEsVeboTxI4YIyhVCo+QpNJQl0Rzn1ldECnA3IuLU7nq5g0IYwmaLFtKhovvJD/CjSgr
 mfpNOXN6nAVW8kN/50+DhFvXLhFplXXGlctgik9eBu1HdPUt1ZlBrSOXTQI0qW5rxtOO
 3Abg==
X-Gm-Message-State: AO0yUKUtYkAi4I5RGpsLZkUjt13J+GZ732BRgonHr+fJAxJZY9CSpp/q
 Ym+pbHKab5xLtMq7qvWAXL3+DA==
X-Google-Smtp-Source: AK7set81ROSrZYyNA3Puq1cqPfaXketVTob01gsC5RRs9n4SXF9f3GSnPc5BNKsdHUb/wxPFQQbCUQ==
X-Received: by 2002:a0c:fa07:0:b0:53a:3a20:4200 with SMTP id
 q7-20020a0cfa07000000b0053a3a204200mr6544477qvn.31.1675304027070; 
 Wed, 01 Feb 2023 18:13:47 -0800 (PST)
Received: from localhost ([64.18.11.67]) by smtp.gmail.com with ESMTPSA id
 d12-20020a05620a204c00b007201df7ff47sm6813568qka.45.2023.02.01.18.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 18:13:46 -0800 (PST)
Date: Wed, 1 Feb 2023 21:13:45 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: seabios <seabios@seabios.org>, xen-devel <xen-devel@lists.xenproject.org>,
 qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: Re: [SeaBIOS] [SeaBIOS PATCH] xen: require Xen info structure at
 0x1000 to detect Xen
Message-ID: <Y9scWQ/ASMCrY/uM@morn>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=kevin@koconnor.net; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 20, 2023 at 11:33:19AM +0000, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When running under Xen, hvmloader places a table at 0x1000 with the e820
> information and BIOS tables. If this isn't present, SeaBIOS will 
> currently panic.
> 
> We now have support for running Xen guests natively in QEMU/KVM, which
> boots SeaBIOS directly instead of via hvmloader, and does not provide
> the same structure.
> 
> As it happens, this doesn't matter on first boot. because although we
> set PlatformRunningOn to PF_QEMU|PF_XEN, reading it back again still
> gives zero. Presumably because in true Xen, this is all already RAM. But
> in QEMU with a faithfully-emulated PAM config in the host bridge, it's
> still in ROM mode at this point so we don't see what we've just written.
> 
> On reboot, however, the region *is* set to RAM mode and we do see the
> updated value of PlatformRunningOn, do manage to remember that we've
> detected Xen in CPUID, and hit the panic.
> 
> It's not trivial to detect QEMU vs. real Xen at the time xen_preinit()
> runs, because it's so early. We can't even make a XENVER_extraversion
> hypercall to look for hints, because we haven't set up the hypercall
> page (and don't have an allocator to give us a page in which to do so).
> 
> So just make Xen detection contingent on the info structure being
> present. If it wasn't, we were going to panic anyway. That leaves us
> taking the standard QEMU init path for Xen guests in native QEMU,
> which is just fine.

Thanks.  I committed this change.

-Kevin

