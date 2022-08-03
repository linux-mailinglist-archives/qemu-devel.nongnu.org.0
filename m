Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF78588CA9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:08:33 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJE6y-0005LO-Go
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJDmy-0002vM-0P; Wed, 03 Aug 2022 08:47:52 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hVua=YH=zx2c4.com=Jason@kernel.org>)
 id 1oJDmw-00063M-4L; Wed, 03 Aug 2022 08:47:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E3FDB8224F;
 Wed,  3 Aug 2022 12:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13F6AC433C1;
 Wed,  3 Aug 2022 12:47:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KWXIezx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659530863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TAb8s85ZGfHKemcqKuAME4rAVXn+jtyz6BJb+RMXqUo=;
 b=KWXIezx7VwGW9r2TnV1wr4FM0cs7qVRj1+KXVKS2CIiXlUjGETTOPnqlrThUfF4Mq3fiwm
 UIxk4mOaqvlm0nNbGEgw7PAanbeJyvybApyiITXKWopsrashg8lUw9YZBpynzN2WLkBG0i
 0tTVMxPN6D7ssCaXiR2AYHxVjgZ/Qq0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e046f4fc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 3 Aug 2022 12:47:42 +0000 (UTC)
Date: Wed, 3 Aug 2022 14:47:40 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
Message-ID: <YupubD62cV7ad2tJ@zx2c4.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
 <20220802190011.458871-3-Jason@zx2c4.com>
 <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
 <YupmwgYFShLfP8Xd@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YupmwgYFShLfP8Xd@zx2c4.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=hVua=YH=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 03, 2022 at 02:14:58PM +0200, Jason A. Donenfeld wrote:
>         s.even = (unsigned long)src;
>         s.odd  = (unsigned long)src_len;
>         asm volatile(
>                 "       lgr     0,%[fc]\n"
>                 "       lgr     1,%[pba]\n"
>                 "0:     .insn   rre,%[opc] << 16,0,%[src]\n"
>                 "       brc     1,0b\n" /* handle partial completion */
>                 : [src] "+&d" (s.pair)
>                 : [fc] "d" (func), [pba] "d" ((unsigned long)(param)),
>                   [opc] "i" (CPACF_KIMD)
>                 : "cc", "memory", "0", "1");
> 
> So I guess that means it'll just loop until it's done? Or do I need to
> return "1" from HELPER(msa)?

Looks like returning 3 did the trick. v5 incoming...

Jason

