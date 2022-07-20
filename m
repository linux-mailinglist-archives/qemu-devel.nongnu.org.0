Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AFC57BED9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 21:47:07 +0200 (CEST)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEFez-0007z5-TW
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 15:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oEFd0-0005mV-MO; Wed, 20 Jul 2022 15:45:02 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:39432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org>)
 id 1oEFcy-0006Tf-Fi; Wed, 20 Jul 2022 15:45:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C019B81D74;
 Wed, 20 Jul 2022 19:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228F5C3411E;
 Wed, 20 Jul 2022 19:44:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="huDLEaN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658346293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ie4Z/Dmh5eTu1Nz79Q/iLQnC85IPVaIqubqWj9ftFdM=;
 b=huDLEaN+Gcb7GI47hmMLThS2UoD6H8AqUZaDMICSlLqhqbMOWADq1vuufkMMXb9YwdZKv2
 0l1Oi/Fgf32vMMHlJ1the2la4loFl8RerowEd2bQRu/VzwTuj7jUVVNAoOB8ot68Cv5MmD
 Z0CedSDsXAtgPiqidzTB3v7UW59Vdx8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a8fe2343
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 20 Jul 2022 19:44:52 +0000 (UTC)
Date: Wed, 20 Jul 2022 21:44:50 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Message-ID: <YthbMikOIkKr8tAU@zx2c4.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
 <c61e0119-24e8-c1a3-d1c1-cd57b3feca02@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c61e0119-24e8-c1a3-d1c1-cd57b3feca02@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=WeL6=XZ=zx2c4.com=Jason@kernel.org;
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

Hi David,

On Wed, Jul 20, 2022 at 08:41:48PM +0200, David Hildenbrand wrote:
> > +        while (len) {
> > +                size_t block = MIN(len, sizeof(tmp));
> > +
> > +                qemu_guest_getrandom_nofail(tmp, block);
> > +                for (size_t i = 0; i < block; ++i) {
> > +                        cpu_stb_data_ra(env, wrap_address(env, *buf_reg), tmp[i], ra);
> > +                        *buf_reg = deposit64(*buf_reg, 0, reg_len, *buf_reg + 1);
> > +                        --*len_reg;
> > +                }
> > +                len -= block;
> > +        }
> 
> Yeah, that's better, although kind-off hard to read.
> 
> We could process one guest page at a time, similar to how we handle
> target/s390x/tcg/mem_helper.c:access_memset and friends nowadays.
> 
> But I won't force you to do that ;)
> 
> This here is good enough for now, with room for improvement regarding
> efficiency.
> 
> I did not review the doc in detail once again, maybe I get to that later
> this week.

Alright, so we'll leave it be for now then and stick with this v3.

The do_access_memset trick is clever, but sheesh, seems a bit overkill
for here. On the real hardware, this instruction takes ~190us for every
32 byte chunk, so there's basically no way that we can possibly be worse
than that. :)

Jason

