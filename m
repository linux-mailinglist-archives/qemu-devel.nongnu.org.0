Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E896584A4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 17:59:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAZkr-00025c-59; Wed, 28 Dec 2022 11:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=vu6c=42=zx2c4.com=Jason@kernel.org>)
 id 1pAZkl-000259-Tt
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 11:58:09 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=vu6c=42=zx2c4.com=Jason@kernel.org>)
 id 1pAZki-0005XC-FV
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 11:58:07 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A947061572;
 Wed, 28 Dec 2022 16:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E479BC433F1;
 Wed, 28 Dec 2022 16:58:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="f9G1NL6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672246678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/TBVDGYdRlG5U31yqV7pynGEXacXzLmZlTrofPWf0ws=;
 b=f9G1NL6Pa1K0WeUCjN7cMRJECqjZIM1uJkStKJn7z//z/h+IKVbcjv0PFYqXkrpvLYMlc4
 MFiI9xta0v+DDtKg8n5Sv6wxgOGVNuYZQdXb9mH6TmB6+/ffQxgoZ2nwbKqFCnBpJ5YZss
 2bhQJzstgm+VLqf3A2Muu+bd7kZKoVw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 46f0ad33
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 28 Dec 2022 16:57:58 +0000 (UTC)
Date: Wed, 28 Dec 2022 17:57:54 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: hpa@zytor.com
Cc: pbonzini@redhat.com, ebiggers@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
 ardb@kernel.org, kraxel@redhat.com, bp@alien8.de, philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y6x1knb8udpSyMSp@zx2c4.com>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y6xvJheSYC83voCZ@zx2c4.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=vu6c=42=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

HELLO H. PETER ANVIN,
E
L
L
O

On Wed, Dec 28, 2022 at 05:30:30PM +0100, Jason A. Donenfeld wrote:
> > Fix looks good, glad you figured out the problem.
> 
> I mean, kind of. The solution here sucks, especially given that in the
> worst case, setup_data just gets dropped. I'm half inclined to consider
> this a kernel bug instead, and add some code to relocate setup_data
> prior to decompression, and then fix up all the links. It seems like
> this would be a lot more robust.
> 
> I just wish the people who wrote this stuff would chime in. I've had
> x86@kernel.org CC'd but so far, no input from them.

Apparently you are the x86 boot guru. What do you want to happen here?
Your input would be very instrumental.

Jason

