Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4844A65A36A
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 10:49:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBYTf-0006RH-VI; Sat, 31 Dec 2022 04:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBYTa-0006Qm-QG
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 04:48:27 -0500
Received: from mail.skyhub.de ([5.9.137.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBYTY-0003Su-GH
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 04:48:26 -0500
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 49A6B1EC04AD;
 Sat, 31 Dec 2022 10:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672480101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=wereH6LHdBUC9kDDyzTdxHdgO+FIsA0w3UKr8l/p+2c=;
 b=oBEx9t+2nMWbl4wOSjExVFfM8W6KgpgcubJTWInjr+IwcCqV0JFuv7XEmHZwb+Lga+3sSX
 RUvReFUOumoCd7uYviKZSfbIav6sfuiqwrsCg1XUgbcgUs1Zu6em0bOqDl+VF/Xi7tfn2G
 w6FADtP1YWCeqYvWQCi+EkKrVXqJjPY=
Date: Sat, 31 Dec 2022 10:48:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7AFYKWPRXYs7S4m@zn.tnic>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y68K4mPuz6edQkCX@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y68K4mPuz6edQkCX@zx2c4.com>
Received-SPF: pass client-ip=5.9.137.197; envelope-from=bp@alien8.de;
 helo=mail.skyhub.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Fri, Dec 30, 2022 at 04:59:30PM +0100, Jason A. Donenfeld wrote:
> I'll attach a .config file. Apply the patch at the top of this thread to
> qemu,

Hmm, so the patch at the top of this thread is fixing the clobbering of
setup_data.

But I tried latest qemu with your .config and it boots ok here. So how do I
repro the original issue you're trying to fix?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

