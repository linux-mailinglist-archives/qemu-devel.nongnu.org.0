Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EFC5A51CA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 18:31:28 +0200 (CEST)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oShfb-0005Ga-OC
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 12:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7wty=ZB=zx2c4.com=Jason@kernel.org>)
 id 1oShc0-0002B1-Qt; Mon, 29 Aug 2022 12:27:45 -0400
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1]:51396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7wty=ZB=zx2c4.com=Jason@kernel.org>)
 id 1oShbv-0003fp-72; Mon, 29 Aug 2022 12:27:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1C7BCCE12F2;
 Mon, 29 Aug 2022 16:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D24C433D6;
 Mon, 29 Aug 2022 16:27:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="OqCuAopo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1661790444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mcB01RxUdOvGcAW54XDrXKvyO5m6pppBfDD1BoVeXIA=;
 b=OqCuAopoWpA9PYJbqVyi2AgFXsUdT0L82XEA76ZKOj3kKn1tZBqwId8+ERpdC4qDTnMIQk
 gQnrlHIStqobD3BOTtH+irNJAUfFWFJR9+bsK/iQSUZrNfBz0GxxAdnzsKpcn+rtPAs4wS
 lGNppuRPO+JJO3oyfhyCmtK6GU1alvg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c18a2727
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 29 Aug 2022 16:27:24 +0000 (UTC)
Date: Mon, 29 Aug 2022 12:27:22 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v7 1/2] target/s390x: support SHA-512 extensions
Message-ID: <Ywzo6pKMh5i0a1L7@zx2c4.com>
References: <Yu0UtNzyb81O0ND2@zx2c4.com>
 <20220809150331.84296-1-Jason@zx2c4.com>
 <362c6915-c7fa-9eee-fe3d-1995fb55d5a1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <362c6915-c7fa-9eee-fe3d-1995fb55d5a1@redhat.com>
Received-SPF: pass client-ip=2604:1380:40e1:4800::1;
 envelope-from=SRS0=7wty=ZB=zx2c4.com=Jason@kernel.org;
 helo=sin.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

On Fri, Aug 26, 2022 at 12:21:36PM +0200, Thomas Huth wrote:
> > + *  Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> 
> Please drop the "All rights reserved" ... it does not have any legal meaning 

No.

> > +{
> > +    enum { MAX_BLOCKS_PER_RUN = 64 }; /* This is arbitrary, just to keep interactivity. */
> > +    uint64_t z[8], b[8], a[8], w[16], t;
> > +    uint64_t message = message_reg ? *message_reg : 0, len = *len_reg, processed = 0;
> 
> The line is very long, could you please declare message and len on separate 
> lines?

Will do.

> 
> > +    int i, j, message_reg_len = 64, blocks = 0, cc = 0;
> > +
> > +    if (!(env->psw.mask & PSW_MASK_64)) {
> > +        len = (uint32_t)len;
> > +        message_reg_len = (env->psw.mask & PSW_MASK_32) ? 32 : 24;
> > +    }
> > +
> > +    for (i = 0; i < 8; ++i) {
> > +        z[i] = a[i] = cpu_ldq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), ra);
> 
> Quite a long line again, maybe split it like this:
> 
>        abi_ptr addr = wrap_address(env, parameter_block + 8 * i);
>        z[i] = a[i] = cpu_ldq_be_data_ra(env, addr, ra);

Sure.

> 
> > +    }
> > +
> > +    while (len >= 128) {
> > +        if (++blocks > MAX_BLOCKS_PER_RUN) {
> > +            cc = 3;
> > +            break;
> > +        }
> > +
> > +        for (i = 0; i < 16; ++i) {
> > +            if (message) {
> > +                w[i] = cpu_ldq_be_data_ra(env, wrap_address(env, message + 8 * i), ra);
> 
> Long line again, please split.

Okay.

> >               cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
> 
> So for KIMD and KLMD, I think we now have to set the bit that corresponds to 
> SHA-512 in the query status information, too? Otherwise the guest might not 
> use the function if it thinks that it is not available?

That's already taken care of generically I think. This works fine from
Linux's autodetection.

Jason

