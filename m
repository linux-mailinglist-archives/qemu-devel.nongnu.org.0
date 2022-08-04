Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC7589BBA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:34:40 +0200 (CEST)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJa3j-0000P4-J4
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZe2-0008Gy-9U; Thu, 04 Aug 2022 08:08:06 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:43460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org>)
 id 1oJZdz-0006Wr-PA; Thu, 04 Aug 2022 08:08:05 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1034616DE;
 Thu,  4 Aug 2022 12:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB66C433C1;
 Thu,  4 Aug 2022 12:07:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PSM4cEU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659614877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o0W0H3ZOZNGv4omt3K6gBN8l1AOL9VhBOGNzQvyX8hY=;
 b=PSM4cEU6VScCC60NDAx5LwiPmxW0dQGTEvO5j0XU5SrZO7AYTTXSBYIP1f/A0qBHEMEmZa
 qxzZ5iAWqISUsQdOvNsrD19zUchCdcNFT+VubxKH7MC7E8N61HebSBB3rfdWp0TVQ1eDYH
 GexmsKlXNB4QFue0ORoroEBl1Ao9oYs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ea9e7077
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 4 Aug 2022 12:07:57 +0000 (UTC)
Date: Thu, 4 Aug 2022 14:07:55 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: freude@linux.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
Message-ID: <Yuu2m6tdf2W+fr9M@zx2c4.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
 <20220802190011.458871-3-Jason@zx2c4.com>
 <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
 <YupmwgYFShLfP8Xd@zx2c4.com>
 <0ff11adb819138cfed16dfb489b66f6f@linux.ibm.com>
 <60ae0ada-a99b-f6a8-93c3-f55db2480458@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60ae0ada-a99b-f6a8-93c3-f55db2480458@redhat.com>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=nI4E=YI=zx2c4.com=Jason@kernel.org;
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

Hi,

On Thu, Aug 04, 2022 at 10:10:52AM +0200, David Hildenbrand wrote:
> > Hm, you don't really want to implement some kind of particial complete.
> > Qemu is an emulation and you would have to implement some kind of
> > fragmenting this based on machine generation.
> 
> Do we?
> 
> "The
> CPU-determined number of bytes depends on the
> model, and may be a different number each time the
> instruction is executed. The CPU-determined number
> of bytes is usually nonzero. In certain unusual situa-
> tions, this number may be zero, and condition code 3
> may be set with no progress. However, the CPU pro-
> tects against endless recurrence of this no-progress
> case.
> "
> 
> I read that as "do what you want, even on a given model it might be random."

Just FYI, I implemented this, and it works in v6. Please take a look at:
https://lore.kernel.org/qemu-devel/20220803171536.1314717-2-Jason@zx2c4.com/

So we can keep that. Or I can send a v7 that removes it.

It wasn't very hard to implement, and it's not very hard to remove, so
either way, just tell me what you want to do.

Jason

