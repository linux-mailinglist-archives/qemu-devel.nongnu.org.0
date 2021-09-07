Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9734402A62
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:04:40 +0200 (CEST)
Received: from localhost ([::1]:47492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbiK-00084W-0C
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNb6H-00079D-Cs
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:25:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNb6E-00085E-6e
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:25:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v10so14458961wrd.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b9A+L0A4c+lgi3xx+wMu+0Z2+/nZhWTpfFaWN1ioKfI=;
 b=sxLnXN/6IubEYovgwP1zOpeRFv56US2kqLqsU0utyVkUc47rfhPdeUFeVUIIPlsf4o
 6oPDwcFZdnKgpOsSgh9zNRspEa8z4A7Qq0awhZZlKIUoJpoukyJd13T7H5Ipl4rUCWHN
 hoqUOZU+H1UkYtWdiMy34gnb063o8OqOyRxuHa2FEbJd5a5mswpQJjvrW8mjCAm/A5jK
 Ikga6bznTTIMjFZagIZF6u0arkF+wZ10f/J7Kew6kytIOY5MIa25iWdlx77WOvqepADg
 70Q+ZAzBXhtBBurMYM5RNQZKnACS+c8FdIDAMZLDaMGVSf7gMq0bXq6baUv7oCvlWeTn
 dg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b9A+L0A4c+lgi3xx+wMu+0Z2+/nZhWTpfFaWN1ioKfI=;
 b=FLaenkN+KHcoovT9AHJrR7eHinCB93QnBK4VfsLP9pZwf4GwiHnZEeEocWPTrxdix9
 2WgMw5QmfvfjQFX68NCQsq5+yIOSMoK5bgDsE4chbxLmPVcu//YFtxIqbSjeN4/8bKYE
 t5JTAp1lXHR1vQqgj7GlYLqTd3HO6cjZRS6FijWVPfIER5Kp8StV47KU1W9CDfrX1adu
 hm5Ro/zYneJygh89OWQxBph4wcYGNmJ/50ACLk5JJwa0M5B4qaNy3clTw+fYsUQy4qug
 8drMklexu2VJiOfxjC7WTuShtgmus6lipYrTnrzSzEP8JuqrHs0/dRONoH7PeLlBQGqM
 G4gQ==
X-Gm-Message-State: AOAM531Ddkz9E6m3+2ZYmYixJgac8SOXvSbYZaktXsOzlMNnaoho0wRB
 kbH/nag42ojrjoH3lju6ATirYa9l+TsUIwiJA9UhKg==
X-Google-Smtp-Source: ABdhPJy5rxjElUlooOuECJ2k6H4WycKk4cCy2xOEixDWf+gQwcXcKQFtmwz0CArC/N8MeUu31OmgGIqDNt4MhV9MW8Y=
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr19317761wra.275.1631021116403; 
 Tue, 07 Sep 2021 06:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210903153820.686913-1-philmd@redhat.com>
In-Reply-To: <20210903153820.686913-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 14:24:27 +0100
Message-ID: <CAFEAcA9hjVYRT+=sdfoowd+=Q54r7p--K9wL32Y-G7amO_4fCA@mail.gmail.com>
Subject: Re: [RFC PATCH] physmem: Do not allow unprivileged device map
 privileged memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 16:38, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Since commits cc05c43ad94..42874d3a8c6 ("memory: Define API for
> MemoryRegionOps to take attrs and return status") the Memory API
> returns a zero (MEMTX_OK) response meaning success, anything else
> indicating a failure.
>
> In commits c874dc4f5e8..2f7b009c2e7 ("Make address_space_map() take
> a MemTxAttrs argument") we updated the AddressSpace and FlatView
> APIs but forgot to check the returned value by the FlatView from
> the MemoryRegion.
>
> Adjust that now, only returning a non-NULL address if the transaction
> succeeded with the requested memory attributes.
>
> Reported-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> RFC because this could become a security issue in a core component,
>     however currently all callers pass MEMTXATTRS_UNSPECIFIED.

"Wrong set of memattrs" isn't the only reason that a device
could return a failure from the memory transaction. It looks to
me like what this patch is really doing is propagating the
possibly transaction failure up to the callers of address_space_map(),
which seems like the right thing to me.

There are two reasons (now) why address_space_map() could fail:
 (1) QEMU has run out of some internal limited resource
     (ie the bounce buffer is in use elsewhere)
 (2) the emulated guest memory transaction returned a failure;
     this should generally not be fatal, but result in whatever
     the device's reaction to "whoops, DMA failed" is, eg
     setting error registers, stopping processing of DMA, etc

Do we want to make them indistinguishable to callers? It might
be better to have address_space_map() have a way to return the
MemTxResult to callers. (This would bring it into line with other
APIs which both allow passing in MemTxAttrs and getting back a
MemTxResult.) There aren't that many callers of address_space_map()
and dma_memory_map() so it wouldn't be too hard to add an extra
argument or whatever.

Side note: looking at some of the callsites, error handling on
the failure case is not always great. Eg:
 * hw/hyperv/vmbus.c calls dma_memory_unmap() if dma_memory_map()
   fails, which is definitely the wrong thing to do, because it
   will try to unmap NULL
 * hw/misc/aspeed_hace.c just ploughs on using the NULL pointer
   regardless
 * target/ppc/mmu-hash64.c calls hw_error(), ie kills QEMU,
   on failure, which is not strictly wrong but seems a bit harsh.

-- PMM

