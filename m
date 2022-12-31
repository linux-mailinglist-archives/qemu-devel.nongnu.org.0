Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70C65A4BD
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Dec 2022 14:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBcLf-0005Q4-Hx; Sat, 31 Dec 2022 08:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org>)
 id 1pBcLc-0005PA-2a
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 08:56:28 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org>)
 id 1pBcGt-00014L-Qm
 for qemu-devel@nongnu.org; Sat, 31 Dec 2022 08:51:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EAAF60B2D;
 Sat, 31 Dec 2022 13:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2421C433D2;
 Sat, 31 Dec 2022 13:51:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LzKR1o/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672494691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1swn0xwgNdguNiw43DhjJqxNtHVgXYZnUSm8WOToSuo=;
 b=LzKR1o/LkAdiF6MQnQZuxpn3T6rBbriro7O0n1mUAFSbF1qGtnNS9Lhps0XwRRb9kbrE6p
 o4AtXcOZBddrfITpfFJbpsKVnugNBebeusahm34sX3p04dwhC+MLbHshQ/KtFResg+FE4n
 sb7Ri73QTrtccYqxb0OAQbjzv2kVUxs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7f4aebf1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 31 Dec 2022 13:51:30 +0000 (UTC)
Date: Sat, 31 Dec 2022 14:51:28 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y7A+YELM7m5E2PUQ@zx2c4.com>
References: <Y68Js5b0jW/2nLU4@zx2c4.com> <Y68Zf/MKmX3Rr18E@zn.tnic>
 <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
 <Y69B40T9kWfxZpmf@zn.tnic>
 <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
 <Y69h6ur79SMhu61F@zx2c4.com>
 <46466e54-25c3-3194-8546-a57cd4a80d9d@zytor.com>
 <Y7A76+IBS4fnucrW@zn.tnic> <Y7A8qP05B0YRbQIN@zx2c4.com>
 <Y7A9nBud6UeH+wYd@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7A9nBud6UeH+wYd@zn.tnic>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=hRBJ=45=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

On Sat, Dec 31, 2022 at 02:48:12PM +0100, Borislav Petkov wrote:
> On Sat, Dec 31, 2022 at 02:44:08PM +0100, Jason A. Donenfeld wrote:
> > Are you using patch v1 minus the 62 MiB thing?
> 
> No, I want to see the original failure - the one that prompted you to send
> 
> https://lore.kernel.org/r/20221228143831.396245-1-Jason@zx2c4.com

That failure is unrelated to the ident mapping issue Peter and
I discussed. The original failure is described in the commit message:
decompression clobbers the data, so sd->next points to garbage.

