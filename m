Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188765A43C
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 13:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBbOT-0001zh-D7; Sat, 31 Dec 2022 07:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org>)
 id 1pBbOI-0001zM-SG
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 07:55:13 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org>)
 id 1pBbOG-0002x1-56
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 07:55:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BC22EB8075B;
 Sat, 31 Dec 2022 12:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB69C433EF;
 Sat, 31 Dec 2022 12:54:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="DkUn8CJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672491297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x7/PSeae4emuwI8+qvT80CZJIbxy+A9eTBLm8a0VJcc=;
 b=DkUn8CJZuGF2WlUWlRRQ6xrmk4cBTb0n1YKAlWgk5zVMnNPVFeKyFXYfaA9kV4qaepWunX
 A1XVU/5J/kLHds4iLja+2GZRwLbzsozbAVMcPPliZzAWOvBHymFRNaWkYbqMc9ub4/V9FY
 8i7XsYEPfDBm3x7o3MITAbeFYIJBKao=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 249602d6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 31 Dec 2022 12:54:57 +0000 (UTC)
Date: Sat, 31 Dec 2022 13:54:50 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7AxGiGQYZNJWpCr@zx2c4.com>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y68K4mPuz6edQkCX@zx2c4.com> <Y7AFYKWPRXYs7S4m@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7AFYKWPRXYs7S4m@zn.tnic>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

On Sat, Dec 31, 2022 at 10:48:16AM +0100, Borislav Petkov wrote:
> On Fri, Dec 30, 2022 at 04:59:30PM +0100, Jason A. Donenfeld wrote:
> > I'll attach a .config file. Apply the patch at the top of this thread to
> > qemu,
> 
> Hmm, so the patch at the top of this thread is fixing the clobbering of
> setup_data.
> 
> But I tried latest qemu with your .config and it boots ok here. So how do I
> repro the original issue you're trying to fix?

Nothing special... `-kernel bzImage` should be enough to do it. Eric
reported it, and then I was able to repro trivially. Sure you got the
right version?

Jason

