Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60457985A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:25:28 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlLy-0007Dn-Rr
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDlKY-0005py-OS
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:23:58 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1]:58740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org>)
 id 1oDlKW-0002Xn-72
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:23:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97CC9B81AF2;
 Tue, 19 Jul 2022 11:23:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0F8C341C6;
 Tue, 19 Jul 2022 11:23:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KhIGxU2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658229829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Xltzb52NGnbPY2VCaaF/R/ZpzfmeAtXwV9zVBung+Y=;
 b=KhIGxU2h0HKUqv/emgeI3pJlq9Pqu4JPRj7VQ0Q2YhC8lVGFx7oEkGzGTggAwKWLhK/ukf
 get3jHK5gGGmE+YNCI46/3B3pMs1BEtUJHVuGm9+h6l6CZ3swvA3v4/Q6zv7onlrgFzfnM
 ulBtJyCzQwEyq3lAnV4lMSbZ/oRMQhw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cb59bb4f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Jul 2022 11:23:48 +0000 (UTC)
Date: Tue, 19 Jul 2022 13:23:46 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-s390@vger.kernel.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH qemu] target/s390x: support PRNO_TRNG instruction
Message-ID: <YtaUQkVUPVHt+v0Z@zx2c4.com>
References: <20220712164627.581570-1-Jason@zx2c4.com>
 <8326327a-e55e-3aba-049f-b925282f95a8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8326327a-e55e-3aba-049f-b925282f95a8@redhat.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=TnJG=XY=zx2c4.com=Jason@kernel.org;
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

Thanks for your feedback. I'll CC you on v+1. Note that I don't know
very much about s390x, so I may require some slight hand holding, but
let's see how far I can get...

On Tue, Jul 19, 2022 at 11:54:04AM +0200, David Hildenbrand wrote:
> How is that warning avoided now? We have to sort that out first -- either by
> removing that dependency (easy) or implementing SHA-512 (hard).

Ahhh... Well, I can do either one I guess. Implementing SHA512 isn't
really that hard. I can cook up a short enough software implementation
of that which we could plonk into crypto_helper.c fairly minimally. Of
course, then those instructions would have to be wired up. So maybe I'll
try removing the dependency for v2 instead, and we'll see what you and
Thomas think of that.

> > +static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
> > +                            uint64_t buf, uint64_t len)
> > +{
> > +        uint64_t addr = wrap_address(env, buf);
> > +        uint8_t tmp[256];
> > +
> > +        while (len) {
> > +                size_t block = MIN(len, sizeof(tmp));
> > +                qemu_guest_getrandom_nofail(tmp, block);
> > +                for (size_t i = 0; i < block; ++i)
> > +                        cpu_stb_data_ra(env, addr++, tmp[i], ra);
> 
> 
> There seems to be something missing regarding exception + register handling.

Thanks, missed this. I'll do that.

> Further, to be 100% correct you might have to wrap the address whenever
> you increment it.

Ack.

Jason

