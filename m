Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18096DD615
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 10:59:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm9pd-000357-1X; Tue, 11 Apr 2023 04:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pm9pY-00034K-Au
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 04:58:25 -0400
Received: from out-8.mta1.migadu.com ([2001:41d0:203:375::8])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pm9pW-0004Xg-Cj
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 04:58:24 -0400
Date: Tue, 11 Apr 2023 10:58:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1681203497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYQNARfOa8tbEcaqHz6ILgvSCbmZ1g80hA9Tr6Qv/7s=;
 b=neUyHC2H2EsgiXEob5Mtj9hBifKo5nO/AW+si/QiXgKpMGVBSXS6fKnfwNsh5oUKuyF78L
 DUFGK9EJGWKuLswoWD4ZB5wdvUzRTogHYq8CcRFcDPN4wjxdzuiDVukunMGou81d2jatm+
 +LQm1blIm0+lxk8up+SHqnX/vxRknY4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, 
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
 qemu-arm@nongnu.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [kvm-unit-tests PATCH v10 4/7] arm/tlbflush-code: TLB flush
 during code execution
Message-ID: <cw7kze4l7nhttr74j6hkojkyr4nuidxryyzvvr7vcxtu3ihi34@sy6hcuphtlff>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-5-alex.bennee@linaro.org>
 <20230321150220.mfrvgxg3ebju5e6k@orel> <87ile2rffl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ile2rffl.fsf@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::8;
 envelope-from=andrew.jones@linux.dev; helo=out-8.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Apr 11, 2023 at 09:26:56AM +0100, Alex Bennée wrote:
> 
> Andrew Jones <andrew.jones@linux.dev> writes:
> 
> > On Tue, Mar 07, 2023 at 11:28:42AM +0000, Alex Bennée wrote:
> >> This adds a fairly brain dead torture test for TLB flushes intended
> >> for stressing the MTTCG QEMU build. It takes the usual -smp option for
> >> multiple CPUs.
> >> 
> <snip>
> >
> > BTW, have you tried running these tests as standalone? Since they're
> > 'nodefault' it'd be good if they work that way.
> 
> It works but I couldn't get it to skip pass the nodefault check
> automaticaly:
> 
>   env run_all_tests=1 QEMU=$HOME/lsrc/qemu.git/builds/arm.all/qemu-system-aarch64 ./tests/tcg.computed 
>   BUILD_HEAD=c9cf6e90
>   Test marked not to be run by default, are you sure (y/N)?
>

I think

 $ yes | tests/some-nodefault-test

should work.

Thanks,
drew

