Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB688681DB5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:08:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMcIx-0000eV-Ut; Mon, 30 Jan 2023 17:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMcIv-0000e4-8P
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:07:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMcIt-0000uZ-Ak
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675116426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8GFrkNjLRlmcaA1oM4cQNL/TP873GT3h8cL/NJeTxU8=;
 b=OhHKD5xYYu6nn8SJK5S0eqSKomqiAK/3c7i2zSz+yAmoS5K/N/2aE7jSkkKXBshMmv8zGi
 7VLKu5Y+/OifEWgeHExEiSzEJx/cEfELZn4BrExCVspf7yjWO58KphO5zJgfPQONemB4gK
 uwZfPzbQnnGYsT9YdBKGiymqfzxUZz0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-101-sqvuuR3eMBCrBHW-h2Xzvg-1; Mon, 30 Jan 2023 17:07:03 -0500
X-MC-Unique: sqvuuR3eMBCrBHW-h2Xzvg-1
Received: by mail-qk1-f199.google.com with SMTP id
 bk3-20020a05620a1a0300b007092ce2a17eso7969775qkb.22
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 14:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8GFrkNjLRlmcaA1oM4cQNL/TP873GT3h8cL/NJeTxU8=;
 b=e+sg97k7J2S2E6cUQX+d0jYo/EktEVJPCJ0GKu9T/SOOvf0Lxwigkd9NfCberBTiCl
 LvtreUqjXCh1Zw+zoTje5p2InTwL5lUzFDMbamb6BF+Bew2a+fHUuPCP3vT++65r/jPb
 OxsYptL0i3QBOKzOQU14DJjdILnSdhgU+6yK5mTSIHc6I/eD6UAzDOcFUhfaUiCCf19r
 gCSo1XPrSJd2Giw0cmgst7aiGxd3TUupWHKuTgeCYwv8XxzvdMVMk069UPKX6No+NY4I
 jmq7l4s4mnBQTvWO3k8igrPkQpJ0CQmV2KP+N7KQp7MjHfM404KGizhH9Tr+tjAoJ/dK
 MrTg==
X-Gm-Message-State: AO0yUKW+R/K26NXEzM0GFDcARQc7/VtMa8yv1B7F3BNOsx9S9MlwQ4PD
 68bLGsJt7U0+NhYOCZChHafFQ/66j79abBHT7s77ZeHpysZQ9Mik0Tmbp1nzOji7mpUduhZdeDM
 LIUW+84hIQf4vzts=
X-Received: by 2002:a05:622a:229e:b0:3b9:a4d4:7f37 with SMTP id
 ay30-20020a05622a229e00b003b9a4d47f37mr920578qtb.3.1675116423391; 
 Mon, 30 Jan 2023 14:07:03 -0800 (PST)
X-Google-Smtp-Source: AK7set9OVEV2bmlSi9XUJFO8mYF+DnoCs03i/oWgrLBzB7R6K1vbFwlol+eBgMXZ1qSisAZnP+sDuw==
X-Received: by 2002:a05:622a:229e:b0:3b9:a4d4:7f37 with SMTP id
 ay30-20020a05622a229e00b003b9a4d47f37mr920540qtb.3.1675116423034; 
 Mon, 30 Jan 2023 14:07:03 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 j7-20020ac806c7000000b003b80a69d353sm8705805qth.49.2023.01.30.14.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 14:07:02 -0800 (PST)
Date: Mon, 30 Jan 2023 17:07:01 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 08/21] ramblock: Cache the length to do file mmap()
 on ramblocks
Message-ID: <Y9g/hQHaPtMcVetW@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-9-peterx@redhat.com>
 <878rhkk3x0.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <878rhkk3x0.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Jan 30, 2023 at 06:05:47AM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > We do proper page size alignment for file backed mmap()s for ramblocks.
> > Even if it's as simple as that, cache the value because it'll be used in
> > multiple places.
> >
> > Since at it, drop size for file_ram_alloc() and just use max_length because
> > that's always true for file-backed ramblocks.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>

Thanks for reviewing the set!

> 
> > @@ -2100,7 +2100,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
> >      new_block->used_length = size;
> >      new_block->max_length = size;
> >      new_block->flags = ram_flags;
> > -    new_block->host = file_ram_alloc(new_block, size, fd, readonly,
> > +    new_block->host = file_ram_alloc(new_block, fd, readonly,
> >                                       !file_size, offset, errp);
> >      if (!new_block->host) {
> >          g_free(new_block);
> 
> Passing "size" in three places, not bad at all O:-)

Yes it's a bit unfortunate. :(

-- 
Peter Xu


