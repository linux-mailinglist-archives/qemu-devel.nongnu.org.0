Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21568566030
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 02:55:59 +0200 (CEST)
Received: from localhost ([::1]:34480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Wr7-0001yW-L0
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 20:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org>)
 id 1o8Wom-0000py-Bl; Mon, 04 Jul 2022 20:53:32 -0400
Received: from dfw.source.kernel.org ([139.178.84.217]:39862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org>)
 id 1o8Wok-0006ub-Dx; Mon, 04 Jul 2022 20:53:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A118617FF;
 Tue,  5 Jul 2022 00:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5C2C3411E;
 Tue,  5 Jul 2022 00:53:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eRlWDnT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656982405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GBj62MjJ2VIbiGWs/eNHFVJd5tihvIWhRW+pstEVFFg=;
 b=eRlWDnT5ghp5r2IdRoKNpM5LbEBcUFbexszN8zJCvE+EMHHsE242BXPkbfcFc5ahWdALTL
 ATFiSIYIz1oY+DCgny/y37O2EhSFNK3DfbxfITFvJ0OasqqTSXhROz+U87wEs8ZCSmPt2u
 ikAguaBR/YIF0tbqZCnpK7peeDG4Iiw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e151ae2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 5 Jul 2022 00:53:25 +0000 (UTC)
Date: Tue, 5 Jul 2022 02:53:21 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stafford Horne <shorne@gmail.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 "open list:Goldfish RTC" <qemu-riscv@nongnu.org>,
 Anup Patel <anup.patel@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH v2 03/11] goldfish_rtc: Add endianness property
Message-ID: <YsOLgWl0N8RFvZyc@zx2c4.com>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-4-shorne@gmail.com>
 <272f1e82-ff1b-9a7a-931b-91472dd244bf@linaro.org>
 <b8d2595b-c86a-b1b8-8912-13fc9ba782d3@redhat.com>
 <31017a43-3ebb-0aa3-f6ce-d2df1b5dc177@linaro.org>
 <78ac87ee-e40b-8d18-3775-4417edb74fa3@redhat.com>
 <YsNQP9UJ5faHNguC@antec>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YsNQP9UJ5faHNguC@antec>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=7kjP=XK=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
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

On Tue, Jul 05, 2022 at 05:40:31AM +0900, Stafford Horne wrote:
>   riscv{LE}--------------->goldfish_rtc{LE}
>   mips-longsoon3{LE}------>goldfish_rtc{LE}
>   openrisc{BE}------------>goldfish_rtc{LE} (LE to BE conversion done in driver)
>   m68k{BE}---------------->goldfish_rtc{BE} (only big-endian user)

I wish the powers that be would lighten up a little bit and let us
change m68k to be LE, and then we could avoid all this...

Just a last grumble, I guess.

Jason

