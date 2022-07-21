Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0346E57C942
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 12:44:30 +0200 (CEST)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oETfR-0001po-4w
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 06:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oETdd-0008W3-MG
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:42:37 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:57202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org>)
 id 1oETdb-0002RP-N1
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:42:37 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04877616E2;
 Thu, 21 Jul 2022 10:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62507C3411E;
 Thu, 21 Jul 2022 10:42:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Yx6fR7tx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1658400149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ms57pCRh8L45M1Z9q5PlTJelnN4kXmsiPBtCtcQMvc=;
 b=Yx6fR7txfDNuttSlTQFkPKCwWfGZs45WXfUTX5uCcr/RIQheyFdMD6hGYj0DrF1M/MrrQe
 K+pBiEf6VwaRjWkwtoKt5IsviJ7MGHKZf0cXyHJeKJMPatrVwn4ZtB3lmIjh0uH+8uSNFi
 NXYZHjQoyXKua0v14RuuJQlAuXy2FAw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d398efeb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 21 Jul 2022 10:42:29 +0000 (UTC)
Date: Thu, 21 Jul 2022 12:42:27 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v4] hw/i386: pass RNG seed via setup_data entry
Message-ID: <Ytktk532xNP8sjgR@zx2c4.com>
References: <YtkitoK3PVjbgXBH@zx2c4.com>
 <20220721100959.427518-1-Jason@zx2c4.com>
 <20220721062910-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220721062910-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=2GtW=X2=zx2c4.com=Jason@kernel.org;
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

Hi Michael,

Thanks for the feedback.

On Thu, Jul 21, 2022 at 06:35:41AM -0400, Michael S. Tsirkin wrote:
> > -        setup_data->next = 0;
> > +        setup_data->next = last_setup_data_offset;
> 
> does this make any difference? if the idea is that we'll add more stuff
> down the road, then see below ...

It doesn't; it's just for completeness, in case somebody decides to add
something prior, and then less code has to change and there's less
chance of an error. The compiler generates the same code either way.

> 
> >          setup_data->type = cpu_to_le32(SETUP_DTB);
> >          setup_data->len = cpu_to_le32(dtb_size);
> >  
> >          load_image_size(dtb_filename, setup_data->data, dtb_size);
> > +
> > +        last_setup_data_offset = prot_addr + setup_data_offset;
> 
> 
> if the idea is that we'll add more stuff down the road, then
> it should be += here.

It's just poorly named actually. It should be called
"prev_setup_data_prot_addr" or something. I'll find a better name for
v+1.

> 
> >      }
> >  
> > +    setup_data_offset = QEMU_ALIGN_UP(kernel_size, 16);
> > +    kernel_size = setup_data_offset + sizeof(struct setup_data) + 32;
> > +    kernel = g_realloc(kernel, kernel_size);
> > +    setup_data = (struct setup_data *)(kernel + setup_data_offset);
> > +    setup_data->next = last_setup_data_offset;
> 
> Likely broken on LE.

Nice catch, thanks.

> 
> > +    setup_data->type = cpu_to_le32(SETUP_RNG_SEED);
> > +    setup_data->len = cpu_to_le32(32);
> > +    qemu_guest_getrandom_nofail(setup_data->data, 32);
> > +
> > +    last_setup_data_offset = prot_addr + setup_data_offset;
> 
> 
> where does this 32 come from? maybe make it a macro.

Will do.

> 
> > +
> > +    stq_p(header + 0x250, last_setup_data_offset);
> 
> add a comment while we are at it?

Ack.
 
Jason

