Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC329659A3E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 16:56:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBHie-0005Fq-5n; Fri, 30 Dec 2022 10:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ek1s=44=zx2c4.com=Jason@kernel.org>)
 id 1pBHia-0005Ew-RT
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 10:54:48 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ek1s=44=zx2c4.com=Jason@kernel.org>)
 id 1pBHiZ-0004N9-1p
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 10:54:48 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7288B81BAA;
 Fri, 30 Dec 2022 15:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368B7C433D2;
 Fri, 30 Dec 2022 15:54:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cthGg0NM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672415676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BxfkqOG1X9KuqUurA2SWp45MzpX2tzl76AOrYBX8vQ0=;
 b=cthGg0NM0dVWdKvV1zp+jB5rca47a21IO6n3zxLLzOp65JWqNPbQJNl3WrtYsGIT0TEPPN
 TorQyQeFPOUl9l7L9+CP2bIPR07oP181k7iAQDPwvaZ4N5oBMkcWM641IcoE9QcEecKgFu
 0vJZQPICKmJERWhDOqV+okWpoUilnf8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2838488f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 30 Dec 2022 15:54:35 +0000 (UTC)
Date: Fri, 30 Dec 2022 16:54:27 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y68Js5b0jW/2nLU4@zx2c4.com>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y62MdawGaasXmoVL@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y62MdawGaasXmoVL@zn.tnic>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=ek1s=44=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Dec 29, 2022 at 01:47:49PM +0100, Borislav Petkov wrote:
> On Wed, Dec 28, 2022 at 11:31:34PM -0800, H. Peter Anvin wrote:
> > As far as a crash... that sounds like a big and a pretty serious one at that.
> > 
> > Could you let me know what kernel you are using and how *exactly* you are booting it?
> 
> Right, with CONFIG_X86_VERBOSE_BOOTUP=y in a guest here, it says:
> 
> early console in extract_kernel
> input_data: 0x000000000be073a8
> input_len: 0x00000000008cfc43
> output: 0x0000000001000000
> output_len: 0x000000000b600a98
> kernel_total_size: 0x000000000ac26000
> needed_size: 0x000000000b800000
> trampoline_32bit: 0x000000000009d000
> 
> so that's a ~9M kernel which gets decompressed at 0x1000000 and the
> output len is, what, ~180M which looks like plenty to me...

I think you might have misunderstood the thread. First, to reproduce the
bug that this patch fixes, you need a kernel with a compressed size of
around 16 megs, not 9. Secondly, that crash is well understood and
doesn't need to be reproduced; this patch fixes it. Rather, the question
now is how to improve this patch to remove the 62 meg limit. I'll follow
up with hpa's request for reproduction info.

Jason

