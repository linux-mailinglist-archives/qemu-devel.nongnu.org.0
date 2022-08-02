Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F79158823D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 21:04:23 +0200 (CEST)
Received: from localhost ([::1]:54154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIxBl-00076i-W7
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 15:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oIx7S-0001yX-3g; Tue, 02 Aug 2022 14:59:54 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:51834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org>)
 id 1oIx7O-0000Yn-Eb; Tue, 02 Aug 2022 14:59:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6746FB8205E;
 Tue,  2 Aug 2022 18:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7CBC433D6;
 Tue,  2 Aug 2022 18:59:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="blZV3fVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1659466783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=97yA0ONbVtAK4nTosslSJ7gO6YG0dCcE3aw1v37GTQ4=;
 b=blZV3fVJ+6N8oTaQdCFr7c4oegIeKimnJO0rPZLYa5B0fsPnSopdH2HVkmIC76tGVMgbhI
 +bi+/aSg3/8CTPulBLaCDnMOytMwGFvW3wDntY7RI1rF5267c6uYrSIGCVRjE24KAQZ1/L
 dQI1iumDkuyX9v95Nrslrr0UqFre6rY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5e59275f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 2 Aug 2022 18:59:43 +0000 (UTC)
Date: Tue, 2 Aug 2022 20:59:39 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Message-ID: <Yul0G2YCKLXiypvv@zx2c4.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
 <ef161533-0123-28f0-db1f-5257e82f6340@linux.ibm.com>
 <1afd34c3-0aa6-541c-07e9-b0eef7e0f0d7@redhat.com>
 <71d173c2-21eb-5966-8458-91de9bc48620@linux.ibm.com>
 <71b1b0f6-95b9-0249-e996-b8348470693f@redhat.com>
 <834c1a76-d972-a1b2-2c28-d0482335d3ba@linux.ibm.com>
 <5835cfa9-841f-ab6c-6684-2ae3bddeacf3@redhat.com>
 <CAHmME9pT+ifm4SbKMCxdXLDOtmEn99ssf54Bz8SWsiRLWfOvGA@mail.gmail.com>
 <b35530a5-cf84-eead-38a6-5aa80363702d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b35530a5-cf84-eead-38a6-5aa80363702d@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=YGwI=YG=zx2c4.com=Jason@kernel.org;
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

On Tue, Aug 02, 2022 at 05:32:26PM +0200, David Hildenbrand wrote:
> On 02.08.22 17:28, Jason A. Donenfeld wrote:
> > Hi David, Christian,
> > 
> > While this thread has your attention, I thought I'd reiterate my offer in:
> > https://lore.kernel.org/qemu-devel/YuEoUwzDzBqFFpxe@zx2c4.com/
> > 
> > Do either of you want to "take ownership" of this patch to bring it
> > past the finish line, and I can provide whatever additional crypto
> > code you need for that?
> 
> For me the patch is good enough. But sure, having a SHA512
> implementation would be nice ...
> 
> Long story short, I'll wire up whatever crypto stuff you can come up with ;)

Long story short, I started to take you up on that offer, but because I
am an insane person, before I knew it, the whole thing was done... Patch
series incoming.

Jason

