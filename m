Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB40659CA9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 23:11:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBNah-0008QG-9S; Fri, 30 Dec 2022 17:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ek1s=44=zx2c4.com=Jason@kernel.org>)
 id 1pBNaf-0008Q8-87
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 17:11:01 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=ek1s=44=zx2c4.com=Jason@kernel.org>)
 id 1pBNad-0000Qo-RJ
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 17:11:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 608F261C12;
 Fri, 30 Dec 2022 22:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9B8C433D2;
 Fri, 30 Dec 2022 22:10:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="cNfgAfr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1672438254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ANdsmCLGFl3adJKDrU26y3FV7jGPIEv2301jMP+DTIo=;
 b=cNfgAfr3kz1oYOh86w5HBs9adgDTpNYJBr0ji86TzPLguutgKoeaSjbR8pt7SGyr+6Isw9
 CHBQ3zQMQ9hqvA9YOJYQFFpOkxX8+2Cp+1f2VpPtqIocJIgzsqeyUWcq7OKG8D6ppRj2tW
 Z4KjB3jogZk0fuHiiBoKes7v7fP6e/s=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eb1d6463
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 30 Dec 2022 22:10:54 +0000 (UTC)
Date: Fri, 30 Dec 2022 23:10:50 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, pbonzini@redhat.com,
 ebiggers@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, ardb@kernel.org, kraxel@redhat.com,
 philmd@linaro.org
Subject: Re: [PATCH qemu] x86: don't let decompressed kernel image clobber
 setup_data
Message-ID: <Y69h6ur79SMhu61F@zx2c4.com>
References: <Y6x1knb8udpSyMSp@zx2c4.com>
 <9188EEE9-2759-4389-B39E-0FEBBA3FA57D@zytor.com>
 <Y6z765zHrQ6Rl/0o@zx2c4.com>
 <AF921575-0968-434A-8B46-095B78C209C1@zytor.com>
 <Y62MdawGaasXmoVL@zn.tnic> <Y68Js5b0jW/2nLU4@zx2c4.com>
 <Y68Zf/MKmX3Rr18E@zn.tnic>
 <CAHmME9oPUJemVRvO3HX0q4BJGTFuzbLYANeizuRcNq2=Ykk1Gg@mail.gmail.com>
 <Y69B40T9kWfxZpmf@zn.tnic>
 <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E5D0A77E-5ABC-4978-9A66-37B60DA43869@zytor.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=ek1s=44=zx2c4.com=Jason@kernel.org;
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

On Fri, Dec 30, 2022 at 01:58:39PM -0800, H. Peter Anvin wrote:
> See the other thread fork. They have identified the problem already.

Not sure I follow. Is there another thread where somebody worked out why
this 62meg limit was happening?

Note that I sent v2/v3, to fix the original problem in a different way,
and if that looks good to the QEMU maintainers, then we can all be happy
with that. But I *haven't* addressed and still don't fully understand
why the 62meg limit applied to my v1 in the way it does. Did you find a
bug there to fix? If so, please do CC me.

Jason

