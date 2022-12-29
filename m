Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D763F658CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 13:49:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAsKl-000462-2r; Thu, 29 Dec 2022 07:48:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pAsKO-00042I-S5
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 07:48:12 -0500
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pAsKG-0004Bx-Qm
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 07:48:05 -0500
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2396E1EC01CE;
 Thu, 29 Dec 2022 13:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672318073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=1KcR7E77mv9elx5G9X9IlsW0Rh4iCO+tG818qQo64N4=;
 b=CXjIIeugIvcObmtb7Y1VmnUNOHDXpJU3ucwjMO1ozxW9lHCawJh7MurU1zO23IZx13C8rl
 t28rQjH2rqLXjinYGlHeFAyAlnl32bEKMf8id/Vv/FcMml3qru7Xkv397ijHGtsGftOLd0
 oHU55jRihKJJFoKwMmQ7wQOvWd2qkqA=
Date: Thu, 29 Dec 2022 13:47:49 +0100
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y62MdawGaasXmoVL@zn.tnic>
References: <20221228143831.396245-1-Jason@zx2c4.com>
 <6cab26b5-06ae-468d-ac79-ecdecb86ef07@linaro.org>
 <Y6xvJheSYC83voCZ@zx2c4.com> <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
Received-SPF: pass client-ip=2a01:4f8:190:11c2::b:1457;
 envelope-from=bp@alien8.de; helo=mail.skyhub.de
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

On Wed, Dec 28, 2022 at 11:31:34PM -0800, H. Peter Anvin wrote:
> As far as a crash... that sounds like a big and a pretty serious one at that.
> 
> Could you let me know what kernel you are using and how *exactly* you are booting it?

Right, with CONFIG_X86_VERBOSE_BOOTUP=y in a guest here, it says:

early console in extract_kernel
input_data: 0x000000000be073a8
input_len: 0x00000000008cfc43
output: 0x0000000001000000
output_len: 0x000000000b600a98
kernel_total_size: 0x000000000ac26000
needed_size: 0x000000000b800000
trampoline_32bit: 0x000000000009d000

so that's a ~9M kernel which gets decompressed at 0x1000000 and the
output len is, what, ~180M which looks like plenty to me...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

