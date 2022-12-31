Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E00D65A62B
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 20:02:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBh6I-0000fn-RU; Sat, 31 Dec 2022 14:00:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBh6E-0000fW-7K
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 14:00:54 -0500
Received: from mail.skyhub.de ([5.9.137.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bp@alien8.de>) id 1pBh64-00064D-7L
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 14:00:54 -0500
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E73191EC04AD;
 Sat, 31 Dec 2022 20:00:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1672513234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=wtcKKnYS0ZHRn/fZeFnfnImCwHmhNYrXNEufS2qk2IY=;
 b=rEFqycmTC2OglrzR35Kb4FvOYMQmK/u+hjZ6Q5DeDghRR3Fkb9g8m7lrzZc5JZNaWOwBX/
 zD3l3yzMBfMonVKI8o0kPn9TcqZwlLgAZVF67+Hh4yOH01/7sXYXBMl/OE47/DJzISZO0c
 miXtD/9pE4oLWzklFvb4oXm4DJFs1MY=
Date: Sat, 31 Dec 2022 20:00:29 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7CGzde+qPB7YJP4@zn.tnic>
References: <Y69B40T9kWfxZpmf@zn.tnic>
 <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
 <Y69h6ur79SMhu61F@zx2c4.com>
 <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
 <Y7A76+IBS4fnucrW@zn.tnic> <Y7A8qP05B0YRbQIN@zx2c4.com>
 <Y7A9nBud6UeH+wYd@zn.tnic> <Y7A+YELM7m5E2PUQ@zx2c4.com>
 <Y7BGIAL4z6o6FEI5@zn.tnic> <Y7B993P1+jYB/etX@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7B993P1+jYB/etX@zx2c4.com>
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

On Sat, Dec 31, 2022 at 07:22:47PM +0100, Jason A. Donenfeld wrote:
> So with that understanding confirmed, I'm confused at your surprise that
> hpa's unrelated fix to the different issue didn't fix this issue.

No surprise there - I used a qemu variant without your patch to prevent the
setup_data clobbering so hpa's fix can't help there.

> But since the kernel doesn't do this now, and the 62MiB bug also seems
> to apply to existing kernels, for the purposes of QEMU for now, I think
> the v3 patch is probably best, since it'll handle existing kernels.

Right, we can't fix all those guests which are out there.

> Alternatively, setup_data could be relocated, the boot param protocol
> could be bumped, and then QEMU could conditionalized it's use of
> setup_data based on that protocol version. That'd work, but seems a bit
> more involved.

I think this is at least worth considering because the kernel overwriting
setup_data after having been told where that setup_data is located is not really
nice.

Well not explicitly at least - it gets the pointer to the first element and
something needs to traverse that list to know which addresses are live. But
still, that info is there so perhaps we need to take setup_data into
consideration too before decompressing...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

